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
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userListAjax.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
function getUsers(){
	$.ajax({
        //contentType: "application/json",
        type:'GET',
        url:'<%=request.getContextPath()%>/user/userList.api',
        dataType:'json',
        //data:param,
        //data:JSON.stringify(param),
        success: function (response) {
            console.log(response);
            makeHtml(response);            
        },
        error: function (request, status, error) {
            console.log(request, status,error);
        }
    });
}
function makeHtml(data){
	let html = ''; 
	
    for(u of data){            	
		html += '<tr>';
    	html += '<td>' + u['idx'] + '</td>';
    	html += '<td>' + u['id'] + '</td>';
    	html += '<td>' + u['password'] + '</td>';
    	html += '<td>' + u['name'] + '</td>';
    	html += '<td>' + u['role'] + '</td>';
    	html += '<td>' + u['regDate'] + '</td>';
    	html += '</tr>\n';         
    }
    console.log(html);
    $('#users').html(html);
}
$(function(){
	getUsers();	
});
</script>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h1>User List
<table border="1">
<thead>
<tr><th>IDX</th><th>ID</th><th>PW</th><th>Name</th><th>Role</th><th>Regdate</th></tr>
</thead>
<tbody id="users">

</tbody>
</table>
</h1>
</body>
</html>