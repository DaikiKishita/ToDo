<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/component/header.jsp" %>
<div class="d-flex justify-content-center align-items-center text-center mt-2">
  <div class="justify-content-center bg-success-subtle py-3 px-5" style="max-width: 600px;">
    <h2>登録</h2>
    <form method="post" action="${pageContext.request.contextPath}/user/register">
      ユーザー名: <input type="text" name="username" class = "my-2"><br>
      パスワード: <input type="password" name="password" class = "my-2"><br>
      <input type="hidden" name="action" value="register">
      <button type="submit" class="btn btn-primary my-2">登録</button>
    </form>
    <p>既にアカウントをお持ちの方は<br>
    <a href="${pageContext.request.contextPath}/login">こちらからログイン</a>してください</p>
  </div>
</div>
<%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>