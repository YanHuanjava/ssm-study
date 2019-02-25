package com.seecen.thread;

public class PrintNumTest1 extends Thread {
    private int start;
    private int size = 20;
    public PrintNumTest1(int n){
        this.start = n;
    }

    @Override
    public void run() {
        for (int i = start; i < start+size; i++) {
            System.out.println(getName()+"=="+i);
        }
    }


    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            PrintNumTest1 thread = new PrintNumTest1(i*20+1);
            thread.start();
        }
    }
}
