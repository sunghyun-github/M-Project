<%@page import="mvc.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mvc.dto.UserDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userList.jsp</title>
</head>
<body>
<jsp:include  page="../common/menu.jsp" />
<hr>
<h1>User List
<table border="1">
<tr><th>IDX</th><th>ID</th><th>PW</th><th>Name</th><th>Role</th><th>Regdate</th></tr>
<c:forEach var="dto" items="${userList}">
	<tr><!-- dto.멤버변수명 -->
		<td>${dto.idx }</td>
		<td>${dto.id }</td>
		<td>${dto.password }</td>
		<td>${dto.name }</td>
		<td>${dto.role }</td>
		<td>${dto.regDate }</td></tr>
</c:forEach>
</table>
</h1>
</body>
</html>