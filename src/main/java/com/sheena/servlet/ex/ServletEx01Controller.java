package com.sheena.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx01Controller extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		// 문서 타입 설정 (MIME)
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		Date now = new Date();
		out.println(now);
		
		// 자바 데이터 포맷 "yyyy-MM-dd a hh:mm:ss" 혹은 "yyyy-MM-dd HH:mm:ss"
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		String formatString = formatter.format(now);
		
		out.println(formatString);
	}

}
