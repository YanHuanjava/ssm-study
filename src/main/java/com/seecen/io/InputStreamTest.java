package com.seecen.io;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class InputStreamTest {
    public static void main(String[] args) {
        byte[] b = {95,45,-15,78,-51,88,'a','A'};
        //把数据指定给字节数组输入流
        ByteArrayInputStream bai = new ByteArrayInputStream(b);
        int i = bai.read();
        while (i!=-1){
            System.out.println(i);
            i=bai.read();
        }
        try {
            bai.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
