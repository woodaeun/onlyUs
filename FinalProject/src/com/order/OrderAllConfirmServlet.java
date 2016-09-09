package com.order;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

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
import com.service.CartService;
import com.service.MemberService;

@WebServlet("/OrderAllConfirmServlet")
public class OrderAllConfirmServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO m=(MemberDTO)session.getAttribute("login");
		String userid= m.getUserid();
	
		String [] checkValue =
				request.getParameterValues("check");
	
		MemberService mService = new MemberService();
		CartService cService = new CartService();
		
		 String title="";
		   String target="";
		   try {
		 MemberDTO mDTO = mService.mypage(userid);
		 List<CartDTO> cList = cService.orderAllCart(Arrays.asList(checkValue));
		 System.out.println(cList.size());
		 request.setAttribute("mDTO", mDTO);
		 request.setAttribute("cList", cList);
		  target = "orderAllConfirm.jsp";
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
