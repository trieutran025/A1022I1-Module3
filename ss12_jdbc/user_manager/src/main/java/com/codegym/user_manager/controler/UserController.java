package com.codegym.user_manager.controler;

import com.codegym.user_manager.model.User;
import com.codegym.user_manager.service.UserService;
import com.codegym.user_manager.service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static jdk.nashorn.internal.objects.NativeArray.sort;

@WebServlet(urlPatterns = "/users")
public class UserController extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
//        System.out.println(action);
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "list":
                viewList(req, resp);
                break;
            case "create":
                viewCreate(req, resp);
                break;
            case "find":
                doFind(req, resp);
            case "delete":
                viewDelete(req, resp);
                break;
            case "detail":
                viewDetail(req, resp);
                break;
            case "edit":
                try {
                    viewEdit(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            case "sort":
                doSort(req, resp);
                break;
            default:
                break;
        }
    }

    private void doSort(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userService.sortName();
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("WEB-INF/view/users/list.jsp").forward(req, resp);
    }

    private void doFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String country = req.getParameter("country");
        List<User> users = userService.findByCountry(country);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/view/users/search.jsp").forward(req, resp);
    }


    private void viewEdit(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User users = userService.findById(id);
        userService.update(users);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/view/users/edit.jsp").forward(req, resp);
    }

    private void viewDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User users = userService.findById(id);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/view/users/detail.jsp").forward(req, resp);
    }


    private void viewCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/users/create.jsp").forward(req, resp);
    }

    private void viewDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        User users = userService.findById(id);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/view/users/delete.jsp").forward(req, resp);
    }

    private void viewList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userService.findAll();
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("WEB-INF/view/users/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendRedirect("/users?action=list");
        }
        System.out.println(action);
        switch (action) {
            case "create":
                doCreate(req, resp);
                break;
            case "delete":
                try {
                    doDeletes(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    doEdit(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                break;
        }
    }


    private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(id, name, email, country);
        userService.update(user);
        resp.sendRedirect("/users?action=list");
    }

    private void doDeletes(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User users = userService.findById(id);
        userService.delete(users);
        resp.sendRedirect("/users?action=list");
    }

    private void doCreate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        userService.add(user);
        resp.sendRedirect("/users?action=list");
    }
}
