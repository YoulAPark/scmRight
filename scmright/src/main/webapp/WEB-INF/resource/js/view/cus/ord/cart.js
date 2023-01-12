


$(function() {
	
		fCartList();
		fRegisterButtonClickEvent();

});



/** 버튼 이벤트 등록 */
function fRegisterButtonClickEvent() {
	$('a[name=btn]').click(function(e) {
		e.preventDefault();

		var btnId = $(this).attr('id');
		
		switch (btnId) {
			case 'btnSDelete' : // 제품 삭제하기
				fRemoveProduct();
				fCartList();
				break;
			case 'btnOrder' :
				fOrder();
				break;
			
				
		}
	});
}


/*1. 장바구니 목록 조회*/
function fCartList(){
	
	var param ={
			
	}
	
	var resultcallback = function(returndata){
		console.log("returndata" + returndata);
		callbackCartList(returndata);
		
	}
	
	callAjax("/cusord/cartList.do","post","text",true,param,resultcallback);
	
}

/*1-1. 장바구니 목록 조회 콜백 함수*/
function callbackCartList(returndata){
	
	$('#cartList').empty().append(returndata);
	
}


/*2. 버튼 클릭 시  제품 장바구니에서 삭제하기*/
function fRemoveProduct(prodNo){
	
	var param = {
			prodNo : prodNo
	}
	
	var resultcallback = function(returndata){
		console.log("returndata" + returndata);
		callbackReProduct(returndata)
		
	}
	
	if(confirm('장바구니에서 삭제하시겠습니까?')){
	 callAjax("/cusord/removeProduct.do","post","json",true,param,resultcallback);
	}else{
		return false;
	}
}

/*2. 선택 상품 삭제하기 콜백함수*/
function callbackReProduct(returndata){
	
	console.log("returndata" + returndata.deleteResult);
	//이거 이상 다시 보자 .
	if(returndata.deleteResult==1){
		fCartList();
	}else{
		alert("삭제 실패했습니다.");
	}
}

/*3. 제품 선택 시 합계 금액 계산*/
function sumTotalPrice(){
	
	
}



//최상단 체크박스 클릭 시 전체 선택 
/*$("#checkAll").click(function() {
	  $("input[name=checkProduct]:checkbox").prop("checked", "checked");
	});
*/

$(document).on('click','#checkAll',function(){
    if($('#checkAll').is(':checked')){
       $('.checkProduct').prop('checked',true);
    }else{
       $('.checkProduct').prop('checked',false);
    }
});





