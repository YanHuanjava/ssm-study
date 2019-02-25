package com.seecen.io;

import java.io.*;

public class WriteTest {
    public static void main(String[] args) {
        //八字符写到文件中
        //字节输出
        String tempPath = System.getProperty("user.dir")+"/temp";
        File file = new File(tempPath,"en.txt");
        if (!file.exists()){
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//        byte[] data = {65,97,98,'\n','\t','a','b','c'};
//        try {
//            FileOutputStream fos = new FileOutputStream(file);
//            fos.write(data);
//            fos.close();
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        //写入两字节文本（字符）
//        file = new File(tempPath,"zh.txt");
//        if (!file.exists()){
//            try {
//                file.createNewFile();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
        try {
            Writer writer = new FileWriter(file);
            writer.write("你好\r\n字符输出流");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
