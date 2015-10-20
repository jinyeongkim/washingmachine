<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

#fontfamily{
	font-family: HY엽서M,고딕, 돋움,  맑은고딕,AR DESTINE중간;
	}
	
#login-Button{
	float: left;
	width:80px;
/* 	border: 1px solid #fff; */

}
#textbox{
	float:left;
	width:200px;
	margin-left:10px;
/* 	border: 1px solid #fff; */
	}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body style="background-color:#9BBAD8;border-color:red; ;font-size:9pt;">



<div id="header">
	<img src="/test3/colorwashingmachine.jpg"  style="margin-left:30px;" width="200" height="200" align="middle" >
</div><!-- 
 
 <div style="position:absolute; left:100px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='color.jpg',sizingMethod='scale');"> </div>
 -->
<form name = "selection" action="login_result.jsp" method= "post" >

<div id="textbox">

<p id="font-family"> id</p>
<input type = "text" style="width:180px"  name = "id" id = "id">
<p id="font-family" > password</p>
<input type = "password"  style="width:180px"  name = "password" id="id">
</div>

<div id = "login_Button">
<input type = "submit" style="background-color:#F0F0F0; margin-top:44px;width:80px; height:80px; color:#5D5B54 " value = "로그인" id="fontfamily" >

</div>
<input type = "button" style="background-color:#F0F0F0; margin-top:10px; margin-left:215px;  color:#5D5B54"  id="fontfamily" align = "bottom"  name = "가입하러가기" onclick = "window.location.href = '/test3/signup/signUp.jsp'" value = "회원가입" >

</form> 




</body>
</html>