<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body><h2>회원가입</h2>

	<div style="left: 20px;">

		<form name="signUp" action="/test3/signup/signUpFinish.jsp" method="post">
			<p>이름</p>
			<input type="text" name="name" id="name" maxlength="5" style="ime-mode:active">
			<p>아이디</p>
			<input type="text" name="id" id="id" maxlength="9"> 
			<p>비밀번호</p>
			<input type="password" name="password" id="password" maxlength="15">
			<p>비밀번호 확인</p>
			<input type="password" name="password_check" id="password_check" maxlength="15">

			<p>휴대전화</p>
			<input type="text" name="phone" id="form" maxlength="11">
			<p>은행 선택</p>
			<select name="bank" >
				<option value=99>은행</option>
				<option value="<%="농협"%>">농협</option>
				<option value="<%="신한"%>">신한</option>
				<option value="<%="우리"%>">우리</option>
				<option value="<%="새마을"%>">새마을</option>
				<option value="<%="우체국"%>">우체국</option>
				<option value="<%="국민"%>">국민</option>
			</select>
			<p>계좌번호</p>
			<input type="text" name="account" id="account">
			<p>기숙사</p>
			<select name="dorm">
				<option value=99>기숙사</option>
				<option value="<%="예지원"%>">예지원</option>
				<option value="<%="의암관"%>">의암관</option>
				<option value="<%="율곡관"%>">율곡관</option>
				<option value="<%="한서관"%>">한서관</option>
			</select> <input type="submit" value="가입하기">
		</form>
	</div>
	</body>
</html>