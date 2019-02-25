package com.seecen.pojo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
public class Page<E> {
    private Integer currentPage=1;
    private Integer pageSize = 5;
    private Long total;
    private List<E> list;
    private E condition;//业务条件

    //开始的那条记录
    public Integer getStart(){
        return (currentPage-1)*pageSize;
    }
    //结束记录
    public Integer getEnd() {
        return currentPage*pageSize;
    }
    //总页数
    public Integer getTotalPage(){
        return (int)Math.ceil(total*1.0/pageSize);
    }
}
