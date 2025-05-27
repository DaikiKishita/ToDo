<!DOCTYPE html>
<html>
<head><title>ユーザー登録</title></head>
<body>
  <h2>ユーザー登録フォーム</h2>
<form method="post" action="${pageContext.request.contextPath}/register">
  ユーザー名: <input type="text" name="username"><br>
  パスワード: <input type="password" name="password"><br>
  <input type="submit" value="登録">
</form>
</body>
</html>