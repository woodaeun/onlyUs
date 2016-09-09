<%@page import="java.util.HashMap"%>
<%@page import="com.config.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String amount = request.getParameter("amount");
	String num = request.getParameter("num");
	HashMap<String, Integer> map = new HashMap<>();
	map.put("amount",Integer.parseInt(amount));
	map.put("num",Integer.parseInt(num));
	
	SqlSession sess = MySqlSessionFactory.getSession();
	
	try {
		 sess.update("updateCart", map);
		 sess.commit();
	} finally {
		sess.close();

	}

%>