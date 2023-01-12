<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- abc -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>매출현황</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
 
<script type="text/javascript">

var pagesize = 10;
var pagenumsize = 1;

/** OnLoad event */ 
$(function() {

	// 강의목록 조회
	topList();
	
	// 버튼 이벤트 등록
	tButtonClickEvent();
		
});

/** 버튼 이벤트 등록 */
function tButtonClickEvent() {
	$('a[name=btn]').click(function(e) {
		e.preventDefault();

		var btnId = $(this).attr('id');

		switch (btnId) {
		case 'searchBtn' : // 검색 버튼
				topList();
				break;
		}
	});
}

//page init 게시판 조회

	function topList(clickpagenum) {
		
		clickpagenum = clickpagenum || 1;
		console.log("clickpagenum : " + clickpagenum);
		
		var param = {	
				startDate : $("#startDate").val() ,
				endDate : $("#endDate").val() ,
				clickpagenum : clickpagenum,
				pageSize : pagesize 
		};
		console.log(param);
		var resultCallback = function(returndata){
			console.log("returndata : " + returndata);
			
			CallbackProcess(returndata,clickpagenum);
		} ;
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/exesal/salesTopList.do", "post", "text", true, param, resultCallback);
	}

	//게시판 조회 콜백 함수
	function CallbackProcess(returndata, clickpagenum) {
		console.log("DURL");
		
		//기존 목록 삭제
		$("#salesTopList").empty();
		
		//신규목록 생성
		$("#salesTopList").append(returndata);
		
		//총개수 추출
		var totalCnt = $("searchlistcnt").val();
		
		var paginationHtml = getPaginationHtml(clickpagenum, totalCnt, pagesize, pagenumsize, 'topList');
		console.log("paginationHtml : " + paginationHtml);
		
		$("#comnfileuploadPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#hclickpagenum").val(clickpagenum);
		
	}
</script>

	
	
</head>
<body>
	<form id="myForm" action=""  method="">
	<input type="hidden" id="hclickpagenum" name="hclickpagenum"  value="" />
	<input type="hidden" id="action" name="action"  value="" />
	<input type="hidden" id="loginID" name="loginID"  value="" />

	
	
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
		         
		               
		               <p class="Location">
		                     <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
		                        class="btn_nav bold">매출 현황</span> <span class="btn_nav bold">매출 상위</span> <a href="../exesal/salesStatus.do" class="btn_set refresh">새로고침</a>
		                  </p>
		

		                     
		                   <p class="conTitle">
							<span>매출 상위 기업 고객 상위 10개 목록</span> <span class="fr"> 
							</span>
								<input class="datetype" style="margin-left: 1%" type="date" name = "startDate" id="startDate" >
								<input class="datetype" type="date" name = "endDate" id="endDate" >
								
								<a href="" class="btnType blue" id="searchBtn" name="btn" style="margin-left: 2%"><span>검색</span></a>
						</p>
		                
	                           
						<div class="divNoticeList">
							<table class="col" id="dateDay">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								
								<thead>
									<tr>
										<th scope="col">순위</th>
										<th scope="col">기업명</th>
										<th scope="col">매출액</th>
									</tr>
								</thead>
								<tbody id="salesTopList">
								</tbody>
							</table>
						</div>
						<div class="paging_area"  id="comnfileuploadPagination"> </div>
					
						<div id="chart_div"></div>

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</form>

</body>
</html>