<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String wsyear = (String)request.getSession().getAttribute("wstartSelectYearValue");
	String wsmonth = (String)request.getSession().getAttribute("wstartSelectMonthsValue");
	String weyear = (String)request.getSession().getAttribute("wendSelectYearValue");
	String wemonth = (String)request.getSession().getAttribute("wendSelectMonthsValue");
	String weday = (String)request.getSession().getAttribute("wendSelectDayValue");
%>
<!-- 历史数据点击后主页 2013/09/23 BY RenWei -->
<style type="text/css">
.bdsug{
	border-top-color:#817f82;
	border-right-color:#817f82;
	border-bottom-color:#817f82;
	border-left-color:#817f82;
	border-top-width:1px;
	border-right-width:1px;
	border-bottom-width:1px;
	border-left-width:1px;
	border-top-style:solid;
	border-right-style:solid;
	border-bottom-style:solid;
	border-left-style:solid;
	background-attachment:scroll;
	position:absolute;
	background-repeat:repeat;
	background-position-x:0%;
	background-position-y:0%;
	background-origin:padding-box;
	background-clip:border-box;
	background-color:rgb(255, 255, 255);
	left:2;
	top:0;
	z-index: 100;
}
</style>
<script type="text/javascript">
<!--
	//导出Excel
	function exportWater() {
		var excelWaterQyName = encodeURI(encodeURI($('#waterQyName').val()));//企业名
		var excelWaterAreaCode = $('#waterAreaSelect').val();//区域Code
		var excelWaterSeeWay = $('#waterSeeWaySelect').val();//查看方式
		//----------------------------------------------baib 20140516-----------------------------------
		var selectIndex = document.getElementById("waterJkdName").selectedIndex;//获得是第几个被选中了
		var selectVaLue = document.getElementById("waterJkdName").options[selectIndex].value; //获得被选中的项目的文本
		var excelWaterJkdName = encodeURI(encodeURI(selectVaLue));//监控点名称
		//var excelWaterJkdName = encodeURI(encodeURI($('#waterJkdName').val()));//监控点名称
		//----------------------------------------------baib 20140516-----------------------------------
		var excelWaterIndustryCode = $('#waterIndustrySelect').val();//行业类别
		var excelWaterDateStart = $('#waterDateStart').val();//开始时间
		var excelWaterDateEnd = $('#waterDateEnd').val();//结束时间 
		var excelWaterInputType = $('#waterInputType').attr("checked");//进出口类别
		if(excelWaterInputType == 'checked'){
			excelWaterInputType = '2';
		}else{
			excelWaterInputType = '';
		}

		alertMsg.confirm('确定导出Excel?', {
				okCall : function() {
					$("#waterExcel").attr(
							"href",
							"${context }/statistics/historyData/showWaterExcel?excelWaterQyName="
									+ excelWaterQyName + "&excelWaterAreaCode="
									+ excelWaterAreaCode + "&excelWaterSeeWay="
									+ excelWaterSeeWay + "&excelWaterInputType="
									+ excelWaterInputType + "&excelWaterJkdName="
									+ excelWaterJkdName + "&excelWaterIndustryCode="
									+ excelWaterIndustryCode + "&excelWaterDateStart="
									+ excelWaterDateStart + "&excelWaterDateEnd="
									+ excelWaterDateEnd);
				$("#waterExcel").click();
			}
		});
	}
/******************************搜索提示开始*********************************/
//高亮的索引 
var highLightIndex = -1; 
//超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
var timeoutId; 
$(document).ready(function(){ 
 init(); 
 $('#waterQyName').bind('keyup',processKeyupWater); 
}); 

