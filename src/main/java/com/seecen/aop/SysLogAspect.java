package com.seecen.aop;

import com.seecen.pojo.UserInfo;
import com.seecen.service.SyslogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

@Component   //通过spring扫描来实例化
@Aspect  //切面类的注解(mvc会帮我们生成代理对象)
public class SysLogAspect {

    @Autowired
    private SyslogService syslogService;

    /**public * com.seecen.controller.*.list*(..)
     * 公开类 包路径.类名.方法(参数),还可以使用 &&  ||  !
     * 公开的在controller包下的所有类中所有以list开头,有任意形参的方法
     * execution：用于匹配执行方法的连接点。类似作用的还有within，this.target,args
     *
     */
    //定义切点:拦截哪些方法
    //xxxMethod方法名就是切点名
    @Pointcut("execution(public * com.seecen.controller.TeacherController.*(..))")
    public void xxxMethod(){
        System.out.println("\n执行xxxMethod()方法");
    }

    //切开方法(上面使用xxxMethod方法切开控制层方法之前要做的处理的业务逻辑)
    @Before("xxxMethod()")
    public void beforeXxxMethod(){
        System.out.println("\n在切开方法之 前 执行的方法");
    }

    @After("xxxMethod()")
    public void afterHandler(){
        System.out.println("\n在切开方法之 后 执行的方法");
    }

    /**
     *
     * @param joinPoint 保存了被拦截的方法的参数列表
     * @return
     */
    @Around("xxxMethod()")
    public Object aroundMethod(ProceedingJoinPoint joinPoint){
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.getRequestAttributes())).getRequest();
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user_info");

        String methodName = joinPoint.getSignature().getName();
        //获取被切割方法 接收到的实参
        Object[] args = joinPoint.getArgs();
        System.out.println("\n执行aroundMethod方法之前的操作");
        Object result = null;
        try {
            //这条语句之后会调用beforeXxxMethod方法???
            result = joinPoint.proceed(args);
            String msg = "执行了"+methodName+"方法";
            //获取拦截的方法上是否用Syslog注解，以及获取注解上的文字描述，插入到数据库中
            String desc = getDesc(joinPoint);
            if (desc.length()>0){
                msg = desc;
                syslogService.insertSelective(userInfo,msg);
            }
            System.out.println("\n成功时可以执行的日志");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            System.out.println("\n方法执行出现了异常");
            //如果被切割的方法需要捕获异常，则需要在这里把异常继续抛出
            throw new RuntimeException(throwable);
        }
        System.out.println(methodName+"方法执行完成之后的操作");
        return result;
    }

    /**
     * 通过joinPoint获取对应方法上注解描述
     * @param joinPoint
     * @return
     */
    private String getDesc(ProceedingJoinPoint joinPoint){
        //看源码。。。
        if(joinPoint.getSignature() instanceof MethodSignature){
            MethodSignature imp = (MethodSignature) joinPoint.getSignature();
            Method method = imp.getMethod();
            Syslog syslog = method.getAnnotation(Syslog.class);
            if (syslog!=null){
                return syslog.value();
            }
        }

//        String methodName = joinPoint.getSignature().getName();//获取方法名
//        //通过反射的方式获取方法上面是否用注解
//        Class c = joinPoint.getTarget().getClass();
//        Method[] methods = c.getDeclaredMethods();
//        for (Method m:methods){
//            if (m.getName().equals(methodName)){
//                Syslog syslog = m.getAnnotation(Syslog.class);
//                if (syslog!=null){
//                    return syslog.value();
//                }
//            }
//        }
        return "";
    }
}
