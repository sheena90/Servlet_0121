<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기념일</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

<%--

<%

	Calendar today = Calendar.getInstance();
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
	String dateString = formatter.format(today.getTime()); 
%>
	
	<h4><%=dateString %>부터 1일</h4>
	<hr>
	

<%	for(int i = 1; i <= 10; i++) {
		today = Calendar.getInstance();
		
		today.add(Calendar.DATE, (i * 100 - 1)); 
%>
		<h3><%=i*100 %>일 : <span class="text-danger"><%=formatter.format(today.getTime()) %></span></h3>

    <% } %>

 --%> 


<%
	Calendar today = Calendar.getInstance();
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
	String dateString = formatter.format(today.getTime()); // 문자열로 변환하는 과정

%>
	<h4><%=dateString %>부터 1일</h4>
	<hr>
	

<%	for(int i = 1; i <= 10; i++) {
		if(i == 1) {
		
		today.add(Calendar.DATE, 99); 
%>
		<h3><%=i*100 %>일 : <span class="text-danger"><%=formatter.format(today.getTime()) %></span></h3>

    <% 
   	 	} else {
   	 		today.add(Calendar.DATE, 100);
    %>
		<h3><%=i*100 %>일 : <span class="text-danger"><%=formatter.format(today.getTime()) %></span></h3>

	<% 
		}
	}
	%>



</body>
</html>