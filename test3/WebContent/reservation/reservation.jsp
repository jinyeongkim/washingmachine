<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 정보 입력</title>

</head>
<body style="background-color:#CEE3F6">

	<h2>
		<%
			out.print((String) session.getAttribute("dorm"));	%>
	</h2>
	<h4>
	<%	out.print(request.getParameter("check")+"번 세탁기 예약하기"); %>
	</h4>

	<div>
		<img src="/test3/colorwashingmachine.jpg" width="150" height="150"
			align="top">
	</div>

	<center>
		<table border="2" align="right">
			<tr>
				<td align="center">예약 날짜</td>
				<td align="center">예약 시작 시간</td>
				<td align="center">예약 종료 시간</td>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				request.setCharacterEncoding("UTF-8");
				int rw_id = Integer.parseInt(request.getParameter("check"));
				String dorm = (String) session.getAttribute("dorm");
				out.print(rw_id + "번 세탁기 예약하기");
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
					conn = DriverManager.getConnection(jdbcurl, "root", "root");
					stmt = conn.createStatement();
					String sql = "select * from reservation where rw_id = '"
							+ rw_id + "' and r_dorm = '" + dorm + "'";
					
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				while (rs.next()) {
			%>
			<tr>
				<td align="center"><%=rs.getString("r_date")%></td>
				<td align="center"><%=rs.getString("start_time")%></td>
				<td align="center"><%=rs.getString("end_time")%></td>
			</tr>
			<%
				}
			%>

			<%
				stmt.close();
				conn.close();
			%>
		</table>
	</center>

	<script type="text/javascript">
		function constratints(form) {
			var year = parseInt(form.year.options[form.year.selectedIndex].value);
			var day = form.day.options[form.day.selectedIndex].value;
			var month = form.month.options[form.month.selectedIndex].value;
			var hour_s = parseInt(form.start_time_h.options[form.start_time_h.selectedIndex].value);
			var minute_s = parseInt(form.start_time_m.options[form.start_time_m.selectedIndex].value);

			var hour_e = parseInt(form.end_time_h.options[form.end_time_h.selectedIndex].value);
			var minute_e = parseInt(form.end_time_m.options[form.end_time_m.selectedIndex].value);
			var years = new Date();
			var months = new Date();
			var days = new Date();
			var hours_s = new Date();
			var minutes_s = new Date();

			var hour_s_2 = hour_s + 2;

			if ((year<=years.getFullYear())&&(month < months.getMonth() + 1) && (month != 99)) {
				alert("잘못된 날짜 선택입니다." + (months.getMonth() + 1)
						+ "월 이후로 선택해주세요");
			} else if ((year<=years.getFullYear())&&(month == months.getMonth() + 1)
					&& (day < days.getDate()) && (day != 99) && (month != 99))
				alert("잘못된 날짜 선택입니다." + (months.getMonth() + 1) + "월"
						+ (days.getDate()) + "일 이후로 선택해주세요");

			else if ((year<=years.getFullYear())&&(month == months.getMonth() + 1)
					&& (day == days.getDate()) && (hour_s < hours_s.getHours())
					&& (day != 99) && (month != 99) && (hour_s != 99))
				alert("잘못된 날짜 선택입니다." + (months.getMonth() + 1) + "월"
						+ days.getDate() + "일" + hours_s.getHours() + "시 "
						+ minutes_s.getMinutes() + "분 이후로 선택해주세요.");

			else if ((year<=years.getFullYear())&&(month == months.getMonth() + 1)
					&& (day == days.getDate())
					&& (hour_s <= hours_s.getHours())
					&& (minute_s <= minutes_s.getMinutes()) && (day != 99)
					&& (month != 99) && (hour_s != 99) && (minute_s != 99))
				alert("잘못된 날짜 선택입니다." + (months.getMonth() + 1) + "월"
						+ days.getDate() + "일" + hours_s.getHours() + "시 "
						+ minutes_s.getMinutes() + "분 이후로 선택해주세요.");

			else if (((hour_e < hour_s) || (hour_e - hour_s > 2))
					&& (day != 99) && (month != 99) && (hour_s != 99)
					&& (minute_s != 99) && (hour_e != 99))
				alert("예약은 최대 2시간 동안 가능합니다. " + hour_s + "시~" + hour_s_2
						+ "시 사이에서 선택해주세요.");

			else if ((minute_s != 99) && (hour_s != 99) && (hour_e == hour_s_2)
					&& (minute_e > minute_s) && (hour_e != 99)
					&& (minute_e != 99))
				alert("예약은 최대 2시간 동안 가능합니다. " + hour_s + "시~" + minute_s
						+ "분 ~ " + hour_s_2 + "시" + minute_s + "분 사이에서 선택해주세요.");
			else if(((month==4)||(month==6)||(month==9)||(month==11))
					&& (day==31) && (day != 99) && (month != 99))
				alert(month+"월 "+day+"일은 없는 날짜입니다.");
			else if((((year%4!=0)&&(day==29))||(year%4==0))&&(month==2)&&((day==30)||(day==31))&&(day!=99)&&(month!=99))
				alert(month+"월 "+day+"일은 없는 날짜입니다.");
		}
	</script>

	<script type="text/javascript">
		function dontsubmit(form) {
			var year = form.year.options[form.year.selectedIndex].value;
			var month = form.month.options[form.month.selectedIndex].value;
			var day = form.day.options[form.day.selectedIndex].value;

			var hour_s = parseInt(form.start_time_h.options[form.start_time_h.selectedIndex].value);
			var minute_s = parseInt(form.start_time_m.options[form.start_time_m.selectedIndex].value);

			var hour_e = parseInt(form.end_time_h.options[form.end_time_h.selectedIndex].value);
			var minute_e = parseInt(form.end_time_m.options[form.end_time_m.selectedIndex].value);
			var years = new Date();
			var months = new Date();
			var days = new Date();
			var hours_s = new Date();
			var minutes_s = new Date();

			var hour_s_2 = hour_s + 2;		
		
			if ((year==years.getFullYear()&&(month < months.getMonth() + 1) && (month != 99))
					||((month == months.getMonth() + 1) && (day < days.getDate())
							&& (day != 99) && (month != 99)&&(year==years.getFullYear()))
			
					||((month == months.getMonth() + 1)
							&& (day == days.getDate())
							&& (hour_s < hours_s.getHours()) && (hour_s != 99)&&(year==years.getFullYear()))

					||((month == months.getMonth() + 1)
							&& (day == days.getDate()) && (day != 99)
							&& (hour_s == hours_s.getHours())
							&& (minute_s <= minutes_s.getMinutes())
							&& (day != 99) && (month != 99) && (minute_s != 99) && (hour_s != 99)&&(year==years.getFullYear()))

					||(((hour_e < hour_s) || (hour_e - hour_s > 2))
							&& (day != 99) && (month != 99) && (hour_s != 99)
							&& (minute_s != 99) && (hour_e != 99)&&(year==years.getFullYear()))
					||((minute_s != 99) &&(year==years.getFullYear())&& (hour_s != 99) && (hour_e == hour_s_2)&& (minute_e > minute_s) && (hour_e != 99) && (minute_e != 99))
					|| ((month == 99) || (day == 99) || (hour_s == 99)|| (hour_e == 99) || (minute_s == 99) || (minute_e == 99))
					||(((month==4)||(month==6)||(month==9)||(month==11))&& (day==31) && (day != 99) && (month != 99))
					||((((year%4!=0)&&(day==29))||(year%4==0))&&(month==2)&&((day==30)||(day==31))&&(day!=99)&&(month!=99))){
				window.alert('예약 정보가 맞지 않습니다.');
				return false;
			}	
		}
	</script>
	
	<%
		Calendar today = Calendar.getInstance();
	%>
	

	<form name="selection" action="/test3/reservation/save.jsp" method="post"
		onsubmit="javascript:return dontsubmit(this)">
		<fieldset id="regbox" style="width: 100">

			<p>예약 날짜</p>
			<select name="year" onchange="constratints(form)">
				<%
					String inDate= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
					int year = Integer.parseInt(inDate);
					for(int i =year; i<=year+1;i++){
				%>
				<option value="<%=i%> " ><%=i%>년</option>
				<%}%>
			</select> <select name="month" onchange="constratints(form)">
				<option value=99>월</option>
				<%
					for (int i = 1; i <= 12; i++) {
				%>
				<option value="<%=i%>"><%=i%> 월
				</option>
				<%
					}
				%>
			</select> <select name="day" onchange="constratints(form)">
				<option value=99>일</option>
				<%
					for (int i = 1; i <= 31; i++) {
				%>
				<option value="<%=i%>"><%=i%> 일
				</option>
				<%
					}
				%>
			</select>

			<p>예약시작</p>
			<select name="start_time_h" onchange="constratints(form)">
				<option value=99>시</option>
				<%
					for (int i = 0; i <= 23; i++) {
				%>
				<option value="<%=i%>"><%=i%> 시
				</option>
				<%
					}
				%>
			</select> <select name="start_time_m" onchange="constratints(form)">
				<option value=99>분</option>
				<option value="0"><%="00"%> 분
				</option>
				<%
				for (int i = 1; i <= 59; i++) {// for (int i = 10; i <= 59; i = i + 10)
				%>
				<option value="<%=i%>"><%=i%> 분
				</option>
				<%
					}
				%>
			</select>

			<p>예약 종료</p>
			<select name="end_time_h" onchange="constratints(form)">
				<option value=99>시</option>
				<%
					for (int i = 0; i <= 23; i++) {
				%>
				<option value="<%=i%>"><%=i%> 시
				</option>
				<%
					}
				%>
			</select> <select name="end_time_m" onchange="constratints(form)">
				<option value=99>분</option>
				<option value="0"><%="00"%> 분
				</option>
				<%
				for(int i = 1; i <= 59; i++) { //for(int i = 10; i <= 59; i = i + 10)
				%>
				<option value="<%=i%>"><%=i%> 분
				</option>
				<%
					}
				%>
			</select> <input type="hidden" name="machine_num" value="<%=request.getParameter("check")%>"
				align="left"> <input type="submit" value="예약">
		</fieldset>

	</form>
</body>
</html>