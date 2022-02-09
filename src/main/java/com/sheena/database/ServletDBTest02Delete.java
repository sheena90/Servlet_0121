package com.sheena.database;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheena.common.MysqlService;

@WebServlet("/db/test02_delete")
public class ServletDBTest02Delete extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		String deleteQuery = "DELETE FROM `web_site` WHERE `id` = " + id;
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		mysqlService.update(deleteQuery);
		
		response.sendRedirect("/db/test02_1.jsp");
		
	}

}
