<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트 요소</title>
</head>
<body>
	<%-- 1. 점수들의 평균 구하기 --%>
	<%
		int[] scores = {80, 90, 100, 95, 80};
		int sum = 0;
	    for(int i = 0; i < scores.length; i++) {
	    	sum += scores[i];
	    }
	    
	    double average = sum / (double)scores.length;
	%>
	
	<h4>점수 평균은 <%=average%> 입니다.</h4>


	<%-- 2. 채점 결과 --%>
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});

		int score = 0;
		for(int i = 0; i < scoreList.size(); i++) {
			if(scoreList.get(i).equals("O")) {
				score += 10;
			}
		}
	
	%>
	
	<h4>체점 결과는 <%=score%>점 입니다.</h4>
	
	
	<%-- 3. 1부터 n까지의 합계를 구하는 함수 --%>
	<%!
		public int allSum(int n) {
		 	int sum = 0;
			for (int i = 1; i <= n; i++) {
				sum += i;
			}
		return sum;
		}
	%>
	
	<h4>1에서 50까지의 합은 <%=allSum(50) %></h4>
	
	
	<%-- 4. 나이 구하기 --%>
	<%
		String birthDay = "20010820";
		
		String yearString = birthDay.substring(0,4);
		int year = Integer.parseInt(yearString);
		int age = 2022 - year + 1;
	%>

	<h4><%=birthDay%>의 나이는 <%=age %>살 입니다.</h4>


</body>
</html>