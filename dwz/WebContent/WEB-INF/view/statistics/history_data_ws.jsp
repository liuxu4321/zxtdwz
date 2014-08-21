<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String wssyear = (String)request.getSession().getAttribute("wsstartSelectYearValue");
	String wssmonth = (String)request.getSession().getAttribute("wsstartSelectMonthsValue");
	String wseyear = (String)request.getSession().getAttribute("wsendSelectYearValue");
	String wsemonth = (String)request.getSession().getAttribute("wsendSelectMonthsValue");
	String wseday = (String)request.getSession().getAttribute("wsendSelectDayValue");
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
<form id="pagerForm" method="post" action="${context }/statistics/historyData/ws" onsubmit="return divSearch(this, 'ws_box');">
	<input type="hidden" name="pageNum" value="${page.currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="wsQyName" value="${wsQyName }" />
	<input type="hidden" name="wsAreaCode" value="${wsAreaCode }" />
	<input type="hidden" name="wsSeeWay" value="${wsSeeWay }" />
	<input type="hidden" name="wsInputType" value="${wsInputType }" />
	<input type="hidden" name="wsJkdName" value="${wsJkdName }" />
	<input type="hidden" name="wsIndustryCode" value="${wsIndustryCode }" />
	<input type="hidden" name="wsDateStart" value="${wsDateStart }" />
	<input type="hidden" name="wsDateEnd" value="${wsDateEnd }" />
	
	<input type="hidden" name="wsstartSelectYearValue" value="${wsstartSelectYearValue }" />
	<input type="hidden" name="wsstartSelectMonthsValue" value="${wsstartSelectMonthsValue }" />
	<input type="hidden" name="wsendSelectYearValue" value="${wsendSelectYearValue }" />
	<input type="hidden" name="wsendSelectMonthsValue" value="${wsendSelectMonthsValue }" />
	<input type="hidden" name="wsendSelectDayValue" value="${wsendSelectDayValue }" />
