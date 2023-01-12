<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>


<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	// 상세코드 페이징 설정
	var pagesize = 5;
	var pagenumsize = 5;

	/** OnLoad event */
	$(function() {
		// 일일 수주 조회
		appReturnList();

		// 창고 가져오기
		selectComCombo("wh", "whall", "all", "", ""); // 창고  whall : selectbox ID   value :  strNo

	});

	/** 반품 신청 목록 조회 */
	function appReturnList(clickpagenum) {

		clickpagenum = clickpagenum || 1;

		var param = {
			retADate : $("#daterange").val(),
			searchKey : $("#sname").val(),
			selectKey : $("select[name=searchKey]").val(),
			clickpagenum : clickpagenum,
			pagesize : pagesize
		};
		
		console.log("retADate : " + param.retADate);

		var searchcallback = function(returndata) {

			console.log("returndata : " + returndata);

			searchcallbackprocess(returndata, clickpagenum);

		}

		callAjax("AdmstdAppReturnList.do", "post", "text", true, param,
				searchcallback);

	}

	//리스트 조회후 tbody에 리스트 주입 후 페이징 처리
	function searchcallbackprocess(returndata, clickpagenum) {

		clickpagenum = clickpagenum || 1;

		$("#refundList").empty().append(returndata);

		var totalcnt = $("#searchlistcnt").val();

		console.log("totalcnt :" + totalcnt);

		var paginationHtml = getPaginationHtml(clickpagenum, totalcnt,
				pagesize, pagenumsize, 'appReturnList');
		console.log("paginationHtml : " + paginationHtml);

		$("#listPagination").empty().append(paginationHtml);

		$("#hclickpagenum").val(clickpagenum);

	}
	
	function refundModalOpen(retNo,retADate,prodNo,prodName,retCnt,retPrice,retEsts) {
		
		if(retEsts > 0) {
			alert("이미 승인된 내역입니다.");
			return
		}
		
		$("#refund_no").prepend(retNo); // 반품코드
		$("#refund_date").prepend(retADate); // 반품 일자
		$("#pro_no").prepend(prodNo); // 제품 번호
		$("#pro_name").prepend(prodName); // 제품명
		$("#refund_qty").prepend(retCnt); // 반품 수량
		$("#total_price").prepend(retPrice); // 총금액
			
		gfModalPop("#refundDoc");
		
		/* var param = {
				
				retNo : retNo
			
				};
			var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);	
			
			$("#pur_pro_no").append(returndata.result.prodNo);
			$("#prod_no").val(prodNo);
			$("#pur_pro_name").append(returndata.result.prodName);
			$("#pur_deli_company").prepend(returndata.result.supName);
			$("#pur_login_id").prepend(returndata.loginId);
			
			gfModalPop("#refundDoc");
			
		}
			
		callAjax("order.do", "post", "json", true, param, searchcallback); */
		
	}
	
	function refundModalClosed() {
		
		$("#refund_no").empty();
		$("#refund_date").empty();
		$("#pro_no").empty();
		$("#pro_name").empty();
		$("#refund_qty").empty();
		$("#total_price").empty();
		$("#whall").val("");
		
	}
	
	function returnAuthorization() {
		var param = {
					
			retNo : $("#refund_no").text(),
			strNo : $("select[name=whall]").val()
		};
		
		var searchcallback = function(returndata){
		
		console.log("returndata : " + returndata);	
		
		location.href = "AdmstdAppReturn.do";
		
		}
				
		callAjax("returnUpdate.do", "post", "json", true, param, searchcallback);
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
 
        	appReturnList();
        }
	}
	
</script>

</head>
<body>
	<input type="hidden" id="hclickpagenum" name="hclickpagenum" value=""/>

	<div id="wrap_area">

	<h2 class="hidden">header 영역</h2>
	<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

	<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb"><jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a>
							<span class="btn_nav">거래 내역</span>
							<span class="btn_nav bold">반품 신청 목록</span> 
							<a onClick="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle" id="searcharea">
							<span>반품 신청 목록 </span> <span class="fr">

								<select id="searchKey" name="searchKey" style="width: 150px; height: 32px;" >
									<option value="all" selected="selected">반품 전체</option>
									<option value="com_name">기업명</option>
									<option value="refund_no">반품 코드</option>
									<option value="pro_no">제품 번호</option>
									<option value="pro_name">제품명</option>
								</select> 
								<input type="date" id="daterange" class="daterange" style="width: 150px; height: 30px;"> 
								<input type="text" style="width: 200px; height: 30px;" id="sname" onkeypress="enterkey()">
								<a class="btnType blue" id="btnSearch" onclick="appReturnList()" style="cursor: pointer;"><span>검색</span></a>
							</span>
						</p>

						<!-- 화면에뿌려줄 목록 -->
						<div class="div">
							<table class="col">
								<caption>caption</caption>

								<thead>
									<tr>
										<th scope="col" width="15%">기업명</th>
										<th scope="col">반품 코드</th>
										<th scope="col">반품 신청일</th>
										<th scope="col">제품 번호</th>
										<th scope="col">제품명</th>
										<th scope="col">주문 수량</th>
										<th scope="col">반품 수량</th>
										<th scope="col">반품 총 금액</th>
										<th scope="col">반품지시서</th>
									</tr>
								</thead>
								
								<tbody id="refundList"></tbody>
								
							</table>

							<!-- 페이징 처리  -->
							<div class="paging_area" id="listPagination"></div>
						</div>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> 
					<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 반품지시서  모달 -->
	<div id="refundDoc" class="layerPop layerType2"
		style="width: 1000px; height: auto;">
		<input type="hidden" id="refund" name="modal">
		<!-- 수정시 필요한 refund_no 값을 넘김  -->
		<dl>
			<dt>
				<strong>반품 지시서</strong>
			</dt>
			<dd class="content">
				<table class="col">
					<caption>모달창첫줄</caption>
					<colgroup>
						<col width="10%">
						<col width="12%">
						<col width="10%">
						<col width="6%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">반품 코드</th>
							<th scope="col">반품 신청일</th>
							<th scope="col">제품번호</th>
							<th scope="col">제품명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="refund_no"></td>
							<td id="refund_date"></td>
							<td id="pro_no"></td>
							<td id="pro_name"></td>
						</tr>
					</tbody>
				</table>

				<table class="col">
					<caption>모달창둘째줄</caption>
					<colgroup>
						<col width="10%">
						<col width="12%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">반품 수량</th>
							<th scope="col">총금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="refund_qty"></td>
							<td id="total_price"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="origin_ware_no" name="origin_ware_no"
					value="">
				<table class="row">
					<caption>선택박스</caption>
					<colgroup>
						<col width="15%">
						<col width="5%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">창고 선택</th>
							<td><select style="width: 200px" id="whall"
								name="whall">
							</select></td>
						</tr>

					</tbody>
				</table>

				<div class="btn_areaC mt30">
					<a class="btnType blue" onclick="returnAuthorization()" style="cursor: pointer;"><span>승인요청</span></a>
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a class="closePop" onclick="refundModalClosed()"><span class="hidden">창닫기</span></a>
	</div>

</body>
</html>