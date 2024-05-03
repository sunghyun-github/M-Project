<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="mvc.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h2>Board List</h2>
<form  method="get">
<table border="1" width="90%">
	<tr>	
	<td>
		<select name="searchField">
			<option value="title">title</option>
			<option value="content">content</option>
		</select>
		<input type="text" name="searchWord">
		<input type="submit" value="Search">
	</td>
	</tr>
</table>
</form>
<table border="1" width="90%">
<tr><td colspan="5">&nbsp;<b>전체 : ${totalCount }</b></td></tr>
	<tr>
		<th width="10%">Num</th>
		<th width="50%">Title</th>
		<th width="15%">Writer</th>
		<th width="10%">Visitnum</th>
		<th width="15%">Postdate</th>
	</tr>
<c:choose>	
	<c:when test="${empty boardLists}"> 
	<tr><td colspan="5">&nbsp;<b>Data Not Found!!</b></td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="bbs" items="${ boardLists}">
		<tr align="center">
			<td>${ bbs.num }</td>
			<td align="left">&nbsp;
			<a href="view.bo?num=${bbs.num}">${bbs.title }</a>
			</td>
			<td>${bbs.id }</td>
			<td>${bbs.visitcount }</td>
			<td>${bbs.postdate }</td>
		</tr>
		</c:forEach>
	</c:otherwise>	
</c:choose>
	<tr><td colspan="5" align="right"><a href="write.bo">[Write]</a>&nbsp;&nbsp;&nbsp;</td></tr>
</table>

</body>
</html>