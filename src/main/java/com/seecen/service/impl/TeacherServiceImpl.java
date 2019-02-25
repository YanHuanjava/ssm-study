package com.seecen.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.seecen.pojo.LayuiResult;
import com.seecen.dao.TeacherMapper;
import com.seecen.pojo.Page;
import com.seecen.pojo.Teacher;
import com.seecen.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//交给spring来管理，自动注入
@Service
public class TeacherServiceImpl implements TeacherService {
    //spring根据注解自动注入需要的依赖类，自动查找实现了接口的类对象

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public LayuiResult<Teacher> findTeacherByPage(Page<Teacher> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        PageInfo<Teacher> pageInfo = new PageInfo<>(teacherMapper.findTeacherByPage(page.getCondition()));
        LayuiResult<Teacher> result = new LayuiResult<>();
        result.setCount(pageInfo.getTotal());
        result.setData(pageInfo.getList());
        return result;
    }

    @Override
    public boolean insert(Teacher teacher) {
        int row = teacherMapper.insert(teacher);
        return row>0;
    }

    @Override
    public Teacher selectByPrimaryKey(Integer tid) {
        Teacher teacher = teacherMapper.selectByPrimaryKey(tid);
        return teacher;
    }

    @Override
    public boolean deleteByPrimaryKey(Integer tid) {
        int row = teacherMapper.deleteByPrimaryKey(tid);
        return row>0;
    }

    @Override
    public boolean updateByPrimaryKeySelective(Teacher teacher) {
        int row = teacherMapper.updateByPrimaryKeySelective(teacher);
        return row>0;
    }
}
