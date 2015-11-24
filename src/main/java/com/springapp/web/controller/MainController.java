package com.springapp.web.controller;

import com.springapp.domain.UserVo;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

}