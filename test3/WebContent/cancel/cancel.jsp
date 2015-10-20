<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
        <%@ page import = "java.sql.*" %>
      <%@page import = "java.util.*"%>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취소하기</title>
<style type="text/css">

#fontfamily {
	font-family: HY엽서M;
}

table {border-collapse: collapse;
border: 2px solid #B18904;  /*line color*/
font: normal 80%/140% arial, helvetica, sans-serif;
color: #000; /* top word's color*/
background: #E8BD24;}  /*first attribute's list color*/

td, th {border: 1px dotted #ABA877;  /*line color of table*/
padding: .5em;
}
caption {
	padding: 0 0 .5em 0;
	text-align: left;
	font-size: 1.4em;
	font-weight: bold;
	text-transform: uppercase;
	color: #FB1B8B;
	background: transparent;
}

/* =links
----------------------------------------------- */
table a {
	padding: 1px;
	text-decoration: none;
	font-weight: bold;
	background: transparent;
}

table a:link {
	border-bottom: 1px dashed #ddd;
	color: #FB1B8B;
}

table a:visited {
	border-bottom: 1px dashed #ccc;
	text-decoration: line-through;
	color: #FB1B8B;
}

table a:hover {
	border-bottom: 1px dashed #bbb;
	color: #FB1B8B;
}

/* =head =foot
----------------------------------------------- */
thead th,tfoot th {
	border: 2px solid #000;
	text-align: left;
	font-size: 1.2em;
	font-weight: bold;
	color: #289FDB;
	background: transparent;
}

tfoot td {
	border: 2px solid #FB1B8B;
}

/* =body
----------------------------------------------- */
/*
tbody th, tbody td {vertical-align: top;
text-align: left;}

tbody th {white-space: nowrap;}

.odd {background: #fff;}

tbody tr:hover {background: #AFC1F7;}*/ /*<---------------action*/
#jb-header {
	width: 300px;
	padding: 5px;
	float: left;
	/*border: 1px solid #fff;*/
	margin-bottom : 10px;
}
#jb-button {
	width: 300px;
	float: bottom;
	padding: 5px;
	/*border: 1px solid #fff;*/
}

</style>
</head>
<body style="background-color:#9BBAD8">


<div id="jb-header">
	<p align = "center" id="fontfamily"> 나의 예약정보</p>
	<table border="2" align="left">
	<tr>
		<td align ="center"> 세탁기 번호</td>
		<td align ="center"> 예약 날짜</td>
		<td align ="center">시작 시간</td>
		<td align ="center">종료 시간</td>
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
		<td align = "center" style="width:40px" id="fontfamily"><%= rs.getString("rw_id")%></td>
		<td align = "center" id="font-family"><%= rs.getString("r_date")%></td>	
			<td align = "center" id="font-family"><%= rs.getString("start_time")%></td>
			<td align = "center" id="font-family"><%= rs.getString("end_time")%></td>
		</tr>
		<%
		}
		%>	
	</table>
		<%
			stmt.close();
			conn.close();
			%></div>
			<div id="jb-button">
<input type="button" id="fontfamily" onclick="window.location='/test3/main.jsp'" value="뒤로가기" align="right" style="margin-right:106px">
<input type = "button" onclick="window.location='/test3/cancel/cancel_result.jsp'" value = "예약취소하기" align = "left" ">

</div>


</body>
</html>