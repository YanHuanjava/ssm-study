package com.seecen.thread;

public class SleepTest extends Thread {
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println("线程"+Thread.currentThread().getName()+"："+i);
            try {
                sleep(1000); //100毫秒
                System.out.println(getState());
// InterruptedException中断异常，线程正常执行时可以调用sleep，当线程终止了却调用sleep就会抛出异常
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        Thread thread = new SleepTest();
        thread.start();
    }
}
