
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 예약 정보</title>
</head>
<body style="background-color: #CEE3F6">
	<h2>

		<%
			out.print((String) session.getAttribute("dorm"));
		%>
	</h2>

	<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int set=1;//중복되는 시간 정보 디비에 저장 안하게 하기위한 변수 
	request.setCharacterEncoding("UTF-8");
	int rw_id = Integer.parseInt((String)request.getParameter("machine_num"));
	String dorm = (String) session.getAttribute("dorm");
	String date2 = String.valueOf("2015"+"-"+ request.getParameter("month") + "-" + request.getParameter("day"));
	String start_time = String.valueOf(request.getParameter("start_time_h")+ ":"+ request.getParameter("start_time_m"));
	String end_time = String.valueOf(request.getParameter("end_time_h")
			+ ":" + request.getParameter("end_time_m"));
	String id = (String) session.getAttribute("id");
	
	


	Date date1 = Date.valueOf(date2);
	String card;
	int balance;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl, "root", "root");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select count(*) from reservation where ru_id ='"+ id + "'");
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	rs.next();
	if (rs.getInt(1) != 0) {
		set=0;%><script>
		alert("이미 예약 내역이 있습니다.다른 예약을 원하신다면 예약 취소 후에 이용해주시길 바랍니다.");
		location.href='/test3/main.jsp';</script>

	<%}
			
	try {
		String sql = "select count(*) from reservation where rw_id = '"
				+ rw_id + "'  and r_dorm = '" + dorm + "' and r_date='"+date1+"' and ((start_time <='"+start_time+"' and end_time >= '"+end_time+"')or(start_time >='"+start_time+"' and end_time <= '"+end_time+"')or(start_time >='"+start_time+"' and end_time >= '"+end_time+"' and start_time< '"+end_time+"')or(start_time <='"+start_time+"' and end_time <= '"+end_time+"' and end_time> '"+start_time+"'))";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	rs.next();
	if (rs.getInt(1) > 0) {
	set = 0;%>
	<script>
		alert("중복되는 예약시간이 존재합니다.");
		history.back();
		</script>
	<%}
		if(set!=0){		
		Connection con = null;
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select card from user where u_id ='"+ id + "'");
		rs.next();
		card = rs.getString("card");
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
			con = DriverManager.getConnection(jdbcurl, "root", "root");	
			
			pstmt = con.prepareStatement("insert into reservation values(?,?,?,?,?,?,?)");

			pstmt.setInt(1, rw_id);
			pstmt.setDate(2, date1);
			pstmt.setString(3, start_time);
			pstmt.setString(4, end_time);
			pstmt.setString(5, dorm);
			pstmt.setString(6, id); 
			pstmt.setString(7, card);

			pstmt.executeUpdate();
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		pstmt.close();
		con.close();
		}
	
	%>


	<center>
		<p>나의 예약정보</p>
		<table border="2" align="center">
			<tr>
				<td align="center">세탁기 번호</td>
				<td align="center">예약 날짜</td>
				<td align="center">예약 시작 시간</td>
				<td align="center">예약 종료 시간</td>
			</tr>
			<%
				
				try {
						String sql = "select * from reservation where rw_id = '"
							+ rw_id + "'  and r_dorm = '" + dorm + "' and ru_id='"
							+ id + "'";
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				while (rs.next()) {
			%>

			<tr>
				<td align="center"><%=rs.getString("rw_id")%></td>
				<td align="center"><%=rs.getString("r_date")%></td>
				<td align="center"><%=rs.getString("start_time")%></td>
				<td align="center"><%=rs.getString("end_time")%></td>
			</tr>

			<%}
			%>

		</table>
		
	</center>

	<%		
			try {
					String sql = "select * from reservation where rw_id = '"
							+ rw_id + "'  and r_dorm = '" + dorm + "' and ru_id='"
							+ id + "'";
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				while (rs.next()) {
			%>
	<script type="text/javascript">alert('예약시간 : '+'<%=rs.getString("start_time")%>'+'~'+'<%=rs.getString("end_time")%>');</script>
	<%}
			stmt.close();
			conn.close();
		%>

	<input type="button" onclick="window.location='/test3/main.jsp'"
		value="예약완료  ^_^" align="top">


</body>
</html>