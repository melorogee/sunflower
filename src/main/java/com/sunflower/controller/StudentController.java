package com.sunflower.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.sunflower.entity.User;
import com.sunflower.service.impl.MetadataServiceImpl;
import com.sunflower.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentServiceImpl studentService;


    @RequestMapping("/studentAccount.do") //url
    public String studentAccount(HttpServletRequest req, Model model) {
        String id = req.getParameter("id") != null ? req.getParameter("id") : "";
        model.addAttribute("id",id);
        return "students/studentAccount";
    }

    @RequestMapping("/getStudentAccount.do") //url
    public String getStudentAccount(HttpServletRequest req, Model model, HttpServletResponse resp){
        //获取学生id
        String student_id = req.getParameter("student_id") != null ? req.getParameter("student_id") : "";

        //根据学生id获取 学生姓名，昵称，学生生日，加入时间
        Map<String,Object> baseInfo =  studentService.getStudentBaseInfo(student_id);
        //根据学生id获取该学生所上课程信息，与该课程剩余的课程
        List<Map<String,Object>> classInfo = studentService.getStudentClassInfo(student_id);

        //获取文件名列表
        List<String> imgList = new ArrayList<String>();
        String path="/usr/local/nginx/html/图片资料/学员资料/" + baseInfo.get("student_name");
//        String path="D:\\向日葵\\图片资料\\学员资料\\" + baseInfo.get("student_name");

        File file=new File(path);
        File[] tempList = file.listFiles();
        System.out.println("该目录下对象个数："+tempList.length);
        for (int i = 0; i < tempList.length; i++) {
            if (tempList[i].isFile()) {
                imgList.add("http://sunarts.cn/%E5%9B%BE%E7%89%87%E8%B5%84%E6%96%99/%E5%AD%A6%E5%91%98%E8%B5%84%E6%96%99/"+ baseInfo.get("student_name")+"/"+tempList[i].getName());
            }
        }

        Map<String,Object> retObj = new HashMap<String, Object>();

        retObj.put("imgList",imgList);
        retObj.put("baseInfo",baseInfo);
        retObj.put("classInfo",classInfo);
        String jsonString = JSONUtils.toJSONString(retObj);
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonString;
    }
}