/** 
* 处理键盘按下后弹起的事件 
* @param event 
*/ 
function processKeyupWater(event){ 
    var myEvent = event || windows.event; 
    var keyCode = myEvent.keyCode; 
    //输入是字母，或者退格键则需要重新请求 
    if((keyCode >= 65 && keyCode <= 90) || keyCode == 8){ 
         //以下两行代码是为了防止用户快速输入导致频繁请求服务器 
         //这样便可以在用户500ms内快速输入的情况下，只请求服务器一次 
         //大大提高服务器性能 
         if($('#waterQyName').val()==""){
      	   $('#auto_div_water').html('');
      	   $('#auto_div_water').hide();
         }else{
              highLightIndex = -1; 
              clearTimeout(timeoutId); 
              timeoutId = setTimeout(processAjaxRequestWater,700); 
         }
    //处理上下键(up,down) 
    }else if(keyCode == 38 || keyCode == 40){ 
        processKeyUpAndDown(keyCode); 
    //按下了回车键 
    }else if(keyCode == 13){ 
        processEnter(); 
    } 
} 

/*** 
* 初始化弹出框列表的位置，大小 
*/ 
function init(){ 
 $('#auto_div_water').hide(); 
 var pos = $('#waterQyName').position(); 
 var topPosition = pos.top+$('#waterQyName').height()+43; 
 var leftPosition = pos.left+11; 
 $('#auto_div_water').offset({top:topPosition,left:leftPosition}); 
 $('#auto_div_water').width($('#waterQyName').width() - 39); 
 //$('#auto_div').css('position','absolute'); 
} 

/** 
* 处理Ajax请求 
* @param data 
*/ 
function processAjaxRequestWater(){ 
	 var inputValue = $('#waterQyName').val();
		$(function(){ajaxTodo("${context }/search/enterprise?pyjm="+inputValue,processAjaxResponseWater);});
		//$(function(){ajaxTodo("${context }/search/enterprise_water?water="+inputValue,processAjaxResponseWater);});

} 

/** 
* 处理Ajax回复 
* @param data Ajax请求得到的返回结果为dom文档对象 
*/ 
function processAjaxResponseWater(jsonStr){
	if(jsonStr.length > 0){
   	$('#auto_div_water').html('').show(); 
       for(var i = 0 ; i < jsonStr.length ; i++){
          var word_div = $('<div style="cursor: default;margin:3px 3px 3px 3px;"></div>'); 
          word_div.html(jsonStr[i]);
          word_div.hover(fnOver,fnOut); 
          word_div.click(getAutoText_water);
          $('#auto_div_water').append(word_div); 
       } 
	}else{
		$('#auto_div_water').hide();
	}
} 

/** 
* 处理鼠标滑过 
*/ 
function fnOver(){ 
  //alert($(this)); 
   changeToWhite(); 
   $(this).css('background-color','#cccccc'); 
   //alert($(this).index()); 
   highLightIndex = $(this).index(); 
   //下面一行注释掉了，百度搜索也没这功能，就是鼠标移动时，跟着改变搜索框的内容 
   //$('#auto_txt').val($('#auto_div').children().eq(highLightIndex).html()); 
} 

/** 
* 处理鼠标移除 
*/ 
function fnOut(){ 
  $(this).css('background-color','white'); 
} 

/** 
* 得到自动填充文本 
*/ 
function getAutoText_water(){ 
 //有高亮显示的则选中当前选中当前高亮的文本 
 if(highLightIndex != -1){ 
     $('#waterQyName').val($(this).html()); 
     $('#auto_div_water').html('').hide(); 
   	
     
     //20140515 yuzibing 
     //选中高亮的文本后立即调用该函数动态生成监控点名称下拉列表
     
     changeSelectAreaCode();
 } 
} 

/** 
* 处理按下Enter键 
* @param keyCode 
*/ 
function processEnter(){ 
  if(highLightIndex != -1){ 
     $('waterQyName').val($('#auto_div_water').children().eq(highLightIndex).html()); 
     $('#auto_div_water').html('').hide(); 
  } 
} 

/** 
* 处理按上下键的情况 
*/ 
function processKeyUpAndDown(keyCode){ 
  var words = $('#auto_div_water').children(); 
  var num = words.length; 
  if(num <= 0) return; 
  changeToWhite(); 
  highLightIndex = ((keyCode != 38 ? num + 1:num - 1)+highLightIndex) % num; 
  words.eq(highLightIndex).css('background-color','#cccccc'); 
  $('#waterQyName').val(words.eq(highLightIndex).html()); 
} 

