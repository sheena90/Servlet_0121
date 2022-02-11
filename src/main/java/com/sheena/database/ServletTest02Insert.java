package com.sheena.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheena.common.MysqlService;

@WebServlet("/db/test02_insert")
public class ServletTest02Insert extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		String name = request.getParameter("webName");
		String url = request.getParameter("url");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect(); // 접속
		
		String insertQuery = "INSERT INTO `web_site`\r\n"
				+ "(`name`, `url`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUES\r\n"
				+ "('" + name + "', '" + url + "', now(), now());";

		PrintWriter out = response.getWriter(); //out
		
		int count = mysqlService.update(insertQuery);
		
		mysqlService.disconnect(); // DB 끊기
		
		response.sendRedirect("/db/test02_1.jsp");
		
	}

}
