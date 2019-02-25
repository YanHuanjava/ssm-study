package com.seecen.thread;

public class PrintNumTest extends Thread {
    static int count = 0;

    @Override
    public void run() {
        for (int i = 1 ; i <= 20; i++) {
                System.out.println(getName()+"::"+((count*20)+i));
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            Thread thread = new PrintNumTest();
            thread.setName("线程"+(i+1));
            thread.start();
            try {
                thread.join();
                System.out.println("========count:"+(++count)+"==========");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
