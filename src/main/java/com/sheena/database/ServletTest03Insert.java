package com.sheena.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheena.common.MysqlService;

@WebServlet("/jspTemplete/test03_insert")
public class ServletTest03Insert extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		String sellerId = request.getParameter("newSellerId");
		String title = request.getParameter("newTitle");
		String priceString = request.getParameter("newPrice");
		int price = Integer.parseInt(priceString);
		String description = request.getParameter("newDescription");
		String url = request.getParameter("newUrl");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect(); //접속
		
		String insertQuery = "INSERT INTO `used_goods`\r\n"
				+ "(`sellerId`, `title`, `price`, `description`, `picture`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUES\r\n"
				+ "('" + sellerId + "', '" + title + "', " + price + ", '" + description + "', '" + url + "', now(), now());";
	
		
		int count = mysqlService.update(insertQuery);
		
		mysqlService.disconnect(); //  DB 끊기!!
		
		response.sendRedirect("/jspTemplete/test03/test03main.jsp");
	
	
	}

}
