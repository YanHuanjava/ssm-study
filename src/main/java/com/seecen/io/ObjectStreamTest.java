package com.seecen.io;

import com.seecen.pojo.Teacher;

import java.io.*;

public class ObjectStreamTest {
    //对象序列化：就是把对象数据保存到文件中
    //反序列化：把文件中的数据还原成对象
    public static void main(String[] args) {
        Teacher teacher = new Teacher();
        teacher.setTname("zhangsan");
        teacher.setTsex("男");
        File file = new File(System.getProperty("user.dir"),"temp/teacher.txt");
        try {
            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file));
            oos.writeObject(teacher);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


        //反序列化
        try {
            ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file));
            Object obj = ois.readObject();
            if (obj!=null){
                if (obj instanceof Teacher){
                    Teacher t = (Teacher) obj;
                    System.out.println("用户名:"+t.getTname()+"\n性别:"+t.getTsex());
                }
            }else {
                System.out.println("反序列化失败");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
