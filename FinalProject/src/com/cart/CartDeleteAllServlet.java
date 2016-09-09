package com.cart;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.exception.CommonException;
import com.service.BoardService;
import com.service.CartService;




@WebServlet("/CartDeleteAllServlet")
public class CartDeleteAllServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String [] checkValue =
				request.getParameterValues("check");
	/*	for (String num : checkValue) {
			System.out.println(num);
		}*/
		
		
	
		System.out.println("CartDeleteServlet");
		request.setCharacterEncoding("UTF-8");
		
		String num = request.getParameter("num");
		CartService service = new CartService();
		String title="";
		String target="";
		try {
			service.delAllCart(Arrays.asList(checkValue));
			target = "CartListServlet";
		} catch (CommonException e) {
			e.printStackTrace();
			title= e.getMessage();
			String link="home.jsp";
			target="error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}

		response.sendRedirect("CartListServlet");
}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


