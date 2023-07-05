package com.codegym.demojavaservlet.controler;

import com.codegym.demojavaservlet.entity.Student;
import com.codegym.demojavaservlet.service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/student/list")
public class StudentController extends HttpServlet {
    private StudentService service = new StudentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students =service.getList();
        request.setAttribute("studentList",students);
        request.getRequestDispatcher("/student/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
