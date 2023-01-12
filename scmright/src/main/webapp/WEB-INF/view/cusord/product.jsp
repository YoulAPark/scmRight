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
<script src='${CTX_PATH}/js/view/cus/ord/product.js'></script>

<!-- sweet swal import -->
</head>
<body>
<form id="myForm" action=""  method="">
<%-- 	<input type="hidden" id="detail_att_no" name="detail_att_no" value="${detailProduct.att_no }">
	<input type="hidden" id="detail_mfName" name="detail_mfName" value="${detailProduct.mfName }">
	<input type="hidden" id="detail_selPrice" name="detail_selPrice" value="${detailProduct.selPrice }">
	<input type="hidden" id="detail_prodInfo" name="detail_prodInfo" value="${detailProduct.drodInfo }"> --%>
	
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
	                        class="btn_nav bold">주문</span> <span class="btn_nav bold">제품 목록</span> 
	                     <a href="../cusord/productList.do" class="btn_set refresh">새로고침</a>
	                  </p>
	
	                  <p class="conTitle" style="height:100px;">
                     <span style="line-height:100px">제품 목록</span> 
	                     
	                     
					<table width="100%" cellpadding="5" cellspacing="0" border="1" align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:right;padding-right:25px;">
                               <select id="searchCt"  name="searchCt" style="width: 150px;"> </select>
     	                       <!-- <select id="searchCt" name="searchCt" style="width: 150px;">
									<option value =""></option>
							    </select>  -->
						        <select id="searchPn" name="prosearchMfdall"  style="width:150px; "> </select>
     	                      	<!-- <select  style="width:150px; "id="searchMf" >
									<option></option>					
							 	</select> -->
								
     	                       <input type="text" style="width: 150px; height: 25px;" id="searchValue" name="searchValue">                    
	                           <a href="" id = "btnSearch" class="btnType blue"  name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> &nbsp;&nbsp;     
		                     
		                     
	                    <div class="productList">
						<table class="col" id="dateDay">
							<caption>caption</caption>
							<colgroup>
								<col width="10%">
								<col width="35%">
								<col width="20%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제품명</th>
									<th scope="col">제품분류</th>
									<th scope="col" >제조사</th>
									<th scope="col">가격</th>
								</tr>
							</thead>
							<tbody id="productList"></tbody>
						</table>
					</div>
					</div>
					
					<!-- 제품 목록 페이징  -->
					<div class="paging_area"  id="productListPagination"></div>
					

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
 
 <!-- 제품 상세보기 모달 팝업  start-->
  	<div id="detailProduct" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>제품 상세보기</strong>
			</dt>
			<dd class="content">
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">모델번호</th>
							<td><input type="text" maxlength="15" name="prodNo" id="prodNo" readonly></td>
							<th scope="row">제품이미지</th>
							<td colspan="2" style="text-align:center;">
								 	<img id="att_no" style="object-fit: cover;max-width:100%" src="" alt="제품사진미리보기" >
							</td>
						</tr>
						<tr>
							<th scope="row">제조사</th>
							<td><input type="text" maxlength="15" name="mfName" id="mfName"  value=""  readonly /></td>
								
							<th scope="row">주문수량</th>
							
							
							<!-- <input type="text"  name="od_qty" id="od_qty" value = "1"  /> -->
							
							<td><input type="number" id="productCnt" name = "productCnt" value="1"  class="num" min="1" /></td>
						</tr>
				
						<tr>
							<th scope="row">판매가격 </th>
							<td><input type="text" maxlength="10" name="totalPrice"  id="totalPrice"  readonly></td>
							
							<th scope="row">납품희망일</th>
							<td><input type="date" id="deliveryDate" name = "deliveryDate"   ></td>
						</tr>
						
						<tr>
							<th scope="row">상세정보</th>
								<td colspan="3">
							<textarea id="prodInfo" maxlength="500" name="prodInfo"  
											style="height:130px;outline:none;resize:none;" placeholder="여기에 상세정보를 적어주세요.(500자 이내)"  readonly></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnAddCart" name="btn"><span>장바구니</span></a> 
					<a class="btnType blue" id=btnOrderDeposit  name="btn">
									<span>주문하기</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
	</div>
	
	<!-- 제품 상세보기 모달 팝업 end -->
	
	<!-- 무통장입금 계좌 내역과 주문 가격 모달 팝업 start -->
		<div id="orderDeposit" class="layerPop layerType2" style="width: 500px; height: 400px;">
           <dl>
			<dt>
				<strong>주문하기</strong>
			</dt>
			<dd class="content">
		
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					
					<tbody>
						<tr>
							<th style="width:70px" scope="row">은행명<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="bank_name" id="bank_name">신한은행</span></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">계좌번호<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="user_account" id="user_account">01124567885</span></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">예금주<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="name" id="name">(주)해피잡</span></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">결제금액<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="totalHap" id="totalHap" >*</span></td>
						</tr>
						
							
					</tbody>
					
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnOrder" name="btn" ><span>주문하기</span></a>
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<!-- 무통장입금 계좌 내역과 주문 가격 모달 팝업 end -->
     </div>
	
</form>
</body>
</html>