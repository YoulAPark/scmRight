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
									<a onclick="" class="btnType blue" id="addStrBtn" name="btn"><span>창고등록</span></a>
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

		<!-- 회원관리 모달 -->
		<div id="user" class="layerPop layerType2">
			<form id="RegisterForm" action="" method="post">
				<input type="hidden" id="loginID" name="loginID">
				<!-- 수정시 필요한 num 값을 넘김  -->
				<dl>
					<dt>
						<strong>회원 추가</strong>
					</dt>

					<dd class="content">
						<table class="row">

							<caption>caption</caption>

							<colgroup>
								<col width="120px">
								<col width="*">
								<col width="120px">
								<col width="*">
							</colgroup>

							<tbody>

								<tr>
									<!-- 기업고객/내부직원 선택 -->
									<th scope="row" rowspan="3"><select id="checkstaff"
										name="checkstaff">
											<option name="instaff" value="instaff" selected="selected">내부직원</option>
											<option name="outstaff" value="outstaff">기업고객</option>
									</select></th>
									<!-- 아이디 -->
									<th class="iInput" scope="row">아이디 <span class="font_red">*</span></th>
									<td><input type="text" name="loginId" id="loginId" />
										<button id="duplicate_check" type="button"
											onclick="userIdCheck()">중복체크</button></td>
									<!-- 비밀번호 -->
									<th class="iInput" scope="row">비밀번호<span class="font_red">*</span></th>
									<td><input type="password" name="password" id="password" />
									</td>
								</tr>

								<tr>
									<!-- 연락처 -->
									<th scope="row">연락처 <span class="font_red">*</span></th>
									<td><input class="iHp" type="text" id="tel1" name="tel1">
										- <input class="iHp" type="text" id="tel2" name="tel2">
										- <input class="iHp" type="text" id="tel3" name="tel3">
									</td>
									<!-- 이메일 -->
									<th scope="row">이메일</th>
									<td class="iEmail"><input type="text" name="email"
										id="email"></td>
								</tr>

								<!-- ################################################## 내부직원 ##################################################   -->
								<tr id="instaff">
									<!-- 직원명 -->
									<th class="instfName" scope="row">직원명<span
										class="font_red">*</span></th>
									<td><input type="text" name="name" id="name" /></td>
									<!-- 담당업무 -->
									<th class="isntfwork" scope="row">담당업무<span
										class="font_red">*</span></th>
									<td>
										<div id="chaDiv">
											<select id="selectChaCD" name="selectChaCD">
												<c:forEach items="${listChaCD}" var="list">
													<option id="optionChaCD" value="${list.user_type}"
														name="optionChaCD"><c:out
															value="${list.chaCD_name}" /></option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<!-- ###########################################################################################################   -->

								<!-- ################################################## 외부직원 ##################################################   -->
								<tr id="outstaff">
									<!-- 회사명 -->
									<th class="instfCom" scope="row">회사명<span class="font_red">*</span></th>
									<td><input type="text" name="company" id="company" /></td>
									<!-- 담당자명 -->
									<th class="isntfMng" scope="row">담당자명<span
										class="font_red">*</span></th>
									<td><input type="text" name="name2" id="name2" /></td>
								</tr>
								<!-- ###########################################################################################################   -->

								<!-- 우편번호찾기 -->
								<tr>
									<th class="postNum" scope="row">우편번호<span class="font_red">*</span></th>
									<td colspan="4"><input type="text" name="zipcode"
										id="zipcode" /> <input type="button" class="findPost"
										value="우편번호 찾기" onclick="execDaumPostcode()" /></td>
								</tr>

								<!-- 주소1 -->
								<tr class="addr">
									<th scope="row">주소<span class="font_red">*</span></th>
									<td colspan="4"><input type="text" name="address"
										id="address" size="100" /></td>
								</tr>

								<!-- 주소2 -->
								<tr class="addr">
									<th scope="row">상세주소<span class="font_red">*</span></th>
									<td colspan="4"><input type="text" name="dt_address"
										id="dt_address" size="100" /></td>
								</tr>

								<!-- ################################################## 외부직원 ##################################################   -->
								<tr id="outstaff_account">
									<th class="bankNum" scope="row">계좌번호<span class="font_red">*</span></th>
									<td colspan="2"><input type="text" name="account"
										id="account" size="30" /></td>

									<th class="bankNum" scope="row">은행명<span class="font_red">*</span></th>
									<td>
										<div id="bankDiv">
											<select id="selectBankCD" name="selectBankCD">
												<c:forEach items="${listBankName}" var="list">
													<option id="optionBankCD" value="${list.bank_cd}"
														name="optionBankCD"><c:out
															value="${list.bank_name}" />
													</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<!-- ##########################################################################################################   -->
							</tbody>

						</table>
						<div class="btn_areaC mt30">
							<a href="" class="btnType blue" id="btnUpdateUser" name="btn"
								style="display: none"><span>수정</span></a> <a href=""
								class="btnType blue" id="btnDeleteUser" name="btn"><span>삭제</span></a>
							<a href="" class="btnType blue" id="btnApprovalUser" name="btn"><span>승인</span></a>
							<a href="" class="btnType blue" id="btnComebackUser" name="btn"><span>복구</span></a>
							<a href="" class="btnType blue" id="btnSaveUser" name="btn"><span>저장</span></a>
							<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
						</div>
					</dd>
				</dl>
				<a href="" class="closePop"><span class="hidden">닫기</span></a>
			</form>
		</div>
		<!-- #################################################################################################################################################################################################################### -->
	</form>

</body>
</html>