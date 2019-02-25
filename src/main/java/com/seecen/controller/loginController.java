package com.seecen.controller;

import com.seecen.pojo.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class loginController {
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String showLogin(){
        return "login";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(UserInfo userInfo, HttpSession session){
        if(true){
            session.setAttribute("user_info",userInfo);
//            return "redirect:/teacher/show";
            return "redirect:/chat.html";
        }
        return "login";
    }
}
