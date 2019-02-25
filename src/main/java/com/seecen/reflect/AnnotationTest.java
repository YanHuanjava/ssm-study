package com.seecen.reflect;

import java.lang.reflect.Field;

public class AnnotationTest {
    public static void main(String[] args) {
        try {
            Class c = Class.forName("com.seecen.reflect.UserController");
            Object userController = c.newInstance();

            Field[] fields = c.getDeclaredFields();
            for (Field f:fields){
                MyAnnotation myAnnotation = f.getAnnotation(MyAnnotation.class);
                if (myAnnotation!=null){
                    //getType返回的是成员变量类型（UserService）的类对象
                    Class c2 = f.getType();
                    System.out.println(f.getName()+"加了MyAnnotation注解");
                    Object userService = c2.newInstance();
                    //设置为可修改
                    f.setAccessible(true);
                    //把userService赋值给userController
                    f.set(userController,userService);
                    System.out.println(userController);
                }else {
                    System.out.println(f.getName()+"没有MyAnnotation注解");
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
    }
}
