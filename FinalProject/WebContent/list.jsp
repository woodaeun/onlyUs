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
  <jsp:include page="board/list.jsp" flush="true" />
 <%
    String result = (String)request.getAttribute("result");
   if(result!=null){
 %>
 <script type="text/javascript">
     alert("회원가입을 환영합니다~~~");
  </script>
 <%
   }
 %>
  <%
    String logout = (String)request.getAttribute("logout");
    System.out.println(">>" + logout);
   if(logout!=null){
 %>
 <script type="text/javascript">
      var str = "<%=logout%>";
      alert("<%=logout%>");
  </script>
 <%
   }
 %>
 <%
    String update = (String)request.getAttribute("update");
    System.out.println(">>" + update);
   if(update!=null){
 %>
 <script type="text/javascript">
      var str = "<%=update%>";
      alert("<%=update%>");
  </script>
 <%
   }
 %>
 <%
    String delete = (String)request.getAttribute("delete");
    System.out.println(">>" + delete);
   if(delete!=null){
 %>
 <script type="text/javascript">
      var str = "<%=delete%>";
      alert("<%=delete%>");
  </script>
 <%
   }
 %>
   <footer id=main_footer>
 <jsp:include page="include/footer.jsp" flush="true" />
 </footer>
</body>
</html>


