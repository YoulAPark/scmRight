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
<title>기업고객/직원정보 관리</title>

<!-- common_include.jsp 삽입 -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- [daumPost API]우편번호 조회 사용으로 인한 script 삽입-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8" src="${CTX_PATH}/js/popFindZipCode.js"></script>

<!-- Session사용 userType이 A일경우 redirect처리 -->
<script type="text/javascript">
	// 페이징 처리
	var pageSize = 5; // 화면에 출력할 데이터의 개수
	var pageBlockSize = 2; // 몇 개의 블럭으로 보여줄 것인지

	$(function() {
		userList();
	});

	// Button Event
	function fButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); // 기본 클릭 동작을 막아주는 역할을 함

			var btnId = $(this).attr('id');

			switch (btnId) {
			case 'btnSaveUser':
				fSaveUser(); // save 안에 저장,수정
				break;
			case 'btnDeleteUser':
				fDeleteUser();// 삭제 
				//swal("삭제버튼");
				break;
			case 'btnDeleteDeil':
				fDeleteDeli(); // 배송담당자 삭제
				break;
			case 'btnClose':
				gfCloseModal(); // 모달닫기 
				break;
			case 'btnUpdateUser':
				fUpdateUser(); // 수정하기
				break;
			case 'searchBtn':
				board_search(); // 검색하기
				break;
			case 'btnComebackUser':
				fComebackUser(); // 복구
				//swal("복구 버튼");
				break;
			case 'btnUpdateDeli':
				fDeliTransferClick(); // 창고 이관
				break;
			case 'btnApprovalUser':
				fApprovalUser(); // 승인
				break;

			}
		});
	}

	// userList 불러오기 - onload시 바로 userList function이 실행된다. 
	function userList(currentPage) {

		currentPage = currentPage || 1; // 페이징 네비게이션 : onLoad시 null이기에 무조건적으로 1page출력, paging Navi 클릭하여 실행시 해당 int값이 currentPage로 들어가게 된다.
		console.log("현재 클릭한 페이지 : " + currentPage)
		var param = {
			searchKey : $("#searchKey").val(), // searchkey : 검색시 select박스
			searchInput : $("#searchInput").val(), // sInput : 검색시 input text박스	
			basicNavi : $("#basicNavi").val(), // 기본 pagingNav = 1
			currentPage : currentPage,
			pageSize : pageSize
		};
		var listCallBack = function(returndata) {
			//console.log("data확인 : " + returndata);
			searchUserInfoList(returndata, currentPage);
		}

		callAjax("/admstd/listUsers.do", "post", "text", true, param, listCallBack);
	}

	// userList에서 불러온 searchUserInfoList
	function searchUserInfoList(returndata, currentPage) {

		$("#userList").empty().append(returndata); // tbody영역을 일단 비우고 덮어씌움

		currentPage = currentPage || 1;

		var totalCount = $("#totalCount").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCount,
				pageSize, pageBlockSize, 'userList');

		$("#pagingNavi").empty().append(paginationHtml);
		$("#currentPage").val(currentPage);
	}

	/* Modal _ 신규등록  */
	function frealPopModal(object) {

		// INSERT
		if (object == "" || object == null || object == undefined) {
			
			$('#checkstaff option').each(function() {
				$(this).prop('disabled', false);
			});

			$("#loginId").val("");
			$("#loginId").attr("readonly", false);

			$("#password").val("");

			$("#name").val("");
			$("#name2").val("");
			$("#email").val("");

			$("#tel1").val("");
			$("#tel2").val("");
			$("#tel3").val("");

			$("#company").val("");
			$("#chaCD").val("");

			$('#instaff').show();
			$('#outstaff').hide();
			$('#outstaff_account').hide();

			$("#zipcode").val("");
			$("#address").val("");
			$("#dt_address").val("");
			$("#account").val("");

			$('#checkstaff').change(function() {
				var state = $('#checkstaff option:selected').val();
				if (state == 'instaff') {
					$("#selectChaDiv").show();
					$('#instaff').show();
					$('#outstaff').hide();
					$('#outstaff_account').hide();
					$("#company").val("");
					$("#name2").val("");
				} else {
					$('#instaff').hide();
					$('#outstaff').show();
					$('#outstaff_account').show();
					$("#selectChaDiv").hide();
					$("#name").val("");
				}
			});
			//$("#chaDiv").hide(); // 담당업무 text박스 숨기기
			$("#btnDeleteUser").hide(); // 삭제버튼 숨기기
			$("#btnUpdateUser").hide();
			$("#btnComebackUser").hide();
			$("#btnSaveUser").show();
			$("#duplicate_check").show();
			$("#btnApprovalUser").hide();

		// UPDATE,DELETE
		} else {
			console.log(object.list)

			var div_cd = object.divCD;
			var del_cd = object.chaCD;
			console.log("div_cd : "+div_cd)
			console.log("del_cd : "+del_cd)
			//var approval_cd = object.approval_cd.toString();

			if (div_cd === "instaff") {
				$('#checkstaff option[value=instaff]').prop('selected','selected').change(); // value 에 맞게 option change된다.
				$("#instaff").show();
				$("#outstaff").hide();
				$("#outstaff_account").hide();
				//$('#checkstaff').attr('disabled', 'true'); //disabled <- 비활성화
				$('#checkstaff option[value=outstaff]').prop('disabled', true);

				$('#selectChaCD').val(object.user_type).prop("selected", true); // user_type에 맞게 select의 option이 매칭된다.
			}
			if (div_cd === "outstaff") {
				$('#checkstaff option[value=outstaff]').prop('selected','selected').change();
				$("#instaff").hide();
				$("#outstaff").show();
				$("#outstaff_account").show();
				//$('#checkstaff').attr('disabled', 'true');
				$('#checkstaff option[value=instaff]').prop('disabled', true);
				$('#selectBankCD').val(object.bank_cd).prop("selected", true);
				$('#account').val(object.user_account);

			}

			$("#loginId").val(object.loginID);
			$("#loginId").attr("readonly", true); // loginID 수정불가 

			$("#password").val(object.password);

			$("#name").val(object.name);
			$("#name2").val(object.name);
			$("#email").val(object.user_email);

			$("#tel1").val(object.user_tel1);
			$("#tel2").val(object.user_tel2);
			$("#tel3").val(object.user_tel3);

			$("#company").val(object.user_company);
			$("#chaCD").val(object.chaCD_name);

			$("#zipcode").val(object.user_zipcode);
			$("#address").val(object.user_address);
			$("#dt_address").val(object.user_dt_address);

			// 삭제 안된 계정 볼때 
			if (del_cd === "n") {
				//swal("삭제안된 계정입니다.");
				$("#btnDeleteUser").show();
				$("#btnComebackUser").hide();
				$("#btnSaveUser").hide();
				$("#btnUpdateUser").show();
				$("#btnApprovalUser").hide();
			}
			// 삭제된 계정 볼때
			if (del_cd === "y") {
				//swal("삭제된계정입니다.");
				$("#btnDeleteUser").hide();
				$("#btnComebackUser").show();
				$("#btnSaveUser").hide();
				$("#btnUpdateUser").hide();
				$("#btnApprovalUser").hide();
			}
			if (approval_cd === "y") {
				$("#btnApprovalUser").hide();
			}
			if (approval_cd === "n") {
				$("#btnApprovalUser").show();
				$("#btnDeleteUser").hide();
				$("#btnUpdateUser").hide();
				$("#btnSaveUser").hide();
			}

			$("#duplicate_check").hide();
			//if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			//$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정

		}
	}

	/* 회원관리 모달창(팝업) 실행  여기부터 */ 
	function modalUser(loginID) {

		// 신규저장 하기 버튼 클릭시 (값이 null)
		if (loginID == null || loginID == "") {
			$("#action").val("I"); // insert
			frealPopModal(loginID); //초기화 
			gfModalPop("#user");

		} else {
			$("#action").val("U"); // update
			modalDetailUser(loginID);
		}

	}
	
	/*회원정보 상세 조회*/
	function modalDetailUser(loginID) {
		
		var param = {
			loginID : loginID
		};
		
		var callBack = function(data) {
			frealPopModal(data);
		};

		callAjax("/admstd/detailUser.do", "post", "json", true, param, callBack);
	}

	// 아이디 중복체크
	function userIdCheck() {

		var data = {
			"loginID" : $("#loginId").val()
		};
		var idRules = /^[a-z0-9]{6,20}$/g;

		$.ajax({
			url : '/check_loginID.do',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false,
			success : function(data) {
				if (data == 1) {
					swal("이미 사용중인 아이디입니다.")
					return false;
				} else if (!idRules.test($("#loginId").val())) {
					console.log("사용가능");
					swal("사용가능한 아이디 입니다.")
					return false;
				}
			}
		});
	}

	// 우편번호찾기 DaumPostAPI
	function execDaumPostcode(q) {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("dt_address").focus();
			}
		}).open({
			q : q
		});
	}

	// 회원 저장 INSERT
	function fSaveUser() {
		alert("fSaveUser실행")
		var param = $("#RegisterForm").serialize();

		if (!(fValidatePopup())) {
			return;
		}

		$("#action").val("I");

		var resultCallback = function(data) {
			fSaveRegister(data);
		}

		callAjax("/register.do", "post", "json", true, param, resultCallback);
	}

	// 팝업 내 수정 및 저장
	function fValidatePopup() {

		// 내부직원
		if ($("#checkstaff option:selected").val() == "instaff") {
			var chk = checkNotEmpty([ [ "rloginID", "아이디를 입력해주세요!" ],
					[ "password", "비밀번호를 입력해주세요!" ], [ "tel1", "연락처 기입해주세요!" ],
					[ "tel2", "연락처 기입해주세요!" ], [ "tel3", "연락처 기입해주세요!" ],
					[ "email", "이메일을 입력해주세요!" ],
					[ "zipcode", "우편번호를 입력해주세요!" ],
					[ "address", "주소를 입력해주세요!" ],
					[ "dt_address", "상세주소 기입해주세요!" ], [ "name", "이름 기입해주세요!" ] ]);
		}

		// 기업고객
		if ($("#checkstaff option:selected").val() == "outstaff") {
			var chk = checkNotEmpty([ [ "rloginID", "아이디를 입력해주세요!" ],
					[ "password", "비밀번호를 입력해주세요!" ], [ "tel1", "연락처 기입해주세요!" ],
					[ "tel2", "연락처 기입해주세요!" ], [ "tel3", "연락처 기입해주세요!" ],
					[ "email", "이메일을 입력해주세요!" ],
					[ "zipcode", "우편번호를 입력해주세요!" ],
					[ "address", "주소를 입력해주세요!" ],
					[ "dt_address", "상세주소 기입해주세요!" ],
					[ "name2", "담당자명 기입해주세요!" ], [ "company", "회사명 기입해주세요!" ],
					[ "account", "계좌번호를 입력해주세요!" ] ]);
		}

		if (!chk) {
			return;
		}

		return true;
	}
	
	function userModal() {
		alert("확인")
	}
