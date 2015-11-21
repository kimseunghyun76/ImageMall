package com.springapp.web.controller;

import com.springapp.domain.ImageFileInfoVo;
import com.springapp.domain.ImageInfoVo;
import com.springapp.domain.UserVo;
import com.springapp.service.ImageFileInfoService;
import com.springapp.service.ImageInfoService;
import com.springapp.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-13
 * Time : 오전 11:21
 * To change this template use File | Settings | File and Code Templates.
 */
@Controller
public class MainController {

    @Autowired
    UserService userService;

    @Autowired
    ImageInfoService imageInfoService;

    @Autowired
    ImageFileInfoService imageFileInfoService;


    //include 포함.
    @RequestMapping(value = { "/include_top" })
    public String topPage(ModelMap model) {
        return "includes/top";
    }
    @RequestMapping(value = { "/include_bottom" })
    public String bottomPage(ModelMap model) {
        return "includes/bottom";
    }

    //include 포함.
    @RequestMapping(value = { "/include_paging" })
    public String pagingPage(ModelMap model) {
        return "includes/paging";
    }

    //메인 페이지
    @RequestMapping(value = { "/", "/index" })
    public String mainPage(ModelMap model) {
        return "welcome";
    }

    ///////////////////////////////////////////////////////////////////////////////////////////
    //User List
    @RequestMapping(value = { "/admin", "/admin/list" }, method = RequestMethod.GET)
    public String adminListPage(@ModelAttribute("userVo") UserVo userVo, @RequestParam(value = "pageNo", required = false) String pageNo,ModelMap model) throws Exception{
        userVo.setPageSize(10); // 한 페이지에 보일 게시글 수
        userVo.setPageNo(1); // 현재 페이지 번호
        if(StringUtils.isNotEmpty(pageNo)){
            userVo.setPageNo(Integer.parseInt(pageNo));
        }
        userVo.setBlockSize(10);
        userVo.setTotalCount(userService.selectListCount(userVo)); // 게시물 총 개수
        model.addAttribute("paging", userVo);
        model.addAttribute("userList", userService.selectList(userVo));
        return "user/list";
    }
    //User write
    @RequestMapping(value = "/admin/write")
    public String adminInsertPage(ModelMap model) {
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
    @RequestMapping(value = "/admin/edit")
    public String adminUpdatePage(@ModelAttribute("userVo") UserVo userVo,ModelMap model) throws Exception{
        model.addAttribute("userinfo", userService.selectInfo(userVo));
        return "user/edit";
    }

    //User write
    @RequestMapping(value = "/admin/edit2", method = RequestMethod.POST)
    public String  adminUpdatePage2(RedirectAttributes redirectAttributes,@ModelAttribute("userVo") UserVo userVo,ModelMap model) throws Exception{
        int result=0;
        result = userService.update(userVo);
        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            resultMessage ="정상적으로 수정이 완료되었습니다.";
        }
       // model.addAttribute("resultMessage", resultMessage);
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/admin/list";
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

    ///////////////////////////////////////////////////////////////////////////////////////////
    //이미지 관리 페이지 이동
    @RequestMapping(value = { "/imgmanager", "/imgmanager/list" }, method = RequestMethod.GET)
    public String manageListPage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo, @RequestParam(value = "pageNo", required = false) String pageNo,ModelMap model) throws Exception{
        imageInfoVo.setPageSize(10); // 한 페이지에 보일 게시글 수
        imageInfoVo.setPageNo(1); // 현재 페이지 번호
        if(StringUtils.isNotEmpty(pageNo)){
            imageInfoVo.setPageNo(Integer.parseInt(pageNo));
        }
        imageInfoVo.setBlockSize(10);
        imageInfoVo.setTotalCount(imageInfoService.selectListCount(imageInfoVo)); // 게시물 총 개수
        model.addAttribute("paging", imageInfoVo);
        imageInfoService.selectList(imageInfoVo);
        model.addAttribute("imageInfoList", imageInfoService.selectList(imageInfoVo));
        return "managing/list";
    }
    //이미지 등록 페이지 이동
    @RequestMapping(value = "/imgmanager/write", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageInsertPage(ModelMap model) {
        return "managing/write";
    }

    //이미지 등록 프로세스
    @RequestMapping(value = "/imgmanager/write2", method = RequestMethod.POST)
    public String manageInsert(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,HttpServletRequest request,ModelMap model) throws Exception{

        //file upload path
        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadimages/";

        //첫번째는 이미지 정보
        imageInfoVo.setUser_id(getSessionUserID());
        imageInfoService.insert(imageInfoVo);

        List<MultipartFile> imageFiles = imageInfoVo.getImageFiles();
        List<String> fileNames = new ArrayList<String>();

        int result = 0;
        if (null != imageFiles && imageFiles.size() > 0) {
            for (MultipartFile multipartFile : imageFiles) {
                /*if(multipartFile.getSize() > 2048000){
                    //파일 용량은 나중에
                }*/

                String fileName = "";
                fileName = multipartFile.getOriginalFilename();

                //파일 이름은 현재 날짜 + 업로드 시퀀스 + random(0 ~1000) 으로 결합
                /*Date today = new Date();
                SimpleDateFormat date = new SimpleDateFormat("yyyyMMddhhmmssSSS");
                fileName = date.format(today).toString();
                System.out.println("2. fileName = " + fileName);*/

                //UUID를 활용한 Random 키
              //  System.out.println("3. fileName = " + fileName);

                //TODO : 나중에는 사용자 키 값이랑 상품명도 추가
                if (!"".equalsIgnoreCase(fileName)) {
                    fileName = imageInfoVo.getImage_seq() +"_"+ UUID.randomUUID().toString().replaceAll("-","") +"."+ fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
                    multipartFile.transferTo(new File(saveDirectory + fileName));
                    fileNames.add(fileName);
                    System.out.println("fileName = " + fileName);

                    //두번째는 파일 정보 (이미지 키를 가지고)
                    //파일이 있는걸 저장합니다.
                    ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
                    imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
                    imageFileInfoVo.setImage_name(fileName);

                    result += imageFileInfoService.insert(imageFileInfoVo);

                    //TODO : 나중에 좀 바꿉시다.
                    //model.addAttribute("imagefileInfo", imageFileInfoService.selectList(imageFileInfoVo));
                }
            }

        }
        //파일들 넣어주시고,
        imageInfoVo.setFileNames(fileNames);
        model.addAttribute("imageInfo", imageInfoVo);



        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 )
            resultMessage ="정상적으로 등록이 완료되었습니다.";
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:imgmanager/list";
    }