/** 
* 如果有高亮的则把高亮变白 
*/ 
function changeToWhite(){ 
  if(highLightIndex != -1){ 
      $('#auto_div_water').children().eq(highLightIndex).css('background-color','white'); 
  } 
}
//==========================20140515 yuzibing =============================
//通过ajax动态生成监控点下拉列表 
   
   function changeSelectAreaCode(){
	   var inputValue = document.getElementById("waterQyName").value;
				if(inputValue==''){//选择企业 为空，则设置监控点名称下拉菜单为空
					jQuery("#waterJkdName").html("<option></option>");
					return;
				}  
	$(function(){ajaxTodo("${context }/statistics/historyData/ajax_point_water?eWaterName="+inputValue,AjaxDoneSelect1);});
				
	}
 	// 监控点下拉列表的回调函数
		function AjaxDoneSelect1(jsonStr){
		var jsonObj = jQuery.parseJSON(jsonStr);
		var optionstring = "<option></option>";
		for(var item in jsonObj){
			optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
			}
		 if(jsonObj != "" && jsonObj != null){
			 document.getElementById("waterJkdName").disabled = false;
		}else{
			document.getElementById("waterJkdName").disabled = true;
		}  
		jQuery("#waterJkdName").html(optionstring);
		
	}



//=======================================================================
//function onblurText(){
//	$('#auto_div').hide();
//}
//function onfocusText(){
//   if(document.getElementById("auto_div").innerHTML != ""){
//    $('#auto_div').show();
//  }
//}
/******************************搜索提示结束*********************************/
//-->

 function wchangeDataShow_monitoringPoint(){
	
	var wgraphyKind = $("#waterSeeWaySelect option:selected").val();
	//实时数据
	if("1" == wgraphyKind){
		
		$("td[name='wstartTd']").css("display","none");
		$("td[name='wentTd']").css("display","none");
		$("td[name='wstartDate1']").css("display","block");
		$("td[name='wendDate1']").css("display","block");
		  $('#wstartSelectYearValue').val($('#wstartSelectYear').val());
		  $('#wstartSelectMonthsValue').val($('#wstartSelectMonth').val());
		  $('#wendSelectYearValue').val($('#wendSelectYear').val());
		   $('#wendSelectMonthsValue').val($('#wendSelectMonth').val());
		   var wyear = $('#wendSelectYearValue').val();
		   var wmonths =  $('#wendSelectMonthsValue').val();
		   var wdt = new Date();  
		    wdt.setDate(1);  
		    wdt.setMonth(wmonths); 
		    wdt.setFullYear(wyear);
		  	wcdt = new Date(wdt.getTime()-1000*60*60*24);  
		 	//alert(year+"年"+months+"月月末日期:"+cdt.getDate()+"日");   
			$('#wendSelectDayValue').val(wcdt.getDate());
	}else{
		
		$("td[name='wstartTd']").css("display","block");
		$("td[name='wentTd']").css("display","block");
		$("td[name='wstartDate1']").css("display","none");
		$("td[name='wendDate1']").css("display","none");
	}
}

   $(document).ready(function(){
		$("td[name='wstartTd']").css("display","block");
		$("td[name='wentTd']").css("display","block");
		$("td[name='wstartDate1']").css("display","none");
		$("td[name='wendDate1']").css("display","none");
		//先给年下拉框赋内容
		var y = new Date().getFullYear();
		for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
			document.getElementById("wstartSelectYear").options.add(new   Option(i+"年",i));
			document.getElementById("wendSelectYear").options.add(new   Option(i+"年",i));
		}
		var wstartSelectYear = $('#wstartSelectYearValue').val().substr(0,4);
		var wendSelectYear = $('#wendSelectYearValue').val().substr(0,4);
		var wstartSelectMonth = $('#wstartSelectYearValue').val().substr(5,2);
		var wendSelectMonth = $('#wendSelectYearValue').val().substr(5,2);
		if(wstartSelectYear != '' && wstartSelectYear != null){
			$("#wstartSelectYear").val(wstartSelectYear);
		}
		if(wendSelectYear != '' && wendSelectYear != null){
			$("#wendSelectYear").val(wendSelectYear);
		}
		if(wstartSelectMonth != '' && wstartSelectMonth != null){
			$("#wstartSelectMonth").val(wstartSelectMonth);
		}
		if(wendSelectMonth != '' && wendSelectMonth != null){
			$("#wendSelectMonth").val(wendSelectMonth);
		}
	});
   
   function wstartyears(){
	   $('#wstartSelectYearValue').val($('#wstartSelectYear').val());
   }
   function wstartmonths(){
	   $('#wstartSelectMonthsValue').val($('#wstartSelectMonth').val());
   }
   function wendyears(){
	   $('#wendSelectYearValue').val($('#wendSelectYear').val());
	   var wdt = new Date();  
	   var wyear = $('#wendSelectYearValue').val();
	   var wmonths =  $('#wendSelectMonthsValue').val();
	    wdt.setDate(1);  
	    wdt.setMonth(wmonths); 
	    wdt.setFullYear(wyear);
	  	wcdt = new Date(wdt.getTime()-1000*60*60*24);  
	 	//alert(year+"年"+months+"月月末日期:"+cdt.getDate()+"日");   
		$('#wendSelectDayValue').val(wcdt.getDate());
   }
   function wendmonths(){
	   $('#wendSelectMonthsValue').val($('#wendSelectMonth').val());
	   var wyear = $('#wendSelectYearValue').val();
	   var wmonths =  $('#wendSelectMonthsValue').val();
	   
	   var wdt = new Date();  
	    wdt.setDate(1);  
	    wdt.setMonth(wmonths); 
	    wdt.setFullYear(wyear);
	  	wcdt = new Date(wdt.getTime()-1000*60*60*24);  
		$('#wendSelectDayValue').val(wcdt.getDate());
   }
   
    
   if($("#waterSeeWaySelect").val() != 1){
	   $("td[name='wstartTd']").css("display","block");
		$("td[name='wentTd']").css("display","block");
		$("td[name='wstartDate1']").css("display","none");
		$("td[name='wendDate1']").css("display","none");
   }else{
	   $("td[name='wstartTd']").css("display","none");
		$("td[name='wentTd']").css("display","none");
		$("td[name='wstartDate1']").css("display","block");
		$("td[name='wendDate1']").css("display","block");
		
	 	$("#wstartSelectYear").val(<%=wsyear%>);
		$("#wstartSelectMonth").val(<%=wsmonth%>);
		$("#wendSelectYear").val(<%=weyear%>);
		$("#wendSelectMonth").val(<%=wemonth%>);
		
		$("#wstartSelectYearValue").val(<%=wsyear%>);
		$("#wstartSelectMonthsValue").val(<%=wsmonth%>);			
		$("#wendSelectYearValue").val(<%=weyear%>);
		$("#wendSelectMonthsValue").val(<%=wemonth%>);
		$("#wendSelectDayValue").val(<%=weday%>);
   }
   
   
   function searchwater(){
	   var wstyear =$("#wstartSelectYearValue").val();
	   var wstmonth = $("#wstartSelectMonthsValue").val(); 
	   var wenyear =$("#wendSelectYearValue").val();
	   var wenmonth =$("#wendSelectMonthsValue").val(); 
	   if(wstyear*1 > wenyear*1){
		   alertMsg.info("输入的开始年份大于结束年份");
		   return ;
	   }
	   if(wstyear*1 == wenyear*1 && wstmonth*1 > wenmonth*1){
		   alertMsg.info("输入的开始月份大于结束月份");
		   return ;
	   }
	   $('#historyWaterForm').submit();
   }
    
   
   function xingzheng(){
		var waterAreaSelect  = $("#waterAreaSelect").val();
		var waterIndustrySelect  = $("#waterIndustrySelect").val();
		if(waterAreaSelect==''){//选择行政区划为空，则设置企业名称下拉菜单为空
			jQuery("#waterQyName").html("<option></option>");
			return;
		}
		$(function(){ajaxTodo("${context }/statistics/historyData/ajax_xzqhw?navTabId=xlb&waterAreaCode="+waterAreaSelect
				 +"&waterIndustryCode="+waterIndustrySelect,AjaxDoneSelect);});
	}

	function hangye(){
		var waterAreaSelect  = $("#waterAreaSelect").val();
		var waterIndustrySelect  = $("#waterIndustrySelect").val();
		if(waterAreaSelect==''){//选择行政区划为空，则设置企业名称下拉菜单为空
			jQuery("#waterQyName").html("<option></option>");
			return;
		}
		$(function(){ajaxTodo("${context }/statistics/historyData/ajax_xzqhw?navTabId=xlb&waterAreaCode="+waterAreaSelect
				 +"&waterIndustryCode="+waterIndustrySelect,AjaxDoneSelect);});
	}
	//取得对应小类别回调方法(行政区划->企业名称)
	function AjaxDoneSelect(jsonStr){
		var jsonObj = jQuery.parseJSON(jsonStr);
		
		var optionstring = "<option></option>";
		for(var item in jsonObj){
			optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
			}
		if(jsonObj != "" && jsonObj != null){
			 document.getElementById("waterQyName").disabled = false;
		}else{
			document.getElementById("waterJkdName").disabled = true;
			document.getElementById("waterQyName").disabled = true;
		}  
		jQuery("#waterQyName").html(optionstring);
			
	}

	function exportWater1(){
		 alertMsg.info("对不起，没有数据，无法导出！");
	}
	function exportWater2(){
		alertMsg.info("对不起，数据超出最大条数，无法导出！");
	}
