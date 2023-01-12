<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${totalCnt eq 0 }">
	<tr>
		<td colspan="13">반품 승인 신청 내역이 존재하지 않습니다.</td>
	</tr>
</c:if>

<!-- 갯수가 있는 경우  -->
<c:if test="${totalCnt > 0 }">
	<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
	<c:forEach items="${refundConfirmList}" var="list"> <!-- controller에서 add 한 이름 가져오기!  -->
		<tr>
			<td>${nRow+1}</td>
			<td>${list.com_name}</td>
			<td>${list.prodName}</td>
			<td>${list.coDate}</td>
			<td>${list.retADate}</td>
			<td>${list.coCnt}</td>
			<td>${list.retCnt}</td>
			<td><fmt:formatNumber value="${list.total_price}" pattern="#,###,###"/> 원</td>
			<td><a class="btnType blue"              
				onclick="javascript:fConfirmRefund('${list.retNo}','${list.supNo}','${list.coNo}','${list.strNo}',)"><span style = "cursor : pointer">승인</span></a></td>
			<%-- <fmt:formatNumber value="${list.order_qty}" pattern="#,###,###"/> --%>



		</tr>
		 <c:set var="nRow" value="${nRow + 1}" /> 
	</c:forEach>

</c:if>

<input type="hidden" id="totalCnt" value="${totalCnt}">
