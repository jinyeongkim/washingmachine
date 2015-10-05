<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		

	
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		
		
		if(id.equals("")){
			%><script>alert("아이디를 입력하세요.");
			location.href='/test3/login/login.jsp';</script><%
		}
		else if(password.equals("")){
			%><script>alert("비밀번호를 입력하세요.");
			location.href='/test3/login/login.jsp';</script><%
		}
				
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl,"root","root");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from user where u_id ='"+id+"' and password = '"+password+"'");
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : "+e.getMessage());
		}
		if(!rs.next()){
			%>
			<script>alert("입력하신 아이디/비밀번호가 일치하지 않습니다."); location.href='/test3/login/login.jsp';</script>
			<%
		}
			else{rs.previous();}
		
		
		
		
		while(rs.next()){
		 String ids= rs.getString("u_id");	
		 String dorm= rs.getString("dorm");	
		 
			
			session.setAttribute("id", ids);
			session.setAttribute("dorm", dorm);
			%>
			<script>alert("<%=ids %>님 로그인 완료"); location.href='/test3/main.jsp';</script>
			<%}
		
			stmt.close();
			conn.close();
			

			%>
			
			
		
</body>
</html>