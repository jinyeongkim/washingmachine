<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세탁기 선택하기</title>
</head>
<body>
<h2><%out.print((String)session.getAttribute("dorm")); %></h2>
<center>
<p align = "right"> 예약자 목록 </p>
<table border="2" align="right">
	<tr>
	<td align ="center"> 세탁기 번호</td>
	<td align ="center"> 예약 날짜</td>
		<td align ="center"> 예약 시작 시간</td>
		<td align ="center"> 예약 종료 시간</td>
		<td align ="center"> 기숙사</td>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
		String dorm = (String)session.getAttribute("dorm");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		out.print(dorm);
		
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl,"root","root");
		stmt = conn.createStatement();
		rs =stmt.executeQuery("select * from reservation where r_dorm ='"+dorm+"'");
		
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : "+e.getMessage());
		
		}
		
		if(rs!=null){
		while(rs.next()){	
			
		%>
		<tr>
			<td align = "center"><%=rs.getString("rw_id")%></td>
			<td align = "center"><%=rs.getString("r_date")%></td>	
			<td align = "center"><%= rs.getString("start_time") %> </td>
			<td align = "center"><%= rs.getString("end_time") %></td>
			<td align = "center"><%= rs.getString("r_dorm") %></td>
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
			</center>

<center >
<br><br><br><br><br><br>
	<p align = "right"> <%=(String)session.getAttribute("dorm") %> 세탁기 상태</p>
	<table border="2" align="right">
	<tr>
		<td align ="center"> 세탁기 번호</td>
		<td align ="center"> 세탁기 상태</td>
			</tr>
	<%	
	request.setCharacterEncoding("UTF-8");
	String ru_id = (String) session.getAttribute("id");
	
		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://210.115.48.111:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl,"root","root");
		stmt = conn.createStatement();
	
		String sql = "select * from washingmachine where w_dorm = '"+dorm+"'";
		rs = stmt.executeQuery(sql);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : "+e.getMessage());
		}
		while(rs.next()){		
		%>
		
		<tr>
			<td align = "center"><%= rs.getString("w_id")%></td>	
			<td align = "center"><%= rs.getString("state")%></td>
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
function choose(check){
	var radio = document.all(check);
	var ischecked=false;
	var i;
	if(radio.length==null){
		ischecked = radio.checked;
	}
	else
		for(i=0; i<radio.length; i++){
			if(radio[i].checked){
				ischecked = true;
				break;
			}
		}
	
	if(!ischecked){
		alert("세탁기를 선택해주세요.");
		return false;
	}
}

</script>


<form name = "selection" action="/test3/reservation/reservation.jsp" method= "post"   onsubmit="javascript:return choose('check')">

	<div align="left">	
	<img src="/test3/washingmachine.png" alt="예약목록"width="150" height="150" align="top" > 
	<input type = "radio" name = "check" value ="1"align="left" >
	<p>세탁기1 </p>
	</div>
	
<div> <input type = "submit" value = "확인" align = "right" > </div>
</form>

</body>
</html>