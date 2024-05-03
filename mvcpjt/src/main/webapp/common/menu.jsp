<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>
<ul>
<li>
<a href="<%=request.getContextPath()%>">Index</a> |
<% if(session.getAttribute("idx") == null) {%>
<a href="../user/join.do">Join</a> | 
<a href="../user/joinAjax.jsp">Join(AJAX)</a> | 
<a href="../user/login.do">Login</a> |
<a href="../user/loginAjax.jsp">Login(AJAX)</a> 
<%}else{ %>
<%=session.getAttribute("id") %>(<%=session.getAttribute("name") %>) |
<a href="../user/update.do">Update(내정보수정)</a> | 
<a href="../user/updateAjax.do">Update(내정보수정)(AJAX)</a> | 
<a href="../user/delete.do">Delete(회원탈퇴)</a> |
<a href="../user/deleteAjax.jsp">Delete(회원탈퇴)(AJAX)</a> |
<a href="../user/logout.do">LogOut</a> 
<%} %>
</li>
<li>
<a href="/mvcpjt/user/userList.do">User List2(mvc)</a> |
<a href="../user/userListAjax.jsp">User List(Ajax)</a> |
<a href="../user/userListJstl.do">User List(Jstl)</a> |
<a href="../user/userListPage.do">User List(Paging)</a> |
<a href="../user/userListPageMybatis.do">User List(Mybatis)</a> |
<a href="../user/userListMybatisTest.jsp">User List(Mybatis - Test)</a>
</li>
<li>
<a href="../board/list.bo">Board List</a> |
<a href="../board/listJstl.bo">Board List(Jstl)</a> |
<a href="../board/listFile.bo">Board List(File)</a> |
<a href="../board/listPage.bo">Board List(Paging)</a>
</li>
</ul>
</h3>