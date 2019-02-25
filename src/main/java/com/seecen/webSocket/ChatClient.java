package com.seecen.webSocket;

import com.alibaba.fastjson.JSON;
import com.seecen.pojo.UserInfo;
import lombok.Getter;
import lombok.Setter;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

//客户端连接服务器端的地址,,configurator使用自定义的配置
//
@ServerEndpoint(value = "/sc",configurator = GetHttpSession.class)
@Getter
@Setter
public class ChatClient {
    //用一个集合保存所有客户端对象
    //CopyOnWriteArraySet并发包下面的集合类，这个类中的一些方法加了同步锁，防止数据不正确，
    // 是线程安全的
    private static CopyOnWriteArraySet<ChatClient> clients = new CopyOnWriteArraySet<>();
    //客户端连接服务器端会创建一个会话对象，通过这个对象可以向客户端发送消息
    private Session session;  //当前用户session
    private UserInfo userInfo; //当前用户信息

    //当客户端连接到服务器端，会出发加了@OnOpen注解的方法调用
    @OnOpen
    public void onOpen(Session session,EndpointConfig config){
        //将session取出
//        UserInfo userInfo = (UserInfo) ((HttpSession) session.getUserProperties().get(HttpSession.class.getName())).getAttribute("user_info");
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        UserInfo userInfo = (UserInfo) httpSession.getAttribute("user_info");
        this.userInfo = userInfo;
        this.session = session;
        clients.add(this);

        for (ChatClient c:clients){
            c.sendMessage(userInfo.getUserName()+"加入了聊天室，当前在线人数为："+clients.size());
        }
    }

    //必须要有参数，用来接收客户端发送过来的数据
    @OnMessage
    public void onMessage(String message,Session session){
        System.out.println(message);
        //将字符串转换为对象
        Message message1 = JSON.parseObject(message,Message.class);

        //把消息推送到所有的客户端
        if (message1.getType()==0){ //群聊
            for (ChatClient c:clients){
                c.sendMessage(userInfo.getUserName()+"群发:"+message1.getMsg());
            }
        }else {//私聊，找到指定对象单独发送一条信息
            try {
                this.session.getBasicRemote().sendText(userInfo.getUserName()+"对"+message1.getToUser()+"说:"+message1.getMsg());
            } catch (IOException e) {
                e.printStackTrace();
            }
            for (ChatClient c:clients) {
                if (c.getUserInfo().getUserName().equals(message1.getToUser()) && !this.userInfo.getUserName().equals(message1.getToUser())){
                    c.sendMessage(userInfo.getUserName()+"对"+message1.getToUser()+"说:"+message1.getMsg());
                    break;
                }

            }
        }

    }

    @OnError
    public void onError(Throwable error){
        error.printStackTrace();
        System.out.println("客户端连接失败");
    }

    @OnClose
    public void onClose(){
        clients.remove(this);
        this.session=null; //让垃圾回收机制更好的回收它
        for (ChatClient c:clients){
            c.sendMessage(userInfo.getUserName()+"退出群聊,当前在线人数为："+clients.size());
        }
    }

    public void sendMessage(String msg){
        try {
            this.session.getBasicRemote().sendText(msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
