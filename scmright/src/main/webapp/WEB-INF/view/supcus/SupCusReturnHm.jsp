<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Chain Maker :: 주문 내역 입금확인</title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<c:if test="${sessionScope.userType ne 'D'}">
	<c:redirect url="/dashboard/dashboard.do" />
</c:if>

<script>
	//페이징 설정
	var pageSizeOrderDepositProcessing = 10;
	var pageBlockSizeOrderDepositProcessing = 10;

	var pageSizeModalOrderDepositProcessingDtl = 5;
	var pageBlockSizeModalOrderDepositProcessingDtl = 5;
	
	var currentOrderNum;

	var checkBoxStatus;


	//페이지 로드시 실행 (Onload Event)
	$(document).ready(function(){
		
		//구매담당자_기업고객_주문내역 조회
		orderDepositProcessingList();
		
		//체크박스 설정 시 조회
		checkBoxStatus();
		
		//엔터작동 시 검색 진행
		$("#searchWord").keypress(function (e) {
		    if (e.which == 13){
		    	searchOrderDepositProcessingList();
		    }
		});	
		setDatePicker();
	});


	function setDatePicker() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#startDate").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					nextText : '다음 달',
					prevText : '이전 달',
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					showAnim : "slide", //애니메이션을 적용한다.
					dateFormat : "yy-mm-dd",
					maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
					onClose : function(selectedDate) {
						//시작일(startDate) datepicker가 닫힐때
						//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						$("#endDate").datepicker("option", "minDate",
								selectedDate);

						var endDate = $("#endDate").val();
					}
				});
		$("#endDate").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					nextText : '다음 달',
					prevText : '이전 달',
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					showAnim : "slide", //애니메이션을 적용한다.
					dateFormat : "yy-mm-dd", // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
					onClose : function(selectedDate) {
						// 종료일(endDate) datepicker가 닫힐때
						// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
						$("#startDate").datepicker("option", "maxDate",
								selectedDate);

						var startDate = $("#startDate").val();
					}
				});

		$("#startDate").datepicker('setDate', 'today');
		$("#endDate").datepicker('setDate', 'today');
	}

	function orderDepositProcessingList(clickpagenum) {

		clickpagenum = clickpagenum || 1;

		var param = {
			/* searchvalue : $("#searchvalue").val(), */
			clickpagenum : clickpagenum,
			pageSize : pageSizeOrderDepositProcessing
		};

		var searchcallback = function(returndata) {

			console.log("returndata : " + returndata);

			searchcallbackprocess(returndata, clickpagenum);

		}

		callAjax("/supcus/SupCusReturnHmList.do", "post", "text", true, param,
				searchcallback);

	}

	function searchcallbackprocess(returndata, clickpagenum) {

		clickpagenum = clickpagenum || 1;

		$("#listOrderDepositProcessing").empty().append(returndata);

		var orderDepositProcessingTotal=$("#orderDepositProcessingTotal").val();
		var totalcnt = $("#searchlistcnt").val();

		var paginationHtml = getPaginationHtml(clickpagenum,
				orderDepositProcessingTotal, pageSizeOrderDepositProcessing,
				pageBlockSizeOrderDepositProcessing,
				"orderDepositProcessingList");
		
		
		$("#orderDepositProcessingPagination").empty().append(paginationHtml);
		$("#orderDepositProcessingPagination").empty().append(paginationHtml);

		$("#clickpagenum").val(clickpagenum);

		$("#classEquipList").hide();
	}

	//체크박스 상태에 상태 변경에 대한 처리
	function checkBoxStatus(clickpagenum) {
		clickpagenum = clickpagenum || 1;

		$("#orderBuyerStatusCheck").change(
				function() {
					if ($("#orderBuyerStatusCheck").is(":checked")) {
						checkBoxStatus = "checked";

					} else {
						checkBoxStatus = "unChecked";
					}

					var param = {
						clickpagenum : clickpagenum,
						pageSize : pageSizeOrderDepositProcessing,
						checkBoxStatus : checkBoxStatus
					}

					var resultCallback = function(data) {
						checkBoxListResult(data, clickpagenum);
					}
					callAjax("/supcus/SupCusReturnHmList.do", "post", "text",
							true, param, resultCallback);
				});
	}

	//구매담당자_기업고객_반품내역 조회 & 검색
	function searchOrderDepositProcessingList(clickpagenum) {
		clickpagenum = clickpagenum || 1;

		var searchKey = document.getElementById("searchKey").value;
		var searchWord = document.getElementById("searchWord").value;

		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		//alert(typeof startDate+" => "+startDate+"\n"+typeof endDate+" => "+endDate);

		if ($("#orderBuyerStatusCheck").is(":checked")) {
			//alert("checked");
			checkBoxStatus = "checked";

		} else {
			//alert("unChecked");
			checkBoxStatus = "unChecked";
		}

		var param = {
			clickpagenum : clickpagenum,
			pageSize : pageSizeOrderDepositProcessing,
			searchKey : searchKey,
			searchWord : searchWord,
			startDate : startDate,
			endDate : endDate,
			checkBoxStatus : checkBoxStatus
		}

		var resultCallbackSearch = function(data) {
			checkBoxListResult(data, clickpagenum);
			location.href="/supcus/SupCusReturnHm.do";
		}
		callAjax("/supcus/SupCusReturnHmList.do", "post", "text", true, param,
				resultCallbackSearch);
	}

	//구매담당자_기업고객_주문내역 단건 조회
	function orderDepositProcessingSelect(retNo, retEsts) {

		var param = {

				retNo : retNo

		}

		var resultCallback = function(data) {
			orderDepositProcessingSelectResult(data);

		}

		callAjax("/supcus/SelectReturnList.do", "post", "json", true, param,
				resultCallback);

	}
	//구매담당자_기업고객_주문내역 단건 조회 콜백
	function orderDepositProcessingSelectResult(data) {

		//모달 팝업
		gfModalPop("#layer1");
		//모달 초기화 및 정보 넣기 함수 호출
		setOrderDepositProcessingModal(data.SupCusOrderHmDetailModel);
	}

	//모달 초기화 및 정보 넣기
	function setOrderDepositProcessingModal(object) {
		if (object == "" || object == null || object == undefined) {
			$("#retNo").val("");
			$("#prodName").val("");
			$("#retCnt").val("");
			$("#bankNo").val("");

		} else {
			$("#retNo").val(object.retNo);
			$("#prodName").val(object.prodName);
			$("#retCnt").val(object.retCnt);
			$("#bankNo").val(object.bankNo);
			currentOrderNum = object.retNo;
		}
	}

	//구매담당자_기업고객_주문내역 단건 상세 조회
	function orderDepositProcessingDtlList(retNo, clickpagenum) {
		clickpagenum = clickpagenum || 1;

		var param = {
			retNo:retNo,
			clickpagenum:clickpagenum,
			pageSize:pageSizeModalOrderDepositProcessingDtl

		}
		console.log("!!!");
		var resultCallback = function(data) {
			orderDepositProcessingDtlListResult(data, clickpagenum);
			console.log("!!!!!!!!!");
		}
		callAjax("/supcus/SupCusReturnHmDetailList.do ", "post", "text", true,
				param, resultCallback);
	}

	//구매담당자_기업고객_주문내역 단건 상세 조회 콜백
	function orderDepositProcessingDtlListResult(data, clickpagenum) {

		console.log("들어오니?");
		//기존 목록 삭제 및 가져온 정보 넣기
		$("#listModalOrderDepositProcessingDtl").empty();
		$("#listModalOrderDepositProcessingDtl").append(data);
		//구매담당자_발주 지시서 목록 조회 카운트
		var searchlistcnt = $("#searchlistcnt").val();
	}

	//구매자 입금확인 
	function confirmDeposit() {

		var param = {
				retNo : currentOrderNum
		}

		var resultCallback = function(data) {
			confirmDepositResult(data);
		}

		callAjax("ReturnConfirmDeposit.do", "post", "json", true, param,
				resultCallback);
	}
	//구매자 입금확인 콜백
	function confirmDepositResult(data) {
		swal("구매자 입금 현황 변경\n 입금현황 : 입금 확인");
		//모달 팝업
		gfCloseModal();

		searchOrderDepositProcessingList();
	}

	//체크박스 상태에 상태 변경에 대한 처리
	function checkBoxStatus(clickpagenum) {
		clickpagenum = clickpagenum || 1;
	
		$("#orderBuyerStatusCheck").change(
				function() {
					if ($("#orderBuyerStatusCheck").is(":checked")) {
						checkBoxStatus = "checked";

					} else {
						checkBoxStatus = "unChecked";
					}

					var param = {
							
						clickpagenum : clickpagenum,
						pageSize : pageSizeOrderDepositProcessing,
						checkBoxStatus : checkBoxStatus
					}

					var resultCallback = function(data) {
						console.log("!!!!!!!!!!");
						checkBoxListResult(data, clickpagenum);
					}
					callAjax("/supcus/SupCusReturnHmList.do", "post", "text",
							true, param, resultCallback);
				});
	}

	//체크 박스 상태에 따른 화면 출력
	function checkBoxListResult(data, clickpagenum) {

		//기존 목록 삭제 및 가져온 정보 넣기
		$("#listOrderDepositProcessing").empty();
		$("#listOrderDepositProcessing").append(data);

		//구매담당자_발주 지시서 목록 조회 카운트
		var orderDepositProcessingTotal = $("#searchlistcnt").val();
		
		// 페이지 네비게이션 생성	
		var paginationHtml = getPaginationHtml(clickpagenum,
				orderDepositProcessingTotal, pageSizeOrderDepositProcessing,
				pageBlockSizeOrderDepositProcessing, "checkBoxList");
		$("#orderDepositProcessingPagination").empty().append(paginationHtml);
		$("#currentPageOrderDepositProcessing").val(clickpagenum);
	}

	function rowClickEvent(retNo, retEsts) {

		if (retEsts === "0") {
			$("#btnDepositConfirm").show();
		} else if (retEsts === "1") {
			$("#btnDepositConfirm").hide();
		}

		//구매담당자_발주 지시서 단건 조회 함수 호출

		orderDepositProcessingSelect(retNo);
		orderDepositProcessingDtlList(retNo);

	}
	//체크 박스 상태에 따른 조회 내역 페이지네이션 정보
	function checkBoxList(currentPage) {
		currentPage = currentPage || 1;

		var searchKey = document.getElementById("searchKey").value;
		var searchWord = document.getElementById("searchWord").value;

		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();

		//체크박스 상태에 따라 파라미터 값 변경
		if ($("#orderBuyerStatusCheck").is(":checked")) {
			checkBoxStatus = "checked";

		} else {
			checkBoxStatus = "unChecked";
		}

		var param = {
			currentPage : currentPage,
			pageSize : pageSizeOrderDepositProcessing,
			searchKey : searchKey,
			searchWord : searchWord,
			startDate : startDate,
			endDate : endDate,
			checkBoxStatus : checkBoxStatus
		}

		var resultCallback = function(data) {
			checkBoxListResult(data, currentPage);
		}
		callAjax("/supcus/SupCusReturnHmList.do", "post", "text", true, param,
				resultCallback);

	}
