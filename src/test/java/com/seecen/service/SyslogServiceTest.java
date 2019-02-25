package com.seecen.service;

import com.seecen.BaseTest;
import com.seecen.pojo.UserInfo;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class SyslogServiceTest extends BaseTest {
    @Autowired
    private SyslogService syslogService;
    @Test
    public void addLog() throws Exception {
        UserInfo userInfo = new UserInfo();
        userInfo.setUserName("123");
        Assert.assertTrue(syslogService.insertSelective(userInfo,"测试日志添加"));
    }

}