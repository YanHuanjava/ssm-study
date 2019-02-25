package com.seecen.reflect;

import org.springframework.stereotype.Component;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;

/**
 * 定义一个注解，注解是用来修饰的
 */
@Target({ElementType.FIELD,ElementType.METHOD,ElementType.CONSTRUCTOR})  //Target定义用来修饰什么，这个注解是用来修饰FIELD属性的
@Retention(RetentionPolicy.RUNTIME)//运行时保留注解
@Component
public @interface MyAnnotation {
    //注解上面的属性
    String value() default "";
}
