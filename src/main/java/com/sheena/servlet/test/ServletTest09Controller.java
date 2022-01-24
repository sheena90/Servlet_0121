package com.sheena.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test09")
public class ServletTest09Controller extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 앞으로 주석 부분은 filter했기 때문에 앞으로 쓰지 않아도 됨
		// request.setCharacterEncoding("utf-8");
		// response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 입사지원 - 지원결과
		String name = request.getParameter("name");
		String introduction = request.getParameter("introduction");
		
		out.println("<html><head><title>지원결과</title></head>");
		out.println("<body>");
		out.println("<h2>" + name + "님 지원이 완료 되었습니다.</h2><hr>");
		out.println("<p>지원내용</p>" + introduction);
		
		out.println("</body></html>");
		
		
		
	}

}