</script>
<form id="pagerForm" method="post" action="${context }/statistics/historyData/water" onsubmit="return divSearch(this, 'water_box');">
	<input type="hidden" name="pageNum" value="${page.currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="waterQyName" value="${waterQyName }" />
	<input type="hidden" name="waterAreaCode" value="${waterAreaCode }" />
	<input type="hidden" name="waterSeeWay" value="${waterSeeWay }" />
	<input type="hidden" name="waterInputType" value="${waterInputType }" />
	<input type="hidden" name="waterJkdName" value="${waterJkdName }" />
	<input type="hidden" name="waterIndustryCode" value="${waterIndustryCode }" />
	<input type="hidden" name="waterDateStart" value="${waterDateStart }" />
	<input type="hidden" name="waterDateEnd" value="${waterDateEnd }" />
	
	<input type="hidden" name="wstartSelectYearValue" value="${wstartSelectYearValue }" />
	<input type="hidden" name="wstartSelectMonthsValue" value="${wstartSelectMonthsValue }" />
	<input type="hidden" name="wendSelectYearValue" value="${wendSelectYearValue }" />
	<input type="hidden" name="wendSelectMonthsValue" value="${wendSelectMonthsValue }" />
	<input type="hidden" name="wendSelectDayValue" value="${wendSelectDayValue }" />
	
