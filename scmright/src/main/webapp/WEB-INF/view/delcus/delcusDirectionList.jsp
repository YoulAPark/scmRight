<!-- Encording -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- JSTL 코어(변수 지원, 흐름 제어, URL 처리) 사용으로 인한 tag Library 지정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL 날짜 형식 사용으로 인한 fmt 사용-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- List출력 -->

	<c:if test="${totalCount eq 0}">
		<tr>
			<td colspan="6">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	<!-- List출력 -->
	<c:if test="${totalCount > 0}">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
		<c:forEach items="${list}" var="list"> <!-- tr :행 / td: 열 -->
			<tr onclick="fModalSelectOne(${list.coNo})">
				<td>${list.delNo}</td>
				<td>${list.name}</td>
				<td>${list.coDate}</td>
				<td>${list.coDel}</td>
				<td>${list.strMnm}</td>
				<td>${list.strName}</td>
					<c:if test="${list.delSts == 'waiting'}">
						<td style="color:skyblue; font-weight: bold;">배송준비중</td>
					</c:if>
					<c:if test="${list.delSts == 'loading'}">
						<td style="color:green; font-weight: bold;">배송중</td>
					</c:if>
					<c:if test="${list.delSts == 'complete'}">
						<td style="color:red; font-weight: bold;">배송완료</td>
					</c:if>						
			</tr>
		<c:set var="nRow" value="${nRow + 1}" />
		</c:forEach>
	</c:if>
						
	<input type="hidden" id="totalCount" value="${totalCount}">