</script>

<style>
#user {
	width: 1000px;
	display: table;
}

#checkstaff {
	width: 80px;
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

	<form id="myUser" action="" method="">

		<input type="hidden" id="currentPage" value="1">
		<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
		<input type="hidden" id="basicNavi" value="1">
		<!-- <input type="hidden" id="swriter" value="${writer}"> 작성자 session에서 java에서 넘어온값 -->

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
								<a href="#" class="btn_nav">기준정보</a> <span class="btn_nav bold">기업고객/직원정보
									관리</span> <a href="top.location='javascript:location.reload()'"
									class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<!-- ######################### 기업고객/직원정보 관리 #########################   -->
								<span>기업고객/직원정보 관리 </span>
								<!-- ######################### 검색창 #########################   -->
								<span class="fr"> <!-- 삭제된 정보 표시 체크박스 --> <label><input
										type="checkbox" id="ckDelInfo" name="ckDelInfo" value="del">
										삭제된 정보 표시</label> <!-- select Box 사용 / selected : 기본으로 선택 된 상태 --> <select
									id="searchKey" name="searchKey" style="width: 80px;"
									v-model="searchKey">
										<option value="all" selected="selected">전체</option>
										<option value="comNm">회사명</option>
										<option value="stfNm">직원명</option>
										<option value="mngNm">담당자명</option>
										<option value="resNm">담당업무</option>
								</select> <input type="text" style="width: 160px; height: 30px;"
									id="searchInput" name="searchInput"> <a href=""
									class="btnType blue" id="searchBtn" name="btn"><span>검
											색</span></a>
								</span>
							</p>

							<!-- ######################### divUserList 출력 #########################-->
							<div class="divUserList">
								<table class="col">
									<!-- caption : 표에 대한 설명을 나타나기 위함 -->
									<caption>caption</caption>
									<!-- table 비율 지정 -->
									<colgroup>
										<col width="10%">
										<!-- 고객구분(기업고객/내부직원) -->
										<col width="21%">
										<!-- 회사명/성명(기업고객일 경우 회사명이 있다) -->
										<col width="21%">
										<!-- 담당업무파트(기업고객일 경우의 담당업부) -->
										<col width="21%">
										<!-- 담당자성함(기업고객일 경우 회사의 담당자 성함)-->
										<col width="27%">
										<!-- 고객구분(기업고객/내부직원) -->
										<!-- [재량]<col width="8%">  <!-- 고객구분(기업고객/내부직원) -->
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">회사명/성명</th>
											<th scope="col">담당업무</th>
											<th scope="col">담당자명</th>
											<th scope="col">연락처</th>
											<!-- [재량]<th scope="col" width="50px">삭제여부</th> -->
										</tr>
									</thead>
									<!-- 반복되는 tr/th 태그. *List.jsp 라는 별도의 페이지를 만들어 tbody의 id로 injection 시킨다. -->
									<tbody id="userList"></tbody>
								</table>

								<!-- 페이징 처리 -->
								<div class="paging_area" id="pagingNavi"></div>

								<!-- 신규등록 버튼 -->
								<span class="fr"> 
									<c:set var="nullNum" value=""></c:set>
									<a class="btnType blue" onclick="modalUser(${null});"><span>신규등록</span></a>
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

		<!-- 배송모달 -->
		<div id="deli" class="layerPop layerType2"
			style="width: 500px; height: 400px;">
			<input type="hidden" id="loginID" name="loginID">
			<!-- 수정시 필요한 num 값을 넘김  -->
			<dl>
				<dt>
					<strong>배송담당자의 창고</strong>
				</dt>
				<dd class="content">

					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>


						<tbody>
							<th>담당창고</th>
							<th>이관할 아이디</th>
							<tr>
								<td>
									<div id="chaDiv">
										<select id="selectWarehouse" name="selectWarehouse">
											<c:forEach items="${userInfoList}" var="list">
												<option id="optionWarehouse" value="${list.ware_no}"
													name="optionWarehouse"><c:out
														value="${list.ware_name}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td>
									<div id="deliIDDiv">
										<select id="selectDeliID" name=""selectDeliID"">
											<c:forEach items="${listDeliID}" var="list">
												<option id="optionDeliID" value="${list.loginID}"
													name="optionDeliID"><c:out value="${list.loginID}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</td>
							</tr>

						</tbody>
					</table>
					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnUpdateDeli" name="btn"><span>이관</span></a>
						<a href="" class="btnType blue" id="btnDeleteDeil" name="btn"><span>아이디
								삭제</span></a> <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>



	</form>

</body>
</html>