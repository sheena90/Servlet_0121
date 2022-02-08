<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022-02 달력</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
	<%
		Calendar today = Calendar.getInstance();
	
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
		String dateString = formatter1.format(today.getTime());
	
	
	%>
		<h2 class="text-center"><%=dateString %></h2>
		<table class="table">
			<thead>
				<tr class="text-center">
					<th class="text-danger">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
<%
		// 1. 오늘 날짜기준으로 1일 만들기
		today.add(Calendar.DATE, -(today.get(Calendar.DATE)) + 1);

		// 2. 오늘이 무슨 요일인지(일요일:1, 토요일:7)
		int dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
		out.print(dayOfWeek);
			
		// 3. 이 달의 마지막 날(몇일인지)
		int lastDate = today.getActualMaximum(Calendar.DATE);
		out.print(lastDate);
		
		// 4. 날짜만 출력
		SimpleDateFormat formatter2 = new SimpleDateFormat("d");
		
		
		
		
		
		for(int i = 1; i <= lastDate + dayOfWeek; i++) { // 5. 이 달의 날짜만큼 반복, 단 빈칸 출력도 반복 횟수에 포함되어 +dayOfWeek
		%> <tr> <%
			for(int j = 1; j <= 7; j++) { // 6. 한 줄에 7개씩 출력 커트
				if(today.get(Calendar.DATE) + 1 > lastDate){ // 7. 이 달의 마지막 날 이후 처리
				%>	
					<td class="text-center"><%=formatter2.format(today.getTime()) %></td>
					<%
					i = lastDate + dayOfWeek;
					break;
				}
				
				if (i < dayOfWeek){ // 8. 1일 이전 처리
				%>	
					<td class="text-center"><%="" %></td>
				<%
				} else {  // 9. 주석1에서 먼저 1일을 만들었기 때문에, 출력을 먼저하고 1씩 증가 처리
					%>	
					<td class="text-center"><%=formatter2.format(today.getTime()) %></td>
					<%
					today.add(Calendar.DATE, 1);
					}
					i++;
			}
		
			if(today.get(Calendar.DATE) < lastDate){ // 10. for문 안쪽에서 i++를 하고, 바깥쪽에서 i++를 해서 해당 처리
				i--;
			}	
			
		%> </tr> <%
		}

%>
 				 
 				 
 				
			</tbody>
		</table>
	</div>
</body>
</html>