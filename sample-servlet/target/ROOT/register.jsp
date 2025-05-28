<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/component/header.jsp" %>
  <h2>ユーザー登録フォーム</h2>
<form method="post" action="${pageContext.request.contextPath}/register">
  ユーザー名: <input type="text" name="username"><br>
  パスワード: <input type="password" name="password"><br>
  <input type="submit" value="登録">
</form>
<%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>