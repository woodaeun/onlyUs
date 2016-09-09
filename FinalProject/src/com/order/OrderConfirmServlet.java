package com.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.exception.CommonException;
import com.service.CartService;
import com.service.MemberService;

/**
 * Servlet implementation class OrderConfirmServlet
 */
@WebServlet("/OrderConfirmServlet")
public class OrderConfirmServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userid = request.getParameter("userid");
		String num = request.getParameter("num");
		
		MemberService mService = new MemberService();
		CartService cService = new CartService();
		
		 String title="";
		   String target="";
		   try {
		 MemberDTO mDTO = mService.mypage(userid);
		 CartDTO cDTO = cService.orderCart(num);
		 
		 request.setAttribute("mDTO", mDTO);
		 request.setAttribute("cDTO", cDTO);
		  target = "orderConfirm.jsp";
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
