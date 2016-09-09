package com.goods;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.GoodsDTO;
import com.exception.CommonException;
import com.service.GoodsService;


@WebServlet("/GoodsListServlet")
public class GoodsListServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		
		
		GoodsService service = new GoodsService();
	
		
		 String title="";
		    String target="";
		    try {
				List<GoodsDTO> list= service.list(category);
				target = "goods.jsp";
				request.setAttribute("goodsList", list);
			} catch (CommonException e) {
				title= e.getMessage();
				String link="home.jsp";
				target="error.jsp";
				request.setAttribute("title", title);
				request.setAttribute("link", link);
			}
		
		
		RequestDispatcher dis= request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
