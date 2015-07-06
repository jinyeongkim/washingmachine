<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약||취소하기</title>
</head>
<body>
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
				rs = stmt
						.executeQuery("select count(*) from reservation where ru_id ='"
								+ id + "'");
			} catch (Exception e) {
				out.println("DB 연동 오류입니다. : " + e.getMessage());
			}
			rs.next();
			if (rs.getInt(1) == 0) {
				if (dorm.equals("예지원")) {%>
		location.href = '/test3/dormitory/yejiwon_selecting_machine.jsp';
	<%} else if (dorm.equals("의암관")) {%>
		location.href = '/test3/dormitory/uiamgwan_selecting_machine.jsp';
	<%} else if (dorm.equals("한서관")) {%>
		location.href = '/test3/dormitory/hanseogwan_selecting_machine.jsp';
	<%} else if (dorm.equals("율곡관")) {%>
		location.href = '/test3/dormitory/yulgokgwan_selecting_machine.jsp';
	<%}
			} else if (rs.getInt(1) != 0) {%>
		alert("이미 예약 내역이 있습니다.다른 예약을 원하신다면 예약 취소 후에 이용해주시길 바랍니다.");
	<%}

			stmt.close();
			conn.close();%>
		}
	</script>
	<div align="center">
		<div align="left">
			<input type="button" onclick="logout()" value="로그아웃" align="left">
		</div>
		<div align="right">
			<input type="button"
				onclick="window.location='/test3/state/list.jsp'" value="예약자 목록보기"
				align="right">
		</div>
	</div>

	<center>
		<div align="left">
			<img src="/test3/washingmachine.png" alt="예약하기" width="150"
				height="150" align="top"> <input type="button"
				onclick="constraint_count()" value="예약하기" align="left">

		</div>

		<div align="left">
			<img src="/test3/washingmachine.png" alt="" width="150" height="150"
				align="top"> <input type="button"
				onclick="window.location='/test3/cancel/cancel.jsp'" value="예약취소하기"
				align="left">

		</div>

		<div align="left">
			<img src="/test3/colorwashingmachine.jpg" alt="" width="150"
				height="150" align="top"> <input type="button"
				onclick="window.location='/test3/state/state.jsp'" value="세탁기 상태"
				align="left">
		</div>

		<center>
			<p align="right">나의 예약정보</p>
			<table border="2" align="right">
				<tr>
					<td align="center">세탁기 번호</td>
					<td align="center">예약 날짜</td>
					<td align="center">예약 시작 시간</td>
					<td align="center">예약 종료 시간</td>
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
					<td align="center"><%=rs.getString("rw_id")%></td>
					<td align="center"><%=rs.getString("r_date")%></td>
					<td align="center"><%=rs.getString("start_time")%></td>
					<td align="center"><%=rs.getString("end_time")%></td>
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
	</center>


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