package com.example.customer_manager.service;

import com.example.customer_manager.entity.Customer;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
    private static Map<Integer, Customer> customerMap;
    static {
        customerMap = new HashMap<>();
        String imageData1="/image/1.jpg";
        customerMap.put(1, new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", imageData1))    ;

        String imageData2="/image/2.jpg";
        customerMap.put(2, new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", imageData2));
        String imageData3 = "/image/3.jpg";
        customerMap.put(3, new Customer("Nguyễn Thái  Hòa", "1983-08-22", "Nam Định", imageData3));

       String imageData4 ="/image/4.jpg";
        customerMap.put(4, new Customer("Trần Đăng  Khoa", "1983-08-17", "Hà Tây", imageData4));
        String imageData5="/image/5.jpg";
        customerMap.put(5, new Customer("Nguyễn  Đình Thi", "1983-08-19", "Hà Nội", imageData5));
    }

    public List<Customer> getList(){
        return new ArrayList<>(customerMap.values());
    }
}
