    
var pageRow = 5; // 한 페이지당 보여지는 제품 수 
var pageBlockSize = 5;    //화면에 보여지는 페이지 넘버 1 2 3 4 5 개수


$(function() {
	
	   comcombo("proCD", "searchCt", "all", ""); // 제품 구분  prolargeall : selectbox ID   value :  detail_code
		
		$("#searchCt").change(function() {
			productCombo($("#searchCt").val(), "searchPn", "all",  "");   // 제품정보   prodall : selectbox ID   value : MODEL_CODE
		});
	   
		fProductList();
		fRegisterButtonClickEvent();

});


/** 버튼 이벤트 등록 */
function fRegisterButtonClickEvent() {
	$('a[name=btn]').click(function(e) {
		e.preventDefault();

		var btnId = $(this).attr('id');
		
		switch (btnId) {
			case 'btnSearch' : // 검색 버튼
				fProductList();
				break;
			case 'btnAddCart' :
				fCheckSameProduct();
				break;
			case 'btnOrderDeposit' :
				fOrderDeposit();
				break;
			case 'btnOrder' :
				fOrder();
			case 'btnClose' :
				gfCloseModal();
				
				break;
				
		}
	});
}

/* 1. 제품 목록 가져오기*/
function fProductList(currentPage){
	
	//현재 페이지 값이 없으면 1로 설정
	currentPage  = currentPage || 1;
	
	
	var searchCt = $("#searchCt option:selected").val();
	var searchPn = $("#searchPn option:selected").text();
	var searchValue = $("#searchValue").val();
	
	console.log("searchPn: " + searchPn);
	
	
	var param = {
			searchCt : searchCt,
			searchPn : searchPn,
			searchValue : searchValue,
			currentPage : currentPage,
			pageRow : pageRow
	}
	
	//returndata는 컨트롤러를 통해 반환된 view 페이지인 productList에서 조회해온 html 자체 
	var resultcallback = function(returndata){
		
		console.log("returndata" + returndata);
		callbackProductProcess(returndata,currentPage);
	}
	
	callAjax("/cusord/productList.do","post","text",true,param,resultcallback);
	
}

/* 1-1. 제품 목록 callback- returndata를 통해 html 태그에 html append, 페이징 처리 */
function callbackProductProcess(returndata,currentPage){
	// id 가 productList인 태그의 내용을 모두 지우고 returndata를 그대로 붙여라
	$('#productList').empty().append(returndata);
	
	//productList.jsp에서 input 태그에 hidden 값으로 컨트롤러에서 model에 저장한 값을 넘겼다. 
	totalProductCnt = $('#totalProductCnt').val();
	
	var pagingHtml = getPaginationHtml(currentPage,  totalProductCnt  ,pageRow ,pageBlockSize,'fProductList');
	
	console.log('pagingHtml' + pagingHtml);
	
	
	$('#productListPagination').empty().append(pagingHtml);
	
	
}

/* 2. 제품 단건 조회 - 제품 상세보기 */
function fPopModalProductDetail(prodNo){
	
	var param = {
			prodNo : prodNo
	}

	
	//여기서 returndata는 detailProduct라는 객체와 success라는 string 문자열 
	var resultcallback = function(returndata){
		
		console.log("returndata" + returndata);
		callbackDetailProcess(returndata);
	}
	
	callAjax("/cusord/productDetail.do","post","json",true,param,resultcallback);
}


/* 2-1. 제품 단건 callback*/
function callbackDetailProcess(returndata){
	if(returndata.resultMsg == "SUCCESS"){
		//수량과 총가격 초기화 시켜두기
		fProductInitData(returndata);
		//모달창 띄우기
		gfModalPop("#detailProduct");
		fProductDetailData(returndata.detailProduct);
		
	}
}

/* 2-3. 수량과 총가격, 배송희망날짜 초기화 시켜두기*/
function fProductInitData(returndata){
	var today = new Date().toISOString().substring(0,10);
	$('#productCnt').val(1);
	$('#totalPrice').val(returndata.detailProduct.selPrice);
	$('#deliveryDate').val(today);
}


