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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentServiceImpl studentService;


    @RequestMapping("/studentAccount.do") //url
    public String studentAccount(HttpServletRequest req, Model model) {
        String id = req.getParameter("id") != null ? req.getParameter("id") : "";
        model.addAttribute("id",id);

        //微信分享接口接入
        //获取access_token
        String access_token = studentService.getAccessTokenOfJssdk();
        //根据token获取jsapi_ticket
        String jsapi_ticket = studentService.getJsapiTicketOfJssdk(access_token);
        Long timestamp = new Date().getTime()/1000;
        UUID uuid = UUID.randomUUID();
        String noncestr=uuid.toString();
        String param = req.getQueryString();
        String pageUrl = "http://sunarts.cn/sunflower/students/studentAccount.do";
        if (param != "" && param != null)
        {
            pageUrl = pageUrl + "?" + param;
        }
        System.out.println("pageUrl------------------------"+pageUrl);
        String signature = "jsapi_ticket="+jsapi_ticket+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+pageUrl;
        System.out.println("signature------------------------"+signature);

        signature = getSha1(signature);
        String appid = "wx8a6e796d316ad625";//公众号appid
        Map<String,Object> wechatSign = new HashMap<String,Object>();
        wechatSign.put("timestamp", timestamp);
        wechatSign.put("noncestr", noncestr);
        wechatSign.put("signature", signature);
        wechatSign.put("appid", appid);
        wechatSign.put("pageUrl", pageUrl);
        model.addAttribute("wechatSign", wechatSign);
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


    @RequestMapping("/teacher_class.do") //url
    public String teacher_class(HttpServletRequest req, Model model) {
        //微信分享接口接入
        //获取access_token
        String access_token = studentService.getAccessTokenOfJssdk();
        //根据token获取jsapi_ticket
        String jsapi_ticket = studentService.getJsapiTicketOfJssdk(access_token);
        Long timestamp = new Date().getTime()/1000;
        UUID uuid = UUID.randomUUID();
        String noncestr=uuid.toString();
        String param = req.getQueryString();
        String pageUrl = "http://sunarts.cn/sunflower/students/teacher_class.do";
        if (param != "" && param != null)
        {
            pageUrl = pageUrl + "?" + param;
        }
        System.out.println("pageUrl------------------------"+pageUrl);
        String signature = "jsapi_ticket="+jsapi_ticket+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+pageUrl;
        System.out.println("signature------------------------"+signature);

        signature = getSha1(signature);
        String appid = "wx8a6e796d316ad625";//公众号appid
        Map<String,Object> wechatSign = new HashMap<String,Object>();
        wechatSign.put("timestamp", timestamp);
        wechatSign.put("noncestr", noncestr);
        wechatSign.put("signature", signature);
        wechatSign.put("appid", appid);
        wechatSign.put("pageUrl", pageUrl);
        model.addAttribute("wechatSign", wechatSign);
        return "students/teacher_class";
    }




    @RequestMapping(value = "/get_teachar_class_info.do")
    public void goSearch(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Map<String,Object>> retTeacherList  = new ArrayList<Map<String, Object>>();
            //获取老师列表
            List<String> teacher_list = studentService.getTecherList();
            //循环老师列表获取课程列表
            for(int i =0; i < teacher_list.size();i ++){
                Map<String,Object> temp_teacher_obj = new HashMap<String, Object>();
                String tempTeacher = teacher_list.get(i);
                temp_teacher_obj.put("teacher_name",tempTeacher);

               List<Map<String,Object>> temp_class_obj = new ArrayList<Map<String, Object>>();
                //获取老师有的课程
                List<String> class_id_list = studentService.getTecherClassList(tempTeacher);
                //获取课程所有学生,是否报名，剩余课程，更新时间
                for(int j =0;j <class_id_list.size();j++){
                    String temp_class_id = class_id_list.get(j);
                    Map<String,Object> temp_teacher_class_obj = new HashMap<String, Object>();
                    temp_teacher_class_obj.put("class_id",temp_class_id);
                    List<Map<String,Object>> teacher_class_student_list = studentService.getTecherClassStudentList(temp_class_id);
                    temp_teacher_class_obj.put("student_list",teacher_class_student_list);
                    temp_class_obj.add(temp_teacher_class_obj);
                }
                temp_teacher_obj.put("teacher_class",temp_class_obj);
                retTeacherList.add(temp_teacher_obj);
            }
            String jsonString = JSONUtils.toJSONString(retTeacherList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=utf-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    public String getSha1(String str) {
        if (null == str || 0 == str.length()){
            return null;
        }
        char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
            mdTemp.update(str.getBytes("UTF-8"));

            byte[] md = mdTemp.digest();
            int j = md.length;
            char[] buf = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(buf);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
