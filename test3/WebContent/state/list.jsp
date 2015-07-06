<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약목록</title>
</head>
<body>
	<center>
	<p align = "right"> 예약 목록</p>
	<table border="2" align="right">
	<tr>
	<td align ="center"> 세탁기 번호</td>
		<td align ="center"> 예약 날짜</td>
		<td align ="center"> 예약 시작 시간</td>
		<td align ="center"> 예약 종료 시간</td>
		
			</tr>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
	   request.setCharacterEncoding("UTF-8");
	
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl,"root","root");
		stmt = conn.createStatement();
		String ru_id = (String)session.getAttribute("id");
		String dorm = (String)session.getAttribute("dorm");
		
		String sql = "select * from reservation where r_dorm = '"+dorm+"'";
		rs = stmt.executeQuery(sql);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : "+e.getMessage());
		}
		while(rs.next()){		
		%>
		<tr>
		<td align = "center"><%= rs.getString("rw_id")%></td>	
		<td align = "center"><%= rs.getString("r_date")%></td>	
			<td align = "center"><%= rs.getString("start_time")%></td>
			<td align = "center"><%= rs.getString("end_time")%></td>
		</tr>
		<%
		}
		%>	
	</table>
		<%
			stmt.close();
			conn.close();
			%>
		<input type="button" onclick="window.location='/test3/main.jsp'" value="HOME" align="left">
</center>



</body>
</html>