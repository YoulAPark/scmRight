
// 컨트롤러에서 delReturnStrCnt() 메서드 내의 Sysout("** : "+prodNo) 만해줬는데 returnData를 못받아옴 

// [완료] fbtnDelivery를 실행하며 prodNo와 strNo를 넘겨야 함 어케 넘길지 => Controller에서 map의 value 값을 형변환 해줌 [해결완료]




	$(function() {
		delList();
		//fButtonClickEvent();	
		
	});

	// Button Click Event
	/*function fButtonClickEvent() {		
		
		alert("ewewew");
		
		$('a[name=btn]').click(function(e) {

			e.preventDefault(); // 기본 클릭 동작을 막아주는 역할을 함
			
			var btnId = $(this).attr('id');
			
			alert("btnId : " + btnId);
			
			switch(btnId) {
				case 'btnDtlCancle' : fDtlCancle();
					break;
				case 'btnDtl' : fbtnDtl();
					break;
			}
		});
	} */
	
	// [완료] 1. Return 리스트 조회
	function delList(currentPage) {
		currentPage = currentPage || 1;
		var param = {
			searchKey : $("#searchKey").val(), 		// searchkey : 검색시 select박스
			searchInput : $("#searchInput").val(), 	// sInput : 검색시 input text박스	
			pageNavi : $("#pageNavi").val(), 		// 기본 pagingNav = 1
			currentPage : currentPage,
			pageSize : pageSize
		};
		var callBack = function(returnData) {
			detailDelList(returnData, currentPage);
		}
		callAjax("/delcus/delReturnList.do", "post", "text", true, param, callBack);
	}
	
	// [완료] 2. delList에서 불러온 detailDelList
	function detailDelList(returnData, currentPage) {
		$("#returnList").empty().append(returnData);
		currentPage = currentPage || 1;
		var totalCount = $("#totalCount").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCount,	pageSize, pageBlockSize, 'delList');		
		$("#pagingNavi").empty().append(paginationHtml);
		$("#currentPage").val(currentPage);
	}
	 
	// 3. Modal 출력
	function fModalSelectOne(retPDate, loginID) {
		gfModalPop("#delInfo"); // delcusDirection.jsp의 delInfo열기
		delDtlList(retPDate,loginID);
	}
	
	// 4. 모달 내부 리스트 단 건 조회
	function delDtlList(retPDate, loginID) {

		var loginID = loginID;
		var param = {
				retPDate : retPDate
			, 	loginID : loginID
		};	
		var callBack = function(returnData) {

			$("#retNo").empty().prepend(returnData[0].retNo); // 반품번호
			$("#prodCate").empty().prepend(returnData[0].prodCate);	// 제조사
			$("#prodName").empty().prepend(returnData[0].prodName); // 제품명
			$("#mfName").empty().prepend(returnData[0].mfName); // 제조사
			$("#selPrice").empty().prepend(returnData[0].selPrice); // 판매가격
			
			var prodNo = returnData[0].prodNo;
			var strNo = returnData[0].strNo;
			var retNo = returnData[0].retNo;
			
			// deliveryBtn 버튼 클릭시 function 실행
			$("#deliveryBtn").on("click", function() {
				$("#delDtlListResult").empty();
				fbtnDelivery(prodNo, strNo, retNo);
				location.href="/delcus/delcusReturn.do"
			});

		}
		callAjax("/delcus/delReturnSelectOne.do", "post", "json", true, param, callBack);
	}
	
	
	function fbtnDelivery(prodNo, strNo, retNo) {
		var param = { 
				prodNo : prodNo
				, strNo : strNo 
				, retNo : retNo 
		}
		var callBack = function(returnData) {
			$("#delDtlListResult").empty();
			$("#delDtlListResult").append(returnData);
			gfCloseModal();			
		}
		callAjax("/delcus/delReturnSts.do", "post", "json", true, param, callBack);
	}
	
	// 필요없어져서 주석처리 함
	/* 4-2. 모달 내부 리스트 출력
	function delDtlListResult(returnData) {
		var param = { coNo : returnData[0].coNo };
		var callBack = function(returnData) {
			$("#delDtlListResult").empty().append(returnData);
		}
		callAjax("/delcus/delDelListProd.do", "post", "text", true, param, callBack);
	}*/
	
	
	// 7. 모달창 닫기
	function fbtnCancle() {
		
	}
	
