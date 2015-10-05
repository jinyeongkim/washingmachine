<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세탁기 상태</title>
</head>
<body style="background-color:#CEE3F6">
<center>
	<p align = "right"> <%=(String)session.getAttribute("dorm") %>  세탁기 상태</p> 
	<table border="2" align="right">
	<tr>
		<td align ="center"> 세탁기 번호</td>
		<td align ="center"> 세탁기 상태</td>
		<td align ="center"> 기숙사</td>
			</tr>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dorm = (String)session.getAttribute("dorm");
	
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl,"root","root");
		stmt = conn.createStatement();
	
		String sql = "select * from washingmachine where w_dorm='"+dorm+"'"; //where w_dorm = '"+dorm+"'
		rs = stmt.executeQuery(sql);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : "+e.getMessage());
		}
		while(rs.next()){		
		%>
		<tr>
			<td align = "center"><%= rs.getString("w_id")%></td>	
			<td align = "center"><%= rs.getString("state")%></td>
			<td align = "center"><%= rs.getString("w_dorm")%></td> 
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