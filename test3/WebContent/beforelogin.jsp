<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 안했음</title>
</head>
<body>

	<script type="text/javascript">
	<% String id_check = (String)session.getAttribute("id");
	if (id_check==null) {%>
		alert("로그인 바랍니다.");
		location.replace("/test3/login/login.jsp");
	<%} else if (session.getAttribute("dorm") == null) {%>
		alert("로그인 바랍니다.");
		location.replace("/test3/login/login.jsp");
	<%}
	else{%>
		location.replace("/test3/main.jsp");<%}%>
		
	</script>
</body>
</html>