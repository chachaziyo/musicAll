<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="sDay" value="${sdayMap.keySet() }"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<section>

    <style>
        /* Form */
        
        .question{width:100%;border-top:2px solid #bdbdbd;border-bottom:2px solid #bdbdbd;font-family:"NanumGothic",sans-serif;}
        .question .qtit{text-align:left; margin:50px 0 10px 0;}
        .question tr{border-top:1px solid #cdcdcd;}
        .question tr:first-child{border-top:0;}
        .question th{background:#f6f6f6; width:20%;text-align:left; padding-left:3%}
        .question td{text-align:left;background:#fff;padding-top:1%!important;padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-height:26px;padding-left:3%}
        .question input[type="text"],
        .question select{margin-right:1%;color:#5c5c5c;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#f6f6f6;vertical-align:middle;border:1px solid #cdcdcd;padding:1%;}
        .question select{padding:0.9%;}
        .question textarea{vertical-align:middle;border:1px solid #cdcdcd; width:94%; height:100px;background:#f6f6f6;padding:1%}
        .question label{margin-right:1%;}
        .question .button{margin-right:1%;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#5e5e5e;vertical-align:middle;border:1px solid #5e5e5e;padding:1%; cursor:pointer;}
        .question .button a{color:#fff;}
        .question .add{margin-top:1%;}
        .question .wid10{width:10%;}
        .question .wid20{width:20%;}
        .question .wid30{width:30%;}
        .question .wid53{width:49%;}
        
        .btngreen{margin-top:30px;}
        .btngreen a{width:8%;margin:0 auto;display:block;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#fff;border:1px solid #FF8000;border-radius:2em;background:#FF8000; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
        .btngreen a:hover{background:#fff;color:#FF8000;}
    </style>
        
        <!-- Form -->
     <form id="perforFrm" action="${path }/adminPerfor/insertPerformance.do"
        method="post" enctype="multipart/form-data">
        <input type="hidden" name="mCode" value="${mCode }">
        <table class="question">
            <caption class="qtit"><b style="font-size:20px; margin-left:20px;">???????????? ??????</b></caption>
            <tr>
                <th class="th" scope="row"><b>?????? ??????</b></th>
                    <td><input type="text" name="mTitle" class="wid53" title="?????????" value="${musical.getMTitle() }"></td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>?????? ??????</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="radio" name="mType" id="original" value="????????????" ${musical.getMType().equals("????????????")?"checked":"" }>
                                ???????????? ???????????? </label>
                        <label>
                            <input type="radio" name="mType" id="license" value="????????????" ${musical.getMType().equals("????????????")?"checked":"" }>
                                ???????????? </label>
                        <label>
                            <input type="radio" name="mType"  id="makeMusical" value="???????????????" ${musical.getMType().equals("???????????????")?"checked":"" }>
                                ???????????????  </label>
                        <label>
                            <input type="radio" name="mType"  id="nonverbal" value="?????????" ${musical.getMType().equals("?????????")?"checked":"" }>
                                ????????? ???????????? </label>
                        <label>
                            <input type="radio" name="mType"  id="child" value="??????" ${musical.getMType().equals("??????")?"checked":"" }>
                                ?????? </label>
                        </p>
                    </td>
            </tr>
            <tr>
                <th class="th" scope="row"><b>?????? ???????????? ??????</b>
                <td>
                    <p>
                        <label>
                            <input type="radio" name="mAge" value="???????????????" id="allCan" ${musical.getMAge().equals("???????????????")?"checked":"" }>
                                ??????????????? </label>
                        <label>
                            <input type="radio" name="mAge" value="8?????????" id="overEight" ${musical.getMAge().equals("8?????????")?"checked":"" }>
                                8??? ?????? </label>
                        <label>
                            <input type="radio" name="mAge" value="12?????????" id="overTwelve" ${musical.getMAge().equals("12?????????")?"checked":"" }>
                                12??? ?????? </label>
                        <label>
                            <input type="radio" name="mAge" value="15?????????" id="overFifteen" ${musical.getMAge().equals("15?????????")?"checked":"" }>
                                15??? ?????? </label>
                    </p>
                </td>
            </tr>
                <tr>
                    <th class="th" scope="row"><b>?????? ??????, ?????? ??????</b></th>
                    <td>
                        <p>
                        <label>
                            <input type="checkbox" name="mon" id="mon" value="???" 
                            ${sDay.contains("???")?"checked":"" }>
                                ??? 
                        </label>1??????:&nbsp;<input type="text" id="mon_time1" class="time1" name="startTime1" class="form-control" style="width:140px;" 
                        					value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}">
                        		2??????:&nbsp;<input type="text" id="mon_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="tues" id="tues" value="???" 
                            ${sDay.contains("???")?"checked":"" }>
                                ??? 
                        </label>1??????:&nbsp;<input type="text" id="tues_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}" >
                        		2??????:&nbsp;<input type="text" id="tues_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="wends" id="wends" value="???"
                            ${sDay.contains("???")?"checked":"" } >
                                ???  
                        </label>1??????:&nbsp;<input type="text" id="wends_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        				value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}">
                        		2??????:&nbsp;<input type="text" id="wends_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        				value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="thurs" id="thurs" value="???" 
                            ${sDay.contains("???")?"checked":"" }>
                                ??? 
                        </label>1??????:&nbsp;<input type="text" id="thurs_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}">
                        		2??????:&nbsp;<input type="text" id="thurs_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="fri" id="fri" value="???" 
                            ${sDay.contains("???")?"checked":"" }>
                                ??? 
                        </label>1??????:&nbsp;<input type="text" id="time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}">
                        		2??????:&nbsp;<input type="text" id="time1" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">
                        <br>
                        <label>
                            <input type="checkbox" name="sature" id="sature" value="???" 
                            ${sDay.contains("???")?"checked":"" }>
                                ??? 
                        </label>1??????:&nbsp;<input type="text" id="sature_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}">
                        		2??????:&nbsp;<input type="text" id="sature_time1" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">
                       <br>
                       <label>
                            <input type="checkbox" name="sun" id="sun" value="???" 
                            ${sDay.contains("???")?"checked":"" }>
                                ??? 
                      </label>1??????:&nbsp;<input type="text" id="sun_time1" class="time1" name="startTime1" class="form-control" style="width:140px;"
                      						value="${sdayMap.get('???').size()>0?sdayMap.get('???').get(0).SStartTime:''}">
                        		2??????:&nbsp;<input type="text" id="sun_time2" class="time1" name="startTime2" class="form-control" style="width:140px;"
                        					value="${sdayMap.get('???').size()==2?sdayMap.get('???').get(1).SStartTime:''}">                         
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>?????? ??????</b></th>
                    <td>              
                        <input type="text" id="daterange" name="daterange" style="width:200px;" value="${musical.getMPeriod()}-${musical.getMPeriodEnd()}"/>
                    </td>
                    <!-- <td><input type="text" size="10" title="????????????" readonly style='cursor:pointer'> -&nbsp; <input type="text" size="10" title="????????????" readonly style='cursor:pointer'>
                        <span class="button"><a href="#">??????????????????</a></span><br>
                        <input type="text" class="add wid53"   name="address" id="address"  maxlength="80">
                    </td> -->
                </tr>
                 <tr>
                    <th class="th" scope="row"><b>?????? ????????????</b></th>
                    <td>              
                        <input type="text" name="sTime" value="${schedule.get(0).getSTime() }" style="width:200px;"/>???
                    </td>
                </tr>
                <tr>
                <th class="th" scope="row"><b>?????? ??????</b>
                <td>
                    <p>
                        <label>
                            <input type="radio" name="perPlace" value="????????? ??????" id="artPalace" ${musical.getHName() .equals("????????? ??????")? "checked":""}>
                                 ????????? ??????</label>
                        <label>
                            <input type="radio" name="perPlace" value="???????????????" id="blueSquare" ${musical.getHName() .equals("???????????????")? "checked":""}>
                                 ???????????????</label>
                    </p>
                </td>
            </tr>
                <tr>
                    <th class="th" scope="row"><b>?????? ??????</b>
                    <td>
                        <p>VIP???:</p><input type="text" name="vipPrice" class="wid53"  value="${musical.getVipPrice() }" style="width:200px;">???
                        <p>R???:</p><input type="text" name="rPrice" class="wid53"  value="${musical.getSPrice() }" placeholder="ex :150000" style="width:200px;">???
                        <p>S???:</p><input type="text" name="sPrice" class="wid53"  value="${musical.getRPrice() }" placeholder="ex :150000" style="width:200px;">???
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>?????? ???????????????</b>
                    <td>
                        <input type="file" name="upFile" onchange="readURL(this);" >
                        <br /><br />
                        <img id="preview" style="width:300px; height: 400px;"  src="${path }/resources/upload/performance/${photo.get(0).IName}"/>
                    </td>
                </tr>
                <tr>
                    <th class="th" scope="row"><b>?????? ????????????</b>
                    <td>
                        <input type="file" name="upFile2" onchange="readURL2(this);"> 
                        <br /><br />
                        <img id="preview2" style="width:300px; height: 400px;" src="${path }/resources/upload/performance/${photo.get(1).IName}"/>
                    </td>
                </tr>
                

          </table>

              <div class="btngreen">
                  <a href="javascript:chk_form(event);" id="enrollPer" class="Btn" >????????????</a>
              </div>
        <!-- //Form -->    
      </form>
        <script>
        alert("????????? ?????? ?????? ????????? ????????????!");
            //daterangepicker
            //$('input[name="daterange"]').daterangepicker();
            $("#daterange").daterangepicker({
            	locale:{
            		"format": 'YY/MM/DD'}
            		
            });
            
            //timepicker
            $(function() {
                $(".time1").timepicker({
                    timeFormat: 'h:mm p',
                    interval: 60,
                    minTime: '10',
                    maxTime: '11:00pm',
                    defaultTime: '00:00',
                    startTime: '12:00',
                    dynamic: false,
                    dropdown: true,
                    scrollbar: true        
                });
            });

            // ?????????
            function readURL(input) {
	            if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
			        document.getElementById('preview').src = e.target.result;
		            };
		        reader.readAsDataURL(input.files[0]);
	            } else {
		            document.getElementById('preview').src = "";
	            }
            }
            
            //????????????
            function readURL2(input) {
	            if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
			        document.getElementById('preview2').src = e.target.result;
		            };
		        reader.readAsDataURL(input.files[0]);
	            } else {
		            document.getElementById('preview').src = "";
	            }
            }
            
            //ajax??? ?????? ????????? ?????????! 
            //$("#enrollPer").click(e=>{
            const chk_form=(e)=>{	
            	
        		
        		let form=new FormData();
        		console.log($('input[type=checkbox]:checked'));
        		
            	$('input[type=checkbox]:checked').each((i,e)=>{
					form.append("perDay",
							$(e).val()+"-"+$(e).parent().next().val()
							+"-"+$(e).parent().next().next().val())            		
				
            	});
            	 
            
            	
        		const upFile=$("input[name=upFile]")[0].files;
				const upFile2=$("input[name=upFile2]")[0].files;
        		
				//?????????
				$.each(upFile,(i,v)=>{
					form.append("upFile"+i,v);
				});
				
				//???????????? 
				$.each(upFile2,(i,v)=>{
 					form.append("upFile2"+i,v);
 				});
				
 				var mTitle=$("input[name=mTitle]").val();
 				var mType=$("input[name=mType]:checked").val();
 				var mAge=$("input[name=mAge]:checked").val();
				
 				//var mon=$("#mon:checked").val();
 				//var tues=$("#tues:checked").val();
 				//var wends=$("#wends:checked").val();
 				//var thurs=$("#thurs:checked").val();
 				//var fri=$("#fri:checked").val();
 				//var sature=$("#sature:checked").val();
 				//var sun=$("#sun:checked").val();
				
 				var daterange=$("input[name=daterange]").val(); 
 				var sTime=$("input[name=sTime]").val();
 				var perPlace=$("input[name=perPlace]:checked").val();
 				var vipPrice=$("input[name=vipPrice]").val();
 				var rPrice=$("input[name=rPrice]").val();
 				var sPrice=$("input[name=sPrice]").val();
				var mCode=$("input[name=mCode]").val();
				console.log(mCode);
 				form.append("mTitle",mTitle);
 				console.log(mTitle);
 				form.append("mType",mType);
 				console.log(mType);
 				form.append("mAge",mAge);
 				form.append("mCode",mCode);
 			
				
// 				if(mon=="???"){
// 					 form.append("mon",mon);
// 				}
// 				if(tues=="???"){
// 					 form.append("tues",tues);
// 				}
// 				if(wends=="???"){
// 					 form.append("wends",wends);
// 				}
// 				if(thurs=="???"){
// 					 form.append("thurs",thurs);
// 				}
// 				if(fri=="???"){
// 					 form.append("fri",fri);
// 				}
// 				if(sature=="???"){
// 					 form.append("sature",sature);
// 				}
// 				if(sun=="???"){
// 					 form.append("sun",sun);
// 				}
				
// 				form.append("mon_time1",mon_time1);
// 				form.append("mon_time2",mon_time2);
// 				form.append("tues_time1",tues_time1);
// 				form.append("tues_time2",tues_time2);
// 				form.append("wends_time1",wends_time1);
// 				form.append("wends_time2",wends_time2);
// 				form.append("thurs_time1",thurs_time1);
// 				form.append("thurs_time1",thurs_time1);
// 				form.append("fri_time1",fri_time1);
// 				form.append("fri_time2",fri_time2);
// 				form.append("sature_time1",sature_time1);
// 				form.append("sature_time2",sature_time2);
// 				form.append("sun_time1",sun_time1);
// 				form.append("sun_time2",sun_time2);
				
 				form.append("daterange",daterange);
 				console.log(daterange);
 				form.append("sTime",sTime);
 				form.append("perPlace",perPlace);
 				console.log(perPlace);
 				form.append("vipPrice",vipPrice);
 				form.append("rPrice",rPrice);
 				form.append("sPrice",sPrice);
 				console.log(daterange);
 				console.log(form); 
 				//if(sumnail.length<1){
 				//if(file.length<1){
 					
 				//var form = $('perforFrm')[0];
 				
 				
 				//let form = document.getElementById('perforFrm');
 				
 				
 				console.log("344 form : "+form);
 				//var formData = new FormData(form);
 				
 				/* console.log("346 formData : "+formData);
 				for (let key of formData.keys()) {
 					console.log(key, ":", formData.get(key));
 				}
 				console.log("348"); */
 				
 				
 				$.ajax({
 					type:"post",
 					enctype:'multipart/form-data',
 				    url:'${path}/adminPerfor/updatePerformance.do',
 				    data:form,
 				    dataType:'json',
 				  
 				    processData:false,
 				    contentType:false,
 				    cache:false,
 				    success:function(data){
 				   		alert("?????? ?????? ??????! ???????????? ???????????????:)");
					 	location.replace("${pageContext.request.contextPath}/adminPerfor/performanceList.do");		
 				    },
 				    error:function(e){
 				        alert("????????????, ?????? ??????????????????! ");
 				        console.log(${mCode});
 				       //location.replace("${pageContext.request.contextPath}/adminPerfor/performanceList.do");
 				    }
 				});	
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 					
 				
				
				
        	};
        
           
            
        </script>
</section>
</body>