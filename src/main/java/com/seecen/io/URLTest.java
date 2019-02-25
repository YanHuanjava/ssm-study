package com.seecen.io;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

public class URLTest {
    public static void main(String[] args) {
        String img = "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2480074190,1258483947&fm=173&app=25&f=JPEG?w=218&h=146&s=E4BB30D55E1223DA0E1C5C110300E0F0";
        String html = "https://www.csdn.net/";
        try {
//            URL url = new URL(img);
            URL url = new URL(html);
            try {
                //读取网络上文件的二进制数据
                DataInputStream dis = new DataInputStream(url.openStream()); //打开一个输入流
                // 保存文件的地址
                String savePath = System.getProperty("user.dir")+ File.separator+"temp"+File.separator+"xxx.html";
                //把二进制数据输出到文件中
                FileOutputStream fos = new FileOutputStream(savePath);

                byte[] b = new byte[1024];
                int len;
                while ((len=dis.read(b))!=-1){
                    fos.write(b,0,len);
                }
                fos.flush();
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }
}
