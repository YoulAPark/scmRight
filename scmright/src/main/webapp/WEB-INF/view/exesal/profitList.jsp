<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						    
							<c:if test="${searchlistcnt eq 0 }">
								<tr>
									<td colspan="13">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${searchlistcnt > 0 }">
								<c:forEach items="${searchlist}" var="list">
									<tr>
										<td><a href="javascript:rowclick('${list.ID}')">${list.company}</a></td>
										
										<td><fmt:formatNumber value="${list.profit}" pattern="#,###,###"/> 원</td>
										<td><fmt:formatNumber value="${list.loss}" pattern="#,###,###"/> 원</td>
										<td><fmt:formatNumber value="${list.pureP}" pattern="#,###,###"/> 원</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="searchlistcnt" name="searchlistcnt" value ="${searchlistcnt}"/>