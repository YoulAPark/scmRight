<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty list}">
	<tr>
		<td colspan="13">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty list}">
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.com_name}</td>
			<td>${list.retNo}</td>
			<td><fmt:formatDate value="${list.retADate}" pattern="yyyy-MM-dd" /></td>
			<td>${list.prodNo}</td>
			<td>${list.prodName}</td>
			<td>${list.coCnt}</td>
			<td>${list.retCnt}</td>
			<td><fmt:formatNumber value="${list.retPrice}" pattern="#,###" /></td>
			<td>
				<c:if test="${list.retEsts == 0}">
					<a class="btnType3 color2" onclick="refundModalOpen(${list.retNo},
					'<fmt:formatDate value="${list.retADate}" pattern="yyyy-MM-dd" />',${list.prodNo},
					'${list.prodName}',${list.retCnt},${list.retPrice},${list.retEsts})" style="cursor: pointer;">
						<span>작성</span>
					</a>
				</c:if>
				<c:if test="${list.retEsts gt 0}">
					<a class="btnType3 color1" onclick="refundModalOpen(${list.retNo},
					'<fmt:formatDate value="${list.retADate}" pattern="yyyy-MM-dd" />',${list.prodNo},
					'${list.prodName}',${list.retCnt},${list.retPrice},${list.retEsts})" style="cursor: pointer;">
						<span>작성</span>
					</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</c:if>

<input type="hidden" id="searchlistcnt" name="searchlistcnt"
	value="${searchlistcnt}" />