package com.seecen.webSocket;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Message {
    //0:群聊，1私聊
    private int type;
    private String sendUser;
    private String toUser;
    private String msg;
}
