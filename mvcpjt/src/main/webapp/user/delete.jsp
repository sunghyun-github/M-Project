<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/delete.jsp</title>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h1>회원 탈퇴<br>
<form action="./deleteProc.do" method="post">
pwd : <input type="text" name="password"><br>
<input type="submit" value="submit">
</form>
</h1>
</body>
</html>