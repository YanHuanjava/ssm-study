package com.seecen.thread;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.*;

public class ThreadPool {
    public static void main(String[] args) {
        //创建线程任务类
        //创建指定个数的线程池来执行任务
        ExecutorService executorService = Executors.newFixedThreadPool(5);
        //创建任务
        List<Future> list = new ArrayList<>(); //用来保存任务的结果
        for (int i = 0; i < 5; i++) {
            MyTask task = new MyTask("任务;"+i);
            //把创建的任务提交值至线程池中，提交完就开始执行线程
            Future future = executorService.submit(task);
            list.add(future);
        }

        for (Future<String> f:list) {
            try {
                //f.get()是获取对应f执行call方法所返回的值
                System.out.println(f.get());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
        }
        System.out.println("程序结束");
        executorService.shutdown();//关闭线程池
    }
}

/**
 * 任务类
 */
class MyTask implements Callable<String>{
    private String tastName;
    public MyTask(String tastName){
        this.tastName = tastName;
    }

    @Override
    public String call() throws Exception {
        Date start = new Date();
        for (int i = 0; i < 10; i++) {
            System.out.println("执行任务"+tastName+",进度:"+i+"%");
            Thread.sleep(100);
        }
        return "任务"+tastName+"运行完成,用时："+(new Date().getTime()-start.getTime());
    }
}