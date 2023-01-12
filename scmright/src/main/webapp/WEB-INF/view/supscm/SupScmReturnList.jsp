<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>  <!-- 유저타입이 A가 아니면 기본페이로 -->
</c:if>

 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- abc -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공지사항</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">
	
</script>

</head>
<body>
	<form id="myForm" action="" method="">


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
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">납품업체</span> <span
									class="btn_nav bold">반품 지시서 목록</span> <a
									href="../cusord/productList.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle" style="height: 100px;">
								<span style="line-height: 100px">반품 지시서 목록</span>
							</p>
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
		                        align="left"
		                        style="border-collapse: collapse; border: 1px #50bcdf;">
		                        <tr style="border: 0px; border-color: blue">
		                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
		
		                           <td width="50" height="25" style="font-size: 100%">제목</td>
		                           <td width="50" height="25" style="font-size: 100%">
		                            <input type="text" style="width: 120px" id="title" name="title"></td>                     
		                           <td width="50" height="25" style="font-size: 100%">작성일</td>
		                           <td width="50" height="25" style="font-size: 100%">
		                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
		                           <td width="50" height="25" style="font-size: 100%">
		                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
		                           <td width="110" height="60" style="font-size: 120%">
		                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
		                            <!-- <input type="button" value="검  색  " id="searchBtn" name="btn" class="test_btn1" 
		                              style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white"/> -->
		                        </tr>
                    		</table>    
							<div class="divNoticeList">




								<table class="col" id="dateDay">
									<caption>caption</caption>
									<colgroup>
										<col width="10%">
										<col width="35%">
										<col width="20%">
										<col width="20%">
									</colgroup>

									<thead>
										<tr>
											<th scope="col">반품 번호</th>
											<th scope="col">납품업체</th>
											<th scope="col">반품날짜</th>
											<th scope="col">입금확인</th>
										</tr>
									</thead>
									<tbody id="listNotice"></tbody>
								</table>

							</div>
						</div> <!--// 공지사항 테이블 페이지 네비게이션 -->
						<div class="paging_area" id="comnfileuploadPagination"></div>


						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<!-- 모달팝업 -->
		<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		</div>
		<!--// 모달팝업 -->
	</form>
</body>
</html>