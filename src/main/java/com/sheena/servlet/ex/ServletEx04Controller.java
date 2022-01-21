package com.sheena.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex04")
public class ServletEx04Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 이름, 생년월일 파라미터로 전달 받고 출력
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		
		out.println("<html><head><title>정보출력</title></head>");
		out.println("<body>");
		out.println("<h2>이름 : " + name + "</h2>");
		out.println("<h2>생년월일 : " + birth + "</h2>");
		
		out.println("</body></html>");
	}

}
