package com.springapp.web.controller;

import com.springapp.domain.UserVo;
import com.springapp.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/**
 * Created by jooyoung on 2015-11-22.
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    //User List
    @RequestMapping(value = { "/admin", "/admin/list" }, method = RequestMethod.GET)
    public String adminListPage(@ModelAttribute("userVo") UserVo userVo, @RequestParam(value = "pageNo", required = false) String pageNo,ModelMap model) throws Exception{
        userVo.setPageSize(10); // 한 페이지에 보일 게시글 수
        userVo.setPageNo(1); // 현재 페이지 번호
        if(StringUtils.isNotEmpty(pageNo)){
            userVo.setPageNo(Integer.parseInt(pageNo));
        }
        userVo.setBlockSize(10);
        if(userVo.getUser_role()== null || userVo.getUser_role().equals("0")){
            userVo.setUser_role("");
        }

        userVo.setTotalCount(userService.selectListCount(userVo)); // 게시물 총 개수
        model.addAttribute("paging", userVo);
        model.addAttribute("userList", userService.selectList(userVo));
        model.addAttribute("myid", getSessionUserID());
        UserVo userVo2 = new UserVo();
        userVo2.setUser_id(getSessionUserID());
        model.addAttribute("myUserinfo", userService.selectInfo(userVo2));
        return "user/list";
    }
    //User write
    @RequestMapping(value = "/admin/write")
    public String adminInsertPage(@ModelAttribute("userVo") UserVo userVo, ModelMap model)  throws Exception{
        userVo.setUser_id(getSessionUserID());
        model.addAttribute("myUserinfo", userService.selectInfo(userVo));
        return "user/write";
    }
    @RequestMapping(value = "/admin/idchk", method = RequestMethod.GET)
    public @ResponseBody
    String getIdCheck(@ModelAttribute("userVo") UserVo userVo) throws Exception{
        String result = "" + userService.selectIDCount(userVo);
        return result;
    }


    //User write
    @RequestMapping(value = "/admin/write2", method = RequestMethod.POST)
    public String  adminInsertPage(RedirectAttributes redirectAttributes,@ModelAttribute("userVo") UserVo userVo,ModelMap model) throws Exception{
        int result=0;
        result = userService.insert(userVo); //role은 서비스에 별도로 입력
        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            resultMessage ="정상적으로 등록이 완료되었습니다.";
        }
        // model.addAttribute("resultMessage", resultMessage);
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/admin/list";
    }

    //User edit
    @RequestMapping(value = { "/admin/edit", "/user/edit" })
    public String adminUpdatePage(@ModelAttribute("userVo") UserVo userVo,ModelMap model) throws Exception{
        model.addAttribute("userinfo", userService.selectInfo(userVo));
        userVo.setUser_id(getSessionUserID());
        model.addAttribute("myUserinfo", userService.selectInfo(userVo));
        return "user/edit";
    }

    //User edit
    @RequestMapping(value = { "/admin/edit2", "/user/edit2" }, method = RequestMethod.POST)
    public String  adminUpdatePage2(RedirectAttributes redirectAttributes,@ModelAttribute("userVo") UserVo userVo,ModelMap model) throws Exception{
        int result=0;

        //TODO: 관리자인 경우 패스워드 수정.


        result = userService.update(userVo);
        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            resultMessage ="정상적으로 수정이 완료되었습니다.";
        }
        String resultUrl ="redirect:/admin/list";
        if(getSessionUserID().equals(userVo.getUser_id())){
            resultUrl ="redirect:/";
        }
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return resultUrl;
    }

    //사용자 삭제
    @RequestMapping(value = "/admin/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageDelete(RedirectAttributes redirectAttributes,@ModelAttribute("userVo") UserVo userVo,ModelMap model) throws Exception{

        int result = 0;
        String resultMessage ="관리자에게 문의 바랍니다.";
        if(!getSessionUserID().equals(userVo.getUser_id())){
            result = userService.delete(userVo);
        }else{
            resultMessage ="본인 계정으로는 본인 정보를 삭제 할 수 없습니다.";
        }
        if(result > 0 )
            resultMessage ="정상적으로 삭제되었습니다.";

        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/admin/list";
    }


    private String getSessionUserID(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }



    @RequestMapping(value = "/admin/uploadFile", method = RequestMethod.POST)
    public String uploadFileHandler(RedirectAttributes redirectAttributes,@RequestParam("file") MultipartFile file,HttpServletRequest request,ModelMap model) {
        //file upload path
        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadexcel/";
        String resultMessage ="관리자에게 문의 바랍니다.";

        if (!file.isEmpty()) {
            try {

                File originexcelfile = new File(saveDirectory+file.getName());
                file.transferTo(originexcelfile);
                FileInputStream excelfile = new FileInputStream(originexcelfile);
                //Create Workbook instance holding reference to .xlsx file

                XSSFWorkbook workbook = new XSSFWorkbook(excelfile);

                //Get first/desired sheet from the workbook
                XSSFSheet sheet = workbook.getSheetAt(0);

                //Iterate through each rows one by one
                Iterator<Row> rowIterator = sheet.iterator();
                int errorCnt = 0;
                int rowloopcnt = 0 ;

                List<UserVo> userVoList = new ArrayList<UserVo>();
                while (rowIterator.hasNext())
                {
                    Row row = rowIterator.next();
                    //첫번째 열 제목 열이라서 무시
                    UserVo userVo = new UserVo();
                    if(rowloopcnt > 0)
                    {
                        Iterator<Cell> cellIterator = row.cellIterator();
                        int loopcnt = 0;
                        while (cellIterator.hasNext())
                        {
                            Cell cell = cellIterator.next();
                            //Check the cell type and format accordingly
                            String cellValue ="";
                            switch (cell.getCellType())
                            {
                                case Cell.CELL_TYPE_NUMERIC:
                                    System.out.print(cell.getNumericCellValue() + "\t");
                                    cellValue = ""+cell.getNumericCellValue();
                                    break;
                                case Cell.CELL_TYPE_STRING:
                                    System.out.print(cell.getStringCellValue() + "\t");
                                    cellValue = cell.getStringCellValue();
                                    break;
                            }

                            userVo.setUser_role("1");
                            if(loopcnt ==0) {

                                if(cellValue == null || cellValue == ""){
                                    resultMessage = (rowloopcnt+1) + "번째 ID가 누락되었습니다.";
                                    errorCnt++;
                                }else{
                                    userVo.setUser_id(cellValue);
                                    int idchk = userService.selectIDCount(userVo);
                                    if(idchk != 0){
                                        resultMessage = (rowloopcnt+1)+"번째 " + cellValue + "의 아이디가 중복되었습니다.";
                                        errorCnt++;
                                    }
                                }
                            }
                            else if(loopcnt == 1){
                                if(cellValue == null || cellValue == ""){
                                    resultMessage = (rowloopcnt+1) + "번째 비밀번호가 누락되었습니다.";
                                    errorCnt++;
                                }else{
                                    userVo.setPassword(cellValue);
                                }
                            }
                            else if(loopcnt == 2){

                                if(cellValue == null || cellValue == ""){
                                    resultMessage = (rowloopcnt+1) + "번째 이름이 누락되었습니다.";
                                    errorCnt++;
                                }else{
                                    userVo.setUser_name(cellValue);
                                }
                            }
                            else if(loopcnt == 3)
                                userVo.setPhone_num(cellValue);
                            else if(loopcnt == 4)
                                userVo.setGroup_name(cellValue);
                            else if(loopcnt == 5)
                                userVo.setShop_name(cellValue);
                            else if (loopcnt == 6)
                                userVo.setCategory_name(cellValue);


                            if(errorCnt > 0) {
                                break;
                            }else{
                                loopcnt++;
                            }
                        }

                        if(errorCnt > 0) {
                            break;
                        }else{
                            userVoList.add(userVo);
                        }
                    }
                    rowloopcnt++;
                }


                if(errorCnt == 0) {
                    //전체 에러가 없는 경우에만 저장을 합니다.
                    resultMessage = "총 " + rowloopcnt + "명이 사용자가 정상적으로 등록되었습니다.";
                    for (UserVo userVo : userVoList) {
                        userService.insert(userVo);
                    }
                }
                excelfile.close();
            } catch (Exception e) {
                e.printStackTrace();
                resultMessage ="정확하지 않은 형식입니다. 다시 확인하시고 업로드 해주세요";
            }
        } else {
            resultMessage ="파일을 등록하지 않았습니다.";
        }

        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/admin/list";
    }

}
