package com.sunflower.service.impl;

import com.sunflower.dao.MetadataDao;
import com.sunflower.service.MetadataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MetadataServiceImpl implements MetadataService {
	@Autowired
	private MetadataDao metadataDao;

	public List<Map<String, Object>> initList(Map<String,Object> paramMap) {
		List<Map<String, Object>> datalist = metadataDao.initList(paramMap);
		return datalist;
	}

	public Map<String, Object> initDetailInfo(Map<String, Object> paramMap) {
		Map<String, Object> dataObj = metadataDao.initDetailInfo(paramMap);
		return dataObj;
	}

	public Map<String, Object> initCodeInfo(Map<String, Object> paramMap) {
		Map<String, Object> dataObj = metadataDao.initCodeInfo(paramMap);
		return dataObj;
	}

	public Map<String, Object> initTableRelation(Map<String, Object> paramMap) {
		Map<String, Object> dataObj = metadataDao.initTableRelation(paramMap);
		return dataObj;
	}

	public Integer totalCount(Map<String, Object> paramMap) {
		Integer totalCount = metadataDao.totalCount(paramMap);
		return totalCount;
	}

	public Integer student_count() {
		Integer totalCount = metadataDao.student_count();
		return totalCount;
	}

	public Integer student_class_count() {
		Integer student_class_count = metadataDao.student_class_count();
		return student_class_count;
	}

	public Integer term_week() {
		Integer term_week = metadataDao.term_week();
		return term_week;
	}

	public Integer class_count() {
		Integer class_count = metadataDao.class_count();
		return class_count;
	}

	public Integer pre_student_count() {
		Integer pre_student_count = metadataDao.pre_student_count();
		return pre_student_count;
	}

	public List<String> birthday_student(String dateNowStr) {
		List<String> birthday_student = metadataDao.birthday_student(dateNowStr);
		return birthday_student;
	}
}
