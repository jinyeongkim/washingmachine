<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import = "java.sql.*" %>
      <%@page import = "java.util.*"%>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body style="background-color:#CEE3F6">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취소하기</title>
</head>
<body>
<center>
	<p align = "right"> 나의 예약정보</p>
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
		String jdbcurl = "jdbc:mysql://localhost:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl,"root","root");
		stmt = conn.createStatement();
		String ru_id = (String)session.getAttribute("id");
		String dorm = (String)session.getAttribute("dorm");
		
		String sql = "select * from reservation where r_dorm = '"+dorm+"' and ru_id= '"+ru_id+"'";
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

</center>

<script type = "text/javascript">
function confirms(){
	if(confirm("정말 삭제하시겠습니까??")==true){
		<%
		Connection con = null;
		PreparedStatement pstmt = null;
		request.setCharacterEncoding("UTF-8");

		String dorm = (String)session.getAttribute("dorm");
		String id = (String)session.getAttribute("id");


		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		con = DriverManager.getConnection(jdbcurl,"root","root");
		pstmt = con.prepareStatement("delete from reservation where ru_id = '"+id+"'");
		pstmt.executeUpdate();
		}
		catch(Exception e){ 
			out.println("DB 연동 오류입니다. : "+e.getMessage());	
		}
			
			con.close();
			
			%>
		alert("취소가 완료되었습니다.");
		location.href='/test3/main.jsp';
	
	}else{
		return;
	}
}

</script>
<input type = "button" onclick="confirms()" value = "예약취소하기" >

</body>
</html>