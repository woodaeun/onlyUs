<%@page import="com.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

   function updateBoard(f){
	   f.action="BoardUpdateServlet";
   }
   function deleteBoard(f){
	   f.action="BoardDeleteServlet";
   }
</script>

<%
   BoardDTO dto = 
   (BoardDTO)request.getAttribute("retrieve");
   int num = dto.getNum();
   String title = dto.getTitle();
   String author = dto.getAuthor();
   String content = dto.getContent();
   String writeday = dto.getWriteday();
   int readcnt = dto.getReadcnt();
%>
<form  method="get" name="myForm">

<table>
<tr>
<th>글번호</th>
<th>내용</th>
<th>작성자</th>
<th>작성일</th>
<th>조회수</th>
</tr>


</table>
<input type="hidden" name="num" value="<%=num %>">
 글번호:<%= num %>&nbsp;작성일:<%= writeday%>
    &nbsp;조회수:<%= readcnt%><br>
  제목<input type="text" name="title" value="<%=title %>"><br>
  작성자<input type="text" name="author" value="<%= author%>"><br>
  내용<textarea rows="10" cols="10" name="content">
   <%= content %>
  </textarea>
  <button onclick="updateBoard(myForm)">수정</button>
  <button onclick="deleteBoard(myForm)">삭제</button>
</form>
<a href="BoardListServlet">목록보기</a>




