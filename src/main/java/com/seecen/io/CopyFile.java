package com.seecen.io;

import java.io.*;

public class CopyFile {
    public static void main(String[] args) {
        String tempPath = System.getProperty("user.dir")+ File.separator+"temp";
        System.out.println("==========================");
        File filedir = new File(tempPath);
        File[] notes = filedir.listFiles();
        for (File f:notes) {
            System.out.println(f.getPath());
            System.out.println(f.getName());
            System.out.println(f.getAbsolutePath());
        }
        System.out.println("==========================");
        try {
            //读取文件
            FileInputStream is = new FileInputStream(new File(tempPath,"bbb.txt"));
            //输出文件
            File outFile = new File(tempPath,"ccc.txt");
            if (!outFile.exists()){
                outFile.createNewFile();
            }
            //用来写入的文件
            OutputStream os = new FileOutputStream(outFile);
            //一个字节一个字节的读写
//            int i = is.read();
//            while (i>0){
//                os.write(i);
//                i=is.read();
//            }
            int i;
            while ((i=is.read())!=-1){
                os.write(i);
            }

            //一次性读取一个字节
            byte[] b = new byte[2];
            int len;
            while ((len=is.read(b))!=-1){
                os.write(b,0,len);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
