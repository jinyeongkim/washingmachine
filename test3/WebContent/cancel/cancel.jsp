<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import = "java.sql.*" %>
      <%@page import = "java.util.*"%>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body style="background-color:#CEE3F6">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ϱ�</title>
</head>
<body>
<center>
	<p align = "right"> ���� ��������</p>
	<table border="2" align="right">
	<tr>
		<td align ="center"> ��Ź�� ��ȣ</td>
			<td align ="center"> ���� ��¥</td>
		<td align ="center"> ���� ���� �ð�</td>
		<td align ="center"> ���� ���� �ð�</td>
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
			out.println("DB ���� �����Դϴ�. : "+e.getMessage());
		}
		while(rs.next()){		
		%>
		<tr>
		<td align = "center"><%= rs.getString("rw_id")%></td>
		<td align = "center"><%= rs.getString("r_date")%></td>	
			<td align = "center"><%= rs.getString("start_time")%></td>
			<td align = "center"><%= rs.getString("end_time")%></td>
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
function confirms(){
	if(confirm("���� �����Ͻðڽ��ϱ�??")==true){
		<%
		Connection con = null;
		PreparedStatement pstmt = null;
		request.setCharacterEncoding("UTF-8");

		String dorm = (String)session.getAttribute("dorm");
		String id = (String)session.getAttribute("id");


		try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/washingmachine?useUnicode=true&characterEncoding=utf8";
		con = DriverManager.getConnection(jdbcurl,"root","root");
		pstmt = con.prepareStatement("delete from reservation where ru_id = '"+id+"'");
		pstmt.executeUpdate();
		}
		catch(Exception e){ 
			out.println("DB ���� �����Դϴ�. : "+e.getMessage());	
		}
			
			con.close();
			
			%>
		alert("��Ұ� �Ϸ�Ǿ����ϴ�.");
		location.href='/test3/main.jsp';
	
	}else{
		return;
	}
}

</script>
<input type = "button" onclick="confirms()" value = "��������ϱ�" >

</body>
</html>