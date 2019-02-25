package com.seecen.thread;

public class WaitAndNotifyTest {
    //图片是否下载完完成
    private static boolean isFinish = false;
    //用来发送通知的人
    private static Object zhangsan = new Object();

    /**
     * 负责下载图片
     */
    private static class Download extends Thread{
        @Override
        public void run() {
            System.out.println("开始下载图片");
            for (int i = 0; i < 100; i++) {
                System.out.println("已下载："+i+"%");
                try {
                    sleep(50);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("下载完成");
            //通知显示图片的线程继续执行
            isFinish = true;
            synchronized (zhangsan){
//wait,notify,notifyAll 必须放在synchronized中，否则会抛出IllegalMonitorStateException异常
 //因为对某个对象的锁的操作（wait,notify,notifyAll）的前提是获得到了该对象的锁
                zhangsan.notify();  //唤醒zhangsan这把锁
            }
        }
    }

    private static class ShowImage extends Thread{
        @Override
        public void run() {
            System.out.println("准备显示图片");
            if (!isFinish){//如果没有下载完成就暂停线程，否则直接显示图片
                synchronized (zhangsan){
                    try {
                        System.out.println("开始等待============");
                        zhangsan.wait(); //让zhangsan这把锁进入等待状态
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            System.out.println("显示图片");
        }
    }

    public static void main(String[] args) {
        Download download = new Download();
        ShowImage showImage = new ShowImage();
        download.start();
        showImage.start();
    }
}
