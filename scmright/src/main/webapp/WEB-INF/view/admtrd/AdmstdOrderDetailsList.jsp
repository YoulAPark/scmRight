<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty list || list[0].coNo == 0}">
	<tr>
		<td colspan="13">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty list && list[0].coNo != 0}">
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.coNo}</td>
			<td><fmt:formatDate value="${list.coDate}" pattern="yyyy-MM-dd" /></td>
			<td>${list.com_name }</td>
			<td>${list.prodName}</td>
			<td>${list.strCnt}</td>
			<td><fmt:formatNumber value="${list.delPrice}" pattern="#,###" /></td>
			<td>${list.coCnt}</td>
			<td><fmt:formatNumber value="${list.delPrice*1 * list.coCnt*1}" pattern="#,###" /></td>
			<c:if test="${list.coSts eq 'order'}">
				<td>주문</td>
			</c:if>
			<c:if test="${list.coSts ne 'order'}">
				<td>반품</td>
			</c:if>
			
			<td><fmt:formatDate value="${list.coDel}"
					pattern="yyyy-MM-dd" /></td>
			<c:if test="${list.coDpsts eq 0}">
				<td>미입금</td>
			</c:if>
			<c:if test="${list.coDpsts eq 1}">
				<td>입금</td>
			</c:if>
			<c:if test="${list.coCnt le list.prodCnt}">
				<td><a class="btnType3 color1" onclick="shippingModalOpen(${list.coNo},${list.prodNo},${list.coDpsts},${list.strCnt },${list.coCnt})" style="cursor: pointer;"><span>배송</span></a></td>
			</c:if>
			<c:if test="${list.coCnt gt list.prodCnt}">
				<td><a class="btnType3 color2" onclick="shippingModalOpen(${list.coNo},${list.prodNo},${list.coDpsts},${list.strCnt },${list.coCnt})" style="cursor: pointer;"><span>배송</span></a></td>
			</c:if>
				<td><a class="btnType3 color2" onclick="orderModalOpen(${list.prodNo})" style="cursor: pointer;"><span>발주</span></a></td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="searchlistcnt" name="searchlistcnt"
	value="${searchlistcnt}" />