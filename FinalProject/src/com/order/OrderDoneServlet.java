package com.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dto.OrderDTO;
import com.exception.CommonException;
import com.service.OrderService;


@WebServlet("/OrderDoneServlet")
public class OrderDoneServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String num = request.getParameter("num");
		
		 String userid=request.getParameter("userid");
		 String gCode=request.getParameter("gCode");
		 String gName=request.getParameter("gName");
		 String gPrice=request.getParameter("gPrice");
		 String gImage=request.getParameter("gImage");
		 String gSize=request.getParameter("gSize");
		 String gColor=request.getParameter("gColor");
		 String gAmount=request.getParameter("gAmount");
		
		 String orderName=request.getParameter("orderName");
		 String post1=request.getParameter("post1");
		 String post2=request.getParameter("post2");
		 String addr1=request.getParameter("addr1");
		 String addr2=request.getParameter("addr2");
		 String phone=request.getParameter("phone");
		 String payMethod=request.getParameter("payMethod");

		 OrderDTO dto = new OrderDTO();
		 dto.setUserid(userid);
		 dto.setgCode(gCode);
		 dto.setgName(gName);
		 dto.setgPrice(Integer.parseInt(gPrice));
		 dto.setgImage(gImage);
		 dto.setgSize(gSize);
		 dto.setgColor(gColor);
		 dto.setgAmount(Integer.parseInt(gAmount));
		 
		 dto.setOrderName(orderName);
		 dto.setPost1(post1);
		 dto.setPost2(post2);
		 dto.setAddr1(addr1);
		 dto.setAddr2(addr2);
		 dto.setPhone(phone);
		 dto.setPayMethod(payMethod);

		
		OrderService service = new OrderService();
		
		   String title="";
		   String target="";
		   try {
	     service.addOrder(dto , num);
	     request.setAttribute("orderDTO", dto);
		  target = "orderDone.jsp";
		} catch (CommonException e) {
			title= e.getMessage();
			String link="home.jsp";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		 
			RequestDispatcher dis =
					request.getRequestDispatcher(target);
			dis.forward(request, response);
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
