<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/performance/performanceView.css" rel="stylesheet">
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('159a9195668e221c0f6db2e6d888709d'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>



<section>
<div id="title-box">
        <br>
        <br>
        <br>
        <br>
        <p>${musical.getMType() }</p>
        <strong style="font-size:30px;">${musical.getMTitle() }</strong>
        <form name="myform" class="myform" method="post" >
		<br>
        	<c:choose>
        		<c:when test="${scoreAverage eq '0'}">
                	<fieldset>
                       <input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                   <input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                   <input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                   <input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                   <input type="radio"  name="rating" value="1" id="rate15"><label for="rate14">⭐</label> 
                    </fieldset>
                </c:when>
            	<c:when test="${scoreAverage eq '1'}">
                	<fieldset>
                       <input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                   <input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                   <input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                   <input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                   <input type="radio"  name="rating" value="1" id="rate15" checked><label for="rate14">⭐</label> 
                    </fieldset>
                </c:when>
                <c:when test="${scoreAverage eq '2'}">
                     <fieldset>
                      	<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                  	<input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                  	<input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                    <input type="radio"  name="rating" value="2" id="rate14"checked><label for="rate13">⭐</label>
	                    <input type="radio"  name="rating" value="1" id="rate15"><label for="rate14">⭐</label> 
                      </fieldset>    
                </c:when>
                <c:when test="${scoreAverage eq '3'}">
                      <fieldset>
                       	<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                    <input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                    <input type="radio" name="rating" value="3" id="rate13" checked><label for="rate12">⭐</label>
	                    <input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                    <input type="radio"  name="rating" value="1" id="rate15" ><label for="rate14">⭐</label> 
                      </fieldset>    
                </c:when>
                <c:when test="${scoreAverage eq '4'}">
                      <fieldset>
                       	<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                    <input type="radio"  name="rating" value="4" id="rate12"checked><label for="rate11">⭐</label>
	                    <input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                    <input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                    <input type="radio"  name="rating" value="1" id="rate15" ><label for="rate14">⭐</label> 
                       </fieldset>    
                </c:when>
                <c:when test="${scoreAverage eq '5'}">
                       <fieldset>
                       		<input type="radio" name="rating" value="5" id="rate11" checked><label for="rate10">⭐</label>
	                        <input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                        <input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                        <input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                        <input type="radio"  name="rating" value="1" id="rate15" ><label for="rate14">⭐</label> 
                      	</fieldset>                     		
                </c:when>
            </c:choose>           
        </form>
    </div>
    <br>


    <div class="parent">
        <div id="info-box" style=" height:700px;display: flex;">
          <div style="" >
          
          	<div>
              <img src="${path }/resources/upload/performance/${perPhoto.get(0).IName}" id="imgView" /><br>
              </div>
              
			<div id="icon-box" style="margin-left: 59px;margin-top: 100px;width: 10%;height:70px;float: left;">
                  <img src="${path }/resources/images/performance/share.png"
  					id="kakaotalk-sharing-btn" href="javascript:;" alt="카카오톡 공유 보내기 버튼" />
  			</div>		
  			<div id="chat-icon" style="margin-left:19px;width: 10%;margin-top: 100px;height:70px;float: left;">
  				<img src="${path }/resources/images/chatting-icon.png" onclick="bt_chat();"  >
                <!-- <input type="button" onclick="bt_chat();" value="채팅" > -->
            </div>  
              
            
            
          </div>
          
        <div class="info-box2">         
             <b class="info">공연기간</b><p>${musical.getMPeriod() } ~ ${musical.getMPeriodEnd() }</p><br>
             <b class="info">공연시간</b><p>${schedule.get(0).S_TIME}분</p><br>
             <b class="info">관람연령</b><p>${musical.getMAge() }</p><br>
             <b class="info">가격</b><p>vip석:${musical.getVipPrice() }원</p>
               <p>r석:${musical.getRPrice() }원</p>
               <p>s석:${musical.getSPrice() }원</p>
               <b class="info">장소</b><p>${musical.getHName() }</p><a href="javascript:showPopUp()">지도보기➤</a><br><br>
             <button class="btn btn-danger" id="go1" onclick="location.href='${path}/booking/bookingview.do?mCode=${musical.getMCode()} '">예매하러 가기</button><br>
			<br>
			<c:if test="${not empty loginMember}">
				<c:if test="${empty mLike}">	
             		<button class="btn btn-danger" id="go2" onclick="fn_addMyMusical();">관심공연 등록</button>
				</c:if>
				<c:if test="${not empty mLike}">
	             	<button class="btn btn-danger" id="go2" onclick="fn_deleteMyMusical();">관심공연 해제</button> 
				</c:if>
			</c:if>
         </div>
       </div>

	               


        <div id="downContainer">
            <ul>
                <li><a href="#" id="perInfo" style="font-size: 20px;">공연정보</a></li>
                <li><a href="#" id="Comment" style="font-size: 20px;">한줄평</a></li>
            </ul>
        </div>
	
        <div id="detailInfo"><!--상세정보-->
            <img src="${path }/resources/upload/performance/${perPhoto.get(1).IName}" width="800" height="2000" style="margin-left: 550px;">
        </div>

        <div class="oneComment" style="height:150px;  display: none; "><!--한줄평 입력하기-->
            <div id="starBox">
                <form name="myform" id="commentWrite" class="myform" method="post" action="${path }/perfor/insertComment.do">
                     <input type="hidden" name="mCode" value="${musical.getMCode() }">
                    <fieldset>
                    	<input type="radio">
                    	
                        <legend></legend>
                        <input type="radio" name="rating" value="5" id="rate6"><label for="rate6">⭐</label>
                        <input type="radio"  name="rating" value="4" id="rate7"><label for="rate7">⭐</label>
                        <input type="radio"  name="rating" value="3" id="rate8"><label for="rate8">⭐</label>
                        <input type="radio"  name="rating" value="2" id="rate9"><label for="rate9">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate10"><label for="rate10">⭐</label>
                    </fieldset>
                	<textarea id="commentContainer" name="ct" style="width: 800px; height:80px; border:none; float:left;"
                	placeholder="별점과 후기를 남겨주세요!"></textarea>
                	<input type="button" name="save" onclick="fn_submit();" value="등록" style="float:left;margin-left:10px;">
                </form>
            </div>
        </div>
        <c:if test="${not empty comment}">
        <c:forEach var="ct" items="${comment }">
         <div class="oneComment" style="height:150px;  display: none; margin-top:10px;">
            <div id="starBox">
                <form name="myform" class="myform" method="post" >
 				<br>
                       <c:choose>
                       		<c:when test="${ct.SCORE eq '1'}">
                       		<fieldset>
                       			<legend></legend>
                       			<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                        	<input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                        	<input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                        	<input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                        	<input type="radio"  name="rating" value="1" id="rate15" checked><label for="rate14">⭐</label> 
                       		 </fieldset>
                       		</c:when>
                       		<c:when test="${ct.SCORE eq '2'}">
                       		<fieldset>
                       			<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                        	<input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                        	<input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                        	<input type="radio"  name="rating" value="2" id="rate14"checked><label for="rate13">⭐</label>
	                        	<input type="radio"  name="rating" value="1" id="rate15"><label for="rate14">⭐</label> 
                       		</fieldset>    
                       		</c:when>
                       		<c:when test="${ct.SCORE eq '3'}">
                       		<fieldset>
                       			<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                        	<input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                        	<input type="radio" name="rating" value="3" id="rate13" checked><label for="rate12">⭐</label>
	                        	<input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                        	<input type="radio"  name="rating" value="1" id="rate15" ><label for="rate14">⭐</label> 
                       		</fieldset>    
                       		</c:when>
                       		<c:when test="${ct.SCORE eq '4'}">
                       		<fieldset>
                       			<input type="radio" name="rating" value="5" id="rate11"><label for="rate10">⭐</label>
	                        	<input type="radio"  name="rating" value="4" id="rate12"checked><label for="rate11">⭐</label>
	                        	<input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                        	<input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                        	<input type="radio"  name="rating" value="1" id="rate15" ><label for="rate14">⭐</label> 
                       		</fieldset>    
                       		</c:when>
                       		<c:when test="${ct.SCORE eq '5'}">
                       		<fieldset>
                       			<input type="radio" name="rating" value="5" id="rate11" checked><label for="rate10">⭐</label>
	                        	<input type="radio"  name="rating" value="4" id="rate12"><label for="rate11">⭐</label>
	                        	<input type="radio" name="rating" value="3" id="rate13"><label for="rate12">⭐</label>
	                        	<input type="radio"  name="rating" value="2" id="rate14"><label for="rate13">⭐</label>
	                        	<input type="radio"  name="rating" value="1" id="rate15" ><label for="rate14">⭐</label> 
                      		</fieldset>                     		
                       		</c:when>
                       </c:choose>

                	<p style="font-size:18px;">${ct.REVIEW_CONTENT }</p>
                 	<p style="font-size:13px;">${ct.REVIEW_DATE }&nbsp;&nbsp;&nbsp;${ct.MEMBER_ID }님</p>
                </form>
            </div>
        </div>
        </c:forEach>
        </c:if>
        <br>
</div>
</section>
<script>
    //카카오톡으로 공유하기
    Kakao.Share.createDefaultButton({
        container: '#kakaotalk-sharing-btn',
        objectType: 'feed',
        content: {
          title: '${musical.getMTitle() }',
          description: '#공연정보 #뮤지컬 #데이트 #분위기',
          imageUrl:
            'https://ibb.co/SyG33LR',
          link: {
            // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
            mobileWebUrl: 'https://gd1class.iptime.org:8844/GDJ56_musicAll_final/perfor/performanceView1.do?mCode=${musical.getMCode()}',
            webUrl: 'https://gd1class.iptime.org:8844/GDJ56_musicAll_final/perfor/performanceView1.do?mCode=${musical.getMCode()}',
          },
        },
        social: {
          likeCount: 286,
          commentCount: 45,
          sharedCount: 845,
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'https://gd1class.iptime.org:8844/GDJ56_musicAll_final/perfor/performanceView1.do?mCode=${musical.getMCode()}',
              webUrl: 'https://gd1class.iptime.org:8844/GDJ56_musicAll_final/perfor/performanceView1.do?mCode=${musical.getMCode()}',
            },
          },
         
        ],
      });
    
		<!--show and hide 클릭이벤트-->
        $('#perInfo').click(function(){
            $("#detailInfo").show();
            $(".oneComment").hide();
        })

        $('#Comment').click(function(){
            $("#detailInfo").hide();
            $(".oneComment").show();
        })
		
        //한줄평 등록
        const fn_submit=()=>{
        	var memberNo='${loginMember.member_No}';
        	var mCode=$("input[name=mCode]").val();
        	console.log(memberNo);
        	let reservations=[];
        	<c:forEach var='e' items="${reservation}">
        		reservations.push('${e.memberNo}');
        	</c:forEach>
        	console.log("예약자 번호 배열:"+reservations);
        		if(reservations.indexOf(memberNo) !=-1){
        			console.log("일치");
        			console.log(mCode);
        			alert("한줄평 등록이 완료되었습니다! 감사합니다.");
        			$("#commentWrite").submit();
        		}else{
        			console.log("불일치");
        			alert("공연을 예매한 회원만 작성가능합니다.");
        			return false;
        		}
        	
        }
        
        //관심공연 등록하기 
        const fn_addMyMusical=()=>{
           var memberNo='${loginMember.member_No}';
           var mCode=$("input[name=mCode]").val();
           console.log(memberNo);
           console.log(mCode);
           if(memberNo==null){
              alert("로그인한 회원만 작성가능합니다.");
              location.assign("${path}/member/login.do");
           }
           else{
              location.assign("${path}/perfor/addMyMusical.do?mCode=${musical.getMCode()}&&memberNo=${loginMember.member_No}");

           }
        }
        
        //관심공연 해제하기 
        const fn_deleteMyMusical=()=>{
        	var memberNo='${loginMember.member_No}';
            var mCode=$("input[name=mCode]").val();
        	location.assign("${path}/perfor/deleteMyMusical.do?mCode=${musical.getMCode()}&&memberNo=${loginMember.member_No}");

        }
        
        //지도 창 
        function showPopUp() {
        	
        	var hCode='${musical.getHCode() }';
        	//console.log(hCode);
        	
        	var width = 420;
        	var height = 340;
        	
        	var left = (window.screen.width / 2) - (width/2);
        	var top = (window.screen.height / 4);
        	
        	var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
        	
            const url = "${path}/perfor/placeMap.do?hCode=${musical.getHCode() }";

        	window.open(url, "hello popup", windowStatus);
        }
        
        
        
        //채팅함수->방번호 넘김!
        const bt_chat =  function(){
        	let url = "${path}/chatting/chattingpage.do?roomNo=" +${param.mCode}; 
        	window.open(url, 'chat_window', 'width=500, height=500, location=no, status=no, scrollbars=yes');
        	/* location.href="${path}/chatting/chattingpage.do?roomNo="+${param.mCode}; */ 

        }
</script>


    <br>
    <br>
    <br>
<script src="${path }/resources/js/share.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>