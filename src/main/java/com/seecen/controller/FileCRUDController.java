package com.seecen.controller;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.*;

@Controller
@RequestMapping("fileCrud")
public class FileCRUDController {

    String tempPath = "D:\\javastudy\\maven\\SSM_init\\temp\\note";
    File filedir = new File(tempPath); //保存笔记的跟目录

    @RequestMapping("list")
    public String list(Model model){
        File[] files = filedir.listFiles();

        model.addAttribute("files",files);
        return "fileCrud/list";
    }

    @RequestMapping("del/{id}")
    public String del(@PathVariable("id") Integer id){
        if (id!=null){
            File file = filedir.listFiles()[id];
            if (file!=null){
                file.delete();
            }
        }
        return "redirect:/fileCrud/list";
    }

    @RequestMapping("add")
    private String add(){
        return "fileCrud/add";
    }
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(String content,String fileName) throws IOException {
        if (content!=null){
            File file = new File(filedir,fileName);
            if (!file.exists()){
                file.createNewFile();
            }
            PrintWriter pw = new PrintWriter(file);
            pw.write(content);
            pw.close();
        }
        return "redirect:/file/list";
    }

    @RequestMapping("edit/{id}")
    public String edit(@PathVariable("id") Integer id,Model model){
        if (id!=null){
            File file = filedir.listFiles()[id];
            model.addAttribute("id",id);
            model.addAttribute("fileName", file.getName());
            //读取文本内容
            try {
                Reader reader = new FileReader(file);
                StringBuffer sb = new StringBuffer();
                char[] c = new char[1024];
                int len;
                while ((len=reader.read(c))!=-1){
                    sb.append(c);
                }
                model.addAttribute("content", sb.toString());
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "file/edit";
    }

}
