<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약목록</title>
<style type="text/css">

#fontfamily{
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
	
#jb-header{
	width:300px;
}	
	
</style>

</head>
<body style="background-color:#9BBAD8">
	<div id="jb-header">
	<h4 id="fontfamily" align = "center"> <%=(String)session.getAttribute("dorm")%> 예약 목록</h4>
	<table id="fontfamily"border="2" align="left">
	<tr>
	<td id="fontfamily"align ="center">세탁기 번호</td>
		<td id="fontfamily" align ="center">예약 날짜</td>
		<td id="fontfamily"align ="center">시작 시간</td>
		<td id="fontfamily" align ="center">종료 시간</td>
		
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
		<td id="fontfamily"align = "center"><%= rs.getString("rw_id")%></td>	
		<td id="fontfamily"align = "center"><%= rs.getString("r_date")%></td>	
		<td id="fontfamily"align = "center"><%= rs.getString("start_time")%></td>
		<td id="fontfamily"align = "center"><%= rs.getString("end_time")%></td>
		</tr>
		<%
		}
		%>	
	</table>
		<%
			stmt.close();
			conn.close();
			%>
		<input type="button" id="fontfamily" onclick="window.location='/test3/main.jsp'" value="메인화면" align="bottom" style="margin-left:235px;margin-top:10px">
</div>



</body>
</html>