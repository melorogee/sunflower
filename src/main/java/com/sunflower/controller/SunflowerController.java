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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sunflower")
public class SunflowerController {
	@Autowired
	private MetadataServiceImpl metadataService;
	/**
	 * 首頁
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/index.do") //url
	public String test(User user, Model model){
			return "/index_1";
	}

	/**
	 * 現在的基礎信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/now_state.do") //url
	public String now_state(User user, Model model){
		return "jsp/now_state";
	}

	/**
	 * 現在的学生和班级信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/student_class.do") //url
	public String student_class(User user, Model model){
		return "jsp/student_class";
	}

	/**
	 * 初始化学员列表
	 * @param req
	 * @param resp
	 */
	@RequestMapping(value = "/initList.do")
	public void initList(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String student_name_search = req.getParameter("student_name_search") != null ? req.getParameter("student_name_search") : "";
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
			paramMap.put("student_name_search",student_name_search);
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
	 * 初始化首页信息
	 * @param req
	 * @param resp
	 */
	@RequestMapping(value = "/initBrief.do")
	public void initBrief(HttpServletRequest req, HttpServletResponse resp) {
		try {
			Integer student_count  = metadataService.student_count();
			Integer student_class_count  = metadataService.student_class_count();
			Integer term_week  = metadataService.term_week();
			Integer class_count  = metadataService.class_count();
			Integer pre_student_count  = metadataService.pre_student_count();

			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String dateNowStr = sdf.format(d);
			List<String> birthday_student = metadataService.birthday_student(dateNowStr);
			String birthday_student_str = "<br>";
			if(birthday_student != null && birthday_student.size() > 0){
				for(int i = 0;i < birthday_student.size();i++){
					birthday_student_str += (birthday_student.get(i)+"<br>");
				}
			}
			//封装返回map
			Map<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("student_count",student_count);
			resultMap.put("student_class_count",student_class_count);
			resultMap.put("term_week",term_week);
			resultMap.put("class_count",class_count);
			resultMap.put("pre_student_count",pre_student_count);
			resultMap.put("birthday_student",birthday_student_str);

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
}
