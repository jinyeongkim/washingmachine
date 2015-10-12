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

#fontfamily{
	font-family: HY엽서M,고딕, 돋움,  맑은고딕,AR DESTINE중간;
	}
	
	
</style>

<!--wrap - 레이아웃 전체를 묶어서 wrap안에 있는 div들이 깨지지 않고 자리를 잘 잡게 하기 위한 테두리이다.-->

<!--header - 넓이값과 float으로 위치를 잡아주면 된다.  -->

<!--bar, content - bar와 content의 합은 레이아웃 전체 크기보다 클수 없다.  -->

<!-- footer - footer에도 float값을 주어야한다. float값을 주지 않으면 브라두저에서 레이아웃이 깨져나올수 있다. -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body style="background-color:#9BBAD8;border-color:red; ;font-size:9pt;">



<div class="header">
	<img src="/test3/colorwashing.jpg" width="150" height="150" align="middle" >
 </div>
<div class = "header" align = "justify">
<form name = "selection" action="login_result.jsp" method= "post" >

<p id="fontfamily"> id</p>
<input type = "text" name = "id" id = "id">

<p id="fontfamily" > password</p>
<input type = "password" name = "password" id="id">

<input type = "submit" style="background-color:#F0F0F0; color:#5D5B54 " value = "로그인" id="fontfamily" >
</form>

<input type = "button" style="background-color:#F0F0F0; color:#5D5B54"  id="fontfamily" name = "가입하러가기" onclick = "window.location.href = '/test3/signup/signUp.jsp'" value = "회원가입" >
</div>
</body>
</html>