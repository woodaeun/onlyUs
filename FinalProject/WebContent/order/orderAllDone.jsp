<%@page import="java.util.List"%>
<%@page import="com.dto.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
        List<OrderDTO> list1 = (List<OrderDTO>)request.getAttribute("orderList");
        String userid = "";
        String orderName = "";
        String post1 = "";
        String post2 = "";
        String addr1 = "";
        String addr2 = "";
        String phone = "";
        String orderDay = "";
	for(int i=0 ; i< list1.size(); i++){
        OrderDTO dto = list1.get(i);
        userid = dto.getUserid(); //
		
		 orderName = dto.getOrderName();
		 post1 = dto.getPost1();
		 post2 = dto.getPost2();
		 addr1 = dto.getAddr1();
		 addr2 = dto.getAddr2();
		 phone = dto.getPhone();
		 orderDay = dto.getOrderDay();

	}
%>
<table width="70%" cellspacing="0" cellpadding="0" align="center">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td><b>주문완료</b></td>
	</tr>

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center"><b><%=userid %></b> 님의 주문이
			안전하게 처리되었습니다.</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>상품 및 배송정보</b></td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35">받으시는 분</td>
					<td class="td_default" height="35"><%=orderName %></td>
				</tr>
				<tr>
					<td class="td_default" height="35">주소</td>
					<td class="td_default" height="35">(<%=post1 %>-<%=post2 %>)<br>
						<%=addr1 %><%=addr2 %>
					</td>
				</tr>

				<tr>
					<td class="td_default" height="35">휴대전화</td>
					<td class="td_default" height="35"><%=phone %></td>
				</tr>
			</table>
	</tr>
	</td>

	<tr>
		<td height="20">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td width="250" class="td_default" height="35" align="center"><strong>상품명</strong></td>
					<td width="100" class="td_default" height="35" align="center"><strong>판매가</strong></td>
					<td class="td_default" width="50" height="35" align="center"><strong>수량</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>합계</strong></td>
				</tr>

				<%
        List<OrderDTO> list = (List<OrderDTO>)request.getAttribute("orderList");
		String payMethod = "";
		int totalSum = 0;
	for(int i=0 ; i< list.size(); i++){
        OrderDTO dto = list.get(i);
		String gCode = dto.getgCode();
		String gName = dto.getgName();
		int gPrice = dto.getgPrice();
		String gImage = dto.getgImage();
		String gSize = dto.getgSize();
		String gColor = dto.getgColor();
		int gAmount = dto.getgAmount();

		int sum = gPrice*gAmount;
		totalSum =+ sum;
%>

				<tr>
					<td height="35" class="td_default"><span class="a_default"><%=gName %></span>
					</td>
					<td height="35" class="td_default" align="center"><span
						id="price1"><%= gPrice %></span>원</td>
					<td height="35" class="td_default" align="center"><span
						id="num1"><%= gAmount %></span>권</td>
					<td height="35" class="td_default" align="center"><span><%= sum %></span>원
					</td>
				</tr>

				
 <%
	}//end for
 %>	


			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>결제정보</b></td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35">결제금액</td>
					<td class="td_default" height="35" align='right'><input
						type='text' id='total' value='<%= totalSum %>' readonly>원</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35">결제수단</td>
					<td class="td_default" height="35" align='right'><span><%=payMethod %></span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>



	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default" align="center"><a class="a_default"
			href="OrderListDetailServlet?mem_id=guest">주문조회 페이지로 이동</a></td>
	</tr>

	<tr>
		<td height="30">
	</tr>

</table>
