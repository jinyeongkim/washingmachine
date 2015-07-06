<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>세탁기 상태</title>
</head>
<style type="text/css">

</style>
<body>
	<h2>의암관</h2>
	
	
	
	
	<script>
		function changeImage(){
			document.getElementDyId("image").src = "colorwashingmachine.jpg";
		}
		function buttonClick(mouseEvent){
			
		}
		</script>
	
	
	<div align="left">	
	<button class="y_w1"  id="y_w1" type="submit" onclick="showTable()"><img src="washingmachine.png" alt="실패"
	width="150" height="150" align="top" > </button> 
	<p>세탁기1 </p>
	</div>
	
	<% %>
	
	
	
	
	
	

	<div align="left">
	<button class="y_w2" id="y_w2" type="submit"> <img src="washingmachine.png" alt="실패"
	width="150" height="150" align="middle"></button> 
	<p>세탁기2 </p>
	</div>
	
	
	<div align="left">
	<button class="y_w3" id="y_w3" type="submit"> <img src="washingmachine.png" alt="실패"
	width="150" height="150" align="bottom"></button>
	<p>세탁기3 </p>
	</div>
		
	
</body>
</html>