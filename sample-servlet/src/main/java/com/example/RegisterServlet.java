// src/main/java/com/example/RegisterServlet.java
package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class RegisterServlet extends HttpServlet {

    // アプリケーション全体で共有するユーザーリスト
    private static HashMap<String,User> userDict = new HashMap<String,User>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        synchronized (userDict) {
            userDict.put(username,new User(username, password));
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp.jsp");
        request.setAttribute("message", "ユーザー登録が完了しました。ログインしてください。");
        dispatcher.forward(request, response);
    }

    // 登録済ユーザーを取得する別の Servlet からアクセスできるように
    public static HashMap<String,User> getUserList() {
        return userDict;
    }
}
