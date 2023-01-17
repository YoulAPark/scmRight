
	// 페이징 처리
	var pageSize = 10; // 화면에 출력할 데이터의 개수
	var pageBlockSize = 10; // 몇 개의 블럭으로 보여줄 것인지

	$(function() {
		strList();
		fButtonClickEvent();
	});

	// 버튼 클릭 이벤트
	function fButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); // 기본 클릭 동작을 막아주는 역할을 함
			var btnId = $(this).attr('id');
			switch (btnId) {
			case 'btnClose' : gfCloseModal(); // 모달 창 닫기 버튼 클릭
				break;
			case 'searchBtn' : searchBtn(); // 검색 버튼 클릭
				break;
			case 'addStrBtn': addStrBtn(); // 창고등록 버튼 클릭
				break;
			case 'btnSubmit' : if($("#btnSaveEdit").text()=='저장') {
									admstdStrOne();
								} else if($("#btnSaveEdit").text()=='수정') {
									admstdUpdate();
								}
				break;
			case 'excelBtn' : excelBtn(); // 엑셀 버튼 클릭				
				break;
			}
		});
	}

	function searchBtn() {
		console.log("검색 버튼 클릭")
	}
	
	function btnfindMng() {
		let textCk = $("input[name='strMnm']").val();
		if( textCk = '' || null || !textCk || 0 || NaN ) {
			swal("검색하시기 이전, 빈 칸에 담당자 성함을 먼저 입력해주세요")
		} else {
			findMng();
		}
	}
	
	function excelBtn() {
		$("#storageList").table2excel({
			exclude : ".excludeThisClass"
			,	name : "Worksheet Name"
			,	filename : "창고리스트.xls"
			,	preserveColors : false
		});
	}
	
	function findMng() {

		var param = {
			name :  $("input[name='strMnm']").val()
		}

		var callBack = function(returndata) {
			console.log("returndata : "+returndata)
			if( returndata = '' || null || !returndata || 0 || NaN ) {
				swal("유효하지 않은 회원입니다")
			} else {
				swal("유효한 회원입니다");
			}
						//searchStrList(returndata, currentPage);
		}
		callAjax("/admstd/searchName.do", "post", "text", true, param, callBack);
	}
	/* 저장기능구현시
	let emailId = $("input[name='email']").val();
		let emailValue = $("#selectEmail").val();
		alert(emailId)
		alert(emailValue)
		
		 var param = {
			strName : $("input[name='strName']").val()
			, strMnm : $("input[name='strMnm']").val()
			, hp1 : $("input[name='hp1']").val()
			, hp2 : $("input[name='hp2']").val()
			, hp3 : $("input[name='hp3']").val()
			, email : $("input[name='email']").val()
			, textCk : $("input[name='strMnm']").val()
			
			
			textCk : $("#searchKey").val(), // searchkey : 검색시 select박스
			searchInput : $("#searchInput").val(), // sInput : 검색시 input text박스	
			pageNavi : $("#pageNavi").val(), // 기본 pagingNav = 1
			currentPage : currentPage,
			pageSize : pageSize
		};	*/
	
	function addStrBtn() {
		$("#strText").show().text("창고등록"); // strong 태그에 '창고등록'이라고 뜨게 설정
		$("#btnSaveEdit").show().text("저장"); // 하단 버튼에 '저장'이라고 뜨게 설정
		gfModalPop("#fModalAddStr")		
	}
	
	function admstdStrOne() {
		
	}
	
	function admstdUpdate() {
	}
	
	function strList(currentPage) {
		currentPage = currentPage || 1; // 페이징 네비게이션 : onLoad시 null이기에 무조건적으로 1page출력, paging Navi 클릭하여 실행시 해당 int값이 currentPage로 들어가게 된다.
		console.log("현재 클릭한 페이지 : " + currentPage)
		var param = {
			searchKey : $("#searchKey").val(), // searchkey : 검색시 select박스
			searchInput : $("#searchInput").val(), // sInput : 검색시 input text박스	
			pageNavi : $("#pageNavi").val(), // 기본 pagingNav = 1
			currentPage : currentPage,
			pageSize : pageSize
		};
		var listCallBack = function(returndata) {
			searchStrList(returndata, currentPage);
		}
		callAjax("/admstd/admstdStrList.do", "post", "text", true, param, listCallBack);
	}
	
	function searchStrList(returndata, currentPage) {
		$("#strList").empty().append(returndata); // tbody영역을 일단 비우고 덮어씌움

		currentPage = currentPage || 1;

		var totalCount = $("#totalCount").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCount,	pageSize, pageBlockSize, 'strList');

		$("#pagingNavi").empty().append(paginationHtml);
		$("#currentPage").val(currentPage);
	}
	
	// 창고이름 클릭시 수정함수로 이어지게끔
	function fModalSelectOne(loginID) {
		$("#strText").show().text("창고수정"); // strong 태그에 '창고수정'이라고 뜨게 설정
		$("#btnSaveEdit").show().text("수정"); // 하단 버튼에 '수정'이라고 뜨게 설정
		gfModalPop("#fModalAddStr");
		admstdStrOne(loginID); // 창고 수정 실행
	}
	
	// 단 건 조회
	function admstdStrOne(loginID){
		console.log("loginID : "+loginID)
		var param = {
			loginID : loginID
		};
		var listCallBack = function(returnData) {
			console.log("returnData : "+returnData)
			 $("#strName").empty().prepend(returnData[0].strName);
		}
		callAjax("/admstd/admstdStrOne.do", "post", "text", true, param, listCallBack);
	}
	