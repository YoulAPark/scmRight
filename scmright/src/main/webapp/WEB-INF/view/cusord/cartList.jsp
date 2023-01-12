<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<c:if test="${ totalCartCnt eq 0 }" >
				<tr>
						<td colspan="5">장바구니에 제품이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ totalCartCnt > 0 }" >
				<c:forEach var ="product" items="${cartList }">
					<tr id="productTr">
							<td><input type="checkbox"  id="checkProduct"  class="checkProduct"  onclick="sumTotalPrice()"></td>
							<td>${product.prodName }</td>
							<%-- <td><a href = "javascript:fPopModalProductDetail('${product.prodNo}');">${product.prodName}</a></td> --%>
							<td>${product.selPrice }</td>
							<td>${product.cartCnt }</td>
							<td>${product.selPrice  * product.cartCnt }</td>
							<td ><input value="${product.cartDel }" onClick="changeDate()"></td>
							<td><a class="btnType3 color1"  name="btn"  id="btnSDelete" onclick="fRemoveProduct('${product.prodNo}')"><span>삭제</span></a></td>
					</tr>
				</c:forEach>
			</c:if>		
			
