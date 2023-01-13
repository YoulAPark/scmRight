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
<title>창고정보관리</title>

<!-- common_include.jsp 삽입 -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src='${CTX_PATH}/js/view/admstd/admstdStrMng.js'></script>

<script type="text/javascript">
// admstdStrMng.js 확인
</script>

<style>
#fModalAddStr {
				width : 1000px;
				display : table;
				align : center;
}
.sHp {
	width : 60px;
}
</style>

</head>
<!-- Head 영역 종료 -->

<!-- Body 영역 시작 -->
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

	<form id="myUser" action="" method="">

		<input type="hidden" id="currentPage" value="1"> <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
		<input type="hidden" id="pageNavi" value="1">

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
								<a href="#" class="btn_nav">기준정보</a> <span class="btn_nav bold">창고정보관리</span> 
								<a href="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<!-- ######################### 창고정보관리 #########################   -->
								<span>창고정보관리 </span>
								<!-- ######################### 검색창 #########################   -->
								<span class="fr"> <!-- 삭제된 정보 표시 체크박스 --> <label>
								<!-- select Box 사용 / selected : 기본으로 선택 된 상태 --> 
								<select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
										<option value="all" selected="selected">전체</option>
										<option value="strNm">창고명</option>
										<option value="strMngNm">담당자명</option>
								</select> 
								<input type="text" style="width: 160px; height: 30px;" id="searchInput" name="searchInput"> 
								<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검색</span></a>
								</span>
							</p>

							<!-- ######################### divUserList 출력 #########################-->
							<div class="divUserList">
								<table class="col">
									<!-- caption : 표에 대한 설명을 나타나기 위함 -->
									<caption>caption</caption>
									<!-- table 비율 지정 -->
									<colgroup>
										<col width="5%">
										<col width="23%">
										<col width="27%">
										<col width="10%">
										<col width="20%">
										<col width="15%">										
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">창고이름</th>
											<th scope="col">창고주소</th>	
											<th scope="col">담당자성함</th>
											<th scope="col">이메일주소</th>
											<th scope="col">연락처</th>																				
										</tr>
									</thead>
									<!-- 반복되는 tr/th 태그. *List.jsp 라는 별도의 페이지를 만들어 tbody의 id로 injection 시킨다. -->
									<tbody id="strList"></tbody>
								</table>

								<!-- 페이징 처리 -->
								<div class="paging_area" id="pagingNavi"></div>

								<!-- 신규등록 버튼 -->
								<span class="fr"> 
									<c:set var="nullNum" value=""></c:set>
									<a href="" class="btnType blue" id="addStrBtn" name="btn"><span>창고등록</span></a>
								</span>
							</div>
						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<!-- ############################################################################################################################### -->

		<!-- Modal 창고등록 -->
		<div id="fModalAddStr" class="layerPop layerType2">
			<form id="RegisterForm" action="" method="post">
				<dl>
					<dt>
						<strong>창고등록</strong>
					</dt>

					<dd class="content">
						<table class="row">

							<caption>caption</caption>

							<colgroup>
								<col width="120px">
								<col width="200px">
								<col width="120px">
								<col width="200px">
							</colgroup>

							<tbody>

								<tr>
									<!-- 창고코드 -->
									<th class="" scope="row">창고코드</th>
										<td>
											<input type="hidden" name="strNo" id="" style="width:100%;"/>
										</td> 
									<!-- 창고명 -->
									<th class="" scope="row">창고명</th>
										<td>
											<input type="text" name="strName" id="" style="width:100%;"/>
										</td>
								</tr>

								<tr>
									<!-- 담당자 -->
									<th class="" scope="row">담당자</th>
										<td>
											<input type="text" name="strMnm" id="strMnm" style="width:60%;"/>
											<input type="button" class="" value="담당자검색" onclick="btnfindMng()"/>
										</td>
									<!-- 전화번호 -->
									<th class="" scope="row">전화번호</th>
										<td>
											<input class="sHp" type="text" name="hp1" id="" style="width:75px"/>
											 -
											<input class="sHp" type="text" name="hp2" id="" style="width:75px"/>
											 -
											<input class="sHp" type="text" name="hp3" id="" style="width:75px"/>
										</td>
								</tr>
								
								<!-- 이메일 -->
								<tr>	
									<th scope="row">이메일</th>
									<td colspan="4" class="iEmail">
										<input type="text" name="email" id="email" style="width:150px%;">
										 @ 
										<select style="width:100px; margin-right:10px" name="selectEmail" id="selectEmail">
											 <option value="1">직접입력</option>
											 <option value="naver.com" selected>naver.com</option>
											 <option value="hanmail.net">hanmail.net</option>
											 <option value="hotmail.com">hotmail.com</option>
											 <option value="nate.com">nate.com</option>
											 <option value="yahoo.co.kr">yahoo.co.kr</option>
											 <option value="empas.com">empas.com</option>
											 <option value="dreamwiz.com">dreamwiz.com</option>
											 <option value="freechal.com">freechal.com</option>
											 <option value="lycos.co.kr">lycos.co.kr</option>
											 <option value="korea.com">korea.com</option>
											 <option value="gmail.com">gmail.com</option>
											 <option value="hanmir.com">hanmir.com</option>
											 <option value="paran.com">paran.com</option>
										</select>
									</td>
								</tr>
								
								<!-- 우편번호찾기 -->
								<tr>
									<th class="" scope="row">우편번호</th>
									<td colspan="4"><input type="text" name="" id=""  style="width:100px;"/> 
										<input type="button" class="" value="우편번호찾기" onclick="execDaumPostcode()"/>
									</td>
								</tr>
								
								<!-- 창고위치 -->
								<tr class="">
									<th scope="row">창고위치</th>
									<td colspan="4"><input type="text" name="" id="" style="width:100%;"/></td>
								</tr>
								
								<!-- 상세주소 -->
								<tr class="">
									<th scope="row">상세주소</th>
									<td colspan="4"><input type="text" name="" id="" style="width:100%;"/></td>
								</tr>

							</tbody>

						</table>
						<div class="btn_areaC mt30">
							<a href="" class="btnType blue" id="btnSubmit" name="btn"><span id="btnSaveEdit" name="btn">저장</span></a>
							<a href="" class="btnType blue" id="btnClose" name="btn"><span>취소</span></a>
						</div>
					</dd>
				</dl>
				<a href="" class="closePop" id="btnClose" name="btn"><span class="hidden">닫기</span></a>
			</form>
		</div>
		<!-- #################################################################################################################################################################################################################### -->
	</form>

</body>
</html>