<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
						    
 							<c:if test="${fn:length(searchlist) <= 0 }">
								<tr>
									<td colspan="6">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if> 
							<c:if test="${fn:length(searchlist) > 0 }">
								<c:forEach items="${searchlist}"  var="list"  varStatus="index"  >
									<tr>
										<td>${index.count}</td>
										<td>${list.com_name}</td>
										<td><fmt:formatNumber value="${list.sales_price}" pattern="#,###,###"/> 원</td>
									</tr>
								</c:forEach>
							</c:if>
							
<%-- 							<input type="hidden" id="searchlistcnt" name="searchlistcnt" value ="${searchlistcnt}"/> --%>