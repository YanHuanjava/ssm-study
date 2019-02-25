package com.seecen.io;

import java.io.*;

public class FileInputStreamTest {
    public static void main(String[] args) {
        //创建File对象映射到要读取的文件
        File file = new File("D:\\javastudy\\maven\\SSM-init - 副本\\temp\\abc.txt");
        if (file.exists()){
            try {
                //用来读取的文件
                InputStream is = new FileInputStream(file);
                int i = is.read();
                while (i!=-1){
                    char c = (char) i;
                    System.out.println(i+":"+c);
                    i=is.read();
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
