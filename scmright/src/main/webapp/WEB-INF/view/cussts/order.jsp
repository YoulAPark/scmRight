<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>주문 현황 / 반품 신청</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>


<link rel="stylesheet" href="${CTX_PATH}/css/chosen/chosen.css">
<script src="${CTX_PATH}/js/chosen/chosen.jquery.js"></script>
<script src='${CTX_PATH}/js/view/cus/sts/order.js'></script>

	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
    
    .chosen-container.chosen-container-single {
    width: 180px !important; /* or any value that fits your needs */
}
	</style>
	
</head>
<body>
	

<!-- 	<div id="refundDetails"></div> -->

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
							<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav">현황</a> <span class="btn_nav bold">주문 현황 / 반품 신청</span>
							<a href="../cussts/orderList.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>주문 현황 / 반품 신청</span> <span class="fr"> 
							</span>
						</p>
						
						<p class="conTitle">
							<span>주문 내역</span> <span class="fr"> 
							</span>
							
								<label style="margin-left: 3%">모델명      </label> 
								<input type="text" style="text-align: center; height:35%;  width:30%; margin-left: 1%" id='searchValue'>
								
								
								<label style="margin-left: 5%">구매일자      </label> 
								<input class="datetype" style="margin-left: 1%" type="date" name = "date"  id="startDate" value="${now}">
							
								<input class="datetype" type="date" name = "date"  id="endDate"  value="${now}" >
								
								<a href="" class="btnType blue" id="btnSearch" name="btn" style="margin-left: 2%"><span>검색</span></a>
						</p>
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="20%">
									<col width="5%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">주문 번호</th>
										<th scope="col">주문 제품</th>
										<th scope="col">총 수량</th>
										<th scope="col">결제 금액</th>
										<th scope="col">구매 일자</th>
										<th scope="col">배송 일자</th>
										<th scope="col">주문 현황</th>
									</tr>
								</thead>
								<tbody id="orderList"></tbody>
							</table>
						</div>
						<div class="paging_area" id="orderListPagination"></div>


						<!-- 제품 클릭 시 상세 내역 출력  -->
						<p class="conTitle">
							<span>상세 내역</span> <span class="fr"> 
							</span>
						</p>
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="7%">
									<col width="10%">
									<col width="8%">
									<col width="20%">
									<col width="8%">
									<col width="8%">
									<col width="15%">
<%-- 									<col width="8%">
									<col width="7%"> --%>
								</colgroup>

								<thead>
									<tr>
										<th scope="col">체크</th>
										<th scope="col">주문 번호</th>
										<th scope="col">제품 번호</th>
										<th scope="col">제품 구분</th>
										<th scope="col">제품 명</th>
										<th scope="col">제조사</th>
										<th scope="col">주문 수량</th>
										<th scope="col">결제 금액</th>
<!-- 										<th scope="col">환불 수량</th>
										<th scope="col">환불 금액</th> -->
									</tr>
								</thead>
								<tbody id="orderDetail">
								
								</tbody>
							</table>
							
							<div class="btn_areaC mt30" style="margin-bottom: 30px;">
							<a href="" class="btnType blue" id="btncheckRefundDetail" name="btn" ><span>반품 요청</span></a>
							 </div>
						</div>
						
					</div> <!--// content -->
					
					<!-- 반품 내역 상세보기 모달 팝업 -->
					<div id="refundDetail" class="layerPop layerType2" style="width: 900px;">
					<dl>
						<dt>
							<strong>반품 지시서 작성</strong>
						</dt>
						<dd class="content">
							<!-- s : 여기에 내용입력 -->
							
							<table class="col" id ="refundDetailTable">
								<caption>caption</caption>
								<colgroup>
								
									<col width="4%">
									<col width="12%">
									<col width="12%">
									<col width="8%">
									<col width="16%">
									<col width="10%">
								</colgroup>
			
								<thead>
									<tr>
										<th scope="col">주문 번호</th>
										<th scope="col">반품 제품 번호</th>
										<th scope="col">반품 제품명</th>
										<th scope="col">반품 수량</th>
										<th scope="col">반품 사유</th>
										<th scope="col">환불 예정 금액</th>
									</tr>
								</thead>
								<tbody id="refund_tbody" >
								
									<tr>
											<td><input type="text" id="coNo" name="coNo"></input><!-- <input type="text"  name="coNo" id="coNo" readonly> --></td>
											<td ><input  type="text" id="prodNo" name="prodNo"></input></td>
											
											<td ><input  type="text" id="prodName" name="prodName"></input></td>
											<td><input type="text" id="coCnt" name="coCnt"></input></td>
											<td>
												<select name="refundInfo">
													<option value="">사유선택</option>
													<option value="상품 불량" selected="selected">상품 불량</option>
													<option value="상품 파손">상품 파손</option>
													<option value="오 배송">오 배송</option>
													<option value="주문착오">주문착오</option>	
													<option value="상품 불만족">상품 불만족</option>
												</select>
											</td>
											<td><input  type="text" id="totalRefundPrice" name="totalRefundPrice"></input></td>
										</tr>
								</tbody>
							</table>
							<div class="btn_areaC mt30">
							
								<a ><span style = " font-size:1.3em; ">환불 계좌 정보 : </span></a>
								<a id="refundBankInfo"   style = " font-size:1.3em;" ></a>
								<!-- <input type="text"  name="refundBankInfo" id="refundBankInfo" readonly> -->
							</div>
							
							<div class="btn_areaC mt30">
								<a ><span style = " font-size:1.3em; " >수거 예정 지역 : </span></a>
								<a id="refundAddressInfo"  style = " font-size:1.3em;" ></a>
							<!-- 	<input type="text"   name="refundAddressInfo" id="refundAddressInfo" readonly> -->
							</div>
			
							<div class="btn_areaC mt30">
								<a href="" class="btnType blue" id="btnrequestRefund" name="btn"><span>반품신청</span></a>
								<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
							</div>
						</dd>
					</dl>
				</div>


					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>