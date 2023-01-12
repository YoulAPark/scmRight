<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>


<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	
	// 상세코드 페이징 설정
	var pagesize = 5;
	var pagenumsize = 5;

	/** OnLoad event */ 
	$(function() {
		// 일일 수주 조회
		oderDetailsList();
		
		// 창고 가져오기
		selectComCombo("wh", "swhall", "all", "", ""); // 창고  whall : selectbox ID   value :  strNo

		// 창고 가져오기
		selectComCombo("wh", "owhall", "all", "", ""); // 창고  whall : selectbox ID   value :  strNo
		
	});

	/** 일별 수주 내역 조회 */
	function oderDetailsList(clickpagenum) {
		
		/* if(clickpagenum == null){
			clickpagenum = 1;
		} */
		//clickpagenum = (clickpagenum != null) ? clickpagenum : 1;
		
		//clickpagenum 이 null 이면 1 값을 clickpagenum에 넘겨준다 clickpagenum 값이 있을 시 clickpagenum에 clickpagenum을 넘겨준다
		clickpagenum = clickpagenum || 1;
			
		var refundCheck = "";
		
		$('input:checkbox[name=refundCheck]').each(function (index) {
			if($(this).is(":checked")==true){
				refundCheck = $(this).val();
		    }
		});
		
		var param = {
			startDate : $("#startDate").val(),
			endDate : $("#endDate").val(),
			coDpsts : refundCheck,
			clickpagenum : clickpagenum,
			pagesize : pagesize
		};
		
		var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);
			
			searchcallbackprocess(returndata, clickpagenum);
			
		}
			
		callAjax("AdmstdOrderDetailsList.do", "post", "text", true, param, searchcallback);
	  
	  // Ajax실행 방식
	  // callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
	  // html로 받을거라 text
	  //callAjax("admtrd/AdmstdOrderDetailsList.do", "post", "text", true, param, resultCallback);
	}
	
	//리스트 조회후 tbody에 리스트 주입 후 페이징 처리
	function searchcallbackprocess(returndata, clickpagenum){
			
		clickpagenum = clickpagenum || 1;
			
		$("#orderDetailList").empty().append(returndata);
		
		var totalcnt = $("#searchlistcnt").val();
		
		console.log("totalcnt :"+totalcnt);
		
		var paginationHtml = getPaginationHtml(clickpagenum, totalcnt, pagesize, pagenumsize, 'oderDetailsList');
		console.log("paginationHtml : " + paginationHtml);

		$("#oderDetailListPagination").empty().append( paginationHtml );
		
		$("#hclickpagenum").val(clickpagenum);
			
		}
	
	//배송 지시서 모달 오픈
	function shippingModalOpen(coNo,prodNo,coDpsts,strCnt,coCnt) {
		
		if(coDpsts != "1" || coDpsts != 1) {
			alert("입금 되지않은 내역입니다.");
			return
		}
		
		if(strCnt == "0" || strCnt == 0) {
			alert("창고에 재고가 없습니다.");
			return
		}
		
		var param = {
				coNo : coNo
			};
		
		var searchordercallback = function(data){
			
			console.log("data : " + data);
			
			if(coCnt <= data){
				alert("이미 주문 수량에 맞게 배송을 하였습니다.");
				return
			}else{
				callAjax("shipping.do", "post", "json", true, param, searchcallback);
			}
			
		}
		
		var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);
			
			var today = new Date(returndata.result.coDate).toISOString().substring(0,10);	
			
			$("#order_no").append(coNo);
			$("#order_date").append(today);
			$("#user_company").prepend(returndata.result.com_name);
			$("#pro_name").prepend(returndata.result.prodName);
			$("#order_qty").prepend(returndata.result.coCnt);
			$("#prod_no").val(prodNo);
			
			gfModalPop("#deliDirection");
			
		}
		
		callAjax("orderCnt.do", "post", "json", true, param, searchordercallback);
			
	}
	
	//shippingModalClosed
	function shippingModalClosed() {
		$("#order_no").empty();
		$("#order_date").empty();
		$("#user_company").empty();
		$("#pro_name").empty();
		$("#order_qty").empty();
		$("#pro_ware_qty_upper").val("");
		$("#prod_no").val("");
		$("#swhall").val("");
		$("#pro_ware_qty_upper").val("");
		$("#shipping_tbody").empty();
		$("#order_qty_upper").val("");
	}
	
	//발주 지시서 모달 오픈
	function orderModalOpen(prodNo) {
		
		var param = {
				prodNo : prodNo
			};
			
		var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);	
			
			$("#pur_pro_no").append(returndata.result.prodNo);
			$("#prod_no").val(prodNo);
			$("#pur_pro_name").append(returndata.result.prodName);
			$("#pur_deli_company").prepend(returndata.result.supName);
			$("#pur_login_id").prepend(returndata.loginId);
			
			gfModalPop("#purchaseDirection");
			
		}
			
		callAjax("order.do", "post", "json", true, param, searchcallback);
		
	}
	
	//발주 지시서 ModalClosed
	function purchaseDirectionModalClosed() {
		$("#pur_pro_no").empty();
		$("#pur_pro_name").empty();
		$("#pur_deli_company").empty();
		$("#pur_login_id").empty();
		$("#prod_no").val("");
		$("#owhall").val("");
		$("#pur_pro_ware_qty_upper").val("");
	}
	
	//swhall 재고 개수 가져오기
	function sstorCnt() {
	
		var prodNo = $("#prod_no").val();
		var strNo = $("select[name=swhall]").val();
		
		console.log("prodNo : " + prodNo + " strNo : " + strNo)
		
		if(strNo == 0 || strNo == "") {
			console.log("strNo : " + strNo)
			$("#pro_ware_qty_upper").val("");
		}
		
		var param = {
				strNo : strNo,
				prodNo : prodNo
			};
			
			var searchcallback = function(returndata){
				
				console.log("returndata : " + returndata);	
				
				$("#pro_ware_qty_upper").val(returndata.result);
				
			}
			if(prodNo != "" && strNo != ""){
				callAjax("storCnt.do", "post", "json", true, param, searchcallback);
			}
		
	}
	
	//owhall 재고 개수 가져오기
	function ostorCnt() {
	
		var prodNo = $("#prod_no").val();
		var strNo = $("select[name=owhall]").val();
		
		console.log("prodNo : " + prodNo + " strNo : " + strNo)
		
		var param = {
				strNo : strNo,
				prodNo : prodNo
			};
			
		var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);	
			
			$("#pur_pro_ware_qty_upper").val(returndata.result);
			
		}
		if(prodNo != "" && strNo != ""){
			callAjax("storCnt.do", "post", "json", true, param, searchcallback);
		}
		
	}
	
	//배송지시서 추가
	function shpping() {
		var strNo = $("select[name=swhall]").val();
		var strName = $("select[name=swhall] option:checked").text();
		var prodNo = $("#prod_no").val();
		var prodName = $("#pro_name").text();
		var prodCnt = $("#order_qty_upper").val();
		var order_qty = Number($("#order_qty").text());
		var order_qty_upper = Number($("#order_qty_upper").val());
		var pro_ware_qty_upper = Number($("#pro_ware_qty_upper").val());
		var qtyLength = $("td[name='prodCnt']").length;
		var totalQty = 0;
		
		for(i = 0; i < qtyLength; i++) {
			totalQty += Number($("td[name='prodCnt']").eq(i).text());
			console.log("totalQty : " + totalQty + " qtyLength : " + qtyLength + " order_qty_upper : " + order_qty_upper);
		}
		
		totalQty += order_qty_upper;
		
		if(prodCnt == "") {
			alert("주문 개수 없이는 추가하실 수 없습니다.");
			document.getElementById("#order_qty_upper").focus();
			return
		}
		
		if($("#pro_ware_qty_upper").val() == "" || $("#pro_ware_qty_upper").val() == 0) {
			alert("창고를 선택하지 않았거나 재고 개수가 없습니다.");
			return
		}
		
		if(order_qty < order_qty_upper){
			alert("주문개수보다 더 많은 양을 주문할 수 없습니다.");
			return
		}
		
		if(pro_ware_qty_upper < order_qty_upper){
			alert("재고개수보다 더 많은 양을 주문할 수 없습니다.");
			return
		}
		
		if(order_qty < totalQty) {
			alert("주문개수보다 더 많은 양을 주문할 수 없습니다.");
			return
		}
		
		console.log("strNo : " + strNo + " strName : " + strName + " prodNo : " + prodNo + " prodName : " + prodName + " prodCnt : " + prodCnt);
		
		var param = {
				strNo : strNo
			};
		
		var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);	
			
			$("#shipping_tbody").prepend("<tr id='shtr'><td name='strNo'>" + strNo + "</td><td name='strName'>" + strName + "</td><td name='prodNo'>" + prodNo + "</td><td name='prodName'>" + prodName + "</td><td name='prodCnt'>" + prodCnt + "</td><td id='strMnm'>" + returndata.result + "</td><td id='relativeHeight'><a class='btnType gray' style='cursor: pointer;' onclick='deletetb(this)' ><span>삭제</span></a></td></tr>")
			
		}
		
		callAjax("getDelivery.do", "post", "json", true, param, searchcallback);
		
		
	}
	
	//modaltb 삭제
	function deletetb(tbthis) {
		tbthis.closest('tr').remove();
	}
	
	//배송지시서 보내기
	function sendShipping() {
		
		if($("#shipping_tbody").text() == "") {
			alert("작성된 배송지시서가 없습니다.");
			return
		}
		
		var coNo = $("#order_no").text();
		var length = $("td[name='strNo']").length;
		var strNo = "";
		var prodNo = "";
		var prodCnt = "";
		
		for(i = 0; i < length; i++) {
			if(i < length-1){
				strNo += $("td[name='strNo']").eq(i).text() + ",";
				prodNo += $("td[name='prodNo']").eq(i).text() + ",";
				prodCnt += $("td[name='prodCnt']").eq(i).text() + ",";
			} else {
				strNo += $("td[name='strNo']").eq(i).text();
				prodNo += $("td[name='prodNo']").eq(i).text();
				prodCnt += $("td[name='prodCnt']").eq(i).text();
			}
		}
		console.log("coNo : " + coNo + " strNo : " + strNo + " prodNo : " + prodNo + " prodCnt : " + prodCnt);
			
		var param = {
				coNo : coNo,
				strNo : strNo,
				prodNo : prodNo,
				prodCnt : prodCnt,
				length : length
			};
			
		var searchcallback = function(returndata){
			
			console.log("returndata : " + returndata);	
			
			location.href = "AdmstdOrderDetails.do";
			
		}
			
		callAjax("shippingInsert.do", "post", "json", true, param, searchcallback);
		
	}
	
	function order() {
		var prodNo = $("#pur_pro_no").text();
		var prodName = $("#pur_pro_name").text();
		var supName = $("#pur_deli_company").text();
		var strNo = $("select[name=owhall]").val();
		var strName = $("select[name=owhall] option:checked").text();
	}
	
