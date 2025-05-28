<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
=======
    <title>ユーザー登録</title>
>>>>>>> a34c597 (jinjer的なシステムの構成構築)
</head>
<body>
<%@ include file="/WEB-INF/jsp/component/header.jsp" %>
<div class="bg-success-subtle p-5 text-center">
  <div class="justify-content-center">
    <h2>登録フォーム</h2>
    <form method="post" action="${pageContext.request.contextPath}/register">
      ユーザー名: <input type="text" name="username" class = "my-2"><br>
      パスワード: <input type="password" name="password" class = "my-2"><br>
      <button type="submit" class="btn btn-primary my-2">登録</button>
    </form>
  </div>
</div>
<%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>