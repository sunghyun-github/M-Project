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
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script type="text/javascript">
function updateProc(){
	const password = $('#password').val();
	const name = $('#name').val();
	const role = $('input:radio[name="role"]:checked').val();
	//console.log(role);
	const param = {password,name,role};// js object, array, es6
	
	$.ajax({
        
        type:'post',
        url:'<%=request.getContextPath()%>/user/updateProc.api',        
        dataType:'json',
        data:param,
        //data:JSON.stringify(param),
        success: function (data) {
        	console.log(data);
            if(data['rs'] === '1'){
            	location.href = 'update.do';
            }else{
            	alert('잠시후에 다시 한번 해주세요');
            };
            
        },
        error: function (request, status, error) {
            console.log(request, status,error);
        }
    });
	
}
</script>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h1>UPDATE <br>
<form method="post">
	*id: <%=session.getAttribute("id") %><br>
	*pw: <input type="text" id="password" name="password" value="<%=dto.getPassword()%>"><br>
	*name: <input type="text" id="name" name="name" value="<%=dto.getName()%>"><br>
	*role: 
	<input type="radio" name="role" value="User" 
	<%if(dto.getRole().equals("User")) {%> checked="checked" <%} %>>User
	<input type="radio" name="role" value="Admin"
	<%if(dto.getRole().equals("Admin")) {%> checked="checked" <%} %>>Admin<br>
	<input type="button" value="Submit" onclick="updateProc();">
</form>
</h1>
</body>
</html>