package com.sunflower.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.sunflower.entity.User;
import com.sunflower.service.impl.MetadataServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/metadata")
public class MetadataController {

    @Autowired
    private MetadataServiceImpl metadataService;

    @RequestMapping("/index.do") //url
    public String test(User user, Model model) {
        return "/index_1";
    }

    @RequestMapping("/list.do") //url
    public String list(User user, Model model) {
        return "jsp/metaList";
    }

    /**
     * 跳转表详情
     * @param req
     * @param model
     * @return
     */
    @RequestMapping("/detail.do") //url
    public String detail(HttpServletRequest req, Model model) {
        String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
        model.addAttribute("table_name",table_name);
        return "jsp/metaDetail";
    }

    /**
     * 跳转代码详情
     * @param req
     * @param model
     * @return
     */
    @RequestMapping("/code_detail.do") //url
    public String code_detail(HttpServletRequest req, Model model) {
        String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
        model.addAttribute("table_name",table_name);
        return "jsp/metaCode";
    }

    /**
     * 跳转血缘详情
     * @param req
     * @param model
     * @return
     */
    @RequestMapping("/relation_detail.do") //url
    public String relation_detail(HttpServletRequest req, Model model) {
        String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
        model.addAttribute("table_name",table_name);
        return "jsp/metaRelation";
    }

    /**
     * 初始化列表
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initList.do")
    public void initList(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
            String label_name = req.getParameter("label_name") != null ? req.getParameter("label_name") : "";
            String label_desc = req.getParameter("label_desc") != null ? req.getParameter("label_desc") : "";
            int searchpage = req.getParameter("searchpage") != null ? Integer.parseInt(req.getParameter("searchpage")) : 1;
            //计算start和end num
            int start = 0;
            int end = 10;
            if(searchpage > 1){
                start = (searchpage-1) * 10 ;
                end = start + 10;
            }

            //封装请求参数
            Map<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("table_name",table_name);
            paramMap.put("label_name",label_name);
            paramMap.put("label_desc",label_desc);
            paramMap.put("start",start);
            paramMap.put("end",end);

            //封装返回map
            Map<String,Object> resultMap = new HashMap<String,Object>();
            //计算总页数
            Integer totalCount  = metadataService.totalCount(paramMap);
            int totalPage = totalCount/10 +1 ;
            //计算数据列表
            List<Map<String, Object>> retList = metadataService.initList(paramMap);
            resultMap.put("retList",retList);
            resultMap.put("totalPage",totalPage);
            resultMap.put("currentPage",searchpage);

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


    /**
     * 初始化表详情
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initDetailInfo.do")
    public void initDetailInfo(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
            //封装请求参数
            Map<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("table_name",table_name);

           Map<String, Object> retObj = metadataService.initDetailInfo(paramMap);
            String jsonString = JSONUtils.toJSONString(retObj);
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


    /**
     * 获取表的计算代码
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initCodeInfo.do")
    public void initCodeInfo(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
            //封装请求参数
            Map<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("table_name",table_name);

            Map<String, Object> retObj = metadataService.initCodeInfo(paramMap);
            String jsonString = JSONUtils.toJSONString(retObj);
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

    /**
     * 获取表血缘关系
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initTableRelation.do")
    public void initTableRelation(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String table_name = req.getParameter("table_name") != null ? req.getParameter("table_name") : "";
            //封装请求参数
            Map<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("table_name",table_name);

            Map<String, Object> retObj = metadataService.initTableRelation(paramMap);
            String jsonString = JSONUtils.toJSONString(retObj);
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



}
