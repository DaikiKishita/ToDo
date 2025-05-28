<!DOCTYPE html>
<html lang="ja">
<head>
    <%@ include file="/WEB-INF/jsp/component/head.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/component/header.jsp" %>
    <main>
        <h2>ようこそ！</h2>
        <p>このアプリは、ユーザーがToDoリストを管理できるシンプルなアプリケーションです。</p>
        <p>ユーザー登録をして、ToDoリストを作成しましょう!</p>
        <p>ログイン後、ToDoリストの追加、編集、削除が可能です。</p>
        <p>まずは<a href="/register">ユーザー登録</a>を行ってください。</p>
        <p>すでにアカウントをお持ちの方は、<a href="/login">ログイン</a>してください。</p>
    </main>
    <%@ include file="/WEB-INF/jsp/component/footer.jsp" %>
</body>
</html>