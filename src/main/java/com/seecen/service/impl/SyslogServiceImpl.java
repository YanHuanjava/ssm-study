package com.seecen.service.impl;

import com.seecen.dao.SyslogMapper;
import com.seecen.pojo.Syslog;
import com.seecen.pojo.UserInfo;
import com.seecen.service.SyslogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class SyslogServiceImpl implements SyslogService {
    @Autowired
    private SyslogMapper syslogMapper;

    @Override
    public boolean insertSelective(UserInfo userInfo, String operation) {
        Syslog syslog = new Syslog();
        if (userInfo!=null){
            syslog.setUserName(userInfo.getUserName());
        }else {
            syslog.setUserName("匿名");
        }
        syslog.setLogInfo(operation);
        syslog.setCreateDate(new Date());
        int row = syslogMapper.insertSelective(syslog);
        return row>0;
    }
}
