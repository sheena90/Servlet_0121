package com.sheena.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test03")
public class ServletTest03Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 뉴스 기사 출력
		Date time = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		out.println("<html><head><title>뉴스 기사 출력</title></head>");
		out.println("<body><h2>[단독]고양이가 야옹해</h2>");
		out.println("기사 입력시간 : " + formatter.format(time) + "<hr></hr>" );
		out.println("끝</body></html>" );
		
	}

}