</form>
<script type="text/javascript">
<!--
	//导出Excel
	function exportWs() {
		var excelWsQyName = encodeURI(encodeURI($('#wsQyName').val()));//企业名
		var excelWsAreaCode = $('#wsAreaCodeSelect').val();//区域Code
		var excelWsSeeWay = $('#wsSeeWaySelect').val();//查看方式
		//----------------------------------------------baib 20140516-----------------------------------
		var selectIndex = document.getElementById("wsJkdName").selectedIndex;//获得是第几个被选中了
		var selectVaLue = document.getElementById("wsJkdName").options[selectIndex].value; //获得被选中的项目的文本
		var excelWsJkdName = encodeURI(encodeURI(selectVaLue));//监控点名称
		//var excelWsJkdName = encodeURI(encodeURI($('#wsJkdName').val()));//监控点名称
		//----------------------------------------------baib 20140516-----------------------------------

		var excelWsIndustryCode = $('#wsIndustrySelect').val();//行业类别
		var excelWsDateStart = $('#wsDateStart').val();//开始时间
		var excelWsDateEnd = $('#wsDateEnd').val();//结束时间 
		var excelWsInputType = $('#wsInputType').attr("checked");//进出口类别
		if(excelWsInputType == 'checked'){
			excelWsInputType = '2';
		}else{
			excelWsInputType = '';
		}
		
		alertMsg.confirm('确定导出Excel?', {
				okCall : function() {
					$("#wsExcel").attr(
							"href",
							"${context }/statistics/historyData/showWsExcel?excelWsQyName="
									+ excelWsQyName + "&excelWsAreaCode="
									+ excelWsAreaCode + "&excelWsSeeWay="
									+ excelWsSeeWay + "&excelWsInputType="
									+ excelWsInputType + "&excelWsJkdName="
									+ excelWsJkdName + "&excelWsIndustryCode="
									+ excelWsIndustryCode + "&excelWsDateStart="
									+ excelWsDateStart + "&excelWsDateEnd="
									+ excelWsDateEnd);
				$("#wsExcel").click();
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
$('#wsQyName').bind('keyup',processKeyupWs); 
}); 

/** 
* 处理键盘按下后弹起的事件 
* @param event 
*/ 
function processKeyupWs(event){ 
  var myEvent = event || windows.event; 
  var keyCode = myEvent.keyCode; 
  //输入是字母，或者退格键则需要重新请求 
  if((keyCode >= 65 && keyCode <= 90) || keyCode == 8){ 
       //以下两行代码是为了防止用户快速输入导致频繁请求服务器 
       //这样便可以在用户500ms内快速输入的情况下，只请求服务器一次 
       //大大提高服务器性能 
       if($('#wsQyName').val()==""){
    	   $('#auto_div_ws').html('');
    	   $('#auto_div_ws').hide();
       }else{
            highLightIndex = -1; 
            clearTimeout(timeoutId); 
            timeoutId = setTimeout(processAjaxRequestWs,700); 
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
$('#auto_div_ws').hide(); 
var pos = $('#wsQyName').position(); 
var topPosition = pos.top+$('#wsQyName').height()+43; 
var leftPosition = pos.left+11; 
$('#auto_div_ws').offset({top:topPosition,left:leftPosition}); 
$('#auto_div_ws').width($('#wsQyName').width() - 39); 
//$('#auto_div').css('position','absolute'); 
} 

/** 
* 处理Ajax请求 
* @param data 
*/ 
function processAjaxRequestWs(){ 
	 var inputValue = $('#wsQyName').val();
		$(function(){ajaxTodo("${context }/search/enterprise?pyjm="+inputValue,processAjaxResponseWs);});
} 

/** 
* 处理Ajax回复 
* @param data Ajax请求得到的返回结果为dom文档对象 
*/ 
function processAjaxResponseWs(jsonStr){
	if(jsonStr.length > 0){
 	$('#auto_div_ws').html('').show(); 
     for(var i = 0 ; i < jsonStr.length ; i++){
        var word_div = $('<div style="cursor: default;margin:3px 3px 3px 3px;"></div>'); 
        word_div.html(jsonStr[i]);
        word_div.hover(fnOver,fnOut); 
        word_div.click(getAutoText_ws);
        $('#auto_div_ws').append(word_div); 
     } 
	}else{
		$('#auto_div_ws').hide();
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
function getAutoText_ws(){ 
//有高亮显示的则选中当前选中当前高亮的文本 
if(highLightIndex != -1){ 
   $('#wsQyName').val($(this).html()); 
   $('#auto_div_ws').html('').hide(); 
 	
   
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
   $('wsQyName').val($('#auto_div_ws').children().eq(highLightIndex).html()); 
   $('#auto_div_ws').html('').hide(); 
} 
} 

/** 
* 处理按上下键的情况 
*/ 
function processKeyUpAndDown(keyCode){ 
var words = $('#auto_div_ws').children(); 
var num = words.length; 
if(num <= 0) return; 
changeToWhite(); 
highLightIndex = ((keyCode != 38 ? num + 1:num - 1)+highLightIndex) % num; 
words.eq(highLightIndex).css('background-color','#cccccc'); 
$('#wsQyName').val(words.eq(highLightIndex).html()); 
} 

/** 
* 如果有高亮的则把高亮变白 
*/ 
function changeToWhite(){ 
if(highLightIndex != -1){ 
    $('#auto_div_ws').children().eq(highLightIndex).css('background-color','white'); 
} 
} 


//======================20140515 yuzibing ======================================== 

//通过ajax动态生成监控点下拉列表 

function changeSelectAreaCode(){
	   var inputValue = document.getElementById("wsQyName").value;
				if(inputValue==''){//选择企业 为空，则设置监控点名称下拉菜单为空
					jQuery("#wsJkdName").html("<option></option>");
					return;
				}
				$(function(){ajaxTodo("${context }/statistics/historyData/ajax_point_ws?eWaterWs="+inputValue,AjaxDoneSelect1);});
				
	}
	// 监控点下拉列表的回调函数
		function AjaxDoneSelect1(jsonStr){
		var jsonObj = jQuery.parseJSON(jsonStr);
		var optionstring = "<option></option>";
		for(var item in jsonObj){
			optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
			}
		if(jsonObj != "" && jsonObj != null){
			 document.getElementById("wsJkdName").disabled = false;
		}else{
			document.getElementById("wsJkdName").disabled = true;
		} 
		jQuery("#wsJkdName").html(optionstring);
		
	}
//============================================================================= 


//function onblurText(){
//	$('#auto_div').hide();
//}
//function onfocusText(){
// if(document.getElementById("auto_div").innerHTML != ""){
//  $('#auto_div').show();
//}
//}
/******************************搜索提示结束*********************************/
//-->


function wschangeDataShow_monitoringPoint(){
	
	var wsgraphyKind = $("#wsSeeWaySelect option:selected").val();
	//实时数据
	if("1" == wsgraphyKind){
		
		$("td[name='wsstartTd']").css("display","none");
		$("td[name='wsentTd']").css("display","none");
		$("td[name='wsstartDate1']").css("display","block");
		$("td[name='wsendDate1']").css("display","block");
		  $('#wsstartSelectYearValue').val($('#wsstartSelectYear').val());
		  $('#wsstartSelectMonthsValue').val($('#wsstartSelectMonth').val());
		  $('#wsendSelectYearValue').val($('#wsendSelectYear').val());
		   $('#wsendSelectMonthsValue').val($('#wsendSelectMonth').val());
		   var wsyear = $('#wsendSelectYearValue').val();
		   var wsmonths =  $('#wsendSelectMonthsValue').val();
		   var wsdt = new Date();  
		    wsdt.setDate(1);  
		    wsdt.setMonth(wsmonths); 
		    wsdt.setFullYear(wsyear);
		  	wscdt = new Date(wsdt.getTime()-1000*60*60*24);  
		 	//alert(year+"年"+months+"月月末日期:"+cdt.getDate()+"日");   
			$('#wsendSelectDayValue').val(wscdt.getDate());
	}else{
		
		$("td[name='wsstartTd']").css("display","block");
		$("td[name='wsentTd']").css("display","block");
		$("td[name='wsstartDate1']").css("display","none");
		$("td[name='wsendDate1']").css("display","none");
	}
}

   $(document).ready(function(){
		$("td[name='wsstartTd']").css("display","block");
		$("td[name='wsentTd']").css("display","block");
		$("td[name='wsstartDate1']").css("display","none");
		$("td[name='wsendDate1']").css("display","none");
		//先给年下拉框赋内容
		var y = new Date().getFullYear();
		for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
			document.getElementById("wsstartSelectYear").options.add(new   Option(i+"年",i));
			document.getElementById("wsendSelectYear").options.add(new   Option(i+"年",i));
		}
		var wsstartSelectYear = $('#wsstartSelectYearValue').val().substr(0,4);
		var wsendSelectYear = $('#wsendSelectYearValue').val().substr(0,4);
		var wsstartSelectMonth = $('#wsstartSelectYearValue').val().substr(5,2);
		var wsendSelectMonth = $('#wsendSelectYearValue').val().substr(5,2);
		if(wsstartSelectYear != '' && wsstartSelectYear != null){
			$("#wsstartSelectYear").val(wsstartSelectYear);
		}
		if(wsendSelectYear != '' && wsendSelectYear != null){
			$("#wsendSelectYear").val(wsendSelectYear);
		}
		if(wsstartSelectMonth != '' && wsstartSelectMonth != null){
			$("#wsstartSelectMonth").val(wsstartSelectMonth);
		}
		if(wsendSelectMonth != '' && wsendSelectMonth != null){
			$("#wsendSelectMonth").val(wsendSelectMonth);
		}
	});
   
   function wsstartyears(){
	   $('#wsstartSelectYearValue').val($('#wsstartSelectYear').val());
   }
   function wsstartmonths(){
	   $('#wsstartSelectMonthsValue').val($('#wsstartSelectMonth').val());
   }
   function wsendyears(){
	   $('#wsendSelectYearValue').val($('#wsendSelectYear').val());
	   var wsdt = new Date();  
	   var wsyear = $('#wsendSelectYearValue').val();
	   var wsmonths =  $('#wsendSelectMonthsValue').val();
	    wsdt.setDate(1);  
	    wsdt.setMonth(wsmonths); 
	    wsdt.setFullYear(wsyear);
	  	wscdt = new Date(wsdt.getTime()-1000*60*60*24);  
	 	//alert(year+"年"+months+"月月末日期:"+cdt.getDate()+"日");   
		$('#wsendSelectDayValue').val(wscdt.getDate());
   }
   function wsendmonths(){
	   $('#wsendSelectMonthsValue').val($('#wsendSelectMonth').val());
	   var wsyear = $('#wsendSelectYearValue').val();
	   var wsmonths =  $('#wsendSelectMonthsValue').val();
	   
	   var wsdt = new Date();  
	    wsdt.setDate(1);  
	    wsdt.setMonth(wsmonths); 
	    wsdt.setFullYear(wsyear);
	  	wscdt = new Date(wsdt.getTime()-1000*60*60*24);  
		$('#wsendSelectDayValue').val(wscdt.getDate());
   }
   
    
   if($("#wsSeeWaySelect").val() != 1){
	   $("td[name='wsstartTd']").css("display","block");
		$("td[name='wsentTd']").css("display","block");
		$("td[name='wsstartDate1']").css("display","none");
		$("td[name='wsendDate1']").css("display","none");
   }else{
	   $("td[name='wsstartTd']").css("display","none");
		$("td[name='wsentTd']").css("display","none");
		$("td[name='wsstartDate1']").css("display","block");
		$("td[name='wsendDate1']").css("display","block");
		
	 	$("#wsstartSelectYear").val(<%=wssyear%>);
		$("#wsstartSelectMonth").val(<%=wssmonth%>);
		$("#wsendSelectYear").val(<%=wseyear%>);
		$("#wsendSelectMonth").val(<%=wsemonth%>);
		
		$("#wsstartSelectYearValue").val(<%=wssyear%>);
		$("#wsstartSelectMonthsValue").val(<%=wssmonth%>);			
		$("#wsendSelectYearValue").val(<%=wseyear%>);
		$("#wsendSelectMonthsValue").val(<%=wsemonth%>);
		$("#wsendSelectDayValue").val(<%=wseday%>);
   }
   
   
   function searchws(){
	   var wsstyear =$("#wsstartSelectYearValue").val();
	   var wsstmonth = $("#wsstartSelectMonthsValue").val(); 
	   var wsenyear =$("#wsendSelectYearValue").val();
	   var wsenmonth =$("#wsendSelectMonthsValue").val(); 
	   if(wsstyear*1 > wsenyear*1){
		   alertMsg.info("输入的开始年份大于结束年份");
		   return ;
	   }
	   if(wsstyear*1 == wsenyear*1 && wsstmonth*1 > wsenmonth*1){
		   alertMsg.info("输入的开始月份大于结束月份");
		   return ;
	   }
	   $('#historyWsForm').submit();
   }
    
   
   
   function xingzheng(){
		var wsAreaCodeSelect  = $("#wsAreaCodeSelect").val();
		var wsIndustrySelect  = $("#wsIndustrySelect").val();
		if(wsAreaCodeSelect==''){//选择行政区划为空，则设置企业名称下拉菜单为空
			jQuery("#wsQyName").html("<option></option>");
			return;
		}
		$(function(){ajaxTodo("${context }/statistics/historyData/ajax_xzqhws?navTabId=xlb&wsAreaCode="+wsAreaCodeSelect
				 +"&wsIndustryCode="+wsIndustrySelect,AjaxDoneSelect);});
	}

	function hangye(){
		var wsAreaCodeSelect  = $("#wsAreaCodeSelect").val();
		var wsIndustrySelect  = $("#wsIndustrySelect").val();
		if(wsAreaCodeSelect==''){//选择行政区划为空，则设置企业名称下拉菜单为空
			jQuery("#wsQyName").html("<option></option>");
			return;
		}
		$(function(){ajaxTodo("${context }/statistics/historyData/ajax_xzqhws?navTabId=xlb&wsAreaCode="+wsAreaCodeSelect
				 +"&wsIndustryCode="+wsIndustrySelect,AjaxDoneSelect);});
	}
	//取得对应小类别回调方法(行政区划->企业名称)
	function AjaxDoneSelect(jsonStr){
		var jsonObj = jQuery.parseJSON(jsonStr);
		
		var optionstring = "<option></option>";
		for(var item in jsonObj){
			optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
			}
		if(jsonObj != "" && jsonObj != null){
			 document.getElementById("wsQyName").disabled = false;
		}else{
			document.getElementById("wsJkdName").disabled = true;
			document.getElementById("wsQyName").disabled = true;
		} 
		jQuery("#wsQyName").html(optionstring);
			
	}
	
	function exportWs1(){
		 alertMsg.info("对不起，没有数据，无法导出！");
	}
	function exportWs2(){
		alertMsg.info("对不起，数据超出最大条数，无法导出！");
	}
</script>
<a id="wsExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<div class="bdsug" id="auto_div_ws"></div>
<div class="pageHeader">
	<form id="historyWsForm" onsubmit="return divSearch(this, 'ws_box');" action="${context }/statistics/historyData/ws" method="post">
		<div class="pageFormContent" >
			<table class="searchContent" border="0">
				<tr height="20px">
				
					<td style="width: 340px">
						<label style="width:90px; text-align: right">	行政区域：</label>
						<select  name="wsAreaCode" id="wsAreaCodeSelect" onchange="xingzheng();">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }" <c:if test="${ac.key==wsAreaCode }">selected='selected'</c:if>>${ac.value }</option>
							</c:forEach>
						</select>
					</td>
					
					<td style="width: 220px;">
						<label style="width:80px; text-align: right">	行业：</label>
						<select name="wsIndustryCode" id="wsIndustrySelect" style="width: 120px;" onchange="hangye();">
						<option></option>
							<c:forEach var="it" items="${industryTypeSelectMap }">
								<option value="${it.key }" <c:if test="${it.key==wsIndustryCode }">selected='selected'</c:if>>${it.value }</option>
							</c:forEach>
						</select>
					</td>
					
					<td style="width: 300px;">
						<label style="width:80px; text-align: right" >污染源名称：</label>
						<%-- <input type="text" value="${wsQyName}" name="wsQyName" id="wsQyName" size="40"/> --%>
						<select name="wsQyName" id="wsQyName" style="width:170px;" onchange="changeSelectAreaCode();" >
							<option></option>
							<c:forEach var="en" items="${enterpriseNameSelectMap }">
								<option value="${en.key }"<c:if test="${en.key==wsQyName }">selected='selected'</c:if>>
									${en.value}
								</option>
							</c:forEach>
						</select>	
					</td>
					
					
					<td>
						<label style="width:170px; text-align: right">进出口类型,选中为只查询出口:</label>
						<input type="checkbox" id="wsInputType" name="wsInputType" value="2"<c:if test="${wsInputType==2 }">checked</c:if>/>
					</td>
				</tr>
				<tr height="20px">
				<!-- ${en.value}==================20140515   yuzibing 改 修改为 select====================================================== -->				
				
					<td style="width: 340px">
						<label style="width:90px; text-align: right">	监控点名称：</label>
						<!--  <input type="text" value="${wsJkdName}" name="wsJkdName" id="wsJkdName" size="40"/> -->
						<select    id="wsJkdName" name="wsJkdName"  style="width:230px" >
							 	<option></option>
								<c:forEach var="en" items="${pointWsNameSelectMap }">
									<option value="${en.key }"<c:if test="${en.key==wsJkdName }">selected='selected'</c:if>>
										${en.value}
									</option>
								</c:forEach>
							 </select>
						
					</td>
				<!-- ================================================================================== -->				
					<td style="width: 220px;">
						<label style="width:80px; text-align: right">	查看方式：</label>
						<select  name="wsSeeWay" id="wsSeeWaySelect" onchange="wschangeDataShow_monitoringPoint()" style="width: 120px;">
							<option></option>
							<c:forEach var="sw" items="${seeWaySelectMap }">
								<option value="${sw.key }" <c:if test="${sw.key==wsSeeWay }">selected='selected'</c:if>>${sw.value }</option>
							</c:forEach>
						</select>
					</td>
					
					<td name = "wsstartTd" width="250px">
						<label style="width:80px; text-align: right">	时间从：</label>
						<input type="text" id="wsDateStart" name="wsDateStart" class="date" value="${wsDateStart}" readonly
						minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"/><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td name="wsentTd" width="250px">
						<label style="width:80px; text-align: right">	时间至：</label>
						<input type="text" id="wsDateEnd" name="wsDateEnd" class="date" value="${wsDateEnd}" readonly
						minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"/><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					
					<td name="wsstartDate1"  style="display:none;"width="250px">
							<label style="width:80px; text-align: right" >时间从：</label>
							<select id="wsstartSelectYear" name="wsstartSelectYear" onchange= "wsstartyears();"></select>
							<input type="hidden"  id="wsstartSelectYearValue" name="wsstartSelectYearValue" value="${wsstartSelectYearValue}"/>
							<input type="hidden"  id="wsstartSelectMonthsValue" name="wsstartSelectMonthsValue" value="${wsstartSelectMonthsValue}"/>
							<select id="wsstartSelectMonth" name="wsstartSelectMonth" onchange= "wsstartmonths();">
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
						<td name="wsendDate1"  style="display:none;"width="250px">
							<label style="width:50px; text-align: right" >时间至：</label>
							<select id="wsendSelectYear" name="wsendSelectYear" onchange="wsendyears();"></select>
							<input type="hidden"  id="wsendSelectYearValue" name = "wsendSelectYearValue"/>
							<input type="hidden"  id="wsendSelectMonthsValue" name = "wsendSelectMonthsValue"/>
							<input type="hidden"  id="wsendSelectDayValue" name = "wsendSelectDayValue"/>
							<select id="wsendSelectMonth" name="wsgasSelectMonth" onchange="wsendmonths();">
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
					<li><div class="buttonActive"><div class="buttonContent"><button onclick="searchws();">查询</button></div></div></li>
					<li>
					<c:if test="${page.totalCount > 0 && page.totalCount < 65536}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportWs();">导出Excel</button>
							</div>
						</div>
					</c:if>
					<c:if test="${page.totalCount == 0}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportWs1();">导出Excel</button>
							</div>
						</div>
					</c:if>
					<c:if test="${page.totalCount > 65536}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportWs2();">导出Excel</button>
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
			<th width="19%" align="center"  style="vertical-align: middle;">企业名称</th>
			<th width="17%" align="center"  style="vertical-align: middle;">监控点名称</th>
			<th width="16%" align="center"  style="vertical-align: middle;">时间节点</th>
			<th width="12%" align="center" >氨氮浓度(mg/l)</th>
			<th width="12%" align="center" >COD浓度(mg/l)</th>
			<th width="12%" align="center" >流量
				<c:if test="${wsSeeWay == '1' }">(m³/mon)</c:if>
				<c:if test="${wsSeeWay == '2' }">(m³/d)</c:if>
				<c:if test="${wsSeeWay == '3' }">(m³/h)</c:if>
				<c:if test="${wsSeeWay == '4' }">(m³/h)</c:if>
			</th>
			<th width="12%" align="center" >ph值</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="historyDataWs" items="${page.result}">
			<tr>
				<td align="center" style="vertical-align: middle;">${historyDataWs.ENTERPRISE_NAME }</td>
				<td align="center" style="vertical-align: middle;">${historyDataWs.MON_NAME }</td>
				<td align="center" style="vertical-align: middle;">${historyDataWs.DATA_TIME }</td>
				<td align="center" colspan="2">${historyDataWs.NHN_AVG }</td>
				<td align="center" colspan="2">${historyDataWs.COD_AVG }</td>
				<td align="center" colspan="2">${historyDataWs.WATER_AVG }</td>
				<td align="center" colspan="5">${historyDataWs.PH_AVG }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="panelBar">
	<div class="pages">
		<span>显示</span> <select class="combox" name="numPerPage"
			onchange="navTabPageBreak({numPerPage:this.value},'ws_box')">
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
	<div class="pagination" targetType="navTab" rel="ws_box"
		totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
		pageNumShown="5" currentPage="${page.currentPageNo }"></div>
</div>