</form>
<a id="waterExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<div class="bdsug" id="auto_div_water"></div>
<div class="pageHeader">
	<form id="historyWaterForm" onsubmit="return divSearch(this, 'water_box');" action="${context }/statistics/historyData/water" method="post">
		<div class="pageFormContent" >
			<table class="searchContent" border="0">
				<tr height="20px">
				
					<td style="width: 340px">
						<label style="width:90px; text-align: right">	行政区域：</label>
						<select  name="waterAreaCode" id="waterAreaSelect" onchange="xingzheng();">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }" <c:if test="${ac.key==waterAreaCode }">selected='selected'</c:if>>${ac.value }</option>
							</c:forEach>
						</select>
					</td>
					
					<td style="width: 220px;">
						<label style="width:80px; text-align: right">	行业：</label>
						<select name="waterIndustryCode" id="waterIndustrySelect" style="width: 120px;" onchange="hangye();">
						<option></option>
							<c:forEach var="it" items="${industryTypeSelectMap }">
								<option value="${it.key }" <c:if test="${it.key==waterIndustryCode }">selected='selected'</c:if>>${it.value }</option>
							</c:forEach>
						</select>
					</td>
					
					<td style="width: 300px;">
						<label style="width:80px; text-align: right" >污染源名称：</label>
						<%-- <input type="text" value="${waterQyName}" name="waterQyName" id="waterQyName" size="40"/> --%>
						<select name="waterQyName" id="waterQyName" style="width:170px;" onchange="changeSelectAreaCode();" >
							<option></option>
							<c:forEach var="en" items="${enterpriseNameSelectMap }">
								<option value="${en.key }"<c:if test="${en.key==waterQyName }">selected='selected'</c:if>>
									${en.value}
								</option>
							</c:forEach>
						</select>	
					</td>
					
					
					<td>
						<label style="width:170px; text-align: right">进出口类型,选中为只查询出口:</label>
						<input type="checkbox" id="waterInputType" name="waterInputType" value="2"<c:if test="${waterInputType==2 }">checked</c:if>/>
					</td>
				</tr>
				<tr height="20px">
