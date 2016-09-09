<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<link href="css/main.css" rel="stylesheet" type="text/css">

<!-- DAUM 주소 라이브러리 끝 -->
<%
	MemberDTO dto = (MemberDTO) request.getAttribute("mypage");
	String userid = dto.getUserid();
	String passwd = dto.getPasswd();
	String username = dto.getUsername();
	String post1 = dto.getPost1();
	String post2 = dto.getPost2();
	String addr1 = dto.getAddr1();
	String addr2 = dto.getAddr2();
	String phone1 = dto.getPhone1();
	String phone2 = dto.getPhone2();
	String phone3 = dto.getPhone3();
	String email1 = dto.getEmail1();
	String email2 = dto.getEmail2();
%>

<center>
<form name="myform">

	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="userid"
				value="<%=userid%>" readonly></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="passwd" id="passwd"
				value="<%=passwd%>"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="username" id="username"
				value="<%=username%>" readonly></td>
		</tr>
		<tr>
			<td colspan="2"><input name="post1" id="post1" size="5"
				value="<%=post1%>" readonly=""> - <input name="post2"
				id="post2" size="5" value="<%=post2%>" readonly=""> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"> <br>
				<input name="addr1" id="addr1" size="40" value="<%=addr1%>"
				readonly="" placeholder="도로명주소"> <br> <span
				style="line-height: 10%;"><br></span> <input name="addr2"
				id="addr2" size="40" placeholder="지번주소" value="<%=addr2%>"></td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><select name="phone1" id="phone1">
					<option value="010" <%if ("010".equals(phone1)) {%> selected <%}%>>010</option>
					<option value="011" <%if ("011".equals(phone1)) {%> selected <%}%>>011</option>
					<option value="017" <%if ("017".equals(phone1)) {%> selected <%}%>>017</option>
			</select>- <input type="text" name="phone2" id="phone2" value="<%=phone2%>">-
				<input type="text" name="phone3" id="phone3" value="<%=phone3%>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email1" id="email1"
				value="<%=email1%>">@ <input type="text" name="email2"
				id="email2 value="<%=email2%>"></td>
		</tr>


		<tr>
			<td colspan="3"><center>
				<button onclick="memberUpdate(myform)">수정</button>
				<button onclick="memberDelete(myform)">탈퇴</button></center>
			</td>
		</tr>
	</table>
</form>
</center>






<script type="text/javascript">
	function memberUpdate(f) {
		f.action = "MemberUpdateServlet";
	}

	function memberDelete(f) {
		f.action = "MemberDeleteServlet";
	}

	$(document).ready(function() {

		$("form").on("submit", function(event) {

			var userid = $("#userid").val();
			if (userid == '') {
				alert("아이디를 입력하세요");
				return false;
			} else if ($("#passwd").val() == '') {
				alert("비밀번호를 입력하세요");
				return false;
			} else if ($("#username").val() == '') {
				alert("이름을 입력하세요");
				return false;
			} else if ($("#post1").val() == '') {
				alert("우편번호를 입력하세요");
				return false;
			} else if ($("#post2").val() == '') {
				alert("우편번호를 입력하세요");
				return false;
			} else if ($("#post2").val() == '') {
				alert("우편번호를 입력하세요");
				return false;
			} else if ($("#addr1").val() == '') {
				alert("주소를 입력하세요");
				return false;
			} else if ($("#phone1").val() == '') {
				alert("전화번호1 입력하세요");
				return false;
			} else if ($("#phone2").val() == '') {
				alert("전화번호2 입력하세요");
				return false;
			} else if ($("#phone3").val() == '') {
				alert("전화번호3 입력하세요");
				return false;
			} else if ($("#email1").val() == '') {
				alert("이메일1를 입력하세요");
				return false;
			} else if ($("#email2").val() == '') {
				alert("이메일2를 입력하세요");
				return false;
			} else {
				//성공
				//alert("회원가입을 환영합니다");
			}

		});

	});
</script>











