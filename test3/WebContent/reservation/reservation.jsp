<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 정보 입력</title>
<style type="text/css" >


#fontfamily{
	fontfamily: HY엽서M;
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

table a:link {border-bottom: 1px dashed #ABA877;
color: #FB1B8B;}

table a:visited {border-bottom: 1px dashed #ABA877;
text-decoration: line-through;
color: #FB1B8B;}

table a:hover {border-bottom: 1px dashed #ABA877;
color: #FB1B8B;}

/* =head =foot
----------------------------------------------- */

thead th, tfoot th {border: 2px solid #ABA877;
text-align: left;
font-size: 1.2em;
font-weight: bold;
color:#ABA877;
background: transparent;}

tfoot td {border: 2px solid #FB1B8B;}

/* =body
----------------------------------------------- */
/*
tbody th, tbody td {vertical-align: top;
text-align: left;}

tbody th {white-space: nowrap;}

.odd {background: #fff;}

tbody tr:hover {background: #AFC1F7;}*//*<---------------if you move to cursor on this table, the color will be changed*/


#jb-header {
	width: 270px;
	float: top;
	margin-left:10px;
}

#jb-sidebarleft {
	width: 270px;
	float: left;
	margin-bottom: 10px;
		margin-left:10px;
	/*border: 1px solid #fff;*/
}

#jb-sidebarbottom {
	width: 270px;
	float: bottom;

/*border: 1px solid #fff;*/
}



</style>
</head>
<body style="background-color:#9BBAD8" >
	
	<h2 id="fontfamily">
		<%
			out.print((String) session.getAttribute("dorm"));	%>
	</h2>
	<input type="button" id="fontfamily" onclick="window.location='/test3/main.jsp'" align="left" value="메인화면" style="margin-left:200px">
	
	<div id="jb-header">
	<h4 id="fontfamily" align="center">
	<%	out.print(request.getParameter("check")+"번 세탁기 예약하기"); %>
	</h4>
		<img src="/test3/colorwashingmachine.jpg" width="200" height="200"
			style="align:center; margin-left: 20px">
	</div>

	<%
		Calendar today = Calendar.getInstance();
	%>
	<div id="jb-sidebarleft">

	<form name="selection" action="/test3/reservation/save.jsp" method="post"
		onsubmit="javascript:return dontsubmit(this)">
		<!--  <fieldset id="regbox" style="width:300; height:100">-->

			<p id="fontfamily">예약 날짜</p>
			<select id="fontfamily" name="year" style="align:left" onchange="constratints(form)" >
				<%
					String inDate= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
					int year = Integer.parseInt(inDate);
					for(int i =year; i<=year+1;i++){
				%>
				<option  id="fontfamily" value="<%=i%> " ><%=i%>년</option>
				<%}%>
			</select> 
			<select id="fontfamily" name="month" style="align:left"  onchange="constratints(form)">
				<option value=99>월</option>
				<%
					for (int i = 1; i <= 12; i++) {
				%>
				<option id="fontfamily" value="<%=i%>"><%=i%> 월
				</option>
				<%
					}
				%>
			</select> 
			<select id="fontfamily" name="day" style="align:left"  onchange="constratints(form)">
				<option value=99>일</option>
				<%
					for(int i= 1; i<=31; i++) {
					%>
						<option id="fontfamily" value="<%=i%>"><%=i%> 일
						</option><%
					}
				%>
			</select>

			<p id="fontfamily">시작 시간</p>
			<select  id="fontfamily"name="start_time_h" onchange="constratints(form)">
				<option  id="fontfamily"value=99>시</option>
				<%
					for (int i = 0; i <= 23; i++) {
				%>
				<option  id="fontfamily"value="<%=i%>"><%=i%> 시
				</option>
				<%
					}
				%>
			</select> <select id="fontfamily" name="start_time_m" onchange="constratints(form)">
				<option  id="fontfamily" value=99>분</option>
				<option  id="fontfamily" value="0"><%="00"%> 분
				</option>
				<%
				for (int i = 1; i <= 59; i++) {// for (int i = 10; i <= 59; i = i + 10)
				%>
				<option id="fontfamily" value="<%=i%>"><%=i%> 분
				</option>
				<%
					}
				%>
			</select>

			<p id="fontfamily">종료 시간</p>
			<select name="end_time_h" onchange="constratints(form)">
				<option id="fontfamily" value=99>시</option>
				<%
					for (int i = 0; i <= 23; i++) {
				%>
				<option  id="fontfamily" value="<%=i%>"><%=i%> 시
				</option>
				<%
					}
				%>
			</select> <select id="fontfamily" name="end_time_m" onchange="constratints(form)" style="margin-right: 80px">
				<option id="fontfamily" value=99>분</option>
				<option id="fontfamily" value="0"><%="00"%> 분
				</option>
				<%
				for(int i = 1; i <= 59; i++) { //for(int i = 10; i <= 59; i = i + 10)
				%>
				<option  id="fontfamily" value="<%=i%>"><%=i%> 분
				</option>
				<%
					}
				%>
			</select> <input id="fontfamily" type="hidden" name="machine_num" value="<%=request.getParameter("check")%>"
				align="left"> <input  id="fontfamily" type="submit" value="예약" align ="right">
		<!--  </fieldset>-->

	</form>
	</div>
	
	<div id="jb-sidebarbottom">
	<p id ="fontfamily" style= "margin-left:10px">예약 목록</p>
		<table border="2" align="center">
			<tr>
				<td id="fontfamily"align="center">예약 날짜</td>
				<td id="fontfamily"align="center">시작 시간</td>
				<td id="fontfamily" align="center">종료 시간</td>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				request.setCharacterEncoding("UTF-8");
				int rw_id = Integer.parseInt(request.getParameter("check"));
				String dorm = (String) session.getAttribute("dorm");
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
				<td id="fontfamily"align="center"><%=rs.getString("r_date")%></td>
				<td id="fontfamily" align="center"><%=rs.getString("start_time")%></td>
				<td id="fontfamily"align="center"><%=rs.getString("end_time")%></td>
			</tr>
			<%
				}
			%>

			<%
				stmt.close();
				conn.close();
			%>
		</table>
	</div>

	<script type="text/javascript">
		function constratints(form) {
			var year = parseInt(form.year.options[form.year.selectedIndex].value);
			var day = form.day.options[form.day.selectedIndex].value;
			var month = form.month.options[form.month.selectedIndex].value;
			var hour_s = parseInt(form.start_time_h.options[form.start_time_h.selectedIndex].value);
			var minute_s = parseInt(form.start_time_m.options[form.start_time_m.selectedIndex].value);

			var hour_e = parseInt(form.end_time_h.options[form.end_time_h.selectedIndex].value);
			var minute_e = parseInt(form.end_time_m.options[form.end_time_m.selectedIndex].value);
			var date = new Date();
			var hour_s_2 = hour_s + 2;

			if ((year<=date.getFullYear())&&(month < date.getMonth() + 1) && (month != 99)) {
				alert("잘못된 날짜 선택입니다." + (date.getMonth() + 1)
						+ "월 이후로 선택해주세요");
			} else if ((year<=date.getFullYear())&&(month == date.getMonth() + 1)
					&& (day < date.getDate()) && (day != 99) && (month != 99))
				alert("잘못된 날짜 선택입니다." + (date.getMonth() + 1) + "월"
						+ (date.getDate()) + "일 이후로 선택해주세요");

			else if ((year<=date.getFullYear())&&(month == date.getMonth() + 1)
					&& (day == date.getDate()) && (hour_s < hours_s.getHours())
					&& (day != 99) && (month != 99) && (hour_s != 99))
				alert("잘못된 날짜 선택입니다." + (date.getMonth() + 1) + "월"
						+ date.getDate() + "일" + date.getHours() + "시 "
						+ date.getMinutes() + "분 이후로 선택해주세요.");

			else if ((year<=date.getFullYear())&&(month == date.getMonth() + 1)
					&& (day == date.getDate())
					&& (hour_s <= date.getHours())
					&& (minute_s <= date.getMinutes()) && (day != 99)
					&& (month != 99) && (hour_s != 99) && (minute_s != 99))
				alert("잘못된 날짜 선택입니다." + (date.getMonth() + 1) + "월"
						+ date.getDate() + "일" + date.getHours() + "시 "
						+ date.getMinutes() + "분 이후로 선택해주세요.");

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
			var date = new Date();
			var hour_s_2 = hour_s + 2;		
		
			if ((year==date.getFullYear()&&(month < date.getMonth() + 1) && (month != 99))
					||((month == date.getMonth() + 1) && (day < date.getDate())
							&& (day != 99) && (month != 99)&&(year==date.getFullYear()))
			
					||((month == date.getMonth() + 1)
							&& (day == date.getDate())
							&& (hour_s < date.getHours()) && (hour_s != 99)&&(date==years.getFullYear()))

					||((month == date.getMonth() + 1)
							&& (day == date.getDate()) && (day != 99)
							&& (hour_s == date.getHours())
							&& (minute_s <= date.getMinutes())
							&& (day != 99) && (month != 99) && (minute_s != 99) && (hour_s != 99)&&(date==years.getFullYear()))

					||(((hour_e < hour_s) || (hour_e - hour_s > 2))
							&& (day != 99) && (month != 99) && (hour_s != 99)
							&& (minute_s != 99) && (hour_e != 99)&&(year==date.getFullYear()))
					||((minute_s != 99) &&(year==date.getFullYear())&& (hour_s != 99) && (hour_e == hour_s_2)&& (minute_e > minute_s) && (hour_e != 99) && (minute_e != 99))
					|| ((month == 99) || (day == 99) || (hour_s == 99)|| (hour_e == 99) || (minute_s == 99) || (minute_e == 99))
					||(((month==4)||(month==6)||(month==9)||(month==11))&& (day==31) && (day != 99) && (month != 99))
					||((((year%4!=0)&&(day==29))||(year%4==0))&&(month==2)&&((day==30)||(day==31))&&(day!=99)&&(month!=99))){
				window.alert('예약 정보가 맞지 않습니다.');
				return false;
			}	
		}
	</script>

<script type="text/javascript">

jQuery(document).ready(function(){
    
    var select = $("select#color");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
});

</script>
	

</body>
</html>