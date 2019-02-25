package com.seecen.io;

import java.io.*;

public class BufferStreamTest {
    public static void main(String[] args) {
        //使用buffer流（缓冲流）来实现文件复制的功能
        String tempPath = System.getProperty("user.dir")+ File.separator+"temp";
        try {
            //采用缓存的方式来读取文件
            InputStream is = new BufferedInputStream(new FileInputStream(tempPath+"/xxx.jpg"));
            //用来写入的文件
            OutputStream os = new BufferedOutputStream(new FileOutputStream(tempPath+"/ooo.jpg"));

            byte[] b = new byte[1024];
            int len;
            while ((len=is.read(b))!=-1){
                os.write(b,0,len);
            }
            os.close();
            is.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
