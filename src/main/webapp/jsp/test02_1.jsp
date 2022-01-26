<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 시간 출력</title>
</head>
<body>
	<%
		Date now = new Date();	

		// 파라미터로 보고 싶은것이 시간인지 날짜인지를 알려줘
		// type = date 날짜 보여주기
		// type = time 시간 보여주기
		String dateString = null;
		
		if(request.getParameter("type").equals("date")) {
			SimpleDateFormat formatter = new SimpleDateFormat("오늘 날짜 yyyy년 MM월 dd일");
			dateString = formatter.format(now);
		} else if(request.getParameter("type").equals("time")) {
			SimpleDateFormat formatter = new SimpleDateFormat("현재시간 HH시 mm분 ss초");
			dateString = formatter.format(now);
		}
	%>

	<%=dateString %>


</body>
</html>