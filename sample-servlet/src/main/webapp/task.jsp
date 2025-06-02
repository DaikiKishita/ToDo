<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Task" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/component/header.jsp" %>

<%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    int cnt = 0;
%>

<div class="text-center mt-2">
    <div class=" bg-warning-subtle py-3 px-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div></div>
            <div>
                <h2>タスク一覧</h2>
            </div>
            <div>
                <a class="btn btn-primary" data-bs-toggle="offcanvas" href="#addTask" role="button" aria-controls="addTask">
                    新規作成
                </a>
            </div>
        </div>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="width: 10%">タスク名</th>
                    <th style="width: 30%">説明</th>
                    <th style="width: 10%">操作</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (tasks != null) {
                        for (Task task : tasks) {
                %>
                    <tr class="<%= task.isCompleted() ? "table-secondary" : "table-primary" %>">
                        <td><p class="fs-3"><%= task.getName() %></p></td>
                        <td><p class="fs-4"><%= task.getDescription()%></p></td>
                        <td> 
                        <div class="d-flex justify-content-end">
                            <% if (!task.isCompleted()) { %>
                            <a class="btn btn-info mx-1" data-bs-toggle="offcanvas" href="#editTask<%= cnt %>" role="button" aria-controls="addTask<%= cnt %>">
                                編集
                            </a>
                                <form method="post" action="<%= request.getContextPath() %>/task/complete/" class="mx-1">
                                    <input type="hidden" name="action" value="complete">
                                    <input type="hidden" name="index" value="<%= cnt %>">
                                    <button type="submit" class="btn btn-success">
                                        完了
                                    </button>
                                </form>
                            <% }%>
                            <form method="post" action="<%= request.getContextPath() %>/task/delete/" class="mx-1">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="index" value="<%= cnt %>">
                                <button type="submit" class="btn btn-danger">削除</button>
                            </form>
                        </div>
                        </td>
                    </tr>
                <%
                            cnt++;
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- タスク新規作成用オフキャンバス -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="addTask" aria-labelledby="addTaskLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="addTaskLabel">編集</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <form method="post" action="/task/create/">
                <div class="mb-3">
                    <label for="taskName" class="form-label">タスク名</label>
                    <input type="text" class="form-control" id="taskName" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="taskDescription" class="form-label">説明</label>
                    <textarea class="form-control" id="taskDescription" name="description"></textarea>
                </div>
                <input type="hidden" name="action" value="create">
                <button type="submit" class="btn btn-primary">作成</button>
            </form>
        </div>
    </div>

<%
    cnt = 0;
    if (tasks != null) {
        for (Task task : tasks) {
%>
        <!-- タスク編集用オフキャンバス -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="editTask<%= cnt %>" aria-labelledby="editTaskLabel<%= cnt %>">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="editTaskLabel<%= cnt %>">タスク編集</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <form method="post" action="<%= request.getContextPath() %>/task/update/">
                    <div class="mb-3">
                        <label for="taskName<%= cnt %>" class="form-label">タスク名</label>
                        <input type="text" class="form-control" id="taskName<%= cnt %>" name="newName" value="<%= task.getName() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="taskDescription<%= cnt %>" class="form-label">説明</label>
                        <input type ="text" class="form-control" id="taskDescription<%= cnt %>" name="newDescription" value="<%= task.getDescription() %>">
                    </div>
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="index" value="<%= cnt %>">
                    <button type="submit" class="btn btn-primary">更新</button>
                </form>
            </div>
        </div>
<%
            cnt++;
        }
    }
%>
</div>
<%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>
