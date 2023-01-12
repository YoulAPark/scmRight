	var pageSize = 5; // 화면에 출력할 데이터의 개수
	var pageBlockSize = 10; // 몇 개의 블럭으로 보여줄 것인지
	
   $(function() {
   
      delList();
      //fButtonClickEvent();   
      
   });

   // Button Click Event
   /*function fButtonClickEvent() {      
      alert("ewewew");
      $('a[name=btn]').click(function(e) {
         e.preventDefault(); // 기본 클릭 동작을 막아주는 역할을 함         
         var btnId = $(this).attr('id');         
         alert("btnId : " + btnId);         
         switch(btnId) {
            case 'btnDtlCancle' : fDtlCancle();
               break;
            case 'btnDtl' : fbtnDtl();
               break;
         }
      });
   } */
   
   function delList(currentPage) {
      currentPage = currentPage || 1;
      var param = {
         searchKey : $("#searchKey").val(),       // searchkey : 검색시 select박스
         searchInput : $("#searchInput").val(),    // sInput : 검색시 input text박스   
         pageNavi : $("#pageNavi").val(),       // 기본 pagingNav = 1
         currentPage : currentPage,
         pageSize : pageSize
      };
      var callBack = function(returnData) {
         detailDelList(returnData, currentPage);
      }
      callAjax("/delcus/delList.do", "post", "text", true, param, callBack);
   }
   
   // 2. delList에서 불러온 detailDelList
   function detailDelList(returnData, currentPage) {
      $("#deliveryList").empty().append(returnData);
      currentPage = currentPage || 1;
      var totalCount = $("#totalCount").val();
      var paginationHtml = getPaginationHtml(currentPage, totalCount,  pageSize, pageBlockSize, 'delList');      
     console.log("paginationHTML : "+paginationHtml)
      $("#pagingNavi").empty().append(paginationHtml);
      $("#currentPage").val(currentPage);
   }
    
   // 3. Modal 출력
   function fModalSelectOne(coNo) {
      gfModalPop("#delInfo"); // delcusDirection.jsp의 delInfo열기
      delDtlList(coNo);
   }
   
   // 4. 모달 내부 리스트 단 건 조회
   function delDtlList(coNo) {

      var param = {
         coNo : coNo
      };   
      var callBack = function(returnData) {

         $("#coNo").empty().prepend(returnData[0].coNo); // 주문번호
         $("#name").empty().prepend(returnData[0].name);   // 주문자명
         $("#totalAddr").empty().prepend(returnData[0].totalAddr); // 배송주소지
         
         $("#prodName").empty().prepend(returnData[0].prodName); // 상품명
         $("#coCnt").empty().prepend(returnData[0].coCnt); // 주문수량
         $("#strNo").empty().prepend(returnData[0].strNo); // 창고번호
         $("#strName").empty().prepend(returnData[0].strName); // 창고명
         $("#totalStrAddr").empty().prepend(returnData[0].totalStrAddr); // 창고주소
         $("#delSts").empty().prepend(returnData[0].delSts); // 배송상태
         
         /*
          delSts DB값 = (1)waiting (2)loading (3)complete 일 경우 
            1. 버튼 show(), hide()
            2. text 배송처리, 배송완료처리      
         */
         if(returnData[0].delSts == "waiting") {
            $("#deliveryBtn").show().text("배송처리");
         }else if(returnData[0].delSts === "loading"){
            $("#deliveryBtn").show().text("배송완료처리");      
         }else if(returnData[0].delSts === "complete"){
            $("#deliveryBtn").hide();
         }

         // deliveryBtn 버튼 클릭시 function 실행
         $("#deliveryBtn").on("click", function() {
            $("#delDtlListResult").empty();
            fbtnDelivery(returnData[0].delNo);
            location.href="/delcus/delcusDirection.do"
         });
         
         // delCancle 버튼 클릭시 function 실행
         /*$("#delCancle").on("click", function() {
         });*/
      }
      callAjax("/delcus/delDelList.do", "post", "json", true, param, callBack);
   }
   
   
   function fbtnDelivery(delNo) {
      var param = { delNo : delNo }
      var callBack = function(returnData) {
         $("#delDtlListResult").empty();
         $("#delDtlListResult").append(returnData);
         gfCloseModal();         
      }
      callAjax("/delcus/deliverySts.do", "post", "json", true, param, callBack);
   }
   
   // 필요없어져서 주석처리 함
   /* 4-2. 모달 내부 리스트 출력
   function delDtlListResult(returnData) {
      var param = { coNo : returnData[0].coNo };
      var callBack = function(returnData) {
         $("#delDtlListResult").empty().append(returnData);
      }
      callAjax("/delcus/delDelListProd.do", "post", "text", true, param, callBack);
   }*/
   
   
   // 7. 모달창 닫기
   function fbtnCancle() {
      
   }
   