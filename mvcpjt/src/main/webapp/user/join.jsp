<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/join.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
<form action="./joinProc.do" method="post">
	*id: <input type="text" name="id" id="id">
	<input type="button" value="idCheck" onclick="idCheck();"><br>
	<span id="isIdTure" style="color:red">ID가 존재 합니다.</span>
	<span id="isIdFalse" style="color:blue">사용 가능한 ID 입니다.</span><br>	
	*pw: <input type="text" name="password"><br>
	*name: <input type="text" name="name"><br>
	*role: 
	<input type="radio" name="role" value="User" checked="checked">User
	<input type="radio" name="role" value="Admin">Admin<br>
	<input type="submit" value="Submit">
</form>
</h1>
</body>
</html>