<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<c:if test="${searchlistcnt eq 0 }">
		<tr>
			<td colspan="8">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>

<c:if test="${searchlistcnt > 0 }">
	<c:set var="nRow" value="${pageSize*(clickpagenum-1)}" />
	<c:forEach items="${list}" var="list">
		<tr onclick="javascript:rowClickEvent('${list.coNo}','${list.coDpsts}')">

			<td>${list.coNo}</td>
			<td>${list.loginID}</td>
			<td>${list.coDate}</td>
			<c:if test="${list.coDpsts == 0}">
				<td>미입금</td>
			</c:if>
			<c:if test="${list.coDpsts == 1}">
				<td>입금</td>
			</c:if>

		</tr>
		<c:set var="nRow" value="${nRow + 1}" />
	</c:forEach>
</c:if>

<input type="hidden" id="searchlistcnt"
	name="searchlistcnt" value="${searchlistcnt}" />
