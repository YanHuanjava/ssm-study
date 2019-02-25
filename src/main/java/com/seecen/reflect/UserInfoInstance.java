package com.seecen.reflect;

import com.seecen.pojo.UserInfo;

import java.lang.reflect.*;

public class UserInfoInstance {

    /**
     * 通过反射获取类的三种方式
     * @param args
     */
    public static void main(String[] args) {

        try {
            //1、通过类的全名来实例化类
            Class c1 = Class.forName("com.seecen.pojo.UserInfo");
            Object obj = c1.newInstance();
            System.out.println(obj instanceof UserInfo);
            UserInfo userInfo = (UserInfo) obj;

            //2、
            Class c2 = UserInfo.class;
            Object obj2 = c2.newInstance();

            //3、通过对象获取所属的类
            UserInfo userInfo1 = new UserInfo();
            Class c3 = userInfo.getClass();
            Object obj3= c3.newInstance();

            System.out.println(obj);
            System.out.println(obj2);
            System.out.println(obj3);

 //=================通过构造函数创建对象=================
            try {
                c1 = Class.forName("com.seecen.pojo.UserInfo");
                Constructor con = c1.getConstructor(String.class,String.class);
                Object obj4 = con.newInstance("张三","123");
                System.out.println("构造函数创建对象"+obj4);
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }


 //获=================取类的属性=================
            Field[] fields = c1.getDeclaredFields();
            for (Field f:fields) {
                System.out.println("获取属性的访问修饰符："+ Modifier.toString(f.getModifiers()));
                System.out.println("获取属性的类型:"+f.getType().getSimpleName());
                System.out.println("获取属性的名称:"+f.getName());
                System.out.println();
            }

//=================获取类的方法=================
            Method[] methods = c1.getMethods();
            Method[] methods1 = c1.getDeclaredMethods();
            for (Method m:methods) {
                System.out.println("获取方法的修饰符"+Modifier.toString(m.getModifiers()));
                System.out.println("获取方法的返回类型:"+m.getReturnType());
                System.out.println("获取方法的名称:"+m.getName());
                Class[] params = m.getParameterTypes();
                if (params.length==0){
                    System.out.println(m.getName()+"方法没有形参");
                }
                for (Class p:params) {
                    System.out.println("方法的参数类型"+p.getSimpleName());
                }
                System.out.println();
            }

//=================通过反射来修改类对象的属性（成员变量）= 使用get set方法================
            try {
                Field field = c1.getDeclaredField("userId");
                field.setAccessible(true);//设置为可访问修改
                Object object = c1.newInstance();
                field.set(object,99); //把object的userId设置为999
                System.out.println(object);

                //获取object对象的field（userId）属性对应的属性值
                System.out.println(field.get(object));


    //=================通过反射的方式来调用对象的方法=使用invoke方法=============
                Method m1 = c1.getDeclaredMethod("getUserId");
                //调用object的m1（getUserId）方法
                System.out.println("userId值："+m1.invoke(object));

                Method m2 = c1.getDeclaredMethod("setUserId",Integer.class);
//                要修改的属性.invoke（被修改的对象，修改的值）
                m2.invoke(object,888);
                //获取object对象的field（userId）属性对应的属性值
                System.out.println("修改后的userId值："+field.get(object));

   //===================================================
            } catch (NoSuchFieldException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
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
