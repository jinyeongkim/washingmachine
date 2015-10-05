<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body style="background-color:#CEE3F6"><h2>회원가입</h2>

	<div style="left: 20px;">

		<form name="signUp" action="/test3/signup/signUpFinish.jsp" method="post">
			<p>아이디</p>
			<input type="text" name="id" id="id" maxlength="9"> 
			<p>비밀번호</p>
			<input type="password" name="password" id="password" maxlength="15">
			<p>비밀번호 확인</p>
			<input type="password" name="password_check" id="password_check" maxlength="15">
			<p>휴대전화</p>
			<input type="text" name="phone" id="form" maxlength="11">
			<p>카드번호</p>
			<input type="text" name="card" id="card" maxlength="15">
		<!--	<p>충전 금액</p>
		  	<select name="balance" >
				<option value=99>금액</option>
				<option value="<%="1000"%>"><%=1000 %></option>
				<option value="<%="3000"%>"><%=3000 %></option>
				<option value="<%="5000"%>"><%=5000 %></option>
				<option value="<%="10000"%>"><%=10000 %></option>
			</select>-->
			<p>기숙사</p>
			<select name="dorm">
				<option value=99>기숙사</option>
				<option value="<%="w"%>">w</option>
				<option value="<%="m"%>">m</option>
			</select> <input type="submit" value="가입하기">
		</form>
	</div>
	</body>
</html>