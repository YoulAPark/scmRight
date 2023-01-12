var pageRow = 5; // 한 페이지당 보여지는 제품 수 
var pageBlockSize = 5;    //화면에 보여지는 페이지 넘버 1 2 3 4 5 개수


$(function() {
	
		fOrderList();
		fRegisterButtonClickEvent();

});


/** 버튼 이벤트 등록 */
function fRegisterButtonClickEvent() {
	$('a[name=btn]').click(function(e) {
		e.preventDefault();

		var btnId = $(this).attr('id');
		
		switch (btnId) {
			case 'btnSearch' : // 검색 버튼
				fOrderList();
				break;
			case 'btncheckRefundDetail' : //반품요청(반품지시서 작성 모달창 뜨기)
				is_checked();
				break;
			case 'btnrequestRefund' : //반품 신청 완료
				fRequestRefund();
				break;
			case 'btnClose' :
				gfCloseModal();
				
				break;
				
		}
	});
}

/* 1. 주문 목록 전체 조회*/
function fOrderList(currentPage){
	
	//현재 페이지 값이 없으면 1로 설정
	currentPage  = currentPage || 1;
	
	var searchValue = $('#searchValue').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	var param = {
			searchValue : searchValue,
			currentPage : currentPage,
			pageRow : pageRow,
			startDate:startDate,
			endDate:endDate
	}
	
	var resultcallback = function(returndata){
			console.log("returndata" + returndata);
			callBackOrderList(returndata,currentPage);
	}
	
	callAjax("/cussts/orderList.do","post","text",true,param,resultcallback);
	
}

/*1-2 주문 내역 전체 조회 콜백 함수*/
function callBackOrderList(returndata,currentPage){
	
	$('#orderList').empty().append(returndata);
	
	var totalOrderCnt = $('#totalOrderCnt').val();
	
	var pagingHtml = getPaginationHtml(currentPage,  totalOrderCnt  ,pageRow ,pageBlockSize,'fOrderList');
	
	console.log('pagingHtml' + pagingHtml);
	
	
	$('#orderListPagination').empty().append(pagingHtml);
}

/*2.내역 하나 클릭 시 상세 조회*/
function fOrderDetail(coNo){
	
	console.log(coNo);
	var param = {
			coNo : coNo
	}
	
	var resultcallback = function(returndata){
		console.log("returndata" + returndata);
		callBackOrderDetail(returndata);
	}
	
	callAjax("orderDetail.do","post","text",true,param,resultcallback);
	
}

function callBackOrderDetail(returndata){
	
	console.log(returndata);
	$('#orderDetail').empty().append(returndata);
	
	
}

/*3. 주문 상세내역에서 반품을 위한 주문 내역 체크박스 체크 여부*/
function is_checked(){
	var is_checked = $('#refundCheck').is(':checked');
	var shipSts = $("#shipSts").val();

	
	if(!is_checked){
		alert('반품하실 제품을 클릭해 주세요.');
	}else if(shipSts != 'complete'){
		alert('배송 완료 된 상품만 반품 신청이 가능합니다.');
	}else if(is_checked&&shipSts=='complete'){
		fcheckRefundDetail();
	}
	
	
}

/*3-1 반품 내역 상세보기 모달 팝업*/
function fcheckRefundDetail(){
	
	var coNo = $('#refundCoNo').val();
	var param ={
			coNo : coNo
	}
	
	var resultcallback = function(returndata){
		console.log("returndata : "+returndata);
		callbackRefundDetail(returndata);
	}
	
	callAjax("refundDetail.do","post","json",true,param,resultcallback);
	
	
}

/*3-1 반품 내역 상세보기 콜백함수*/
function callbackRefundDetail(returndata){
	
	gfModalPop("#refundDetail");
	fRefundDetailData(returndata.refundDetail);
}


/*3-2 반품 내역 상세 모달창에 값 넣기*/
function fRefundDetailData(returndata){
	
	var selPrice = returndata.selPrice;
	var coCnt = returndata.coCnt
	
/*	$('input[name=coNo]').attr('value',returndata.coNo);
	$('input[name=prodNo]').attr('value',returndata.prodNo);
	$('input[name=prodName]').attr('value',returndata.prodName);
	$('input[name=coCnt]').attr('value',returndata.coCnt);
	$('#totalRefundPrice').val(selPrice*$('#coCnt').val());
	
	$('#refundBankInfo').text(returndata.bankName +', ' + returndata.bankNo);
	$('#refundAddressInfo').text(returndata.addr +', ' + returndata.addrDt);*/
	
	
	
	
/*	$('#coNo').prepend(returndata.coNo);
	$('#prodNo').prepend(returndata.prodNo);
	$('#prodName').prepend(returndata.prodName);
	$('#coCnt').prepend(returndata.coCnt);
	$('#totalRefundPrice').prepend(selPrice*coCnt);*/
	
	/*$('#coNo').text(returndata.coNo);
	$('#prodNo').text(returndata.prodNo);
	$('#prodName').text(returndata.prodName);
	$('#coCnt').text(returndata.coCnt);
	$('#totalRefundPrice').text(selPrice*coCnt)
	
	$('#refundBankInfo').text(returndata.bankName +', ' + returndata.bankNo);
	$('#refundAddressInfo').text(returndata.addr +', ' + returndata.addrDt);*/
	
	$('#coNo').val(returndata.coNo);
	$("#coNo").css("border","none");

	$('#prodNo').val(returndata.prodNo);
	$("#prodNo").css("border","none");
	
	$('#prodName').val(returndata.prodName);
	$("#prodName").css("border","none");
	
	$('#coCnt').val(returndata.coCnt);
	$("#coCnt").css("border","none");
	
	$('#totalRefundPrice').val(selPrice*coCnt)
	$("#totalRefundPrice").css("border","none");
	
	$('#refundBankInfo').text(returndata.bankName +', ' + returndata.bankNo);
	$('#refundAddressInfo').text(returndata.addr +', ' + returndata.addrDt);
}


/*4.반품 신청*/
function fRequestRefund(){
	
	//innerText
	var coNo = $('#coNo').val();
	var retCnt = $('#coCnt').val();
	var retADate = new Date().toISOString().substring(0,10);
	var retPrice = $('#totalRefundPrice').val();
	var retInfo =$("select[name=refundInfo]").val();
	
	var retSts = 0;
	var retEsts =0;
	var coSts = 'refund';
	
	var param = {
			coNo : coNo
			,retCnt : retCnt
			,retADate : retADate
			,retPrice : retPrice
			,retInfo : retInfo
			,retSts : retSts
			,retEsts : retEsts
			,coSts:coSts
	}
	
	var resultcallback = function(returndata){
		console.log(returndata);
		callbackRequestRefund(returndata);
	}
	
	if(confirm("정말로 반품하시겠습니까?")){
		callAjax("addRefund.do","post","json",true,param,resultcallback);	
	}else{
		gfCloseModal();
	}
	
	
	
}

/* 4-1 반품 신청 콜백함수 */
function callbackRequestRefund(returndata){
	
	if(returndata.refundResult ==1 && returndata.updateCoSts){
		alert("반품 신청이 완료되었습니다.");
		gfCloseModal();
	}
		/*if(confirm("반품 신청이 되었습니다. 반품 현황으로 이동하시겠습니까?")){
			location.href='/cussts/refundList.do'
			gfCloseModal();
		}else{
			gfCloseModal();
		}
	}*/
	
}








