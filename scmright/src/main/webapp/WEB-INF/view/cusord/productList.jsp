<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




			<c:if test="${ totalProductCnt eq 0 }" >
				<tr>
						<td colspan="5">제품이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ totalProductCnt > 0 }" >
				<c:forEach var ="product" items="${productList }">
					<tr>
							<td>${product.prodNo }</td>
							<td><a href = "javascript:fPopModalProductDetail('${product.prodNo}');">${product.prodName}</a></td>
							<td>${product.prodCate }</td>
							<td>${product.mfName }</td>
							<td>${product.selPrice }</td>
					</tr>
				</c:forEach>
			</c:if>		
			
			<!-- 컨트롤러에서 model에 저장한 상품총개수를 product.jsp로 전달해줘야함. -->
			<input type="hidden" id="totalProductCnt" name="totalProductCnt" value="${totalProductCnt}"/>	
			
