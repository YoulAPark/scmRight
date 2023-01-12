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
			<c:forEach items="${list}" var="list"> <!-- tr :행 / td: 열 -->
				<tr>	
					<td>${list.prodName}</td>
					<td>${list.coCnt}</td>
					<td>${list.strNo}</td>
					<td>${list.strName}</td>
					<td>${list.totalStrAddr}</td>
					<td>${list.delSts}</td>
				</tr>
			</c:forEach>
		</c:if>

	<!-- 클릭이벤트 동작이 안됨 : 태그 닫힌 부분 있는지 없는지 확인해봐야 알 수 있음 / 임시적으로 onclick이벤트 사용-->
	<!-- <a><span onclick="">배송하기</span></a>
	<a href="javascript:fbtnDtl()" class="btnType White" id="btnDtlCancle" name="btn"><span>취소</span></a>
	-->		
	<c:forEach items="${list}" var="list"> 
		<a class="btnType blue"><span onclick="fbtnDel(${list.delNo})">배송하기</span></a>
		<a class="btnType white"><span onclick="fbtnCancle()">취소</span></a>	
	</c:forEach>
	
	<input type="hidden" id="totalCount" value="${totalCount}">