<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/delete.jsp</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script type="text/javascript">
function deleteProc(){
	const password = $('#password').val();
	//console.log(role);
	const param = {password};// js object, array, es6
	
	$.ajax({
        
        type:'post',
        url:'<%=request.getContextPath()%>/user/deleteProc.api',        
        dataType:'json',
        data:param,
        //data:JSON.stringify(param),
        success: function (data) {
        	console.log(data);
            if(data['rs'] === '1'){
            	alert('그동안 감사드립니다.!!');
            	location.href = 'main.do';
            }else{
            	alert('잠시후에 다시 한번 해주세요');
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
<h1>회원 탈퇴<br>
<form method="post">
pwd : <input type="text" id="password" name="password"><br>
<input type="button" value="submit" onclick="deleteProc();">
</form>
</h1>
</body>
</html>