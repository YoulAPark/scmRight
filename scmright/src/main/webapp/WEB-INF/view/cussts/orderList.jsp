<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
							<c:if test="${totalOrderCnt eq 0 }">
								<tr>
									<td colspan="13">주문 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalOrderCnt gt 0 }">
								<c:forEach items="${orderList}" var="order">
									<tr onclick="fOrderDetail('${order.coNo}');">
										<td>${order.coNo }</td>
										<td>${order.prodName}</td>
										<td>${order.coCnt}</td>
										<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${order.coCnt * order.selPrice}" />
										</td>
										<td><fmt:formatDate value="${order.coDate}" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${order.coDel }" pattern="yyyy-MM-dd" /></td>
										<td>${order.coSts }</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalOrderCnt" name="totalOrderCnt" value="${totalOrderCnt}"/>
							
							