<%@page import="mvc.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mvc.common.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
SqlSession sqlSession = sqlSessionFactory.openSession();

// list
List<UserDTO> userList =  sqlSession.selectList("userMapper.getUsers");

// dto
UserDTO user = new UserDTO();
user.setId("hong");
user = sqlSession.selectOne("userMapper.getUser", user);

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userList.jsp</title>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h1>User List (<%=user.getName() %>)
<table border="1">
<tr><th>IDX</th><th>ID</th><th>PW</th><th>Name</th><th>Role</th><th>Regdate</th></tr>
<%
	for(UserDTO dto : userList) {
		int idx = dto.getIdx();
		String id = dto.getId();
		String password = dto.getPassword();
		String name = dto.getName();
		String role = dto.getRole();
		String regdate = dto.getRegDate();
%>
<tr><td><%=idx %><td><%=id %></td><td><%=password %></td><td><%=name %></td><td><%=role %></td><td><%=regdate %></td></tr>
<%} %>
<% // paging
int listNum = 10;
int totalCount = userList.size();
int pageNum = (int)Math.ceil(((double)totalCount / listNum));
%>
<tr><td colspan="6">
<%for(int i=1; i<= pageNum; i++) {%><a href="userList.do?curPage=<%=i%>">[<%=i %>]</a><%} %>
</td></tr>
</table>
</h1>
</body>
</html>