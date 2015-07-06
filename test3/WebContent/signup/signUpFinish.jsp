<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입 완료</title>
</head>
<body>
	
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String password_check = request.getParameter("password_check");
			String bank = request.getParameter("bank");
			String account = request.getParameter("account");
			String dorm = request.getParameter("dorm");
			String phone = request.getParameter("phone");

			Connection con = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			Statement stmt = null;
			ResultSet rs = null;
			int set = 1;

		if (name.equals("")){
		%><script>alert("이름을 입력하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
			else if (id.equals("")){
		%><script>alert("아이디를 입력하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
			else if (password.equals("")){
		%><script>alert("패스워드를 입력하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
			else if (!password.equals(password_check)){
		%><script>alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		location.href='/test3/signup/signUp.jsp';</script>		
		<%}
			else if (phone.equals("")){
		%><script>alert("휴대전화번호를 입력하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
			else if (bank.equals("99")){
		%><script>alert("은행을 선택하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
			else if (account.equals("")){
		%><script>alert("계좌번호를 입력하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
			else if (dorm.equals("99")){
		%><script>alert("기숙사를 선택하세요.");
		location.href='/test3/signup/signUp.jsp';</script>
		<%}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
			conn = DriverManager.getConnection(jdbcurl, "root", "root");
			stmt = conn.createStatement();
			String sql = "select count(*) from user where u_id='"+id+"'";
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		rs.next();
		if (rs.getInt(1) > 0) {
		set = 0;%>
		<script>
			alert("중복되는 아이디가 존재합니다.");
			history.back();
			</script>
			<%
			}
			stmt.close();
			conn.close();
			
			if(set!=0){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
				con = DriverManager.getConnection(jdbcurl, "root", "root");
				pstmt = con
						.prepareStatement("insert into user values(?,?,?,?,?,?,?,0)");

				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, phone);
				pstmt.setString(6, bank);
				pstmt.setString(4, account);
				pstmt.setString(5, dorm);
				pstmt.setString(7, password);

				pstmt.executeUpdate();
			} catch (Exception e) {
				out.println("DB 연동 오류입니다. : " + e.getMessage());
			}

			con.close();}
		%>
	</center>
	
	<%if(set!=0){	%>
	<img src="/test3/colorwashingmachine.jpg" alt="예약하기" width="150"
		height="150" align="right">
	<p>추카추카 가입 완료</p>
	
	
	<script>alert("<%=id%>님 회원가입 완료");
		location.href = '/test3/login/login.jsp';
	</script>

 	<%}%>

</body>
</html>