</script>

</head>
<body>
	<input type="hidden" id="hclickpagenum" name="hclickpagenum" value=""/>
	<input type="hidden" id="prod_no" name="prod_no" value=""/>
	
	<div id="whInfoData"></div>
	
	<div id="productDetail"></div>

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
							<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a>
							<span class="btn_nav bold">일별 수주 내역</span> <a href="" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>일별 수주 내역</span> <span class="fr"> 
							
								<input class="datetype" type="date" name = "date" id="startDate" value="${nowTime }" onchange="oderDetailsList()">
								&nbsp; ~ &nbsp;
								<input class="datetype" type="date" name = "date" id="endDate" value="${nowTime }" onchange="oderDetailsList()">
								
								<label><input type="checkbox" id="refundCheck" name="refundCheck" value="refund" onchange="oderDetailsList()"> 입금 목록 조회</label> 
								 
							</span>
						</p>

						<div class="divComGrpCodList">
							<table class="col" id="dailyOrderTable">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
									<col width="5%">
									<col width="8%">
									<col width="7%">
									<col width="8%">
									<col width="5%">
									<col width="9%">
									<col width="9%">
									<col width="7%">
									<col width="7%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">주문 번호</th>
										<th scope="col">주문 일자</th>
										<th scope="col">고객기업명</th>
										<th scope="col">주문제품명</th>
										<th scope="col">재고 개수</th>
										<th scope="col">공급가</th>
										<th scope="col">주문 개수</th>
										<th scope="col">금액 합계</th>
										<th scope="col">주문구분</th>
										<th scope="col">납품희망날짜</th>
										<th scope="col">입금여부</th>
										<th scope="col">배송지시서 작성</th>
										<th scope="col">발주지시서 작성</th>
									</tr>
								</thead>
								<!-- 리스트 가져오기 -->
								<tbody id="orderDetailList" ></tbody>
							</table>
						</div>
						<!-- 페이징 처리 -->
						<div class="paging_area" id="oderDetailListPagination"></div>
						<!-- <div class="paging_area" id="pagingnavi">
							<div class="paging">
								<a class="first" href="javascript:selectUserList(1)">
								<span class="hidden">맨앞</span></a>
								<a class="pre" href="javascript:selectUserList(1)">
								<span class="hidden">이전</span></a>
								<strong>1</strong> 
								<a onclick="oderDetailsList(2)">2</a> 
								<a onclick="oderDetailsList(3)">3</a> 
								<a onclick="oderDetailsList(4)">4</a>
								<a onclick="oderDetailsList(5)">5</a>
								<a class="next" href="javascript:selectUserList(5)">
								<span class="hidden">다음</span></a>
								<a class="last" href="javascript:selectUserList(5)">
								<span class="hidden">맨뒤</span></a>
							</div>
						</div> -->


					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="deliDirection" class="layerPop layerType2"
		style="width: 900px;">
		<dl>
			<dt>
				<strong>배송 지시서 작성</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->

				<table class="col">
					<caption>caption</caption>
					<colgroup>
						<col width="8%">
						<col width="14%">
						<col width="10%">
						<col width="18%">
						<col width="6%">
						<col width="8%">
						<col width="6%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">주문 번호</th>
							<th scope="col">주문 일자</th>
							<th scope="col">고객기업명</th>
							<th scope="col">주문제품명</th>
							<th scope="col">주문 개수</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><a type="text" class="inputTxt p100" name="order_no"
								id="order_no" readonly="readonly" /></a></td>
							<td id="order_date"></td>
							<td id="user_company"></td>
							<td id="pro_name"></td>
							<td id="order_qty"></td>
						</tr>
					</tbody>
				</table>

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="15%">
						<col width="5%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">창고 선택</th>
							<td>
								<select id="swhall"  name="swhall" onchange="sstorCnt()"> </select>
							</td>

							<th scope="row">재고 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="pro_ware_qty_upper" readonly="readonly" /></td>
							<th scope="row">주문 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="order_qty_upper" /></td>
							<td>
							<a onclick="shpping()"
							 class="btnType blue" style="cursor: pointer;"><span>추가</span></a>
							</td>
						</tr>

					</tbody>
				</table>
				
				<table class="col" id ="shippingDiretionTable">
					<caption>caption</caption>
					<colgroup>
					
						<col width="3%">
						<col width="12%">
						<col width="12%">
						<col width="16%">
						<col width="3%">
						<col width="8%">
						<col width="3%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">창고번호</th>
							<th scope="col">창고명</th>
							<th scope="col">제품번호</th>
							<th scope="col">제품명</th>
							<th scope="col">수주 개수</th>
							<th scope="col">배송 담당자</th>
							<th scope="col">비고</th>
						</tr>
					</thead>
					<tbody id="shipping_tbody"></tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a class="btnType blue" style="cursor: pointer;" onclick="sendShipping()"><span>완료</span></a>
					<a href="" class="btnType gray" id="btnClose"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop" onclick="shippingModalClosed()"><span class="hidden">닫기</span></a>
	</div>

	<div id="purchaseDirection" class="layerPop layerType2" style="width: 900px;">
		<dl>
			<dt>
				<strong>발주 지시서 작성</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->


				<table class="col">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="12%">
						<col width="10%">
						<col width="6%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">제품번호</th>
							<th scope="col">제품명</th>
							<th scope="col">납품기업</th>
							<th scope="col">발주자</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td id="pur_pro_no"></td>
							<td id="pur_pro_name"></td>
							<td id="pur_deli_company"></td>
							<td id="pur_login_id"></td>
						</tr>
					</tbody>
				</table>

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="15%">
						<col width="5%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">창고 선택</th>
							<td>
								<select id="owhall"  name="owhall" onchange="ostorCnt()" > </select>
							</td>

							<th scope="row">재고 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="pur_pro_ware_qty_upper" readonly="readonly" /></td>
							<th scope="row">발주 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="pur_order_qty_upper" /></td>
							<td>
							<a href="javascript:faddPurchaseBtn();"
							 class="btnType blue"><span>추가</span></a>
							</td>
						</tr>

					</tbody>
				</table>
				
				<table class="col" id ="purchaseDiretionTable">
					<caption>caption</caption>
					<colgroup>
					
						<col width="10%">
						<col width="12%">
						<col width="10%">
						<col width="3%">
						<col width="10%">
						<col width="3%">
						<col width="8%">
						<col width="3%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">제품번호</th>
							<th scope="col">제품명</th>
							<th scope="col">납품기업</th>
							<th scope="col">창고번호</th>
							<th scope="col">창고명</th>
							<th scope="col">발주개수</th>
							<th scope="col">발주자</th>
							<th scope="col">비고</th>
						</tr>
					</thead>
					<tbody id="purchase_tbody">
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a onclick="order()" class="btnType blue" id="btnPurDirDone"><span>신청</span></a>
					<a href="" class="btnType gray" id="btnClosePurDir"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop" onclick="purchaseDirectionModalClosed()"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</body>
</html>