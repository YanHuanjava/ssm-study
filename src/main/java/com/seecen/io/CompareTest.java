package com.seecen.io;

import java.io.*;
import java.util.Arrays;

public class CompareTest {
    public static void main(String[] args) {

        String tempPath = System.getProperty("user.dir")+ File.separator+"temp"+File.separator;
        String zs = tempPath+"张三.txt";
        String ls = tempPath+"李四.txt";

        File zsfile = new File(zs);
        File lsfile = new File(ls);

        try {
            InputStream zsis = new FileInputStream(zsfile);
            InputStream lsis = new FileInputStream(lsfile);
        //一个字节一个字节比较
            int a,b,i=0;
            do {
                i++;
                a = zsis.read();
                b = lsis.read();
                if (a==b && a!=-1){
                    System.out.println("第"+i+"个字符相同");
                }else if(a==-1 && b==-1){
                    System.out.println("两个文件相同");
                    break;
                }else if(a==-1 || b==-1){
                    System.out.println("文件不相同");
                    break;
                }
            }while (true);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

//        try {
//            Reader readerzs = new FileReader(zsfile);
//            Reader readerls = new FileReader(lsfile);
//            char[] c = new char[5];
//            char[] c1 = new char[5];
//
//            int len = readerzs.read(c);
//            readerls.read(c1);
//
//            System.out.println("==========");
//            while (len!=-1){
//                System.out.print("c:"+new String(c));
//                System.out.print("\tc1:"+new String(c1)+"\t");
//                System.out.println(Arrays.equals(c, c1));
//                len = readerzs.read(c);
//                readerls.read(c1);
//            }
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}
