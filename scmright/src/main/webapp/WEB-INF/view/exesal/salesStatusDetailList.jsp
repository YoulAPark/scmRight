<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


							<c:if test="${searchlistcnt2 eq 0 }">
								<tr>
									<td colspan="13">거래 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${searchlistcnt2 > 0 }">
								<c:forEach items="${searchlist2}" var="list">
									<tr>
										<td>${list.com_name}</td>
										<td>${list.prodName}</td>
										<td><fmt:formatNumber value="${list.sales_price2}" pattern="#,###,###"/> 원</td>
										<td>${list.coDate}</td>
										<td><fmt:formatNumber value="${list.profit_price2}" pattern="#,###,###"/> 원</td>
										
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="searchlistcnt2" name="searchlistcnt2" value="${searchlistcnt2}"/>