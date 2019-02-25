package com.seecen.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class JsonResult {
    private Integer code;  //1成功 0 失败
    private String msg;  //消息内容
}
