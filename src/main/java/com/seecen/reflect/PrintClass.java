package com.seecen.reflect;


import org.springframework.beans.factory.annotation.Autowired;

import java.lang.annotation.Annotation;
import java.lang.reflect.*;

public class PrintClass {
    /**
     * 打印指定类的信息
     * @param className
     */
    public static void printClass(String className){
        try {
            Class c1 = Class.forName(className);
//            System.out.println(c1.);
            System.out.println(Modifier.toString(c1.getModifiers())+" class "+c1.getSimpleName()+" {");

            //属性
            Field[] fields = c1.getDeclaredFields();  //获取当前类的所有属性
            Field[] fields1 = c1.getFields();  //获取当前类以及它的父类的属性
            for (Field f:fields) {
                System.out.println("\t"+ Modifier.toString(f.getModifiers())+" "+f.getType().getSimpleName()+" "+f.getName()+";");
            }

            //构造函数
            Constructor[] constructors = c1.getConstructors();
            for (Constructor c:constructors) {
                Annotation[] annotations = c.getAnnotations();
                for (Annotation a:annotations){
                    System.out.println(a.annotationType().getName()+"========Annotation=======");
                }

                System.out.print("\n\t"+Modifier.toString(c.getModifiers())+" "+c1.getSimpleName()+"(");

                Class[] classes = c.getParameterTypes();
                for (int i = 0;i<classes.length;i++) {
                    System.out.print(classes[i].getSimpleName()+" var"+i);
                    if (i<classes.length-1){
                        System.out.print(", ");
                    }
                }
                System.out.println(") {\n\t}");
            }

            //方法
            Method[] methods = c1.getDeclaredMethods();
            for (Method m:methods) {
                Annotation[] annotations = m.getAnnotations();
                for (Annotation a:annotations){
                    System.out.println(a.annotationType().getSimpleName());
                }
                System.out.print("\n\t"+Modifier.toString(m.getModifiers())+" "+m.getReturnType().getSimpleName()+" "+m.getName()+"(");
                Parameter[] parameter=m.getParameters();

                for (int i = 0; i <parameter.length ; i++) {
                    System.out.print(parameter[i].getType().getSimpleName()+" "+parameter[i].getName());
                    if (i<parameter.length-1){
                        System.out.print(",");
                    }
                }
                System.out.println(") {\n\t}");
            }

            System.out.println("}");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        printClass("com.seecen.pojo.UserInfo");
        System.out.println("===========================");
        printClass("com.seecen.reflect.UserController");
    }
}
