<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<%
	 MemberDTO memberDTO =(MemberDTO)session.getAttribute("login");
	String isLogin="";
if(memberDTO != null){
	isLogin="SUCCESS";
}else{
		isLogin="NOT";
	}

%>

<%
	GoodsDTO dto = (GoodsDTO) request.getAttribute("goodsDTO");
	String gCode = dto.getgCode();
	String gCategory = dto.getgCategory();
	String gName = dto.getgName();
	String gContent = dto.getgContent();
	int gPrice = dto.getgPrice();
	String gImage = dto.getgImage();
%>


<form name="goodRetrieveForm" method="GET">

	<input type="hidden" name="gImage" value="<%=gImage%>"> 
	<input type="hidden" name="gCode" value="<%=gCode%>">
	<input type="hidden" name="gName" value="<%=gName%>"> 
	<input type="hidden" name="gPrice" value="<%=gPrice%>">
		
		
		
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr> 


			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"><img src="images/items/<%=gImage%>.gif"
							border="0" align="center" width="300" /></td>
						<td class="td_title">코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><%=gCode%>
						</td>
					</tr>
					<tr>
						<td class="td_title">이름</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><%=gName%>
						</td>
					</tr>
					<tr>
						<td class="td_title">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>￦<%=gPrice%>
						</td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">상품옵션</td>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="GOODS_SIZE" id="GOODS_SIZE">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="GOODS_COLOR"
							id="GOODS_COLOR">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
						</select></td>
					</tr>

					<tr>
						<%
							
						%>

						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="GOODS_AMOUNT" value="1" id="GOODS_AMOUNT"
							style="text-align: right; height: 18px"> <img
							src="images/up.PNG" id="up"> <img src="images/down.PNG"
							id="down"></td>
					</tr>
				</table>

			</td>
		</tr>
		<!-- <tr>
			<td hidden=true><input type="text" id="GOODS_CODE"
				name="GOODS_CODE" value="T1"></td>
			<td height="10">
		</tr> -->
	</table>

	<br> <input type="button" value="구매하기" id="order" onclick="" />
	&nbsp;&nbsp; 
	 <button onclick="xxx(goodRetrieveForm)" id="cart">장바구니</button> 
	<!-- <input type="button" onclick="xxx2(goodRetrieveForm)"
		value="장바구니 담기" id="cart" /> <br> <br> -->
</form>

<script type="text/javascript">
	

		function xxx(f) {
		
			if('<%=isLogin%>'=='SUCCESS'){
			
				f.action = "CartAddServlet";
			}else{
			
				f.action="LoginFormServlet";
			}
			
		}
		
		function xxx2(f) {
			f.action = "CartAddServlet";
			f.submit();
		}
		
		$(document).ready(function() {

		$('#down').click(function(e) {
			e.preventDefault();
			var start = $('#GOODS_AMOUNT').val();
			var num = parseInt(start);
			num--;
			if (num <= 0) {
				alert('더이상 줄일수 없습니다.');
				num = 1;
			}
			$('#GOODS_AMOUNT').val(num);
		});
		$('#up').click(function(e) {
			e.preventDefault();
			var start = $('#GOODS_AMOUNT').val();
			var num = parseInt(start);
			num++;
			$('#GOODS_AMOUNT').val(num);
		});

	});
</script>
