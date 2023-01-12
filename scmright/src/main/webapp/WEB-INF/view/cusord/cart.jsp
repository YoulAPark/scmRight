<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>  <!-- 유저타입이 A가 아니면 기본페이로 -->
</c:if>

 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- abc -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공지사항</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<script src='${CTX_PATH}/js/view/cus/ord/cart.js'></script>

<!-- sweet swal import -->
</head>
<body>
<form id="myForm" action=""  method="">

	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				
				<li class="contents">
		               <!-- contents -->
	               <h3 class="hidden">contents 영역</h3> <!-- content -->
	               <div class="content">
	               
	               <p class="Location">
	                     <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
	                        class="btn_nav bold">주문</span> <span class="btn_nav bold">장바구니 목록</span> 
	                     <a href="../cusord/cartList.do" class="btn_set refresh">새로고침</a>
	                  </p>
	                  <p class="conTitle" style="height:100px;">
                     <span style="line-height:100px" >${userName}님의 장바구니 목록</span> 
	                    <div class="cartList">
						<table class="col" id="dateDay">
							<caption>caption</caption>
							<colgroup>
										 <col width="6%">
										<col width="30%">
										<col width="10%">
										<col width="12%">
										<col width="12%">
										<col width="25%">
										<col width="10%">
							</colgroup>
							
							<thead>
								<tr>
									 <th scope="col"><!-- <input type="checkbox" id="checkAll"  onclick="checkAll()"> -->
									 <input type="checkbox" id="checkAll" ></th>
											<th scope="col">모델명</th>
											<th scope="col">가격</th>
											<th scope="col">수량</th>
											<th scope="col">금액</th>
											<th scope="col">납품 희망일자</th>
											<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody id="cartList">
							</tbody>
						</table>
					</div>
					</div>
					
					<br /><br /><br />
					<div id="cart_hap" style="float:right; width:300px; font-size:20px;">
						<p>
							<span>장바구니 총액</span>
							<br />
							<hr />
							<span>합계 금액</span> 
							<sapn id="hap" name="hap"> &nbsp&nbsp&nbsp 원  </sapn>
							<br /><br />
						</p>
						<div id="cart_deldiv" style="float:right;">
							<a class="btnType blue" name="btn"  id="btnOrder"  ><span>주문하기</span></a>
						</div>
					</div>   
					
					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li><!-- .content 종료 -->
			</ul>
		</div>
	</div><!-- #container 종료 -->
 
</form>
</body>
</html>