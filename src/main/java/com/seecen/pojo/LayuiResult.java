package com.seecen.pojo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
public class LayuiResult<T> {
    private int code;
    private String msg;
    private Long count;
    private List<T> data;
}
