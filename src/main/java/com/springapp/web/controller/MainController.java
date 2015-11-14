package com.springapp.web.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-13
 * Time : 오전 11:21
 * To change this template use File | Settings | File and Code Templates.
 */
@Controller
public class MainController {

    //include 포함.
    @RequestMapping(value = { "/include_top" }, method = RequestMethod.GET)
    public String topPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "includes/top";
    }
    @RequestMapping(value = { "/include_bottom" }, method = RequestMethod.GET)
    public String bottomPage(ModelMap model) {
        return "includes/bottom";
    }

    //메인 페이지
    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String mainPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "welcome";
    }

    //User List
    @RequestMapping(value = { "/admin", "/admin/list" }, method = RequestMethod.GET)
    public String adminListPage(ModelMap model) {
        return "user/list";
    }
    //User write
    @RequestMapping(value = "/admin/write", method = RequestMethod.GET)
    public String adminInsertPage(ModelMap model) {
        return "user/write";
    }
    //User edit
    @RequestMapping(value = "/admin/edit", method = RequestMethod.GET)
    public String adminUpdatetPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "user/edit";
    }


    //Image Upload
    @RequestMapping(value = { "/imgmanager", "/imgmanager/list" }, method = RequestMethod.GET)
    public String manageListPage(ModelMap model) {
        return "managing/list";
    }
    //Image write
    @RequestMapping(value = "/imgmanager/write", method = RequestMethod.GET)
    public String manageInsertPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "managing/write";
    }
    //Image edit
    @RequestMapping(value = "/imgmanager/edit", method = RequestMethod.GET)
    public String manageUpdatePage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "managing/edit";
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
    @RequestMapping(value="/logout", method = RequestMethod.GET)
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