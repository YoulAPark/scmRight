<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${searchlistcnt eq 0 }">
								<tr>
									<td colspan="4">주문 내역 상세 정보가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${searchlistcnt > 0 }">
								<c:set var="nRow" value="${pageSize*(clickpagenum-1)}" />
								<c:forEach items="${list}" var="list">
									<tr>									
										<td>${list.prodName} (${list.coNo})</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.coCnt}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.delPrice}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.delPrice*list.coCnt}"/></td>
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="searchlistcnt" name="searchlistcnt" value="${searchlistcnt}"/>