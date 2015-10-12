
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 예약 정보</title>
<style type="text/css">


#fontfamily{
	font-family: HY엽서M;
	}
table {border-collapse: collapse;
border: 2px solid #4D6BE6;  /*line color*/
font: normal 80%/140% arial, helvetica, sans-serif;
color: #fff; /* top word's color*/
background: #0040FF;}  /*first attribute's list color*/

td, th {border: 1px dotted #bbb;
padding: .5em;}

caption {padding: 0 0 .5em 0;
text-align: left;
font-size: 1.4em;
font-weight: bold;
text-transform: uppercase;
color: #FB1B8B;
background: transparent;}

/* =links
----------------------------------------------- */

table a {padding: 1px;
text-decoration: none;
font-weight: bold;
background: transparent;}

table a:link {border-bottom: 1px dashed #ddd;
color: #FB1B8B;}

table a:visited {border-bottom: 1px dashed #ccc;
text-decoration: line-through;
color: #FB1B8B;}

table a:hover {border-bottom: 1px dashed #bbb;
color: #FB1B8B;}

/* =head =foot
----------------------------------------------- */

thead th, tfoot th {border: 2px solid #000;
text-align: left;
font-size: 1.2em;
font-weight: bold;
color: #289FDB;
background: transparent;}

tfoot td {border: 2px solid #FB1B8B;}

/* =body
----------------------------------------------- */
/*
tbody th, tbody td {vertical-align: top;
text-align: left;}

tbody th {white-space: nowrap;}

.odd {background: #fff;}

tbody tr:hover {background: #AFC1F7;}*//*<---------------action*/
</style>

</head>
<body style="background-color: #9BBAD8 ">
	<h2  id="fontfamily">

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
	String year = request.getParameter("year");
	String date2 = String.valueOf(year.trim()+"-"+ request.getParameter("month") + "-" + request.getParameter("day"));
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
		<p id="fontfamily">나의 예약정보</p>
		<table  id="fontfamily"border="2" align="center">
			<tr>
				<td  id="fontfamily"align="center">세탁기 번호</td>
				<td  id="fontfamily"align="center">예약 날짜</td>
				<td  id="fontfamily"align="center">예약 시작 시간</td>
				<td  id="fontfamily"align="center">예약 종료 시간</td>
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
				<td id="fontfamily" align="center"><%=rs.getString("rw_id")%></td>
				<td id="fontfamily" align="center"><%=rs.getString("r_date")%></td>
				<td  id="fontfamily"align="center"><%=rs.getString("start_time")%></td>
				<td  id="fontfamily"align="center"><%=rs.getString("end_time")%></td>
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

	<input type="button" id="fontfamily" onclick="window.location='/test3/main.jsp'"
		value="예약완료  ^_^" align="top">


</body>
</html>