<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/component/header.jsp" %>
<div class="d-flex justify-content-center align-items-center text-center mt-2">
    <div class="justify-content-center bg-warning-subtle py-3 px-5" style="max-width: 600px;">
        <h2>タスク一覧</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>タスク名</th>
                    <th>ステータス</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <% int cnt =0; %>
                <c:forEach var="task" items="${user.getTasks()}">
                <% if (task.completed) { %>
                    <tr class="bg-light">
                <% } else { %>
                    <tr classs="bg-white">
                <% } %>
                        <td>${task.name}</td>
                        <td>${task.description}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/task/edit/${task.id}" class="btn btn-secondary">編集</a>
                            <form method="post" action="${pageContext.request.contextPath}/task/delete/${task.id}">
                                <input type="hidden" name="task_id" value="${cnt}">
                                <button type="submit" class="btn btn-danger">削除</button>
                            </form>
                        </td>
                    </tr>
                <% cnt++; %>
                </c:forEach>
            </tbody>
        </table>
    </div>
<%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>