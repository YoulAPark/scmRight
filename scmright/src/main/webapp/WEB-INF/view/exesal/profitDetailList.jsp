<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


							<c:if test="${searchlistcnt eq 0 }">
								<tr>
									<td colspan="13">거래 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${searchlistcnt > 0 }">
								<c:forEach items="${searchlist}" var="list">
									<tr>
										<td>${list.company}</td>
										<td>${list.prodName}</td>
										<td><fmt:formatNumber value="${list.profit}" pattern="#,###,###"/> 원</td>
										<td><fmt:formatNumber value="${list.loss}" pattern="#,###,###"/> 원</td>
										<td>${list.codate}</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="searchlistcnt2" name="searchlistcnt2" value="${searchlistcnt}"/>