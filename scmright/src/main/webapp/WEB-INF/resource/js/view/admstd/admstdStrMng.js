
	// 페이징 처리
	var pageSize = 10; // 화면에 출력할 데이터의 개수
	var pageBlockSize = 10; // 몇 개의 블럭으로 보여줄 것인지

	$(function() {
		strList();
	});

	// 버튼 클릭 이벤트
	function fButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); // 기본 클릭 동작을 막아주는 역할을 함
			var btnId = $(this).attr('id');
			switch (btnId) {
			case 'searchBtn' : searchBtn(); // 검색 버튼 클릭
				break;
			case 'addStrBtn': addStrBtn(); // 창고등록 버튼 클릭
				break;
			}
		});
	}

	function searchBtn() {
		console.log("검색 버튼 클릭")
	}
	
	function addStrBtn() {
		console.log("창고등록 버튼 클릭")
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