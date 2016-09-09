<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원관리</title>
</head>
<body>
<%
   String title = (String)request.getAttribute("title");
   String link = (String)request.getAttribute("link");
%>
<h2><%= title %></h2>
<hr>
<a href="<%= link %>">바로가기</a>
</body>
</html>