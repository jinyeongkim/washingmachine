<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약||취소하기</title>
<style>
/* Greyscale
Table Design by Scott Boyle, Two Plus Four
www.twoplusfour.co.uk
----------------------------------------------- */
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

#jb-sidebarleft {
	width: 120px;
	padding: 10px;
	float: left;
}

#jb-header {
	width: 310px;
	height:30px;
	float: top;
}


#jb-sidebarbutton {
	width: 160px;
	height: 325px;
	float: left;

}

#jb-db {
	width: 310px;
	float:bottom;
}
</style>
</head>


<body style="background-color: #9BBAD8">
	<script type="text/javascript">
		function constraint_count() {
		<%Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			request.setCharacterEncoding("UTF-8");
			String id = (String) session.getAttribute("id");
			String dorm = (String) session.getAttribute("dorm");

			try {
				Class.forName("com.mysql.jdbc.Driver");
				String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
				conn = DriverManager.getConnection(jdbcurl, "root", "root");
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select balance from user where u_id ='"+ id + "'");
			} catch (Exception e) {
				out.println("DB 연동 오류입니다. : " + e.getMessage());
			}
			rs.next();
			int balance = rs.getInt(1);
			if ( balance== 0) {%>
				alert("잔액이 부족합니다. 새 카드를 구매하시길 바랍니다.");<%}
			
			else if(balance!=0){
				rs = stmt.executeQuery("select count(*) from reservation where ru_id ='"+ id + "'");
				rs.next();
				if (rs.getInt(1) == 0) {
					if (dorm.equals("women")) {%>
						location.href = '/test3/dormitory/w_selecting_machine.jsp';
				<%} else if (dorm.equals("men")) {%>
						location.href = '/test3/dormitory/m_selecting_machine.jsp';
	<%}
			  }else if (rs.getInt(1) != 0) {%>
					alert("이미 예약 내역이 있습니다.다른 예약을 원하신다면 예약 취소 후에 이용해주시길 바랍니다.");
	<%}}

			

			stmt.close();
			conn.close();%>
		}
	</script>
	<div id="jb-header">
			<input type="button" onclick="logout()" id="fontfamily" value="로그아웃"
				align="left" style="margin-left: 10px;margin-right: 20px">
			<input type="button"
				onclick="window.location='/test3/state/list.jsp'" value="예약자 목록보기"
				align="right" id="fontfamily" style="margin-left: 10px;margin-right: 20px">
				<input type="button"
				onclick="balance()" value="잔액조회"
				align="right" id="fontfamily">
	</div>
	<script type="text/javascript">
		function balance(){
			alert("잔액은 "+<%=balance%>+"입니다.");			
		}
	
	</script>


	<div id="jb-sidebarleft" align="left">
		<img src="/test3/colorwashingmachine.jpg" alt="예약하기" width="100"
			height="100" align="top"> 
		
		<img src="/test3/colorwashingmachine.jpg"
			alt="취소하기" width="100" height="100" align="middle"> 
		
		<img
			src="/test3/colorwashingmachine.jpg" alt="세탁기 상태" width="100" height="100"
			align="bottom">
	</div>
	
	
	<div id="jb-sidebarbutton">
		<input type="button" onclick="constraint_count()" value="예약하기"
			id="fontfamily" align="top"  style="padding:3px; margin-top:40px; margin-left:20px">

		<input type="button"
			onclick="window.location='/test3/cancel/cancel.jsp'" id="fontfamily"
			value="예약취소하기" align="top" style="padding:3px; margin-top:80px; margin-left:20px">

		<input type="button" id="fontfamily"
			onclick="window.location='/test3/state/state.jsp'" value="세탁기 상태"
			align="top" style="padding:3px; margin-top:80px; margin-left:20px">
	</div>



	<div id="jb-db">
	<p  id="fontfamily" align="center" >나의 예약정보</p>
	<table border="2" align="center">
		<tr>
			<td align="center" id="fontfamily">세탁기 번호</td>
			<td align="center" id="fontfamily" >예약날짜</td>
			<td align="center" id="fontfamily" >시작시간</td>
			<td align="center" id="fontfamily" >종료시간</td>
			<td align="center" id="fontfamily" >잔액</td>
		</tr>
		<%
					request.setCharacterEncoding("UTF-8");
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
						conn = DriverManager.getConnection(jdbcurl, "root", "root");
						stmt = conn.createStatement();

						String sql = "select * from reservation where r_dorm = '"
								+ dorm + "' and ru_id= '" + id + "'";
						rs = stmt.executeQuery(sql);
					} catch (Exception e) {
						out.println("DB 연동 오류입니다. : " + e.getMessage());
					}
					while (rs.next()) {
				%>
		<tr>
			<td align="center" id="fontfamily" style="font-size:12px; width:40px"><%=rs.getString("rw_id")%></td>
			<td align="center" id="fontfamily" style="font-size:11px; width:50px"><%=rs.getString("r_date")%></td>
			<td align="center" id="fontfamily" style="font-size:11px; width:50px"><%=rs.getString("start_time")%></td>
			<td align="center" id="fontfamily" style="font-size:11px; width:50px"><%=rs.getString("end_time")%></td>
			<td align="center" id="fontfamily" style="font-size:11px; width:30px"><%=balance%></td>
		</tr>
		<%
					}
				%>
				
	</table>
	</div>
	
	<%
			String inDate   = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			String inTime  = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement("delete from reservation where end_time< ? and r_date <=?");
			pstmt.setString(1,inTime);
			pstmt.setString(2,inDate);
				
			pstmt.executeUpdate();
			pstmt.close();
			
			stmt.close();
			conn.close();
			%>
	
	
	<script type="text/javascript">
		function logout() {
			var result = confirm("로그아웃 하시겠습니까?");
			if (result == true) {
				location.href = '/test3/logout/logout.jsp';
			} else {
				location.relode();
			}
		}
	</script>



</body>
</html>