package com.seecen.thread;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;

public class DownLOLImgs extends Thread {
    public static String imgPre = "http://ossweb-img.qq.com/images/lol/web201310/skin/big";
    public static String SAVE_PATH = System.getProperty("user.dir")+ File.separator+"lol"+File.separator;

    private static int  MAX = 106;
    private static int INDEX = 101;

    @Override
    public void run() {
        while (INDEX < MAX){
            //对所有英雄的循环
            String id = "";
            synchronized (DownLOLImgs.class){
                id = String.valueOf(INDEX++);
            }
            //同一个英雄的不同皮肤
            for (int i = 0; i < 10; i++) {
                String fileName = id+"00"+i+".jpg";
                try {
                    URL url = new URL(imgPre+fileName);
                    InputStream is = new DataInputStream(url.openStream());
                    FileOutputStream fos = new FileOutputStream(SAVE_PATH+fileName);

                    int len;
                    byte[] b = new byte[1024];
                    while ((len=is.read(b))!=-1){
                        fos.write(b,0,len);
                    }
                    fos.flush();
                    fos.close();
                    is.close();
                    System.out.println(getName()+"INFO--------------编号为" + id + "英雄的皮肤"+i+"下载完成");
                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (FileNotFoundException e){
                    System.out.println("ERROR_______________没有编号为" + id + "英雄的第" + i + "张图片");
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) {

        for (int i = 1;i<= 5;i++){
            DownLOLImgs downLOLImgs = new DownLOLImgs();
            downLOLImgs.setName("第"+i+"个线程");
            downLOLImgs.start();
            System.out.println("开启迪"+i+"个线程");

        }
    }
}
