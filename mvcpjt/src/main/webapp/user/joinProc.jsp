<%@page import="mvc.dao.UserDAO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="mvc.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 값을 받고 찍어 본다. 꼭~~
request.setCharacterEncoding("utf-8"); // 한글 처리
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String role = request.getParameter("role");

UserDTO dto = new UserDTO(id,password,name,role);

// 3. db 처리
UserDAO dao = new UserDAO();
int rs = dao.insertUser(dto);
%>
{"rs":"<%=rs %>"}
