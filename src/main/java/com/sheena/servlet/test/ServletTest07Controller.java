package com.sheena.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test07")
public class ServletTest07Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String paymentCard = request.getParameter("paymentCard");
		String priceString = request.getParameter("price");
		
		int price = Integer.parseInt(priceString);
		
		out.println("<html><head><title>주문</title></head>");
		out.println("<boby>");
		
		
		if(!address.contains("서울시")) {
			out.println("배달 불가 지역입니다.");
			return;
		} 
		
		if(paymentCard.equals("신한카드")) {
			out.println("결제 불가 카드입니다.");
			return;
		}
		
		out.println("<h4>" + address + " 배달 준비중</h4>");
		out.println("<hr></hr>");
		out.println("결제금액 : " + price + "원");
		out.println("</boby></html>");
		

	}

}
