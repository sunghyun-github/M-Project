<%@page import="java.sql.DriverManager"%>
<%@page import="mvc.dto.UserDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/sessionCheck.jsp" %>
<%
UserDTO dto = (UserDTO)request.getAttribute("user");
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/join.jsp</title>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h1>UPDATE <br>
<form action="./updateProc.do" method="post">
	*id: <%=session.getAttribute("id") %><br>
	*pw: <input type="text" name="password" value="<%=dto.getPassword()%>"><br>
	*name: <input type="text" name="name" value="<%=dto.getName()%>"><br>
	*role: 
	<input type="radio" name="role" value="User" 
	<%if(dto.getRole().equals("User")) {%> checked="checked" <%} %>>User
	<input type="radio" name="role" value="Admin"
	<%if(dto.getRole().equals("Admin")) {%> checked="checked" <%} %>>Admin<br>
	<input type="submit" value="Submit">
</form>
</h1>
</body>
</html>