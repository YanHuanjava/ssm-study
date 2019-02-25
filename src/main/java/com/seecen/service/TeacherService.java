package com.seecen.service;

import com.seecen.pojo.LayuiResult;
import com.seecen.pojo.Page;
import com.seecen.pojo.Teacher;

public interface TeacherService {
    LayuiResult<Teacher> findTeacherByPage(Page<Teacher> page);
    boolean insert(Teacher teacher);
    Teacher selectByPrimaryKey(Integer tid);
    boolean deleteByPrimaryKey(Integer tid);
    boolean updateByPrimaryKeySelective(Teacher teacher);
}
