package com.seecen.thread;

public class RunableTest implements Runnable {

    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            //实现接口Runnable中没有getNaem方法，如何获取线程名称？
            //Thread.currentThread()静态方法
            String threadName = Thread.currentThread().getName();
            System.out.println("线程"+threadName+":"+i);
        }
    }

    public static void main(String[] args) {
        //自定义的类，就是我们封装的要知执行的代码
        RunableTest th = new RunableTest();
        Thread thread1 = new Thread(th,"线程1");
        Thread thread2 = new Thread(th);
        thread2.setName("线程2");
        //setPriority设置线程优先级
        thread2.setPriority(Thread.MAX_PRIORITY);

        thread1.start();  //调用start方法进入准备运行状态，等待jvm分配执行
        th.run();//。。运行主线程。。。?
        thread2.start();
    }
}
