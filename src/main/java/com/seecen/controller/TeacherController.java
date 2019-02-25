package com.seecen.controller;

import com.alibaba.fastjson.JSONObject;
import com.seecen.aop.Syslog;
import com.seecen.pojo.JsonResult;
import com.seecen.pojo.LayuiResult;
import com.seecen.pojo.Page;
import com.seecen.pojo.Teacher;
import com.seecen.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @Syslog("打开教师信息列表")
    @RequestMapping("show")
    public String show(){
        return "teacher/layerlist";
    }

    @Syslog("显示教师列表数据")
    @RequestMapping("/list")
    @ResponseBody
    public LayuiResult<Teacher> list(Integer page, Integer limit,Teacher teacher){
        Page<Teacher> page1 = new Page<>();
        if (page!=null){
            page1.setCurrentPage(page);
        }
        if (limit!=null){
            page1.setPageSize(limit);
        }
        if (teacher!=null){
            page1.setCondition(teacher);
        }
        return teacherService.findTeacherByPage(page1);
    }

    @Syslog("进入添加教师页面")
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "teacher/layeradd";
    }

    @Syslog("添加一条教师数据")
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public void add(Teacher teacher){
        boolean bool = teacherService.insert(teacher);
    }


    @Syslog("删除一个教师")
    @RequestMapping("/del/{tid}")
    @ResponseBody
    public void del(@PathVariable("tid") Integer tid){
        boolean bool = teacherService.deleteByPrimaryKey(tid);
    }

    @Syslog("查看教师信息")
    @RequestMapping("/detail/{tid}")
    public String detail(@PathVariable("tid") Integer tid, Model model){
        Teacher teacher = teacherService.selectByPrimaryKey(tid);
        model.addAttribute("t",teacher);
        return "teacher/layerdetail";
    }

    @Syslog("打开编辑页面")
    @RequestMapping(value = "/edit/{tid}",method = RequestMethod.GET)
    public String edit(@PathVariable("tid") Integer tid,Model model){
        Teacher teacher = teacherService.selectByPrimaryKey(tid);
        model.addAttribute("t",teacher);
        return "teacher/layeredit";
    }
    @Syslog("修改了一个教师信息")
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(Teacher teacher){
        boolean bool = teacherService.updateByPrimaryKeySelective(teacher);
        if (bool){
            return new JsonResult(1,"修改成功");
        }else {
            return new JsonResult(0,"修改失败");
        }
    }


    @Syslog("批量删除")
    @RequestMapping("/multidel")
    @ResponseBody
    public JsonResult multidel(@RequestParam("tnos[]") Integer[] tnos){
        int len = 0;
        for (int i:tnos){
            if (teacherService.deleteByPrimaryKey(i)){
                len++;
            }
        }

        if (len== tnos.length){
            return new JsonResult(1,"批量删除成功");
        }else {
            return new JsonResult(0,"批量删除失败");
        }
    }

    //批量编辑
    @RequestMapping("/multiDetail")
    public String edits(@RequestBody JSONObject obj, RedirectAttributes redirectAttributes){
        List<Teacher> list = new ArrayList<>();

//        List<Teacher> object = (List<Teacher>) JSONArray.parseArray(teas, );//                JSON.parseObject(jsonStr, Map.class);
//        for (String t:teacher){
//            list.add((Teacher) JSON.parse(t));
//        }
        redirectAttributes.addFlashAttribute("t",list);
        return "teacher/layeredits";
    }
    @RequestMapping("editData")
    @ResponseBody
    public LayuiResult<Teacher> data(RedirectAttributes redirectAttributes){
//        List<Teacher> teacher = redirectAttributes.getFlashAttributes(t);
        LayuiResult<Teacher> result = new LayuiResult<>();
        return result;
    }
}