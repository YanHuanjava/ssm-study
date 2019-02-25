package com.seecen.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

//实现可以序列化的接口
public class Teacher implements Serializable{
    private Integer tno;

    private String tname;

    private String tsex;

    @JSONField(format = "yyyy-MM-dd")  //把日期对象转换为json字符串
    @DateTimeFormat(pattern = "yyyy-MM-dd")  //表单提交时，把字符串的日期转换为Date对象
    private Date tbirthday;

    private String tprof;

    private String tdepart;

    public Integer getTno() {
        return tno;
    }

    public void setTno(Integer tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex == null ? null : tsex.trim();
    }

    public Date getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(Date tbirthday) {
        this.tbirthday = tbirthday;
    }

    public String getTprof() {
        return tprof;
    }

    public void setTprof(String tprof) {
        this.tprof = tprof == null ? null : tprof.trim();
    }

    public String getTdepart() {
        return tdepart;
    }

    public void setTdepart(String tdepart) {
        this.tdepart = tdepart == null ? null : tdepart.trim();
    }
}