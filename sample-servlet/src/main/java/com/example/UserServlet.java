package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;


public class UserServlet extends HttpServlet {    
    private static HashMap<String, User> userDict = new HashMap<String,User>();  
    
    @Override
    public void init() throws ServletException {
        // 初期ユーザーを定義
        setInitialUserList("test", "test");
        setInitialUserList("admin", "admin");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //登録時の処理
        if ("register".equals(action)){
            //　同じユーザー名が存在する場合は登録できない
            if (userDict.containsKey(username)) {
                request.setAttribute("message", "このユーザー名はすでに使用されています。");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
                return;
            }

            synchronized (userDict) {
            userDict.put(username, new User(username, password));
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            request.setAttribute("message", "ユーザー登録が完了しました。ログインしてください。");
            dispatcher.forward(request, response);

        //ログイン時の処理
        }else if ("login".equals(action)){
            User user = userDict.get(username);

            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("/task");
            } else {
                request.setAttribute("message", "ユーザー名またはパスワードが間違っています。");
                response.sendRedirect("/login");
            }

        } else {
            request.setAttribute("message", "ユーザー名またはパスワードが間違っています。");
            response.sendRedirect("/login");
        }
    }

    // 登録済ユーザーを取得する別の Servlet からアクセスできるように
    public static HashMap<String, User> getUserList() {
        return userDict;
    }

    public static void setInitialUserList(String name, String password) {
        synchronized (userDict) {
            userDict.put(name, new User(name, password));
        }
    }
}