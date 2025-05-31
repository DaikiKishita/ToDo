<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.example.User" %>

<header class="header">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">ToDo</a>
            <div>
                <%
                    User user = (User) session.getAttribute("user");
                %>
                <% if (user != null) { %>
                    <span class="navbar-text">ようこそ、<%= user.getUsername() %>さん</span>
                    <form action="/user/logout" method="post" class="d-inline">
                        <button type="submit" class="btn btn-link navbar-brand btn-danger">ログアウト</button>
                    </form>
                <% } else { %>
                    <a class="navbar-brand" href="/register">ユーザー登録</a>
                    <a class="navbar-brand" href="/login">ログイン</a>
                <% } %>
            </div>
        </div>
    </nav>
</header>
