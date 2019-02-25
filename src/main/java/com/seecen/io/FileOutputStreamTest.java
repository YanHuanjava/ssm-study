package com.seecen.io;

import java.io.*;

public class FileOutputStreamTest {
    public static void main(String[] args) {
        //获取项目的目录
        String projectPath = System.getProperty("user.dir");
        System.out.println(projectPath);
        File file = new File(projectPath,"temp/bbb.txt");
        if (!file.exists()){
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try {
            //用来写入的文件
            OutputStream os = new FileOutputStream(file);
            byte[] data = {45,23,-12,-10,'\n','\t','k','a'}; //被写入的数据
            os.write(data);
            os.flush();
            os.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
