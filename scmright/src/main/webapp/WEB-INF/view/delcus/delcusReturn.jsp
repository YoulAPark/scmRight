<!-- Directive 선언 -->
<!-- page : jsp페이지에 대한 정보, 사용문자, 문자타입이나 정보, 에러메세지 작성 -->
<!-- tag/lib : jsp에서 사용할 태그 라이브러리 지정 -->
<!-- include : jsp페이지에서 특정 부분에 다른 jsp를 포함시킬 때 사용 -->

<!-- Encording -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 코어(변수 지원, 흐름 제어, URL 처리) 사용으로 인한 tag Library 지정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL 함수 사용으로 인한 tag Library 지정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JSTL 날짜 형식 사용으로 인한 fmt 사용-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<!-- Head 영역 시작 -->
<head>
<title>배송/반품 지시서</title>

<!-- common_include.jsp 삽입 -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src='${CTX_PATH}/js/view/delcus/delcusReturn.js'></script>

<!-- Session사용 userType이 A일경우 redirect처리 -->
<script type="text/javascript">
	
	// 페이징 처리
	var pageSize = 5; // 화면에 출력할 데이터의 개수
	var pageBlockSize = 10; // 몇 개의 블럭으로 보여줄 것인지

</script>

<style>

#delTable {
	text-align : center;
}

#styLightgray {
	background : #bbc2cd;
}

#delInfo {
	width: 1000px;
}

#checkstaff {
	width: 80px;
}
									
#selBoxStyle {
	width : 115px;
	height : 30px;
}

#selInputStyle {
	width : 250px;
	height : 28px;
}

.iInput {
	width: 70px;
}

.iHp {
	width: 50px;
}

.iEmail, .postNum {
	width: 70px;
}

.instfName, .instfCom {
	width: 70px;
}

.isntfwork, .isntfMng {
	width: 70px;
}

.findPost {
	width: 130px;
	height: 20px;
}

.addr, .bankNum {
	width: 70px;
}
</style>

</head>
<!-- Head 영역 종료 -->

<!-- Body 영역 시작 -->
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

	<form id="myForm" action=""  method="">

		<input type="hidden" id="currentPage" value="1"> <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->	
		<input type="hidden" id=pageNavi value="1"> <!-- <input type="hidden" id="swriter" value="${writer}"> 작성자 session에서 java에서 넘어온값 -->

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
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<a href="#" class="btn_nav">기업고객</a> 
								<span class="btn_nav bold">반품지시서</span> <a href="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 -->
							<p class="conTitle">
								<span>반품지시서 </span>
								<span class="fr"> <!-- 삭제된 정보 표시 체크박스 --> 						
									<select id="selBoxStyle" name="searchKey">
										<option value="all" selected="selected">전체</option>
										<option value="storeNm">업체명</option>
										<option value="retPdate">반품신청일</option>
									</select> 
									<input type="text" id="selInputStyle" name="searchInput">
										<a href=""class="btnType white" id="searchBtn" name="btn"><span>검색</span></a>
								</span>
							</p>

							<!-- delcusDirectionList 쪽 -->
							<div class="divDelCusList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<!-- No -->
										<col width="10%">
										<!-- 업체명 -->
										<col width="30%">
										<!-- 총액 -->
										<col width="30%">
										<!-- 반품처리일 -->
										<col width="30%"> 
									</colgroup>
									<thead>
										<tr>
											<th scope="col">No</th>
											<th scope="col">업체명</th>
											<th scope="col">총액</th>
											<th scope="col">반품처리일</th>
										</tr>
									</thead>
									<!-- 반복되는 tr/th 태그. *List.jsp 라는 별도의 페이지를 만들어 tbody의 id로 injection 시킨다. -->
									<tbody id="returnList"></tbody>
								</table>

								<!-- 페이징 처리 -->
								<div class="paging_area" id="pagingNavi"></div>

							</div>
						</div> <!--// content -->
						
						<div>
							<tbody id="delOneList"></tbody>
						</div>
						
						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<!-- 배송지시서 주문관련(주문번호, 주문자명, 배송주소지) Modal -->
		<div id="delInfo" class="layerPop layerType2">
			<dl>
				<dt>
					<strong>반품지시서</strong>
				</dt>
				<dd class="content">
					<table class="row mt20" id="delTable">
						<caption>반품지시서 주문관련 표시</caption>
						<colgroup>
							<col width="10%">
							<col width="25%">
							<col width="35%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr id="styLightgray">
								<th scope="row">번호</th>
								<th scope="row">장비구분(서버/UPS/Router)</th>								
								<th scope="row">제품명</th>								
								<th scope="row">제조사</th>								
								<th scope="row">판매가격</th>								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td scope="row" id="retNo"></td>
								<td scope="row" id="prodCate"></td>
								<td scope="row" id="prodName"></td>
								<td scope="row" id="mfName"></td>
								<td scope="row" id="selPrice"></td>
							</tr>
						</tbody>
					</table>
					<div style="display: flex; justify-content: center;">
					<div>
						<a class="btnType blue" name="btn" style="" ><span id="deliveryBtn" name="delBtn">재고처리</span></a>
					</div>
					<div>
						<a class="closePop"><span class="hidden">닫기</span></a>
					</div>
					<div>
						<a href="" class="btnType white" name="btn"><span>취소</span></a>
					</div>
					</div>
							
				</dd>
			</dl>
		</div>

	</form>

</body>
</html>