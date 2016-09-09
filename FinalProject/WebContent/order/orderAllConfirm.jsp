<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	function orderAllDone(f) {
		f.action = "OrderAllDoneServlet"
		f.submit();
	}

	$(document).ready(function() {

		$("#same").on("change", function(event) {
			if (this.checked) {
				$("#orderName").val($("#mname").val());
				$("#post1").val($("#mpost1").val());
				$("#post2").val($("#mpost2").val());
				$("#addr1").val($("#maddress1").val());
				$("#addr2").val($("#maddress2").val());
				$("#phone").val($("#mphone").val());

			} else {
				$("#orderName").val("");
				$("#post1").val("");
				$("#post2").val("");
				$("#addr1").val("");
				$("#addr2").val("");
				$("#phone").val("");
			}

		});

	});
</script>
<FORM name="myForm" method="GET" action="">
	<table width="80%" cellspacing="0" cellpadding="0" align="center">

		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>주문상품 확인</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="5">
		</tr>

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_default" align="center"><strong>주문번호</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
						<td class="td_default" align="center"><strong>판매가</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>

					</tr>

					<tr>
						<td colspan="4">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>
					<%
						List<CartDTO> cList = (List<CartDTO>) request.getAttribute("cList");
						int totalSum = 0;
						for (int i = 0; i < cList.size(); i++) {
							CartDTO cDTO = cList.get(i);

							int num = cDTO.getNum(); //주문코드 역할
							String userid = cDTO.getUserid();
							String gCode = cDTO.getgCode();
							String gName = cDTO.getgName();
							int gPrice = cDTO.getgPrice();
							String gSize = cDTO.getgSize();
							String gColor = cDTO.getgColor();
							int gAmount = cDTO.getgAmount();
							String gImage = cDTO.getgImage();
							int sum = gPrice * gAmount;
							totalSum += sum;
					%>

					<input type="hidden" name="userid" value="<%=userid%>">
					<input type="hidden" name="num" value="<%=num%>">
					<input type="hidden" name="gCode" value="<%=gCode%>">
					<input type="hidden" name="gName" value="<%=gName%>">
					<input type="hidden" name="gPrice" value="<%=gPrice%>">
					<input type="hidden" name="gSize" value="<%=gSize%>">
					<input type="hidden" name="gColor" value="<%=gColor%>">
					<input type="hidden" name="gAmount" value="<%=gAmount%>">
					<input type="hidden" name="gImage" value="<%=gImage%>">


					<tr>
						<td class="td_default" width="80"><%=num%></td>
						<td class="td_default" width="80"><img
							src="images/items/<%=gImage%>.gif" border="0" align="center"
							width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px'><%=gName%>
							<br> <font size="2" color="#665b5f">[옵션 : 사이즈(<%=gSize%>)
								, 색상(<%=gColor%>)]
						</font></td>
						<td class="td_default" align="center" width="110"><%=gPrice%>
						</td>
						<td class="td_default" align="center" width="90"><%=gAmount%></td>

					</tr>


					<%
						} //end for
					%>

					<tr>
						<td height="30"></td>
						<td class="td_default" align="right"><span>총 결제 금액 :</span></td>
						<td class="td_default" align='right'><%=totalSum%>원</td>
					</tr>
				</table>
		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		</td>
		</tr>
		<!--  고객 정보 시작-->
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>고객 정보</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>


		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse: collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							<%
								MemberDTO dto = (MemberDTO) request.getAttribute("mDTO");

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
							%> 이 름
						</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="mname" size="20"
							maxlength="20" value="<%=username%>"></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="mpost1" size="4"
							maxlength="3" value="<%=post1%>" readonly></input>- <input
							class="input_default" type="text" id="mpost2" size="4"
							maxlength="3" value="<%=post2%>" readonly></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">주 소</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="maddress1" size="35"
							maxlength="200" value="<%=addr1%>" readonly></input><br> <input
							class="input_default" type="text" id="maddress2" size="35"
							maxlength="200" value="<%=addr2%>" readonly></input></td>
					</tr>

					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="mphone" size="15"
							maxlength="15" value="<%=phone1%><%=phone2%><%=phone3%>"></input></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--  고객 정보 끝-->
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td class="td_default"><input type="checkbox" name="same"
				id="same"> 배송지가 동일할 경우 선택하세요.</td>
		</tr>
		<!--  배송지 정보 시작-->
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>배송지 정보</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>


		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse: collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">이 름</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="orderName" name="orderName"
							size="20" maxlength="20" value=""></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<!-- 다음주소 시작--> <input name="post1" id="post1" size="5"
							readonly=""> - <input name="post2" id="post2" size="5"
							readonly=""> <input onclick="openDaumPostcode()"
							type="button" value="우편번호찾기"> <br> <input
							name="addr1" id="addr1" size="40" readonly="" placeholder="도로명주소">
							<br> <span style="line-height: 10%;"><br></span> <input
							name="addr2" id="addr2" size="40" placeholder="지번주소"> <!-- 다음주소 끝 -->
						</td>
					</tr>

					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="phone" name="phone"
							size="15" maxlength="15" value=""></input></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--  배송지 정보 끝-->

		<tr>
			<td height="30">
		</tr>
		<tr>
			<td><b>결제수단</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse: collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default"><input
							type="radio" name="payMethod" value="신용카드" checked>신용카드</input> <input
							type="radio" name="payMethod" value="계좌이체">계좌이체</input> <input
							type="radio" name="payMethod" value="무통장 입금">무통장 입금</input></td>

					</tr>

				</table>
			</td>
		</tr>

		<tr>
			<td height="30">
		</tr>


		<tr>
			<td class="td_default" align="center"><input type='button'
				value='취소' onclick="javascript:history.back()"> <input
				type='button' value='결제하기' onclick="orderAllDone(myForm)"></td>
		</tr>

	</table>

</FORM>

