<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/performance/performanceView.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<section>
<div id="title-box">
        <br>
        <br>
        <br>
        <br>
        <p>라이센스 뮤지컬 - 1위</p>
        <c:forEach var="r" items="${reservation }">
        <input type="hidden" name="reserNo" value="${r.memberNo }">
        </c:forEach>
        <input type="hidden" name="memberNo" value="${loginMember.getMember_No() }">
       
        <strong style="font-size:30px;">${musical.getMTitle() }</strong>
        <form name="myform" class="myform" method="post" action="./save">
		<br>
        	<c:choose>
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
        <div id="info-box">
            <div style="display:inline-block; " >
                <img src="${path }/resources/upload/performance/${perPhoto.get(0).IName}" id="imgView" style="margin-top:-500px;">
                <input type="button" onclick="bt_chat();" value="채팅">
            </div>
            <div class="info-box2" >
                <b class="info">공연기간</b><p>${musical.getMPeriod() } ~ ${musical.getMPeriodEnd() }</p><br>
                <b class="info">공연시간</b><p>${schedule.get(0).S_TIME}분</p><br>
                <b class="info">관람연령</b><p>${musical.getMAge() }</p><br>
                <b class="info">가격</b><p>vip석:${musical.getVipPrice() }원</p>
                <p>r석:${musical.getRPrice() }원</p>
                <p>s석:${musical.getSPrice() }원</p>
                <b class="info">장소</b><p>${musical.getHName() }</p><br><br>
                <button class="btn btn-danger" id="go1" onclick="location.href='${path}/booking/bookingview.do?mCode=${musical.getMCode()} '">예매하러 가기</button><br>
                <button class="btn btn-danger" id="go2">관심공연 등록</button>
          
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
                <form name="myform" class="myform" method="post" action="${path }/perfor/insertComment.do">
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
        <c:forEach var="ct" items="${comment }">
         <div class="oneComment" style="height:150px;  display: none; margin-top:10px;">
            <div id="starBox">
                <form name="myform" class="myform" method="post" action="./save">
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
        <br>

       	
    </div>
</section>
    <script>
		<!--show and hide 클릭이벤트-->
        $('#perInfo').click(function(){
            $("#detailInfo").show();
            $(".oneComment").hide();
        })

        $('#Comment').click(function(){
            $("#detailInfo").hide();
            $(".oneComment").show();
        })
		
        const fn_submit=()=>{
        	var reserNo=$("input[name=reserNo]").val();
        	var memberNo=$("input[name=memberNo]").val();
        	var mCode=$("input[name=mCode]").val();
        	console.log(reserNo);
        	
        	if(reserNo.indexOf(memberNo) !=-1){
        		console.log("일치");
        		console.log(mCode);
        		alert("한줄평 등록이 완료되었습니다! 감사합니다.");
        		$(".myform").submit();
        		
        	}else{
        		console.log("불일치");
        		alert("공연을 관람한 회원만 작성가능합니다.");
        		return false;
        	}
        }
	/* 
        		const str = 'Hello, World, Javascript';

        	if (str.indexOf('Hello') != -1) {
        	  console.log("exist Hello");
        	} else {
        	  console.log("not exist Hello");
        	}
        } */

        //채팅함수->방번호 넘김!
        const bt_chat =  function(){
        	location.href="${path}/chatting/chattingpage.do?roomNo="+${param.mCode}; 
        }
    </script>


    <br>
    <br>
    <br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>