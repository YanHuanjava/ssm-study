package com.seecen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Iterator;

@Controller
@RequestMapping("file")
public class FileUploadDemoController {
    @RequestMapping(value = "upload",method = RequestMethod.GET)
    public String show(){
        return "file/uploadDemo";
    }

    //由于上传过来的东西都保存在request中，所以需要一个形参；user：用来依赖注入
    @RequestMapping(value = "upload",method = RequestMethod.POST)
    public String upload(HttpServletRequest request){
        //解析文件数据
        //判断上传文件夹是否存在,通过application可以相对于项目的路径
        ServletContext application = request.getServletContext();
//        String uploadPath = application.getRealPath("upload");
        //uploadPath这个路径也可以自己随意修改如："d:\\sc1809\\upload"
        File file = new File("d:\\sc1809\\upload");
        if (!file.exists()){
            file.mkdirs();
        }
        //解析上传的文件
        //二阶段代码也可以使用，springMVC简化了我们的代码
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(application);
        //判断表单是否有enctype属性,并且包含文件上传
        if (resolver.isMultipart(request)){
            //强转
            MultipartHttpServletRequest request1 = (MultipartHttpServletRequest) request;
            //getFileNames返回所有上传文件的文件名 迭代器
            Iterator<String> it = request1.getFileNames();
            int i = 0;
            while (it.hasNext()){
                i++;
                //根据文件名获取对应的文件对象
                MultipartFile f = request1.getFile(it.next());
                //把临时文件对象保存至我们设定的目录
                if(f!=null){
                    //获取上传文件的真实文件名  的扩展名
                    String origName = f.getOriginalFilename();
                    String extName  = origName.substring(origName.lastIndexOf("."));
                    //分别给每个文件创建保存的文件名，都放在file对应的(d:\\sc1809\\upload)目录下
                    //separator文件名分隔符
                    System.out.println(File.separator);
                    File savePath = new File(file.getPath()+File.separator+"aaa"+i+extName);
                    try {
                        //使用io流的方式把文件复制到指定的目录
                        f.transferTo(savePath);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return "file/uploadDemo";
    }

    @RequestMapping("download/{un}")
    public void download(HttpSession session, HttpServletResponse response,@PathVariable("un") String userName){
    //实现思想：以二进制流的方式把文件数据推送response对象中
//细节：在推送之前需要修改http请求头信息，告诉浏览器我们推送的是一个文件而不是html，以及编码等相关信息
        //得到文件的二进制数据
        try {
            //读取二进制数据
            FileInputStream fileInputStream = new FileInputStream("d:\\sc1809\\upload"+File.separator+"aaa.jpg");
            BufferedInputStream bis = new BufferedInputStream(fileInputStream);
            //修改http头信息
            response.setContentType("application/octet-stream;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "中文乱码.jpg";
            response.addHeader("Content-Disposition","attachment;filtname="+new String(fileName.getBytes("gbk"),"iso-8859-1"));
            //通过响应对象得到输出流
            BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
            //创建缓存数组
            byte[] buff = new byte[1024];
            int len;
            while ((len=bis.read(buff,0,buff.length)) != -1){
                bos.write(buff,0,len);
            }
            bos.close();
            bis.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
