// src/main/java/com/example/RegisterServlet.java
package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class RegisterServlet extends HttpServlet {

    // アプリケーション全体で共有するユーザーリスト
    private static List<User> userList = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }   


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        synchronized (userList) {
            userList.add(new User(username, password));
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<h2>ユーザー登録完了</h2>");
        out.println("<p>ユーザー名: " + username + "</p>");
        out.println("<a href=\"users\">登録済ユーザー一覧</a>");
    }

    // 登録済ユーザーを取得する別の Servlet からアクセスできるように
    public static List<User> getUserList() {
        return userList;
    }
}
