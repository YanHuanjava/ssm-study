package com.seecen.thread;

public class YieldTest extends Thread {
    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            if (i==50){
                System.out.println(getName()+"放弃CPU执行权");
                yield();
            }
            System.out.println(getName()+":"+i);
        }
    }

    public static void main(String[] args) {
        YieldTest yieldTest = new YieldTest();
        yieldTest.start();
        YieldTest yieldTest1 = new YieldTest();
        yieldTest1.start();
    }
}
