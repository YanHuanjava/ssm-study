package com.seecen.io;

import java.io.*;

public class ReaderTest {
    public static void main(String[] args) {
        //字符流读取文本文件
//        String tempPath = System.getProperty("user.dir")+ File.separator+"temp";
        String tempPath = "D:\\javastudy\\maven\\SSM-init - 副本\\temp"; //以GBK保存
        try {
//            Reader reader = new FileReader(new File(tempPath,"abc.txt"));
            Reader reader = new InputStreamReader(new FileInputStream(tempPath+"/abc.txt"),"GBK");
//            char[] c = new char[1024];
            char[] c = new char[2]; //可以打断点看看
            int len = reader.read(c);
            while (len != -1){
                String s = new String(c);
                System.out.println(s);
                len = reader.read(c);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