<!-- ==================20140515   yuzibing 改 修改为 select====================================================== -->				
					<td style="width: 340px">
						<label style="width:90px; text-align: right">	监控点名称：</label>
						<!--<input type="text" value="${waterJkdName}" name="waterJkdName" id="waterJkdName" size="40"/>-->
						<select    id="waterJkdName" name="waterJkdName"  style="width:230px" >
							 	<option></option>
								<c:forEach var="en" items="${pointWaterNameSelectMap }">
									<option value="${en.key }"<c:if test="${en.key==waterJkdName }">selected='selected'</c:if>>
										${en.value}
									</option>
								</c:forEach>
							 </select>
					</td>
<!-- ================================================================================== -->				
					<td  style="width: 220px;">
						<label style="width:80px; text-align: right">	查看方式：</label>
						<select  name="waterSeeWay" id="waterSeeWaySelect" onchange="wchangeDataShow_monitoringPoint()" style="width: 120px">
							<option></option>
							<c:forEach var="sw" items="${seeWaySelectMap }">
								<option value="${sw.key }" <c:if test="${sw.key==waterSeeWay }">selected='selected'</c:if>>${sw.value }</option>
							</c:forEach>
						</select>
					</td>
					
					<td name = "wstartTd" width="250px">
						<label style="width:80px; text-align: right">	时间从：</label>
						<input type="text" id="waterDateStart" name="waterDateStart" class="date" value="${waterDateStart}" readonly
						 minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"/><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td name="wentTd" width="250px">
						<label style="width:80px; text-align: right">	时间至：</label>
						<input type="text" id="waterDateEnd" name="waterDateEnd" class="date" value="${waterDateEnd}" readonly
						 minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"/><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					
					<td name="wstartDate1"  style="display:none;"width="250px">
							<label style="width:80px; text-align: right" >时间从：</label>
							<select id="wstartSelectYear" name="wstartSelectYear" onchange= "wstartyears();"></select>
							<input type="hidden"  id="wstartSelectYearValue" name="wstartSelectYearValue" value="${wstartSelectYearValue}"/>
							<input type="hidden"  id="wstartSelectMonthsValue" name="wstartSelectMonthsValue" value="${wstartSelectMonthsValue}"/>
							<select id="wstartSelectMonth" name="wstartSelectMonth" onchange= "wstartmonths();">
								<option value="1">一月</option>
								<option value="2">二月</option>
								<option value="3">三月</option>
								<option value="4">四月</option>
								<option value="5">五月</option>
								<option value="6">六月</option>
								<option value="7">七月</option>
								<option value="8">八月</option>
								<option value="9">九月</option>
								<option value="10">十月</option>
								<option value="11">十一月</option>
								<option value="12">十二月</option>
							</select>
						</td>
						<td name="wendDate1"  style="display:none;"width="250px">
							<label style="width:50px; text-align: right" >时间至：</label>
							<select id="wendSelectYear" name="wendSelectYear" onchange="wendyears();"></select>
							<input type="hidden"  id="wendSelectYearValue" name = "wendSelectYearValue"/>
							<input type="hidden"  id="wendSelectMonthsValue" name = "wendSelectMonthsValue"/>
							<input type="hidden"  id="wendSelectDayValue" name = "wendSelectDayValue"/>
							<select id="wendSelectMonth" name="wgasSelectMonth" onchange="wendmonths();">
								<option value="1" >一月</option>
								<option value="2" >二月</option>
								<option value="3" >三月</option>
								<option value="4" >四月</option>
								<option value="5" >五月</option>
								<option value="6" >六月</option>
								<option value="7" >七月</option>
								<option value="8" >八月</option>
								<option value="9" >九月</option>
								<option value="10" >十月</option>
								<option value="11" >十一月</option>
								<option value="12" >十二月</option>
							</select>
						</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button onclick="searchwater();">查询</button></div></div></li>
					<li>
						<c:if test="${page.totalCount > 0 && page.totalCount < 65536}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportWater();">导出Excel</button>
							</div>
						</div>
					</c:if>
					<c:if test="${page.totalCount == 0}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportWater1();">导出Excel</button>
							</div>
						</div>
					</c:if>
					<c:if test="${page.totalCount > 65536}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportWater2();">导出Excel</button>
							</div>
						</div>
					</c:if>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>

