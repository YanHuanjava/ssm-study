package com.seecen.thread;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;

public class DownImgs extends Thread {
    public static String imgPre = "http://ossweb-img.qq.com/images/lol/web201310/skin/big26700";
    public static String imgAfter = ".jpg";

    private String imgPath;
    public DownImgs(String imgPath){
        this.imgPath = imgPath;
    }

    @Override
    public void run() {
        try {
            URL url = new URL(imgPath);
            //被下载的文件
            InputStream is = new DataInputStream(url.openStream());
            //保存为：
            String savePath = System.getProperty("user.dir")+ File.separator+"temp"+File.separator+imgPath.substring(imgPath.lastIndexOf("/"));
            FileOutputStream fos = new FileOutputStream(savePath);
            byte[] b = new byte[1024];
            int len;
            while ((len=is.read(b))!=-1){
                fos.write(b,0,len);
            }
            fos.flush();
            fos.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            DownImgs thread = new DownImgs(imgPre+i+imgAfter);
            thread.start();
        }
    }
}
