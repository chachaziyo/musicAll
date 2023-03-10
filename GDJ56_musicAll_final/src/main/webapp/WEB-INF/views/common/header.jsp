<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>musicAll</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="icon" href="${path}/resources/images/favicons/logo.png">
    <link rel="apple-touch-icon" sizes="57x57" href="${path}/resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${path}/resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${path}/resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${path}/resources/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${path}/resources/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${path}/resources/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${path}/resources/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${path}/resources/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${path}/resources/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="${path}/resources/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${path}/resources/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicons/favicon-16x16.png">
    <!-- <link rel="manifest" href="/manifest.json"> -->
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${path}/resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="${path}/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${path}/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${path}/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${path}/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${path}/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${path}/resources/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${path}/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${path}/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${path}/resources/css/colors/default.css" rel="stylesheet">
    
   <script src="${path}/resources/lib/jquery/dist/jquery.js"></script>
    <script src="${path}/resources/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${path}/resources/lib/wow/dist/wow.js"></script>
    <script src="${path}/resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="${path}/resources/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="${path}/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="${path}/resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="${path}/resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="${path}/resources/lib/smoothscroll.js"></script>
    <script src="${path}/resources/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="${path}/resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="${path}/resources/js/plugins.js"></script>
    <script src="${path}/resources/js/main.js"></script>
    
    
</head>

  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="${path }">musicAll</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
         
              <li class="dropdown"><a href="${path }/perfor/performanceList.do" >??????</a></li>
              <li class="dropdown"><a href="${path }/booking/bookinglist.do" >??????</a></li>
              <li class="dropdown"><a href="${path }/goods/goodsMain.do" >?????????</a></li>
              <li class="dropdown"><a class="dropdown-toggle" href="${path }/noticeList.do" data-toggle="dropdown">????????????</a>
              <ul class="dropdown-menu" role="menu">
                     <li><a href="${path }/noticeList.do"><i class="fa fa-list-ul fa-sm"></i>????????????</a></li>
                     <li><a href="${path }/question/question.do"><i class="fa fa-pencil-square-o"></i> 1:1??????</a></li>
             </ul>
              </li>
         

              <c:if test="${loginMember==null }">
                 <li class="dropdown"><a href="${path }/member/login.do" >?????????</a></li>
                 <li class="dropdown"><a href="${path }/member/joinchoice.do" >????????????</a></li>
              </c:if>
              <c:if test="${ (loginMember!=null) && (loginMember.member_Id ne 'admin') }"><!-- ??????????????? ???????????? ?????? -->
                 <li class="dropdown"><a class="dropdown-toggle" href="${path }/mypage/mypageMain.do" data-toggle="dropdown">???????????????</a>
                   <ul class="dropdown-menu" role="menu">
                     <li><a href="#" data-toggle="modal" data-target="#loginModal"><i class="fa fa-cog"></i> ???????????? ??????</a></li>
                     <li><a href="${path }/mypage/musicalList.do"><i class="fa fa-list-ul fa-sm"></i> ???????????? ??????</a></li>
                     <li><a href="${path }/mypage/likeMusical.do"><i class="fa fa-heart"></i> ?????? ??????</a></li>
                     <li><a href="${path }/mypage/pointList.do"><i class="fa fa-database"></i> ?????????</a></li>
                     <li><a href="${path }/mypage/shoppingList.do"><i class="fa fa-gift"></i> ?????? ????????????</a></li>
<%--                      <li><a href="${path }/mypage/myContentList.do?No=${loginMember.member_No}"><i class="fa fa-pencil-square-o"></i> ?????? ??? ???</a></li>
 --%>                     <li><a href="${path }/mypage/myContentList.do"><i class="fa fa-pencil-square-o"></i> ?????? ??? ???</a></li>
                     <!-- ?????? ????????? ????????? ??????no?????? ????????????...??????????????? ??????????????????.. ?????????????????? ????????? mypage?????????????????? //?????? ??? ???(??? ????????? + 1???1???????????? ?????????) ????????? int No??? ???????????? ???????????? session??? ???????????? ??????????????????! -->  
                   </ul>
                 </li>
                 <li class="dropdown"><a href="${path }/member/logout.do" >????????????</a></li>  
              </c:if>
              <c:if test="${(loginMember!=null) && (loginMember.member_Id eq 'admin') }" ><!-- ???????????? ???????????????-->
               <li class="dropdown"><a href="${path }/admin/adminMain.do" >??????????????????</a></li>
               <li class="dropdown"><a href="${path }/member/logout.do" >????????????</a></li>  
              </c:if>   
            
            </ul>
          </div>
        </div>
      </nav>
      <!-- ?????? ????????? ????????? (?????????????????? ???????????? ????????????) -->
      <c:if test="${ (loginMember!=null) && (loginMember.member_Id ne 'admin') }">
         <a class="cs-btn" onclick="click_msg_btn();" id="cs_btn">
            <img src="${path}/resources/images/chatting-icon.png" id="cs_btn_img" width="50" height="50">
         </a>
      </c:if>
      </main>


      <!-- ???????????? ????????? -->
      <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
      aria-labelledby="loginModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h3 class="modal-title" id="loginModalLabel"><b>???????????? ??????</b></h3>
                  <h5 class="modal-title" id="loginModalLabel">?????? ?????? ????????? ?????? ??????????????? ?????? ??????????????????.</h5>
               </div>
               <form action="" method="post">
                  <div class="modal-body">
                     <input type="password" name="password" id="memberPwd" class="form-control"
                        placeholder="???????????? ??????" required>
                     <input type="hidden" name="member_No" id="member_No" value="${loginMember.member_No }">
                        <small><span id="checkPwd" style="color:red; display:none;">????????? ?????????????????????.</span></small>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-g btn-round"
                         onclick="fn_updateMember();"><i class="fa fa-cog fa-spin"></i>??????</button>
                     <button type="button" class="btn btn-g btn-round"
                     data-dismiss="modal">??????</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      

      
      <script>
         const fn_updateMember=()=>{
            $.get("${path}/mypage/checkPwd.do?member_No="+$("#member_No").val()+"&password="+$("#memberPwd").val()
               ,data=>{
                  if(data==null || data==""){//???????????? ?????????
                     $("span#checkPwd").show();
                  }else{//???????????? ????????????
                     location.replace("${path }/mypage/updateMember.do?member_No="+data.member_No);
                  }
               });
         }
         
         const click_msg_btn=()=>{
            window.open('${path}/chatting/chatList.do', 'chatList_window', 'width=500, height=500, location=no, status=no, scrollbars=yes');
         }
         
      </script>