<table class="table" style="width:100%;" layoutH="182">
	<thead>
		<tr>
			<th width="19%" align="center" style="vertical-align: middle;">企业名称</th>
			<th width="17%" align="center" style="vertical-align: middle;">监控点名称</th>
			<th width="16%" align="center" style="vertical-align: middle;">时间节点</th>
			<th width="12%" align="center" >氨氮浓度(mg/l)</th>
			<th width="12%" align="center" >COD浓度(mg/l)</th>
			<th width="12%" align="center" >流量
				<c:if test="${waterSeeWay == '1' }">(m³/mon)</c:if>
				<c:if test="${waterSeeWay == '2' }">(m³/d)</c:if>
				<c:if test="${waterSeeWay == '3' }">(m³/h)</c:if>
				<c:if test="${waterSeeWay == '4' }">(m³/h)</c:if>
			</th>
			<th width="12%" align="center" >ph值</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="historyDataWater" items="${page.result}">
			<tr>
				<td align="center" style="vertical-align: middle;">${historyDataWater.ENTERPRISE_NAME }</td>
				<td align="center" style="vertical-align: middle;">${historyDataWater.MON_NAME }</td>
				<td align="center" style="vertical-align: middle;">${historyDataWater.DATA_TIME }</td>
				<td align="center" >${historyDataWater.NHN_AVG }</td>
				<td align="center" >${historyDataWater.COD_AVG }</td>
				<td align="center" >${historyDataWater.WATER_AVG }</td>
				<td align="center" >${historyDataWater.PH_AVG }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="panelBar">
	<div class="pages">
		<span>显示</span> <select class="combox" name="numPerPage"
			onchange="navTabPageBreak({numPerPage:this.value},'water_box')">
			<option value="10"
				<c:if test="${page.pageSize == 10 }">selected="selected"</c:if>>10</option>
			<option value="30"
				<c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
			<option value="50"
				<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
			<option value="100"
				<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
			<option value="200"
				<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
		</select> <span>条，共${page.totalCount }条</span>
	</div>
	<div class="pagination" targetType="navTab" rel="water_box"
		totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
		pageNumShown="5" currentPage="${page.currentPageNo }"></div>
</div>
