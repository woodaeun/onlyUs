<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<link href="css/main.css" rel="stylesheet" type="text/css">
<!-- DAUM 주소 라이브러리 끝 -->
<center>
<form action="MemberAddServlet" >
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="userid">
				<button>아이디중복체크</button> <br>
			</td>
		</tr>
		<tr>
			<th>비밀번호
			</th>
			<td><input type="text" name="passwd" id="passwd"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="username" id="username">
			</td>
		</tr>
		<tr>
			<td colspan="2"><input name="post1" id="post1" size="5" readonly="">
				- <input name="post2" id="post2" size="5" readonly=""> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"> <br>
				<input name="addr1" id="addr1" size="40" readonly=""
				placeholder="도로명주소"> <br> <span
				style="line-height: 10%;"><br></span> <input name="addr2"
				id="addr2" size="40" placeholder="지번주소"></td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><select name="phone1" id="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
			</select>- <input type="text" name="phone2" id="phone2">- <input
				type="text" name="phone3" id="phone3">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email1" id="email1">@ <input
				type="text" name="email2" id="email2">
			</td>
		</tr>


		<tr>
			<td colspan ="2" id="but"><input type="submit" value="회원가입"> 
			<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</center>

<script type="text/javascript">
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











