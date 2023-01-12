<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<%-- <c:forEach items="${orderDetail}" var="detail"> --%>
				<tr>
					<td><input type="checkbox"  id="refundCheck" ></td>
					<td>${orderDetail.coNo}</td>
					<td>${orderDetail.prodNo}</td>
					<td>${orderDetail.prodCate}</td>
					<td>${orderDetail.prodName}</td>
					<td>${orderDetail.mfName}</td>
					<td>${orderDetail.coCnt}</td>
					<td>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDetail.selPrice * orderDetail.coCnt }" />
					</td>
				</tr>
					<input type="hidden" id="shipSts" value="${orderDetail.coSts }" />
					<input type="hidden" id="refundCoNo" value="${orderDetail.coNo }" />
			<%-- </c:forEach> --%>
			
		