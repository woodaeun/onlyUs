<%@page import="com.config.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	SqlSession sess = MySqlSessionFactory.getSession();
	String userid = null;
	try {
		userid = sess.selectOne("idCheck", id);
	} finally {
		sess.close();

	}

	if (userid == null) {
		out.print("사용가능합니다");

	} else {
		out.print("중복된아이디입니다");

	}
%>