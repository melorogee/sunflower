package com.sunflower.controller;

import com.alibaba.druid.support.json.JSONUtils;
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
public class SearchController {

    @Autowired
    private StudentServiceImpl studentService;


    @RequestMapping("/search.do") //url
    public String studentAccount(HttpServletRequest req, Model model) {
        //微信分享接口接入
        //获取access_token
        String access_token = studentService.getAccessTokenOfJssdk();
        //根据token获取jsapi_ticket
        String jsapi_ticket = studentService.getJsapiTicketOfJssdk(access_token);
        Long timestamp = new Date().getTime()/1000;
        UUID uuid = UUID.randomUUID();
        String noncestr=uuid.toString();
        String param = req.getQueryString();
        String pageUrl = "http://sunarts.cn/sunflower/students/search.do";
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
        return "students/search";
    }





    @RequestMapping(value = "/goSearch.do")
    public void goSearch(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String student_name = req.getParameter("student_name") != null ? req.getParameter("student_name") : "";

            //封装请求参数

            //封装返回map
            Map<String,Object> resultMap = new HashMap<String,Object>();
            //计算总页数
            Integer studentId  = studentService.getStudentIdByName(student_name);
            //计算数据列表
            resultMap.put("student_id",studentId != null ? studentId : 0);

            String jsonString = JSONUtils.toJSONString(resultMap);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
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





    @RequestMapping("/time_table.do") //url
    public String time_table(HttpServletRequest req, Model model) {
        //微信分享接口接入
        //获取access_token
        String access_token = studentService.getAccessTokenOfJssdk();
        //根据token获取jsapi_ticket
        String jsapi_ticket = studentService.getJsapiTicketOfJssdk(access_token);
        Long timestamp = new Date().getTime()/1000;
        UUID uuid = UUID.randomUUID();
        String noncestr=uuid.toString();
        String param = req.getQueryString();
        String pageUrl = "http://sunarts.cn/sunflower/students/time_table.do";
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
        return "students/time_table";
    }
}
