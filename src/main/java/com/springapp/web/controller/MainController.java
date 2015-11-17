package com.springapp.web.controller;

import com.springapp.domain.ImageFileInfoVo;
import com.springapp.domain.ImageInfoVo;
import com.springapp.service.ImageFileInfoService;
import com.springapp.service.ImageInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    ImageInfoService imageInfoService;

    @Autowired
    ImageFileInfoService imageFileInfoService;


    //include 포함.
    @RequestMapping(value = { "/include_top" })
    public String topPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "includes/top";
    }
    @RequestMapping(value = { "/include_bottom" })
    public String bottomPage(ModelMap model) {
        return "includes/bottom";
    }

    //메인 페이지
    @RequestMapping(value = { "/", "/index" })
    public String mainPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "welcome";
    }

    //User List
    @RequestMapping(value = { "/admin", "/admin/list" })
    public String adminListPage(ModelMap model) {
        return "user/list";
    }
    //User write
    @RequestMapping(value = "/admin/write")
    public String adminInsertPage(ModelMap model) {
        return "user/write";
    }
    //User edit
    @RequestMapping(value = "/admin/edit")
    public String adminUpdatetPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "user/edit";
    }


    //Image Upload
    @RequestMapping(value = { "/imgmanager", "/imgmanager/list" }, method = RequestMethod.GET)
    public String manageListPage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        model.addAttribute("imageInfoList", imageInfoService.selectList(imageInfoVo));
        return "managing/list";
    }
    //Image write
    @RequestMapping(value = "/imgmanager/write", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageInsertPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "managing/write";
    }



    //Image write
    @RequestMapping(value = "/imgmanager/write2", method = RequestMethod.POST)
    public String manageInsert(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,HttpServletRequest request,ModelMap model) throws Exception{

        //file upload path
        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadimages/";

        //첫번째는 이미지 정보
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
        //파일들 넣어주시고,
        imageInfoVo.setFileNames(fileNames);
        model.addAttribute("imageInfo",imageInfoVo);

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            model.addAttribute("resultMessage", "정상적으로 등록이 완료되었습니다.");
        }
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        return "managing/preview";
    }


    //Image preview
    @RequestMapping(value = "/imgmanager/preview", method = {RequestMethod.GET, RequestMethod.POST})
    public String managePreview(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        model.addAttribute("user", getPrincipal());
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "managing/preview";
    }


    //Image write
    @RequestMapping(value = "/imgmanager/edit", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageUpdatePage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        model.addAttribute("user", getPrincipal());

        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "managing/edit";
    }



    //Image edit
    @RequestMapping(value = "/imgmanager/edit2", method = RequestMethod.POST)
    public String manageUpdate(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,HttpServletRequest request,ModelMap model) throws Exception{

        final String saveDirectory = request.getSession().getServletContext().getRealPath("/") + "/resources/uploadimages/";
        System.out.println("saveDirectory = " + saveDirectory);
        System.out.println("saveDirectory = " + saveDirectory);
        System.out.println("saveDirectory = " + saveDirectory);
        System.out.println("saveDirectory = " + saveDirectory);
        int result;
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
        if(result > 0 ) {
            model.addAttribute("resultMessage", "정상적으로 수정이 완료되었습니다.");
        }
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));
        return "managing/preview";
    }

    //Image edit
    @RequestMapping(value = "/imgmanager/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageDelete(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{

        int result = 0;
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
        result = imageFileInfoService.deleteAll(imageFileInfoVo);
        result += imageInfoService.delete(imageInfoVo);
        if(result > 0 ) {
            model.addAttribute("resultMessage", "정상적으로 삭제되었습니다.");
        }
        model.addAttribute("imageInfoList", imageInfoService.selectList(imageInfoVo));
        return "managing/list";
    }

    //Image edit
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

    private String getPrincipal(){
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