<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/component/header.jsp" %>
<div class="d-flex justify-content-center align-items-center text-center mt-2">
    <div class="justify-content-center bg-info-subtle py-3 px-5" style="max-width: 600px;">
        <p>${message}</p>
        <h2>ログインフォーム</h2>
        <form method="post" action="${pageContext.request.contextPath}/login">
            ユーザー名: <input type="text" name="username" class="my-2"><br>
            パスワード: <input type="password" name="password" class="my-2"><br>
            <button type="submit" class="btn btn-primary my-2">ログイン</button>
        </form>
        <p>アカウントをお持ちでない方は<br>
        <a href="${pageContext.request.contextPath}/register">こちらから登録</a>してください</p>
    </div>
</div>
<%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>