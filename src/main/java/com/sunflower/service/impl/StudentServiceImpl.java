package com.sunflower.service.impl;

import com.sunflower.dao.MetadataDao;
import com.sunflower.dao.StudentDao;
import com.sunflower.service.MetadataService;
import com.sunflower.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;


    public Map<String, Object> getStudentBaseInfo(String student_id) {
        return studentDao.getStudentBaseInfo(student_id);
    }

    public List<Map<String, Object>> getStudentClassInfo(String student_id) {
        return studentDao.getStudentClassInfo(student_id);
    }
}
