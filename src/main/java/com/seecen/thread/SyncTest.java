package com.seecen.thread;

public class SyncTest extends Thread {
    private static int count;
    private static int count2;

    private synchronized static void add(){
        count2++;
    }

    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            //第一种加锁的方法：
            //把需要加锁的代码放到同步代码块中，变量必须是唯一的(变量的地址固定不变)
            synchronized (SyncTest.class){
                count++;
            }
            //第二种加锁的方法：
            //调用外部方法，在方法上加锁
            add();
        }
    }

    public static void main(String[] args) {
        SyncTest[] list = new SyncTest[10];
        for (int i = 0; i < list.length; i++) {
            list[i] = new SyncTest();
            list[i].start();
        }
        for (int i = 0; i < list.length; i++) {
            try {
                list[i].join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("count-----"+count);
        System.out.println("count2----"+count2);
    }
}
