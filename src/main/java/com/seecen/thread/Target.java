package com.seecen.thread;

public class Target {
    //要求写两个线程，一个线程将某个对象的某个成员变量的值加1，
    // 而另外一个线程将这个成员变量的值减1.
    // 使得该变量的值始终处于[0,2].初始值为0.
    public static void main(String[] args){
        Target t = new Target();

        Thread t1 = new Increase(t);
        t1.setName("Increase");
        Thread t2 = new Decrease(t);
        t2.setName("Decrease");

        t1.start();
        t2.start();
    }
    private int count;
    //减少
    public synchronized void increase(){
        if(count == 2){
            try{
                wait();
            } catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        count++;
        System.out.println(Thread.currentThread().getName() + ":" + count);
        notify();
        //唤醒一个处于该对象的等待池中的线程(随机) 进入该对象的锁池
    }
    //增加
    public synchronized void decrease(){
        if(count == 0){
            try{
                //等待，由于Decrease线程调用的该方法,
                //所以Decrease线程进入对象t(main函数中实例化的)的等待池，并且释放对象t的锁
                wait();//Object类的方法
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        count--;
        System.out.println(Thread.currentThread().getName() + ":" + count);
        //唤醒线程Increase，Increase线程从等待池到锁池
        notify();
    }
}
//对一个指定的Target的对象操作减少
class Increase extends Thread{
    private Target t;
    public Increase(Target t){
        this.t = t;
    }
    @Override
    public void run(){
        for(int i = 0 ;i < 30; i++){
            try{
                Thread.sleep((long)(Math.random()*500));
            }catch (InterruptedException e){
                e.printStackTrace();
            }
            t.increase();
        }
    }
}
//对一个指定的Target的对象操作增加
class Decrease extends Thread{
    private Target t;
    public Decrease(Target t){
        this.t = t;
    }

    @Override
    public void run(){
        for(int i = 0 ; i < 30 ; i++) {
            try{
                //随机睡眠0~500毫秒
                //sleep方法的调用，不会释放对象t的锁
                Thread.sleep((long)(Math.random()*500));
            }catch (InterruptedException e){
                e.printStackTrace();
            }
            t.decrease();
        }
    }
}

