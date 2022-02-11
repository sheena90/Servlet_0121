<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sheena.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HONG당무 마켓</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<style>
		.wrap {width:800PX; margin:auto;}
		header {height:80px; background-color:#FF7F50;}
		nav {height:40px; background-color:#FF7F50;}
		section > .main-content > .content {border-style:solid; border-color:#FF7F50; border-width:2px;}
		section > .main-content > .content > .imgNull-size {width:240px; height:150px;}
		section > .main-content > .content > .nickname {color:#FF7F50;}
		footer {height:30px;}
		.content:hover {background-color:#FDF5E6;}
		
	</style>
</head>
<body>

	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String joinQuery = "SELECT seller.*, used_goods.* FROM `seller` JOIN `used_goods` ON seller.id = used_goods.sellerId ORDER BY used_goods.id DESC";
		ResultSet resultSet = mysqlService.select(joinQuery);
	
	%>
	<div class="wrap">
		<jsp:include page="test03header.jsp"/>
		
		<jsp:include page="test03menu.jsp"/>
		
		<section>
			<div class="main-content d-flex flex-wrap justify-content-between">
				<% while(resultSet.next()) { %>
				<div class="content p-2 mt-3">
					<% 
						if(resultSet.getString("picture") != null) {
					%>
						<div>
							<img width="240" height="150" src="<%=resultSet.getString("picture") %>">
						</div>
					<% } else { %>
						<div  class="imgNull-size d-flex justify-content-center align-items-center">
							<div class=" text-secondary font-weight-bold">이미지 없음</div>
						</div>
						<% } %>
					<div class="font-weight-bold mt-1">
						<%=resultSet.getString("title") %>
					</div>
					<div class="mt-1">
						<%=resultSet.getString("price")%>원
					</div>
					<div class="nickname mt-1">
						<%=resultSet.getString("nickname") %>
					</div>			
				</div>
			
				<% } %>

			</div>
		</section>

		<jsp:include page="test03footer.jsp"/>
	
	</div>
	
	
	
	
	

</body>
</html>