<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id")+"ajax";
String pw = request.getParameter("pw")+"ajax";
%>
{"id":"<%=id %>", "pw":"<%=pw %>"}

