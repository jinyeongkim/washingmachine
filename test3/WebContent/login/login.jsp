<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

#wrap{width:1000px;} 

#header{width:300px; float:left;}

#slider{width:300px; float:left;}

#content{width:700px; float:left;}

#footer{width:1000px; float:left;}

</style>

<!--wrap - 레이아웃 전체를 묶어서 wrap안에 있는 div들이 깨지지 않고 자리를 잘 잡게 하기 위한 테두리이다.-->

<!--header - 넓이값과 float으로 위치를 잡아주면 된다.  -->

<!--bar, content - bar와 content의 합은 레이아웃 전체 크기보다 클수 없다.  -->

<!-- footer - footer에도 float값을 주어야한다. float값을 주지 않으면 브라두저에서 레이아웃이 깨져나올수 있다. -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body style="background-color:#CEE3F6;border-color:red;font-face:굴림;font-size:9pt;">



<div class="header">
<img src="/test3/colorwashingmachine.jpg" width="150" height="150" align="middle" >
 </div>
<div class = "header" align = "justify">
<form name = "selection" action="login_result.jsp" method= "post" >

<p> id</p>
<input type = "text" name = "id" id = "id">

<p> password</p>
<input type = "password" name = "password" id="id">

<input type = "submit" value = "로그인" >
</form>

<input type = "button" name = "가입하러가기" onclick = "window.location.href = '/test3/signup/signUp.jsp'" value = "회원가입" >
</div>
</body>
</html>