<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="BoardWriteServlet" method="post">
  제목<input type="text" name="title"><br>
  작성자<input type="text" name="author"><br>
  내용<textarea rows="10" cols="10" name="content"></textarea>
  <input type="submit" value="글쓰기">
</form>
<a href="BoardListServlet">목록보기</a>



