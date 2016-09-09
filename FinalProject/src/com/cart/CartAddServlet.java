package com.cart;

import java.io.IOException;

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




@WebServlet("/CartAddServlet")
public class CartAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("CartAddServlet");
		request.setCharacterEncoding("UTF-8");
	//gImage=outer1&gCode=O1&gName=더블+버튼+블레이져
		//&gPrice=52800&GOODS_SIZE=사이즈선택
		//&GOODS_COLOR=색상선택&GOODS_AMOUNT=1
	 
	 String gCode= request.getParameter("gCode");
	 String gName= request.getParameter("gName");
	 String gPrice= request.getParameter("gPrice");
	 String gSize= request.getParameter("GOODS_SIZE");
	 String gColor= request.getParameter("GOODS_COLOR");
	 String gAmount= request.getParameter("GOODS_AMOUNT");
	 String gImage= request.getParameter("gImage");	
	 
	 HttpSession session = request.getSession();
	 MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
	 String userid = memberDTO.getUserid();
	 CartDTO dto = new CartDTO();
	// dto.setNum(num);
	 dto.setUserid(userid);
	 dto.setgCode(gCode);
	 dto.setgName(gName);
	 dto.setgPrice(Integer.parseInt(gPrice));
	 dto.setgSize(gSize);
	 dto.setgColor(gColor);
	 dto.setgAmount(Integer.parseInt(gAmount));
	 dto.setgImage(gImage);
	 
	   CartService service = new CartService();
	   String title="";
	   String target="";
	   try {
		service.addCart(dto);
		target = "GoodsRetrieveServlet?gCode="+gCode;
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


