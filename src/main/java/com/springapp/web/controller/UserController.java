package com.springapp.web.controller;

import com.springapp.domain.UserVo;
import com.springapp.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by jooyoung on 2015-11-22.
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;


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
        if(userVo.getUser_role()== null || userVo.getUser_role().equals("0")){
            userVo.setUser_role("");
        }

        userVo.setTotalCount(userService.selectListCount(userVo)); // 게시물 총 개수
        model.addAttribute("paging", userVo);
        model.addAttribute("userList", userService.selectList(userVo));
        model.addAttribute("myid", getSessionUserID());
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
}
