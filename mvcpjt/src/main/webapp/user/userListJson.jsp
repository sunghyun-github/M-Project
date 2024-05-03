<%@page import="com.google.gson.Gson"%>
<%@page import="mvc.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserDAO dao = new UserDAO();
List<UserDTO> userList =  dao.getUsers();

Gson gson = new Gson();
String json = gson.toJson(userList);
%>
<%=json%>