package com.seecen.aop;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * 定义一个注解，注解是用来修饰的
 */
@Target(ElementType.METHOD)  //Target定义用来修饰什么，这个注解是用来修饰FIELD属性的
@Retention(RetentionPolicy.RUNTIME)//运行时保留注解
@Documented
public @interface Syslog {
    //注解上面的属性
    String value() default "";
    int type() default 0;
}