</script>
</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" name="currentPageOrderDepositProcessingOrder"
			id="currentPageOrderDepositProcessingOrder" value=""> <input
			type="hidden" name="currentPageModalOrderDepositProcessingDtl"
			id="currentPageModalOrderDepositProcessingDtl" value=""> <input
			type="hidden" id="deliCompanyEmail" name="deliCompanyEmail" value="" />
		<input type="hidden" id="currentOrderNum" name="currentOrderNum"
			value="" />

		<div id="wrap_area">

			<!-- header Include -->
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb Include --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>

					</li>
					<li class="contents">
						<div class="content">
							<!-- 메뉴 경로 영역 -->
							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<a href="#" class="btn_nav">기업고객</a> <span class="btn_nav bold">주문내역관리</span>
								<a href="/pcm/orderDepositProcessing.do" class="btn_set refresh">새로고침</a>
							</p>

							<!-- 검색 영역 -->
							<p class="search"></p>
							<p class="conTitle" id="searchArea">
								<span>구매담당자_기업고객_반품내역</span> <span class="fr"> <select
									id="searchKey" name="searchKey" style="width: 80px;">
										<option value="loginID" id="option1" selected="selected">전체</option>
										<option value="loginID" id="option2">주문신청고객</option>
										<option value="prodName" id="option3">제품 명</option>
								</select> <input type="text" id="searchWord" name="searchWord"
									placeholder="검색어를 입력하세요." style="height: 28px;" /> <input
									type="text" id="startDate" name="startDate"
									placeholder="시작일 선택" style="height: 28px; width: 80px"
									readonly="readonly"></input> <input type="text" id="endDate"
									name="endDate" placeholder="종료일 선택"
									style="height: 28px; width: 80px" readonly="readonly"></input>
									<a class="btnType blue"
									href="javascript:searchOrderDepositProcessingList()"
									onkeydown="enterKey()" name="search"> <span
										id="searchEnter">검색</span></a>
								</span>
							</p>
							<span class="fr"> <input type="checkbox"
								id="orderBuyerStatusCheck"> 미송금 목록 조회
							</span>

							<!-- 테이블 영역 -->
							<div class="divOrderDepositProcessingOrder"
								id="divOrderDepositProcessingOrder">
								<table class="col">
									<colgroup>
										<col width="2%">
										<col width="6%">
										<col width="8%">
										<col width="4%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">반품번호</th>
											<th scope="col">반품신청고객</th>
											<th scope="col">반품날짜</th>
											<th scope="col">송금확인</th>
										</tr>
									</thead>

									<!-- 상단 테이블 정보 출력 -->
									<tbody id="listOrderDepositProcessing">
									</tbody>
								</table>
							</div>
							<!-- .divOrderDepositProcessingOrderList 종료 -->

							<!-- 테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea" id="orderDepositProcessingPagination"></div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<!-- Modal 시작 -->
		<div id="layer1" class="layerPop layerType2" style="width: 900px;">
			<dl>
				<dt>
					<strong>주문고객 입금 확인</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="50px">
							<col width="40px">
							<col width="50px">
							<col width="60px">
							<col width="50px">
							<col width="60px">
							<col width="70px">
							<col width="120px">
						</colgroup>

						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td><input style="text-align: center;" type="text"
									class="inputTxt p100" name="retNo" id="retNo" readonly="readonly" /></td>
								<th scope="row">주문고객</th>
								<td><input style="text-align: center;" type="text"
									class="inputTxt p100" name="prodName" id="prodName"
									readonly="readonly" /></td>
								<th scope="row">주문총액</th>
								<td><input style="text-align: center;" type="text"
									class="inputTxt p100" name="retCnt" id="retCnt"
									readonly="readonly" /></td>
								<th scope="row">은행/계좌번호</th>
								<td><input style="text-align: center;" type="text"
									class="inputTxt p100" name="bankNo" id="bankNo"
									readonly="readonly" /></td>
							</tr>
						</tbody>
					</table>
					<table class="row col mt20" id="modalOrderDepositProcessingDtlList">
						<colgroup>
							<col width="8%">
							<col width="5%">
							<col width="6%">
							<col width="7%">
						</colgroup>
						<thead>
							<tr style="background-color: silver;">
								<th scope="row" style="font-weight: bold;">제품</th>
								<th scope="row" style="font-weight: bold;">수량</th>
								<th scope="row" style="font-weight: bold;">가격</th>
								<th scope="row" style="font-weight: bold;">합계</th>
							</tr>
						</thead>
						<tbody id="listModalOrderDepositProcessingDtl">
						</tbody>


					</table>
					<!-- 테이블 페이지 네비게이션 영역 -->
					<div class="pagingArea"
						id="ModalOrderDepositProcessingDtlPagination"></div>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="javascript:confirmDeposit()" class="btnType blue"
							id="btnDepositConfirm" name="btn"><span>반품 확인</span></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:gfCloseModal()" class="btnType gray"
							name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
		<!-- Modal 종료 -->

	</form>
</body>
</html>