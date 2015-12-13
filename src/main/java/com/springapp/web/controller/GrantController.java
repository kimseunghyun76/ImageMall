package com.springapp.web.controller;

import com.springapp.domain.ImageFileInfoVo;
import com.springapp.domain.ImageInfoVo;
import com.springapp.domain.UserVo;
import com.springapp.service.ImageFileInfoService;
import com.springapp.service.ImageInfoService;
import com.springapp.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by jooyoung on 2015-11-22.
 */
@Controller
public class GrantController {

    @Autowired
    UserService userService;

    @Autowired
    ImageInfoService imageInfoService;

    @Autowired
    ImageFileInfoService imageFileInfoService;


    @RequestMapping(value = { "/imgGrant", "/imgGrant/list" }, method = RequestMethod.GET)
    public String grantlistPage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo, @RequestParam(value = "pageNo", required = false) String pageNo,ModelMap model,HttpSession session) throws Exception{
        imageInfoVo.setPageSize(10); // 한 페이지에 보일 게시글 수
        imageInfoVo.setPageNo(1); // 현재 페이지 번호
        if(StringUtils.isNotEmpty(pageNo)){
            imageInfoVo.setPageNo(Integer.parseInt(pageNo));
        }
        imageInfoVo.setBlockSize(10);

        if(imageInfoVo.getStatus()== null || imageInfoVo.getStatus().equals("0")){
            imageInfoVo.setStatus("1");
        }
        if(imageInfoVo.getUser_role()== null || imageInfoVo.getUser_role().equals("0")){
            imageInfoVo.setUser_role("");
        }

        //본인의 조직은 fix
        if(!session.getAttribute("my_user_role").toString().equals("3")) {
            imageInfoVo.setGroup_now_name(session.getAttribute("my_group_name").toString());
        }

        //selectGrantList , selectGrantListCount 는 승인취소를 제외한 3가지 타입이 나와야 함.
        // 승인신청, 반려, 승인 ...
        imageInfoVo.setTotalCount(imageInfoService.selectGrantListCount(imageInfoVo)); // 게시물 총 개수
        model.addAttribute("paging", imageInfoVo);
        imageInfoService.selectList(imageInfoVo);
        model.addAttribute("imageInfoList", imageInfoService.selectGrantList(imageInfoVo));

        return "grant/list";
    }

    //미리보기 페이지로 이동
    @RequestMapping(value = "/imgGrant/preview", method = {RequestMethod.GET, RequestMethod.POST})
    public String managePreview(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "grant/preview";
    }

    //이미지 수정 페이지로 이동
    @RequestMapping(value = "/imgGrant/edit", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageUpdatePage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "grant/edit";
    }

    //이미지 정보 수정
    @RequestMapping(value = "/imgGrant/edit2", method = RequestMethod.POST)
    public String manageUpdate(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,HttpServletRequest request,ModelMap model) throws Exception{

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
                }
            }
        }

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 )
            resultMessage ="정상적으로 수정이 완료되었습니다.";
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);

        return "redirect:/imgGrant/preview?image_seq=" + imageInfoVo.getImage_seq();
    }

    //업로드 파일 삭제
    @RequestMapping(value = "/imgGrant/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageDelete(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,HttpServletRequest request,ModelMap model) throws Exception{
        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadimages/";
        int result = 0;
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());

        List<ImageFileInfoVo> imagefileList = imageFileInfoService.selectList(imageFileInfoVo);
        try{
            for(ImageFileInfoVo imageFileInfoVo1 :  imagefileList) {
                File file = new File(saveDirectory + imageFileInfoVo1.getImage_name());
                if (file.delete()) {
                    System.out.println(file.getName() + " is deleted!");
                } else {
                    System.out.println("Delete operation is failed.");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }


        result = imageFileInfoService.deleteAll(imageFileInfoVo);
        result += imageInfoService.delete(imageInfoVo);

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 )
            resultMessage ="정상적으로  삭제되었습니다.";
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/imgGrant/list";
    }


    //승인/반려처리
    @RequestMapping(value = "/imgGrant/grant", method = {RequestMethod.GET, RequestMethod.POST})
    public String grantSave(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        int result = 0;
        result = imageInfoService.update(imageInfoVo);

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            if(imageInfoVo.getStatus().equals("3"))
                resultMessage ="반려 처리 되었습니다.";
            else
                resultMessage = "정상적으로 승인 처리 되었습니다.";
        }
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/imgGrant/list";
    }


    //승인/반려처리
    @RequestMapping(value = "/imgGrant/grantAll", method = {RequestMethod.GET, RequestMethod.POST})
    public String grantAllSave(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        int result = 0;

        String[] image_seqs = imageInfoVo.getImage_seqs().split(";");
        for(int i = 0 ; i < image_seqs.length;i++){
            imageInfoVo.setImage_seq(Integer.parseInt(image_seqs[i]));
            result += imageInfoService.update(imageInfoVo);
        }

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            if(imageInfoVo.getStatus().equals("3"))
                resultMessage ="총 " + result + "건이 반려 처리 되었습니다.";
            else
                resultMessage = "총 " + result + "건이 정상적으로 승인 처리 되었습니다.";
        }
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/imgGrant/list";
    }



    //업로드 파일 삭제(JSON)
    @RequestMapping(value = "/imgGrant/deleteFile", method = RequestMethod.GET)
    public @ResponseBody
    String
    manageDelete(@ModelAttribute("imageFileInfoVo") ImageFileInfoVo imageFileInfoVo,HttpServletRequest request) throws Exception{
        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadimages/";
        ImageFileInfoVo imageFileInfoVo2 = imageFileInfoService.selectInfo(imageFileInfoVo);
        try{
            File file = new File(saveDirectory + imageFileInfoVo2.getImage_name());
            if(file.delete()){
                System.out.println(file.getName() + " is deleted!");
            }else{
                System.out.println("Delete operation is failed.");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        imageFileInfoService.delete(imageFileInfoVo);
        return "0";
    }

    //세션 정보를 읽고 싶답니다.
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
