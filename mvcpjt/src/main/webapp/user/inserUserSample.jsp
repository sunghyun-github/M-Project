<%@page import="mvc.dto.UserDTO"%>
<%@page import="mvc.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
for(int i=10; i<133; i++){
	String id = "hong"+i;
	String password = "1111";
	String name = "홍길동"+i;
	String role = "User";
	
	UserDTO dto = new UserDTO(id,password,name,role);
	UserDAO dao = new UserDAO();
	dao.insertUser(dto);
}
%>
End!!