    //미리보기 페이지로 이동
    @RequestMapping(value = "/imgmanager/preview", method = {RequestMethod.GET, RequestMethod.POST})
    public String managePreview(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "managing/preview";
    }


    //이미지 수정 페이지로 이동
    @RequestMapping(value = "/imgmanager/edit", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageUpdatePage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "managing/edit";
    }



    //이미지 정보 수정
    @RequestMapping(value = "/imgmanager/edit2", method = RequestMethod.POST)
    public String manageUpdate(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,HttpServletRequest request,ModelMap model) throws Exception{

        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadimages/";

        int result;
        imageInfoVo.setUser_id(getSessionUserID());
        result = imageInfoService.update(imageInfoVo);

        List<MultipartFile> imageFiles = imageInfoVo.getImageFiles();
        List<String> fileNames = new ArrayList<String>();
        if (null != imageFiles && imageFiles.size() > 0) {
            for (MultipartFile multipartFile : imageFiles) {
                String fileName = "";
                fileName = multipartFile.getOriginalFilename();

                //파일 이름은 현재 날짜 + 업로드 시퀀스 + random(0 ~1000) 으로 결합
                /*Date today = new Date();
                SimpleDateFormat date = new SimpleDateFormat("yyyyMMddhhmmssSSS");
                fileName = date.format(today).toString();
                System.out.println("2. fileName = " + fileName);*/

                //UUID를 활용한 Random 키
                //  System.out.println("3. fileName = " + fileName);

                //TODO : 나중에는 사용자 키 값이랑 상품명도 추가
                if (!"".equalsIgnoreCase(fileName)) {
                    fileName = imageInfoVo.getImage_seq() +"_"+ UUID.randomUUID().toString().replaceAll("-","") + ".png";
                    multipartFile.transferTo(new File(saveDirectory + fileName));
                    fileNames.add(fileName);
                    System.out.println("fileName = " + fileName);

                    //두번째는 파일 정보 (이미지 키를 가지고)
                    //파일이 있는걸 저장합니다.
                    ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
                    imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
                    imageFileInfoVo.setImage_name(fileName);

                    result += imageFileInfoService.insert(imageFileInfoVo);

                    //TODO : 나중에 좀 바꿉시다.
                    //model.addAttribute("imagefileInfo", imageFileInfoService.selectList(imageFileInfoVo));
                }
            }
        }


        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 )
            resultMessage ="정상적으로 수정이 완료되었습니다.";
        model.addAttribute("resultMessage", resultMessage);

        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "managing/preview";
    }

    //Image edit
    @RequestMapping(value = "/imgmanager/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageDelete(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        int result = 0;
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        result = imageFileInfoService.deleteAll(imageFileInfoVo);
        result += imageInfoService.delete(imageInfoVo);

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 )
            resultMessage ="정상적으로  삭제되었습니다.";
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:imgmanager/list";
    }


    //업로드 파일 삭제(JSON)
    @RequestMapping(value = "/imgmanager/deleteFile", method = RequestMethod.GET)
    public @ResponseBody String
    manageDelete(@ModelAttribute("imageFileInfoVo") ImageFileInfoVo imageFileInfoVo) throws Exception{
        imageFileInfoService.delete(imageFileInfoVo);
        return "0";
    }


















    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        return "accessDenied";
    }

    //login
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    //logout
    @RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
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
}