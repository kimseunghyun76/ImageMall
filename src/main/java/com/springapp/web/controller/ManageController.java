package com.springapp.web.controller;

import com.springapp.domain.ImageFileInfoVo;
import com.springapp.domain.ImageInfoVo;
import com.springapp.domain.UserVo;
import com.springapp.service.ImageFileInfoService;
import com.springapp.service.ImageInfoService;
import com.springapp.service.ProductService;
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
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by jooyoung on 2015-11-22.
 */
@Controller
public class ManageController {

    @Autowired
    ImageInfoService imageInfoService;

    @Autowired
    ImageFileInfoService imageFileInfoService;


    @RequestMapping(value = { "/imgManage", "/imgManage/list" }, method = RequestMethod.GET)
    public String manageListPage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo, @RequestParam(value = "pageNo", required = false) String pageNo,ModelMap model) throws Exception{
        //페이징 정보
        imageInfoVo.setPageSize(10);        // 한 페이지에 보일 게시글 수
        imageInfoVo.setPageNo(1);           // 현재 페이지 번호
        if(StringUtils.isNotEmpty(pageNo)){
            imageInfoVo.setPageNo(Integer.parseInt(pageNo));
        }
        imageInfoVo.setBlockSize(10);

        if(imageInfoVo.getUser_role()== null || imageInfoVo.getUser_role().equals("0")){
            imageInfoVo.setUser_role("");
        }
        if(imageInfoVo.getImage_type()== null || imageInfoVo.getImage_type().equals("0")){
            imageInfoVo.setImage_type("");
        }

        imageInfoVo.setUser_id(getSessionUserID());                               // 계정정보를 넣어 줍시다.
        imageInfoVo.setTotalCount(imageInfoService.selectListCount(imageInfoVo)); // 게시물 총 개수
        model.addAttribute("paging", imageInfoVo);

        imageInfoService.selectList(imageInfoVo);
        model.addAttribute("imageInfoList", imageInfoService.selectList(imageInfoVo));
        return "manage/list";
    }

    //이미지 등록 페이지 이동
    @RequestMapping(value = "/imgManage/write", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageInsertPage(ModelMap model)  throws Exception{
        UserVo userVo = new UserVo();

        return "manage/write";
    }

    //이미지 등록 프로세스
    @RequestMapping(value = "/imgManage/write2", method = RequestMethod.POST)
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
                String fileName = "";
                fileName = multipartFile.getOriginalFilename();

                //TODO : 나중에는 사용자 키 값이랑 상품명도 추가
                if (!"".equalsIgnoreCase(fileName)) {
                    fileName = imageInfoVo.getImage_seq() +"_"+ UUID.randomUUID().toString().replaceAll("-","") +"."+ fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
                    multipartFile.transferTo(new File(saveDirectory + fileName));
                    fileNames.add(fileName);

                    //두번째는 파일 정보 (이미지 키를 가지고)
                    //파일이 있는걸 저장합니다.
                    ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
                    imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());
                    imageFileInfoVo.setImage_name(fileName);

                    result += imageFileInfoService.insert(imageFileInfoVo);
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
        return "redirect:/imgManage/list";
    }

    //미리보기 페이지로 이동
    @RequestMapping(value = "/imgManage/preview", method = {RequestMethod.GET, RequestMethod.POST})
    public String managePreview(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());

        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));

        return "manage/preview";
    }

    //이미지 수정 페이지로 이동
    @RequestMapping(value = "/imgManage/edit", method = {RequestMethod.GET, RequestMethod.POST})
    public String manageUpdatePage(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        ImageFileInfoVo imageFileInfoVo = new ImageFileInfoVo();
        imageFileInfoVo.setImage_seq(imageInfoVo.getImage_seq());

        model.addAttribute("imageFileInfo", imageFileInfoService.selectList(imageFileInfoVo));
        model.addAttribute("imageInfo", imageInfoService.selectInfo(imageInfoVo));

        return "manage/edit";
    }


    //이미지 정보 수정
    @RequestMapping(value = "/imgManage/edit2", method = RequestMethod.POST)
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

        return "redirect:/imgManage/preview?image_seq=" + imageInfoVo.getImage_seq();
    }


    //이미지 정보 삭제
    @RequestMapping(value = "/imgManage/delete", method = {RequestMethod.GET, RequestMethod.POST})
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
        return "redirect:/imgManage/list";
    }


    //업로드 파일 삭제(JSON)
    @RequestMapping(value = "/imgManage/deleteFile", method = RequestMethod.GET)
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

    //승인 요청 처리
    @RequestMapping(value = "/imgManage/grant", method = {RequestMethod.GET, RequestMethod.POST})
    public String grantSave(RedirectAttributes redirectAttributes,@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo,ModelMap model) throws Exception{
        int result = 0;
        result = imageInfoService.update(imageInfoVo);

        String resultMessage ="관리자에게 문의 바랍니다.";
        if(result > 0 ) {
            resultMessage = "정상적으로 승인 요청 처리 되었습니다.";
        }
        redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
        return "redirect:/imgManage/list";
    }

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/imgManage/productList.json", method = RequestMethod.POST)
    public String productList(@ModelAttribute("imageInfoVo") ImageInfoVo imageInfoVo, @RequestParam(value = "pageNo", required = false) String pageNo,ModelMap model) throws Exception{

        //페이징 정보
        imageInfoVo.setPageSize(200);        // 한 페이지에 보일 게시글 수
        imageInfoVo.setPageNo(1);           // 현재 페이지 번호
        if(StringUtils.isNotEmpty(pageNo)){
            imageInfoVo.setPageNo(Integer.parseInt(pageNo));
        }
        imageInfoVo.setBlockSize(10);
        imageInfoVo.setTotalCount(productService.selectListCount(imageInfoVo)); // 게시물 총 개수
        //model.put("productList", productService.selectList(imageInfoVo));
        model.addAttribute("totalCount",imageInfoVo.getTotalCount());
        model.addAttribute("resultList",productService.selectList(imageInfoVo));		//리스트

        return "jsonView";
    }

}
