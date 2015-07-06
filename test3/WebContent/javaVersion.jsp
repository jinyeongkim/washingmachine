<%@ page language="java" contentType="text/html; charset=EUC-KR"
    import="java.io.*,java.sql.*,java.util.*,test3.*"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.item{
	white-space:nowrap;
    display:block;
    width:420px;
    height:30px;
    cursor: hand; 
}

.bitem{
	background-color: pink;
	white-space:nowrap;
    display:block;
    width:420px;
    height:30px;
}

.item div{
	display: inline;
list-style-type: none;
padding-right: 20px;
cursor: hand; 
}

.bitem div{
	display: inline;
list-style-type: none;
padding-right: 20px;
}
</style>
</head>
<body>
<div>
<%
//Do required initialization

	//Do required initialization
	CheckConnection manager = null;
	try {
		manager = new CheckConnection("jdbc:mysql://localhost:3306/washingmachine", "root", "root");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	Connection conn = manager.getConnection();

try {
	PreparedStatement stmt = conn.prepareStatement("select * from washingmachine where w_dorm = 'uiamgwan'");

	ResultSet set = stmt.executeQuery();
	while( set.next() ){
		
		String id = set.getString("w_id");
		String building= set.getString("w_dorm");
		String used = set.getString("is_using");
		String status = set.getString("broken");
		if( used.compareTo("Y") == 0 ){
			used = "사용중";
			%>
			 <div class="is_using"><%=used %></div><%
		}else{
			if( status.compareTo("Y") == 0 ){
				status = "수리중";%>
				<div class="bitem"><%=status %></div><%
			}
			else{ used = "사용가능";
			%>
			 <div class="item"><%=used %></div><%
			}
		}
		%>
		<div class="w_dorm"><%=building %></div>
		<div class="w_id"><%=id %></div>
		</div>
		<br>
		<br>		
		<%
	}
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
%> 
</body>
</html>