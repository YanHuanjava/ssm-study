package com.seecen.thread;

public class InterruptTest extends Thread {
    @Override
    public void run() {
        while (!Thread.interrupted()){ //没有被中断时打印
            System.out.println("6666666666");
        }
    }

    public static void main(String[] args) {
        InterruptTest test = new InterruptTest();
        test.start();
        try {
            test.join(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        test.interrupt();//interrupt（）只是把线程标记为中断。。要配合interrupted()使用才有效
    }
}
