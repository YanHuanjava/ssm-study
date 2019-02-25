package com.seecen.thread;

public class JoinTest {
    /**
     * 从结果中可以看出，输出线程2结束一定是在线程2运行完成之后执行
     * 输出线程1结束却不必等到线程1结束后才执行
     * @param args
     */
    public static void main(String[] args) {
        ThreadTest threadTest = new ThreadTest();
        threadTest.setName("线程1");
        threadTest.start();
        //正常情况下，这条输出语句 不 会等待上一条执行完毕才执行（因为是多线程，threadTest是另一条线程）
        System.out.println("线程1结束");
        System.out.println("========================");

        ThreadTest threadTest2 = new ThreadTest();
        threadTest2.setName("线程2");
        threadTest2.start();
        try {
            threadTest2.join(2000);
            System.out.println("线程1"+threadTest.getState());
            System.out.println("线程2"+threadTest2.getState());

            threadTest.join();
  // 指定加入2000毫秒到线程中，2000毫秒之后，后面的语句不必继续等待
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
  //将线程2加入到线程中，后面的语句需要等待这个线程2执行完成后才能执行
        System.out.println("线程2结束");

    }
}
