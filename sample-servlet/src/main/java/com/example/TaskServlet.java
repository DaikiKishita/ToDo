package java.com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*; 
import java.io.*;
import java.util.*;

public class TaskServlet extends HttpServlet {

    // アプリケーション全体で共有するユーザーリスト
    private static HashMap<String, User> userDict = RegisterServlet.getUserList();

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
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            Task task = new Task(name, description);

            user.addTask(task);
        } else if ("complete".equals(action)) {
            String taskName = request.getParameter("taskName");
            for (Task task : user.getTasks()) {
                if (task.getName().equals(taskName)) {
                    task.complete();
                    break;
                }
            }
        }

        response.sendRedirect("/tasks");
    }
}