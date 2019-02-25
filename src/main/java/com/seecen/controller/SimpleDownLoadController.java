package com.seecen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;

@Controller
@RequestMapping("io")
public class SimpleDownLoadController {

    @RequestMapping(value = "down",method = RequestMethod.GET)
    public String down(){
        return "io/down";
    }

    @RequestMapping(value = "down",method = RequestMethod.POST)
    public void down(String url, HttpServletResponse response){
        if (url!=null){
            try {
                URL u = new URL(url);
                InputStream is = new DataInputStream(u.openStream());
                System.out.println(System.getProperty("user.dir"));

//                File file = new File("D:\\javastudy\\maven\\SSM-init - 副本\\temp","xxx.png");
//                FileOutputStream fos = new FileOutputStream(file);

                //设置头信息
                response.setContentType("application/octet-stream;charset=utf-8");
                response.setCharacterEncoding("utf-8");
                String fileName = "xxx.jpg";
                response.addHeader("Content-Disposition","attachment;filename="
                        +new String(fileName.getBytes("gbk"),"iso-8859-1"));
                OutputStream fos = response.getOutputStream();

                byte[] b = new byte[1024];
                int len;
                while ((len=is.read(b))!=-1){
                    fos.write(b,0,len);
                }
                fos.close();
                is.close();
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}
