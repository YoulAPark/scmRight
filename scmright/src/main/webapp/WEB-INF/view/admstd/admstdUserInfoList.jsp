<!-- Encording -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- JSTL 코어(변수 지원, 흐름 제어, URL 처리) 사용으로 인한 tag Library 지정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL 날짜 형식 사용으로 인한 fmt 사용-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- tbody(table Body)관련 JSP -->

	<c:if test="${totalCount eq 0}">
		<tr>
			<td colspan="6">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${totalCount > 0}">
		<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
		<c:forEach items="${list}" var="list"> <!-- tr :행 / td: 열 -->
			<tr>
				<td>${list.divCD}</td>
				
				<!-- 조건 A : 회사가 있을 경우 "회사이름" 출력 -->
				<c:if test="${list.com_name != null and !list.com_name.isEmpty()}">
					<td><a href="javascript:modalUser('${list.loginID}');">${list.com_name}</a></td>
				</c:if>
				<!-- 조건 A : 회사가 없을 경우 "이름" 출력 -->
				<c:if test="${list.com_name == null or list.com_name.isEmpty()}">
					<td><a href="javascript:modalUser('${list.loginID}');">${list.name}</a></td>
				</c:if>
				
				<!-- 조건 B : 기업고객(내부직원) - 담당업무 출력/담당자명 미출력 -->
				<c:if test="${list.chaCD == '기업고객' or list.chaCD.isEmpty()}">
					<td></td>
					<td>${list.name}</td>
				</c:if>
				<!-- 조건 B : 외부직원 - 담당업무 미출력/담당자명 출력 -->
				<c:if test="${list.chaCD != '기업고객' or list.chaCD.isEmpty()}">
					<td>${list.chaCD}</td>
					<td></td>
				</c:if>

				<!-- 조건 C : split -->
				<td>${list.hp1} - ${list.hp2} - ${list.hp3}</td>
			</tr>
			<c:set var="nRow" value="${nRow + 1}" />
		</c:forEach>
	</c:if>

							
	<input type="hidden" id="totalCount" value="${totalCount}">