package com.seecen.service;

import com.seecen.pojo.UserInfo;

public interface SyslogService {
    /**
     *
     * @param userInfo 操作的用户
     * @param operation 操作内容
     * @return
     */
    boolean insertSelective(UserInfo userInfo, String operation);
}