/* 2-4. 제품 상세보기 데이터 집어넣기*/
function fProductDetailData(returndata){
	
	
	var selPrice = returndata.selPrice;

	$('input[name=prodNo]').attr('value',returndata.prodNo);
	$('input[name=att_no]').attr('value',returndata.att_no);
	$('input[name=mfName]').attr('value',returndata.mfName);
	$('input[name=totalPrice]').attr('value',selPrice);
	//name으로 하면 값이 전달되지 않음.
	$('#prodInfo').val(returndata.prodInfo);
	
	
	$('#productCnt').on('change', function(){
		/* var price = $('input[name=selPrice]').attr('value',selPrice);
		var count = $('#cartCnt').val();
		var totalPrice = price * count;
		$('#selPrice').text(totalPrice); */
		$('#totalPrice').val(selPrice*$('#productCnt').val());
		
	})
	
}

/*3. 로그인한 유저의 장바구니에 같은 상품이 담겨있나 check*/
function fCheckSameProduct(){
	
	var prodNo = $('#prodNo').val();
	
	var param = {
			prodNo : prodNo
	}
	
	var resultcallback = function(returndata){
		console.log("returndata" + returndata);
		callbackCheckProcess(returndata)
	}
	
	
	callAjax("/cusord/checkCart.do","post","json",true,param,resultcallback);
	
}

/*3 장바구니 체크 콜백함수*/
function callbackCheckProcess(returndata){
	var checkResult = returndata.sameProduct;
	
	if(checkResult >0){
		alert('이미 장바구니에 있는 품목입니다.')
//		swal('','이미 장바구니에 있는 품목입니다.','error');
		return false;
	}else{
		fAddCart();
	}
	
}



/*3-1. 장바구니에 상품 추가하기*/
function fAddCart(){
	
	var prodNo = $('#prodNo').val();
	var productCnt = $('#productCnt').val();
	var deliveryDate = $('#deliveryDate').val();
	
	
	var param = {
			prodNo : prodNo,
			cartCnt : productCnt,
			cartDel : deliveryDate
	}
	
	var resultcallback = function(returndata){
		console.log("returndata" + returndata);
		
		callbackAddCartProcess(returndata);
		
	}
	
	callAjax("/cusord/addCart.do","post","json",true,param,resultcallback);
	
}

/*3-1 장바구니 상품 추가 callback 함수*/
function callbackAddCartProcess(returndata){
	
	var addCartResult = returndata.addCart;
	
	if(addCartResult ==1){
		
		if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")){
			location.href='/cusord/cartList.do'
			gfCloseModal();
		}else{
			gfCloseModal();
		}
		
	}
	
}


/*4. 주문 버튼 클릭 시 결제 내역 확인*/
function fOrderDeposit(){
	
	var totalPrice = $('#totalPrice').val();
	$('#totalHap').text(totalPrice);
	
	gfModalPop("#orderDeposit");
	
	
	
}


/*4-1. 주문하기*/
function fOrder(){
	
	var prodNo = $('#prodNo').val();
	var coCnt = $('#productCnt').val();
	var coDate = new Date().toISOString().substring(0,10);
	var coDel = $('#deliveryDate').val();
	var coSts = 'order'
	var coDpsts = 0
	
	var param = {
			prodNo : prodNo,
			coCnt : coCnt,
			coDate:coDate,
			coDel : coDel,
			coSts : coSts,
			coDpsts : coDpsts
	}
	
  var resultcallback = function(returndata){
		console.log("returndata" + returndata);
		callbackOrder(returndata);
	}
	
	
	callAjax("/cusord/order.do","post","json",true,param,resultcallback);
}


/*4-2 주문하기 콜백함수*/
function callbackOrder(returndata){
	
	if(returndata.orderResult>0){
		alert("주문이 완료되었습니다.");
	}else{
		alert("주문에 실패하였습니다.");
	}
	
}
   
   