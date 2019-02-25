package com.seecen.thread;

public class ThreadTest extends Thread {
    /**
     * run方法中封装多个线程中需要运行的程序
     */
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            //getName获取线程的名称
            System.out.println("线程"+getName()+":" + i);
            try {
                sleep(1000);
                System.out.println(getName()+getState());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        //创建线程
        Thread thread = new ThreadTest();
        thread.setName("线程1");
        ThreadTest threadTest = new ThreadTest();
        threadTest.setName("线程2");

        //运行线程
        thread.start();
        threadTest.start();
    }
}
