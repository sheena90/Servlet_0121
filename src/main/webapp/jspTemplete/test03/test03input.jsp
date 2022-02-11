<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sheena.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물건 올리기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<style>
		.wrap {width:800PX; margin:auto;}
		header {height:80px; background-color:#FF7F50;}
		nav {height:40px; background-color:#FF7F50;}
		footer {height:30px;}
		
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
			<div class="p-5">
				<div class="mb-4">
					<h3>물건 올리기</h3>
				</div>
				<form method="post" action="/jspTemplete/test03_insert">
					<div class="d-flex">
						<div class="col-3">
							<select class="form-control" name="newSellerId" id="id">
								<option selected>-아이디 선택-</option>
								<% while(resultSet.next()) {  %>
								<option><%=resultSet.getString("nickname") %></option>
								<% } %>
							</select>
						</div>
						<div class="col-6">
							<input type="text" placeholder="제목" name="newTitle" class="form-control" id="title">
						</div>
						<div class="input-group col-3">
							<input type="text" placeholder="가격" name="newPrice" class="form-control" id="price">
							<label>원</label>
						</div>
					</div>			
					<div>
						<textarea rows="5" cols="100" name="newDescription" class="form-control mt-3" id="description">상품설명</textarea>
					</div>
					<div class="input-group mt-3">
						<label id="image">이미지url</label>
						<input type="text" name="newUrl" class="form-control">
					</div>
					<div>
						<button type="submit" class="btn btn-light mt-3 form-control" id="save">저장</button>
					</div>
				</form>
			</div>
		</section>

		<jsp:include page="test03footer.jsp"/>
	
	</div>

</body>
<script>
	$(document).ready(function() {
		$("#save").on("click",function() {
			let id = $("#id").val();
			let title = $("#title").val();
			let price = $("#price").val();
			
			if(id == " ") {
				alert("아이디를 입력하세요.")
				return;
			}
			
			if(title == " ") {
				alert("제목을 입력하세요.")
				return;
			}
			
			if(price == " ") {
				alert("가격을 입력하세요.")
				return;
			}
			
			
		});
	});
</script>


</html>