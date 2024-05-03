<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>user/joinAjax.jsp</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script>
function idCheck(){
	const id = document.querySelector('#id').value;
	//console.log(id);
	const param = {id:id};
	
	$.ajax({
        contentType: "application/json",
        type:'GET',
        url:'<%=request.getContextPath()%>/user/idCheck.api',
        dataType:'json',
        data:param,
        //data:JSON.stringify(param),
        success: function (data) {
            console.log(data);
            if(data['rs'] === '0'){
            	$('#isIdFalse').show();
            	$('#isIdTure').hide();
            }else{
            	$('#isIdTure').show();
            	$('#isIdFalse').hide();
            };
        },
        error: function (request, status, error) {
            console.log(request, status,error);
        }
    });
	
}

function userJoin(){
	const id = document.querySelector('#id').value;
	const password = $('#password').val();
	const name = $('#name').val();
	const role = $('input:radio[name="role"]:checked').val();
	//console.log(role);
	const param = {id:id, password:password,name:name,role:role};// js object, array, es6
	
	$.ajax({
        
        type:'post',
        url:'<%=request.getContextPath()%>/user/joinProc.api',        
        dataType:'json',
        data:param,
        //data:JSON.stringify(param),
        success: function (data) {
        	console.log(data);
            if(data['rs'] === '1'){
            	location.href = 'login.jsp';
            }else{
            	alert('잠시후에 다시 한번 해주세요');
            };
            
        },
        error: function (request, status, error) {
            console.log(request, status,error);
        }
    });
	
}

$(function(){
	$('#isIdTure').hide();
	$('#isIdFalse').hide();
});


</script>

</head>
<body>
<%@ include file="../common/menu.jsp" %>
<hr>
<h1>JOIN <br>
<form action="<%=request.getContextPath() %>/JoinProc" method="post">
	*id: <input type="text" name="id" id="id">
	<input type="button" value="idCheck" onclick="idCheck();"><br>
	<span id="isIdTure" style="color:red">ID가 존재 합니다.</span>
	<span id="isIdFalse" style="color:blue">사용 가능한 ID 입니다.</span><br>	
	*pw: <input type="text" name="password"  id="password"><br>
	*name: <input type="text" name="name" id="name"><br>
	*role: 
	<input type="radio" name="role" value="User" checked="checked">User
	<input type="radio" name="role" value="Admin">Admin<br>
	<input type="button" value="Submit" onclick="userJoin();">
</form>
</h1>
</body>
</html>