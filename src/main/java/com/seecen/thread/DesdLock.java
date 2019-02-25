package com.seecen.thread;

public class DesdLock extends Thread {
    //状态标记
    public int flag = 1;
    //两把锁，锁：大概就是同一时间只能被一个线程使用
    private static Object oneLock = new Object();
    private static Object twoLock= new Object();

    @Override
    public void run() {
        if (flag==1){
            //嵌套开启锁oneLock中使用了twoLock
            synchronized (oneLock){
                System.out.println(flag+"开启第一把锁");
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                //在一个锁定的代码块中开启另一把锁
                synchronized (twoLock){
                    System.out.println(flag+"开启第二把锁，执行某些代码快");
                }
            }
        }
        if (flag==2){
            //嵌套开启twoLock锁中使用了oneLock
            synchronized (twoLock){
                System.out.println(flag+"开启第二把锁");
            }
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            synchronized (twoLock){
                System.out.println(flag+"开启第一把锁，执行某些代码快");
            }
        }
    }

    public static void main(String[] args) {
        DesdLock lock1 = new DesdLock();
        DesdLock lock2 = new DesdLock();
        lock1.flag=1;
        lock2.flag=2;
        lock1.start();
        lock2.start();
    }
}
