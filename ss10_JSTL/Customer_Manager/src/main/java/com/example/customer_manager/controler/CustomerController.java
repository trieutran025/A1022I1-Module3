package com.example.customer_manager.controler;

import com.example.customer_manager.entity.Customer;
import com.example.customer_manager.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Customer Controller", value = "/customer/list")
public class CustomerController extends HttpServlet {
    private CustomerService service = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = service.getList();
        request.setAttribute("customerList",customers);
        request.getRequestDispatcher("/customer/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
