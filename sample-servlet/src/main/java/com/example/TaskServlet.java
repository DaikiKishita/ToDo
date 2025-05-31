package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*; 
import java.io.*;
import java.util.*;

public class TaskServlet extends HttpServlet {

    // アプリケーション全体で共有するユーザーリスト
    private static HashMap<String, User> userDict = UserServlet.getUserList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }


        request.setAttribute("tasks", user.getTasks());
        request.setAttribute("username", user.getUsername());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/task.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String action = request.getParameter("action");

        // タスクの追加または完了の処理
        if ("create".equals(action)) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            Task task = new Task(name, description);

            user.addTask(task);

        // タスクの完了処理
        } else if ("complete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            Task task = user.getTask(index);
            if (task != null) {
                task.complete();
            }
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            user.removeTask(index);
            
        } else if ("update".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            String newName = request.getParameter("newName");
            String newDescription = request.getParameter("newDescription");
            user.getTask(index).editTask(newName, newDescription);
        }

        response.sendRedirect("/task");
    }
}