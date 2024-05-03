<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/login.jsjp</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script type="text/javascript">
function loginProc(){
	const form = document.loginForm;
	const id = form.id.value;
	const password = form.password.value;
	
	const param = {id, password};
	
	$.ajax({       
        type:'POST',
        url:'<%=request.getContextPath()%>/user/loginProc.api',
        dataType:'json',
        data:param,
        //data:JSON.stringify(param),
        success: function (data) {
            console.log(data);
            if(data['rs'] === '1'){ // success
            	location.href='main.do';
            }else{ // fail
            	alert('id 나 password를 체크 하세요');
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
<h1>로그인<br>
<form name="loginForm" method="post">
id: <input type="text" name="id" ><br>
pwd : <input type="text" name="password"><br>
<input type="button" value="login" onclick="loginProc();">
</form>
</h1>
</body>
</html>