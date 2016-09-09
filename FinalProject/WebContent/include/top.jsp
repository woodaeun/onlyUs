<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/top.css" rel="stylesheet" type="text/css">

<%
   MemberDTO dto = (MemberDTO)session.getAttribute("login");
%>
<%
  if(dto==null){
%><div id="gray1">
 <a href="LoginFormServlet">로그인</a>&nbsp;
 <a href="MemberFormServlet">회원가입</a>&nbsp;
  <a href="BoardListServlet">게시판</a>&nbsp;
  <a href="CartListServlet">게시판</a>&nbsp;

  </div><br>
<%
  }else{
%><div id="gray">
 
  <a href="LogOutServlet">로그아웃</a>&nbsp;&nbsp;
  <a href="MyPageServlet">마이페이지</a>&nbsp;&nbsp;
   <a href="BoardListServlet">게시판</a>&nbsp;&nbsp;
    <a href="CartListServlet">장바구니</a><br>
     안녕하세요! <a href="userhome.jsp" id="user"><%= dto.getUsername() %></a> 님 ^^*
   </div><br>
<%
  }//end if

 %>
 
  <a href="home.jsp" ><img src="image/logo.jpg" ></a><br>
 
 
 
 