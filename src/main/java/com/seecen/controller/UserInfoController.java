package com.seecen.controller;

import com.seecen.dao.UserInfoMapper;
import com.seecen.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @RequestMapping("/list")
    @ResponseBody
    public List<UserInfo> list(Model model){
        List<UserInfo> list = userInfoMapper.selectByExample(null);
        return list;
    }
}
