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
var pagenumsize = 5;
  
/** OnLoad event */ 
$(function() {

	// 게시판 조회
	profit();
	
	pButtonClickEvent();

	$("#searchvalue").keydown(function (key) {
        if (key.keyCode == 13) {
            $("#searchBtn").click();
        }
});
$("#searchvalue").focus();

});

/** 버튼 이벤트 등록 */
function pButtonClickEvent() {
	$('a[name=btn]').click(function(e) {
		e.preventDefault();

		var btnId = $(this).attr('id');
		
		switch (btnId) {
			case 'searchBtn' : // 검색 버튼
				profit();
				break;
		}
	});
}

//page init

function profit(clickpagenum){
			console.log("김치");
			clickpagenum = clickpagenum || 1;
			
			var param = {
					searchvalue :  $("#searchvalue").val() ,
					startDate : $("#startDate").val() ,
					endDate : $("#endDate").val() ,
					clickpagenum : clickpagenum,
					pagesize : pagesize
			};
			console.log(param);
			var searchcallback = function(returndata) {
				console.log("returndata : " + returndata);
				
				searchcallbackprocess(returndata,clickpagenum);
			}
			
			callAjax("/exesal/profitList.do", "post", "text", true, param, searchcallback);
		}
	
//페이지 로드시 
function searchcallbackprocess(returndata,clickpagenum) {
	console.log("워리어");
	$("#profitList").empty().append(returndata);
	
	var totalcnt = $("#searchlistcnt").val();
	
	var paginationHtml = getPaginationHtml(clickpagenum, totalcnt, pagesize, pagenumsize, 'profitList');
	console.log("paginationHtml : " + paginationHtml);
	//swal(paginationHtml);
	$("#comnfileuploadPagination").empty().append( paginationHtml );
	
	$("#hclickpagenum").val(clickpagenum);
}

function rowclick(loginID) {
	console.log("김치워리어");
	console.log(loginID);
	$("#loginID").val(loginID);
	
	Pselectone();
}


//상세내역 
function Pselectone( clickpagenum){	
	console.log("잘되나 확인 ㅋ");
	clickpagenum = clickpagenum || 1;
	
	var param = {
			loginID : $("#loginID").val(), 
			clickpagenum : clickpagenum,
			pagesize : pagesize
	};
	
	console.log(param);
	var searchcallback = function(returndata) {
		console.log("returndata : " + returndata);
		
		searchcallbackprocessDetail(returndata,clickpagenum);
		
	}
	
	callAjax("/exesal/profitDetailList.do", "post", "text", true, param, searchcallback);
	
	
}

//클릭시 상세내용
function searchcallbackprocessDetail(returndata,clickpagenum) {
	console.log("홍길동");
	$("#profitDetailList").empty().append(returndata);
	
	var totalcnt = $("#searchlistcnt2").val();
	
	var paginationHtml = getPaginationHtml(clickpagenum, totalcnt, pagesize, pagenumsize, 'Pselectone');
	console.log("paginationHtml : " + paginationHtml);
	//swal(paginationHtml);
	$("#companyDetailPagination").empty().append( paginationHtml );
	
	$("#hclickpagenum").val(clickpagenum);
}

</script>



	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
	</style>
	
</head>
<body>
	<form id="myForm" action=""  method="">
	<input type="hidden" id="hclickpagenum" name="hclickpagenum"  value="" />
	<input type="hidden" id="action" name="action"  value="" />
	<input type="hidden" id="loginID" name="loginID"  value="" />
	<input type="hidden" id="swriter" value="${loginId}">
	
	
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
		                     <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
		                        class="btn_nav bold">매출현황</span> <span class="btn_nav bold">손익조회</span> <a href="../exesal/salesStatus.do" class="btn_set refresh">새로고침</a>
		                  </p>
		
		                  <p class="conTitle">
		                     <span">손익조회</span> <span class="fr">
		                     
		                   <p class="conTitle">
							<span>거래 내역</span> <span class="fr"> 
							</span>
							
								<label style="margin-left: 3%">기업명</label> 
								<input type="text" style="text-align: center; height:35%;  width:30%; margin-left: 1%" id='searchvalue' name='com_name'>
								
								
								<label style="margin-left: 5%">거래일자      </label> 
								<input class="datetype" style="margin-left: 1%" type="date" name = "startDate" id="startDate" >
								<input class="datetype" type="date" name = "endDate" id="endDate">
								
								<a href="" class="btnType blue" id="searchBtn" name="btn" style="margin-left: 2%"><span>검색</span></a>
						</p>
		                
	                           
						<div class="divNoticeList">
							<table class="col" id="dateDay">
								<caption>caption</caption>
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								
								<thead>
									<tr>
										<th scope="col">기업 이름</th>
										<th scope="col">총 매출</th>
										<th scope="col">총 환불</th>
										<th scope="col">총 순수익</th>
									</tr>
								</thead>
								<tbody id="profitList"></tbody>
							</table>
						</div>
									<!--// 공지사항 테이블 페이지 네비게이션 -->
						<div class="paging_area"  id="comnfileuploadPagination"> </div>
						
						<p class="conTitle">
							<span>상세 내역</span> <span class="fr"> 
							</span>

						</p>
						<div class="divComGrpCodList">
							<table class="col" id="detailProfitTable">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="8%">
									<col width="8%">
									<col width="8%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">기업 이름</th>
										<th scope="col">제품 명</th>
										<th scope="col">매출 금액</th>
										<th scope="col">환불 금액</th>
										<th scope="col">거래 날짜</th>
									</tr>
								</thead>
								<tbody id="profitDetailList"></tbody>
							</table>
							
						</div>
						<div class="paging_area" id="companyDetailPagination"></div>
						
						
					</div> <!--// content -->
						
						
						

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</form>

</body>
</html>