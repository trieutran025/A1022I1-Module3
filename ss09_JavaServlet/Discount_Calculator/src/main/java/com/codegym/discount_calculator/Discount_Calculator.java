package com.codegym.discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "amount", value = "/amount")
public class Discount_Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int price = Integer.parseInt(req.getParameter("price"));
        int percent = Integer.parseInt(req.getParameter("percent"));
        float amount = (float) (price * percent * 0.01);
        req.setAttribute("amount",amount);
        req.getRequestDispatcher("amount.jsp").forward(req,resp);
    }
}
