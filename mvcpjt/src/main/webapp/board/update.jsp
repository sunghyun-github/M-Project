<%@page import="mvc.dao.BoardDAO"%>
<%@page import="mvc.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/sessionCheck.jsp"%>      
<% // param

BoardDTO dto = (BoardDTO)request.getAttribute("dto");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/update.jsp</title>
<script type="text/javascript">
function validateForm() {
	const form = document.writeForm;
	console.dir(form); // input
	if(form.title.value === ""){
		alert('title 필수값 입니다.');
		form.title.focus();
		return;
	}
	if(form.content.value === ""){
		alert('content 필수값 입니다.');
		form.content.focus();
		return;
	}
	
	form.submit();
}
</script>
</head>
<body>
<%@ include file="../common/menu.jsp" %>
<h2>글 수정하기 </h2>
<form name="writeForm" 
	action="<%=request.getContextPath() %>/board/updateProc.bo" 
	method="post">
	<input type="hidden" name="num" value="<%=dto.getNum()%>">
	<table border="1" width="90%">
		<tr>
		<td>Num</td><td><%=dto.getNum() %></td>
		<td>ID(Name)</td><td><%=dto.getId()%>(<%=dto.getName() %>)</td>	
		</tr>
		<tr>
		<td>PostDate</td><td><%=dto.getPostdate() %></td>
		<td>Visitcount</td><td><%=dto.getVisitcount() %></td>	
		</tr>
		<tr><td>Title</td><td colspan="3">
		<input type="text" name="title" value="<%=dto.getTitle() %>" style="width:90%">
		</td></tr>
		<tr><td>Content</td><td colspan="3">
		<textarea name="content" style="width:90%; height:100px"><%=dto.getContent() %></textarea>
		</td></tr>
		<tr><td colspan="4">
		<a href="list.bo">[List]</a> |  
		<a href="view.bo?num=<%=dto.getNum()%>">[View]</a> |		
	<%if(session.getAttribute("id") != null && session.getAttribute("id").equals(dto.getId())) {%>
		<a href="javascript:validateForm();">[Update]</a> 
	<%} %>
		</td></tr>		
	</table>
</form>

</body>
</html>