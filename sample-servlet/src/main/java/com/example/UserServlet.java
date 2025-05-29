package java.com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class User {
    private String username;
    private String password;
    private List<Task> tasks = new ArrayList<>();

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public List<Task> getTasks() { return tasks; }
    public void addTask(Task task) { tasks.add(task); }
}

public class UserServlet extends HttpServlet {

    // アプリケーション全体で共有するユーザーリスト
    private static HashMap<String, User> userDict = new HashMap<Stirng,User>();  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("action") == "register"){
            registerUser(
                request.getParameter("username"),
                request.getParameter("password")
            );
        }else if (request.getParameter("action") == "login") {
            loginUser(
                request.getParameter("username"),
                request.getParameter("password")
            );
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "不正なリクエストです。");
        }
    }

    // ユーザー登録処理
    private void registerUser(username,pasword) {
        synchronized (userDict) {
            userDict.put(username, new User(username, password));
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
        request.setAttribute("message", "ユーザー登録が完了しました。ログインしてください。");
        dispatcher.forward(request, response);
    }

    // ユーザーログイン処理
    private void loginUser(String username, String password){
        User user = userDict.get(username);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("/task");
        } else {
            request.setAttribute("message", "ユーザー名またはパスワードが間違っています。");
            response.sendRedirect("/login");
        }
    }

    // 登録済ユーザーを取得する別の Servlet からアクセスできるように
    public static HashMap<String, User> getUserList() {
        return userDict;
    }
}