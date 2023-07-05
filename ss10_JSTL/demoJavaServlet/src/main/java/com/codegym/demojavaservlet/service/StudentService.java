package com.codegym.demojavaservlet.service;

import com.codegym.demojavaservlet.entity.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService {
    private static Map<Integer, Student> studentMap;
    static {
        studentMap = new HashMap<>();
        studentMap.put(1,new Student(1,"Nam",22,"Da Nang"));
        studentMap.put(2,new Student(2,"Hoa",20,"Ha Noi"));
        studentMap.put(3,new Student(3,"Hao",21,"HCM"));
        studentMap.put(4,new Student(4,"Anh",19,"Nha Trang"));
        studentMap.put(5,new Student(5,"Nga",23,"Da Nang"));
    }
    public List<Student> getList(){
        return new ArrayList<>(studentMap.values());
    }
}
