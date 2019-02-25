package com.seecen.controller;

import com.seecen.pojo.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("file")
public class FileController {
    String tempPath = "D:\\javastudy\\maven\\SSM_init\\temp\\note";
    File filedir = new File(tempPath); //保存笔记的跟目录

    //显示列表
    @RequestMapping("/list")
    public String show(Model model,Integer currentPage){
        File[] notes = filedir.listFiles();
        Page<File> page = new Page<>();
        page.setPageSize(5);
        if (currentPage!=null){
            page.setCurrentPage(currentPage);
        }
        List<File> list = new ArrayList<>();
        for (int i = page.getStart(); i < page.getEnd() ; i++) {
            if (i==notes.length){
                break;
            }
            list.add(notes[i]);
        }
        page.setList(list);
        page.setTotal(new Long(notes.length));
        model.addAttribute("p",page);
        return "file/list";
    }

    //去添加
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "file/add";
    }

    //添加和修改
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(String note,String fileName){
        if (fileName.indexOf(".txt")<0){ //没有这个后缀，是添加，文件名加.txt
            fileName = fileName+".txt";
        }
        File file = new File(tempPath+File.separator+fileName);
        if (!file.exists()){ //添加时会执行创建文件，修改时会覆盖文件
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            //指定输出文件
            Writer writer = new OutputStreamWriter(new FileOutputStream(file),"UTF-8");
            System.out.println(note);
            writer.write(note);
            writer.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:list";
    }

    //删除
    @RequestMapping("del")
    public String edit(Integer index, RedirectAttributes redirectAttributes){
        File[] notes = filedir.listFiles();
        if (index!=null){
            File file = notes[index];
            System.out.println(file.getPath());
            if (file!=null){
                if (file.delete()){
                    redirectAttributes.addFlashAttribute("msg","删除成功");
                }else {
                    redirectAttributes.addFlashAttribute("msg","删除失败");
                }
            }
        }
        return "redirect:/file/list";
    }

    //去修改
    @RequestMapping("edit")
    public String edit(String path,Model model){
        File file = new File(tempPath+File.separator+path);
        try {
            Reader reader = new InputStreamReader(new FileInputStream(file),"UTF-8");
            StringBuffer sb = new StringBuffer();
            char[] c = new char[1024];
            int len = reader.read(c);
            while (len != -1){
                String s = new String(c);
                sb.append(s);
                len = reader.read(c);
            }
            System.out.println(sb);
            model.addAttribute("sb",sb);
            model.addAttribute("path",path);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "file/edit";
    }

    //下载
    @RequestMapping("download")
    public void download(String path, HttpServletResponse response){
        File file = new File(tempPath+File.separator+path);
        if (path!=null){
            try {
                //在服务器端被下载的文件
                InputStream is = new FileInputStream(file);
                //设置响应头信息
                response.setContentType("application/octet-stream;charset=utf-8");
                response.setCharacterEncoding("utf-8");
                //attachment;filename= 设置在客户端显示被下载的文件的文件名
                response.addHeader("Content-Disposition","attachment;filename="
                        +new String(path.getBytes("utf-8"),"iso-8859-1"));
                OutputStream fos = response.getOutputStream();

                byte[] b = new byte[1024];
                int len;
                while ((len=is.read(b))!=-1){
                    fos.write(b,0,len);
                }
                fos.close();
                is.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}
