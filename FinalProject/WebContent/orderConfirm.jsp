<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 <jsp:include page="include/top.jsp" flush="true" />
  <jsp:include page="include/submenu.jsp" flush="true" />
 <hr>
<jsp:include page="order/orderConfirm.jsp" flush="true" />

 <footer id=main_footer>
 <jsp:include page="include/footer.jsp" flush="true" />
 </footer>

</body>
</html>