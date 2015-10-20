<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<style type="text/css">

#fontfamily{
	font-family: HY엽서M;
	
	}
</style>
</head>

<body style="background-color:#9BBAD8"><h2 id="fontfamily" style = "color:#086A87" >회원가입</h2>
<input type="button" id="fontfamily" onclick="window.location='/test3/main.jsp'" align="left" value="메인화면" style="margin-left:200px">
	<div style="left: 20px;">

		<form name="signUp" action="/test3/signup/signUpFinish.jsp" method="post">
			<p id="fontfamily" >아이디</p>
			<input type="text" name="id" id="id" maxlength="9"> 
			<p id="fontfamily">비밀번호</p>
			<input type="password" name="password" id="password" maxlength="15">
			<p id="fontfamily">비밀번호 확인</p>
			<input type="password" name="password_check" id="password_check" maxlength="15">
			<p id="fontfamily">휴대전화</p>
			<input type="text" name="phone" id="form" maxlength="11">
			<p id="fontfamily">카드번호</p>
			<input type="text" name="card" id="card" maxlength="15">
		<!--	<p>충전 금액</p>
		  	<select name="balance" >
				<option value=99>금액</option>
				<option value="<%="1000"%>"><%=1000 %></option>
				<option value="<%="3000"%>"><%=3000 %></option>
				<option value="<%="5000"%>"><%=5000 %></option>
				<option value="<%="10000"%>"><%=10000 %></option>
			</select>-->
			<p id="fontfamily">기숙사</p>
			<select name="dorm" id="fontfamily">
				<option value=99 >기숙사</option>
				<option value="<%="w"%>">w</option>
				<option value="<%="m"%>">m</option>
			</select> <input type="submit" value="가입하기" id="fontfamily">
		</form>
	</div>
	</body>
</html>