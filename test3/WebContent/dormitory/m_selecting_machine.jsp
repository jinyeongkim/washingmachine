<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세탁기 선택하기</title>
<style type="text/css">
#fontfamily {
	font-family: HY엽서M, 돋움;
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
	width: 270px;
	float: top;
}

#jb-sidebarleft {
	width: 140px;
	margin-right: 5px;
	float: left;
}

#jb-sidebarright {
	width: 110px;
	padding: 3px;
	float: left;

}
#jb-sidebarradix{
	width: 20px;
	float: right;
	
}
#jb-sidebarpic{
	width: 80px;
	float: left;
}

</style>

</head>
<body style="background-color: #9BBAD8">


		<h2 id="fontfamly">
			<%
			out.print((String) session.getAttribute("dorm"));
		%>
		</h2>
		<input type="button" id="fontfamily" onclick="window.location='/test3/main.jsp'" align="left" value="메인화면" style="margin-left:200px">
			<div id="jb-header">
		<h4 align="center" id="fontfamily">예약자 목록</h4>
		<table id="fontfamly" border="2" align="center">
			<tr>
				<td align="center" id="fontfamly">세탁기 번호</td>
				<td align="center" id="fontfamly">예약 날짜</td>
				<td align="center" id="fontfamly">시작 시간</td>
				<td align="center" id="fontfamly">종료 시간</td>
				<td align="center" id="fontfamly">건물</td>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				String dorm = (String) session.getAttribute("dorm");

				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;

				try {
					Class.forName("com.mysql.jdbc.Driver");
					String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
					conn = DriverManager.getConnection(jdbcurl, "root", "root");
					stmt = conn.createStatement();
					rs = stmt
							.executeQuery("select * from reservation where r_dorm ='"
									+ dorm + "'");

				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());

				}

				if (rs != null) {
					while (rs.next()) {
			%>
			<tr>
				<td align="center" id="fontfamly"><%=rs.getString("rw_id")%></td>
				<td align="center" id="fontfamly"><%=rs.getString("r_date")%></td>
				<td align="center" id="fontfamly"><%=rs.getString("start_time")%>
				</td>
				<td align="center" id="fontfamly"><%=rs.getString("end_time")%></td>
				<td align="center" id="fontfamly"><%=rs.getString("r_dorm")%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<%
			stmt.close();
			conn.close();
		%>

	</div>

	
	<div id="jb-sidebarleft">

		<h4 align="center" id="fontfamily">세탁기 상태</h4>
		<table border="2">
			<tr>
				<td align="center" id="fontfamly">세탁기번호</td>
				<td align="center" id="fontfamly">세탁기  상태</td>
			</tr>

			<%
				request.setCharacterEncoding("UTF-8");
				String ru_id = (String) session.getAttribute("id");

				try {
					Class.forName("com.mysql.jdbc.Driver");
					String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
					conn = DriverManager.getConnection(jdbcurl, "root", "root");
					stmt = conn.createStatement();

					String sql = "select * from washingmachine where w_dorm = '"
							+ dorm + "'";
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				while (rs.next()) {
			%>

			<tr>
				<td align="center" id="fontfamly"><%=rs.getString("w_id")%></td>
				<td align="center" id="fontfamly"><%=rs.getString("state")%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			stmt.close();
			conn.close();
		%>


	</div>
	
	
	<div id="jb-sidebarright">
		
		<form name="selection" action="/test3/reservation/reservation.jsp"
			method="post" onsubmit="javascript:return choose('check')">
			<div id="jb-sidebarpic">
			<img src="/test3/colorwashingmachine.jpg" alt="세탁기 선택" width="80"
				height="80" align="left"> 
					
				<h4 id="fontfamly" align="center">세탁기1</h4>
				</div>
				
				<div id="jb-sidebarradix">
				<input type="radio" name="check" value="1"  style= "margin-top:95px">
				</div>
			<input type="submit" value="확인" id="fontfamly" style= "margin-left:70px">
		
		</form>
		</div>

	
	
	<script type="text/javascript">
		function choose(check) {
			var radio = document.all(check);
			var ischecked = false;
			var i;
			if (radio.length == null) {
				ischecked = radio.checked;
			} else
				for (i = 0; i < radio.length; i++) {
					if (radio[i].checked) {
						ischecked = true;
						break;
					}
				}

			if (!ischecked) {
				alert("세탁기를 선택해주세요.");
				return false;
			}
		}
	</script>



</body>
</html>