<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String syear = (String)request.getSession().getAttribute("startSelectYearValue");
	String smonth = (String)request.getSession().getAttribute("startSelectMonthsValue");
	String eyear = (String)request.getSession().getAttribute("endSelectYearValue");
	String emonth = (String)request.getSession().getAttribute("endSelectMonthsValue");
	String eday = (String)request.getSession().getAttribute("endSelectDayValue");
%>
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

	//导出Excel
	function exportGas() {
		var excelGasQyName = encodeURI(encodeURI($('#gasQyName').val()));//企业名
		var excelGasAreaCode = $('#gasAreaCodeSelect').val();//区域Code
		var excelGasSeeWay = $('#gasSeeWaySelect').val();//查看方式
		//----------------------------------------------baib 20140516-----------------------------------
		var selectIndex = document.getElementById("point").selectedIndex;//获得是第几个被选中了
		var selectVaLue = document.getElementById("point").options[selectIndex].value; //获得被选中的项目的文本
		var excelGasJkdName = encodeURI(encodeURI(selectVaLue));//监控点名称
		//----------------------------------------------baib 20140516-----------------------------------
		var excelGasIndustryCode = $('#gasIndustrySelect').val();//行业类别
		var excelGasDateStart = $('#gasDateStart').val();//开始时间
		var excelGasDateEnd = $('#gasDateEnd').val();//结束时间 
		var excelGasInputType = $('#gasInputType').attr("checked");//进出口类别

		if(excelGasInputType == 'checked'){
			excelGasInputType = '2';
		}else{
			excelGasInputType = '';
		}
		
		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#gasExcel').attr("href","${context }/statistics/historyData/showGasExcel?excelGasQyName="+
						excelGasQyName+"&excelGasAreaCode="+excelGasAreaCode+"&excelGasSeeWay="+
						excelGasSeeWay+"&excelGasInputType="+excelGasInputType+"&excelGasJkdName="+
						excelGasJkdName+"&excelGasIndustryCode="+excelGasIndustryCode +"&excelGasDateStart="+
						excelGasDateStart+"&excelGasDateEnd="+excelGasDateEnd);
				$('#gasExcel').click();
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
      $('#gasQyName').bind('keyup',processKeyupGas); 
   }); 
 
   /** 
    * 处理键盘按下后弹起的事件 
    * @param event 
    */ 
    function processKeyupGas(event){ 
	   
	   //20140513  新增 每次输入不同公司时 初始化 test
	   	global="";
         var myEvent = event || windows.event; 
         var keyCode = myEvent.keyCode; 
         //输入是字母，或者退格键则需要重新请求 
         if((keyCode >= 65 && keyCode <= 90) || keyCode == 8){ 
              //以下两行代码是为了防止用户快速输入导致频繁请求服务器 
              //这样便可以在用户500ms内快速输入的情况下，只请求服务器一次 
              //大大提高服务器性能 
              if($('#gasQyName').val()==""){
           	   $('#auto_div_gas').html('');
           	   $('#auto_div_gas').hide();
              }else{
	               highLightIndex = -1; 
	               clearTimeout(timeoutId); 
	               timeoutId = setTimeout(processAjaxRequestGas,700); 
	               
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
      $('#auto_div_gas').hide(); 
      var pos = $('#gasQyName').position(); 
      var topPosition = pos.top+$('#gasQyName').height()+43; 
      var leftPosition = pos.left+11; 
      $('#auto_div_gas').offset({top:topPosition,left:leftPosition}); 
      $('#auto_div_gas').width($('#gasQyName').width() - 39); 
      //$('#auto_div').css('position','absolute'); 
   } 

   /** 
    * 处理Ajax请求 
    * @param data 
    */ 
   function processAjaxRequestGas(){ 
	   
  	 var inputValue = $('#gasQyName').val();
  		$(function(){ajaxTodo("${context }/search/enterprise?pyjm="+inputValue,processAjaxResponseGas);});
   } 
 
   /** 
    * 处理Ajax回复 
    * @param data Ajax请求得到的返回结果为dom文档对象 
    */ 
   function processAjaxResponseGas(jsonStr){
   	if(jsonStr.length > 0){
	    	$('#auto_div_gas').html('').show(); 
	        for(var i = 0 ; i < jsonStr.length ; i++){
	           var word_div = $('<div style="cursor: default;margin:3px 3px 3px 3px;"></div>'); 
	           word_div.html(jsonStr[i]);
	           word_div.hover(fnOver,fnOut); 
	           word_div.click(getAutoText_gas);
	           $('#auto_div_gas').append(word_div); 
	        } 
   	}else{
   		$('#auto_div_gas').hide();
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
    function getAutoText_gas(){  // baib  修改函数名  否则重名 20140516
      //有高亮显示的则选中当前选中当前高亮的文本 
      if(highLightIndex != -1){ 
          $('#gasQyName').val($(this).html()); 
          $('#auto_div_gas').html('').hide();
          
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
          $('gasQyName').val($('#auto_div_gas').children().eq(highLightIndex).html()); 
          $('#auto_div_gas').html('').hide(); 
         
       } 
   } 

   /** 
    * 处理按上下键的情况 
    */ 
   function processKeyUpAndDown(keyCode){ 
       var words = $('#auto_div_gas').children(); 
       var num = words.length; 
       if(num <= 0) return; 
       changeToWhite(); 
       highLightIndex = ((keyCode != 38 ? num + 1:num - 1)+highLightIndex) % num; 
       words.eq(highLightIndex).css('background-color','#cccccc'); 
       $('#gasQyName').val(words.eq(highLightIndex).html()); 
   } 

   /** 
    * 如果有高亮的则把高亮变白 
    */ 
   function changeToWhite(){ 
       if(highLightIndex != -1){ 
           $('#auto_div_gas').children().eq(highLightIndex).css('background-color','white'); 
       } 
   } 
  //======================20140515 yuzibing ======================================== 
   
   //通过ajax动态生成监控点下拉列表 
   
   function changeSelectAreaCode(){
	   var inputValue = document.getElementById("gasQyName").value;
				if(inputValue==''){//选择企业 为空，则设置监控点名称下拉菜单为空
					jQuery("#point").html("<option></option>");
					return;
				}
				$(function(){ajaxTodo("${context }/statistics/historyData/ajax_point?eName="+inputValue,AjaxDoneSelect1);});
				
	}
 	// 监控点下拉列表的回调函数
		function AjaxDoneSelect1(jsonStr){
		var jsonObj = jQuery.parseJSON(jsonStr);
		var optionstring = "<option></option>";
		for(var item in jsonObj){
			optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
			}
		 if(jsonObj != "" && jsonObj != null){
			 document.getElementById("point").disabled = false;
		}else{
			document.getElementById("point").disabled = true;
		}  
		jQuery("#point").html(optionstring);
		
	}
//============================================================================= 
	
	
	
	function xingzheng(){
	/* var areaCode = _this.value;
	var monLocation = "2";
	var pollutantType = $("#pollutantType").val();  */
	var gasAreaCodeSelect  = $("#gasAreaCodeSelect").val();
	var gasIndustrySelect  = $("#gasIndustrySelect").val();
	if(gasAreaCodeSelect==''){//选择行政区划为空，则设置企业名称下拉菜单为空
		jQuery("#gasQyName").html("<option></option>");
		return;
	}
 	$(function(){ajaxTodo("${context }/statistics/historyData/ajax_xzqh?navTabId=xlb&gasAreaCode="+gasAreaCodeSelect
			 +"&gasIndustryCode="+gasIndustrySelect,AjaxDoneSelect);}); 
	
}

function hangye(){
	var gasAreaCodeSelect  = $("#gasAreaCodeSelect").val();
	var gasIndustrySelect  = $("#gasIndustrySelect").val();
	if(gasAreaCodeSelect==''){//选择行政区划为空，则设置企业名称下拉菜单为空
		jQuery("#gasQyName").html("<option></option>");
		return;
	}
	 $(function(){ajaxTodo("${context }/statistics/historyData/ajax_xzqh?navTabId=xlb&gasAreaCode="+gasAreaCodeSelect
	 		 +"&gasIndustryCode="+gasIndustrySelect,AjaxDoneSelect);});
	 		 
}
//取得对应小类别回调方法(行政区划->企业名称)
function AjaxDoneSelect(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
 	 if(jsonObj != "" && jsonObj != null){
		 document.getElementById("gasQyName").disabled = false;
	}else{
		document.getElementById("gasQyName").disabled = true;
		document.getElementById("point").disabled = true;
	}  
	jQuery("#gasQyName").html(optionstring);
		
	/* $("#pollutantType").val("");
	$("#kindCode2").val("1");
	//$("#monLocation").val("");
	$("#monLocation").val("2");
	$("#monId").val(""); */
}
	
 	
   /******************************搜索提示结束*********************************/
   function changeDataShow_monitoringPoint(){
	
	var graphyKind = $("#gasSeeWaySelect option:selected").val();
	//实时数据
	if("1" == graphyKind){
		
		$("td[name='startTd']").css("display","none");
		$("td[name='endTd']").css("display","none");
		$("td[name='startDate1']").css("display","block");
		$("td[name='endDate1']").css("display","block");
		  $('#startSelectYearValue').val($('#startSelectYear').val());
		  $('#startSelectMonthsValue').val($('#startSelectMonth').val());
		  $('#endSelectYearValue').val($('#endSelectYear').val());
		   $('#endSelectMonthsValue').val($('#endSelectMonth').val());
		   var year = $('#endSelectYearValue').val();
		   var months =  $('#endSelectMonthsValue').val();
		   var dt = new Date();  
		    dt.setDate(1);  
		    dt.setMonth(months); 
		    dt.setFullYear(year);
		  	cdt = new Date(dt.getTime()-1000*60*60*24);  
		 	//alert(year+"年"+months+"月月末日期:"+cdt.getDate()+"日");   
			$('#endSelectDayValue').val(cdt.getDate());
	}else{
		
		$("td[name='startTd']").css("display","block");
		$("td[name='endTd']").css("display","block");
		$("td[name='startDate1']").css("display","none");
		$("td[name='endDate1']").css("display","none");
	}
}

   $(document).ready(function(){
		$("td[name='startTd']").css("display","block");
		$("td[name='endTd']").css("display","block");
		$("td[name='startDate1']").css("display","none");
		$("td[name='endDate1']").css("display","none");
		//先给年下拉框赋内容
		var y = new Date().getFullYear();
		for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
			document.getElementById("startSelectYear").options.add(new   Option(i+"年",i));
			document.getElementById("endSelectYear").options.add(new   Option(i+"年",i));
		}
		var startSelectYear = $('#startSelectYearValue').val().substr(0,4);
		var endSelectYear = $('#endSelectYearValue').val().substr(0,4);
		var startSelectMonth = $('#startSelectYearValue').val().substr(5,2);
		var endSelectMonth = $('#endSelectYearValue').val().substr(5,2);
		if(startSelectYear != '' && startSelectYear != null){
			$("#startSelectYear").val(startSelectYear);
		}
		if(endSelectYear != '' && endSelectYear != null){
			$("#endSelectYear").val(endSelectYear);
		}
		if(startSelectMonth != '' && startSelectMonth != null){
			$("#startSelectMonth").val(startSelectMonth);
		}
		if(endSelectMonth != '' && endSelectMonth != null){
			$("#endSelectMonth").val(endSelectMonth);
		}
	});
   
   function startyears(){
	   $('#startSelectYearValue').val($('#startSelectYear').val());
   }
   function startmonths(){
	   $('#startSelectMonthsValue').val($('#startSelectMonth').val());
	   /* var styear =$("#startSelectYearValue").val();
	   var stmonth = $("#startSelectMonthsValue").val(); 
	   var enyear =$("#endSelectYearValue").val();
	   var enmonth =$("#endSelectMonthsValue").val(); 
	   if(styear*1 > enyear*1){
		   alertMsg.info("输入的开始年份大于结束年份");
		   return ;
	   }
	   if(styear*1 == enyear*1 && stmonth*1 > enmonth*1){
		   alertMsg.info("输入的开始月份大于结束月份");
		   return ;
	   } */
   }
   function endyears(){
	   $('#endSelectYearValue').val($('#endSelectYear').val());
	   var dt = new Date();  
	   var year = $('#endSelectYearValue').val();
	   var months =  $('#endSelectMonthsValue').val();
	    dt.setDate(1);  
	    dt.setMonth(months); 
	    dt.setFullYear(year);
	  	cdt = new Date(dt.getTime()-1000*60*60*24);  
	 	//alert(year+"年"+months+"月月末日期:"+cdt.getDate()+"日");   
		$('#endSelectDayValue').val(cdt.getDate());
   }
   function endmonths(){
	   $('#endSelectMonthsValue').val($('#endSelectMonth').val());
	   var year = $('#endSelectYearValue').val();
	   var months =  $('#endSelectMonthsValue').val();
	   
	   var dt = new Date();  
	    dt.setDate(1);  
	    dt.setMonth(months); 
	    dt.setFullYear(year);
	  	cdt = new Date(dt.getTime()-1000*60*60*24);  
		$('#endSelectDayValue').val(cdt.getDate());
   }
   
    
   if($("#gasSeeWaySelect").val() != 1){
	   $("td[name='startTd']").css("display","block");
		$("td[name='endTd']").css("display","block");
		$("td[name='startDate1']").css("display","none");
		$("td[name='endDate1']").css("display","none");
   }else{
	   $("td[name='startTd']").css("display","none");
		$("td[name='endTd']").css("display","none");
		$("td[name='startDate1']").css("display","block");
		$("td[name='endDate1']").css("display","block");
		
		$("#startSelectYear").val(<%=syear%>);
		$("#startSelectMonth").val(<%=smonth%>);
		$("#endSelectYear").val(<%=eyear%>);
		$("#endSelectMonth").val(<%=emonth%>);
		
		$("#startSelectYearValue").val(<%=syear%>);
		$("#startSelectMonthsValue").val(<%=smonth%>);			
		$("#endSelectYearValue").val(<%=eyear%>);
		$("#endSelectMonthsValue").val(<%=emonth%>);
		$("#endSelectDayValue").val(<%=eday%>);
   }
    
   function searchgas(){
	   var styear =$("#startSelectYearValue").val();
	   var stmonth = $("#startSelectMonthsValue").val(); 
	   var enyear =$("#endSelectYearValue").val();
	   var enmonth =$("#endSelectMonthsValue").val(); 
	   if(styear*1 > enyear*1){
		   alertMsg.info("输入的开始年份大于结束年份");
		   return ;
	   }
	   if(styear*1 == enyear*1 && stmonth*1 > enmonth*1){
		   alertMsg.info("输入的开始月份大于结束月份");
		   return ;
	   }
	   $('#historyGasForm').submit();
   }
   
   function exportGas1(){
	   alertMsg.info("对不起，没有数据，无法导出！");
   }
   function exportGas2(){
	   alertMsg.info("对不起，数据超出最大条数，无法导出！");
   }
</script>
<!-- 历史数据点击后主页 2013/09/23 BY RenWei -->
<form id="pagerForm" method="post"
	action="${context }/statistics/historyData/gas" onsubmit="return divSearch(this, 'gas_box');">
	<input type="hidden" name="pageNum" value="${page.currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" /> 
	<input type="hidden" name="gasQyName" value="${gasQyName }" /> <input
		type="hidden" name="gasAreaCode" value="${gasAreaCode }" /> <input
		type="hidden" name="gasSeeWay" value="${gasSeeWay }" /> <input
		type="hidden" name="gasInputType" value="${gasInputType }" /> 
		<%-- <input type="hidden" name="gasJkdName" value="${point }" /> --%>
		<input type="hidden" name="point" value="${point }" />
		<input type="hidden" name="gasIndustryCode" value="${gasIndustryCode }" /> <input
		type="hidden" name="gasDateStart" value="${gasDateStart }" /> <input
		type="hidden" name="gasDateEnd" value="${gasDateEnd }" />
		
		<input type="hidden" name="startSelectYearValue" value="${startSelectYearValue }" />
		<input type="hidden" name="startSelectMonthsValue" value="${startSelectMonthsValue }" />
		<input type="hidden" name="endSelectYearValue" value="${endSelectYearValue }" />
		<input type="hidden" name="endSelectMonthsValue" value="${endSelectMonthsValue }" />
		<input type="hidden" name="endSelectDayValue" value="${endSelectDayValue }" />
		
</form>


<a id="gasExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<div class="bdsug" id="auto_div_gas"></div>
<div class="pageHeader">
<!-- action="${context }/statistics/historyData/gas" -->
	<form id="historyGasForm" onsubmit="return divSearch(this, 'gas_box');"
		action="${context }/statistics/historyData/gas" method="post">
		<div class="pageFormContent">
			<table class="searchContent" border="0" >
				<tr height="20px">
				
				<td style="width: 340px"><label style="width: 90px; text-align: right">
							行政区域：</label> <select name="gasAreaCode" id="gasAreaCodeSelect" onchange="xingzheng();">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }"
									<c:if test="${ac.key==gasAreaCode }">selected='selected'</c:if>>${ac.value
									}</option>
							</c:forEach>
					</select></td>
					
					<td style="width: 220px;"><label style="width: 80px; text-align: right"> 行业：</label>
						<select name="gasIndustryCode" id="gasIndustrySelect" style="width: 120px;" onchange="hangye();">
							<option></option>
							<c:forEach var="it" items="${industryTypeSelectMap }">
								<option value="${it.key }"
									<c:if test="${it.key==gasIndustryCode }">selected='selected'</c:if>>${it.value
									}</option>
							</c:forEach>
					</select></td>
					
					<td style="width: 300px;"><label style="width: 80px; text-align: right">污染源名称：</label>
						<%-- <input     type="text" value="${gasQyName}" name="gasQyName" id="gasQyName" size="40"/> --%>
						<select name="gasQyName" id="gasQyName" style="width:170px;" onchange="changeSelectAreaCode();">
							<option></option>
							<c:forEach var="en" items="${enterpriseNameSelectMap }">
								<option value="${en.key }"<c:if test="${en.key==gasQyName }">selected='selected'</c:if>>
									${en.value}
								</option>
							</c:forEach>
						</select>	
					</td>
					
					<td><label style="width: 170px; text-align: right">进出口类型,选中为只查询出口:</label>
						<input type="checkbox" id="gasInputType" name="gasInputType" value="2"
						<c:if test="${gasInputType==2 }">checked</c:if> /></td>
				</tr>	
				<tr height="20px">
				
<!-- ==================20140515   yuzibing 改 修改为 select====================================================== -->				
					
					
					<td style="width: 340px">
					<label style="width: 90px; text-align: right">
							监控点名称：</label> 
							<!-- 
								<input type="text" value="${gasJkdName}" name="gasJkdName" id="gasJkdName" size="40"/>
							 -->	 
							   <select    id="point" name="point"  style="width:230px" >
							 	<option></option>
								<c:forEach var="en" items="${pointNameSelectMap }">
									<option value="${en.key }"<c:if test="${en.key==point }">selected='selected'</c:if>>
										${en.value}
									</option>
								</c:forEach>
							 </select>
					</td>
	<!-- ================================================================================== -->				
					<td style="width: 220px;"><label style="width: 80px; text-align: right">
							查看方式：</label> <select name="gasSeeWay" id="gasSeeWaySelect" onchange="changeDataShow_monitoringPoint()" style="width: 120px;">
							<option></option>
							<c:forEach var="sw" items="${seeWaySelectMap }">
								<option value="${sw.key }"
									<c:if test="${sw.key==gasSeeWay }">selected='selected'</c:if>>${sw.value
									}</option>
							</c:forEach>
					</select></td>
					
					<!-- onfocus="start1(); -->
					<td name="startTd" width="250px;"><label style="width: 80px; text-align: right">
							时间从：</label> <input type="text" name="gasDateStart" id="gasDateStart" class="date" readonly  
						value="${gasDateStart}"  minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a class="inputDateButton" " 
						href="javascript:;" >选择</a></td>
					<td name="endTd" width="250px;"><label style="width: 80px; text-align: right">
							时间至：</label> <input  type="text" name="gasDateEnd" id="gasDateEnd" class="date" readonly
						value="${gasDateEnd}"  minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"  /><a class="inputDateButton"
						href="javascript:;">选择</a></td>
						
						<td name="startDate1"  style="display:none;"width="250px">
							<label style="width:80px; text-align: right" >时间从：</label>
							<select id="startSelectYear" name="startSelectYear" onchange= "startyears();"></select>
							<input type="hidden"  id="startSelectYearValue" name="startSelectYearValue" value="${startSelectYearValue}"/>
							<input type="hidden"  id="startSelectMonthsValue" name="startSelectMonthsValue" value="${startSelectMonthsValue}"/>
							<select id="startSelectMonth" name="startSelectMonth" onchange= "startmonths();">
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
						<td name="endDate1"  style="display:none;"width="250px">
							<label style="width:50px; text-align: right" >时间至：</label>
							<select id="endSelectYear" name="endSelectYear" onchange="endyears();"></select>
							<input type="hidden"  id="endSelectYearValue" name = "endSelectYearValue"/>
							<input type="hidden"  id="endSelectMonthsValue" name = "endSelectMonthsValue"/>
							<input type="hidden"  id="endSelectDayValue" name = "endSelectDayValue"/>
							<select id="endSelectMonth" name="gasSelectMonth" onchange="endmonths();">
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
					<li><div class="buttonActive"><div class="buttonContent"><button id="selButton"  onclick="searchgas();">查询</button></div></div></li>
					<li>
						<c:if test="${page.totalCount > 0 && page.totalCount < 65536}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportGas();">导出Excel</button>
							</div>
						</div>
					</c:if>
					<c:if test="${page.totalCount == 0}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportGas1();">导出Excel</button>
							</div>
						</div>
					</c:if>
					<c:if test="${page.totalCount > 65536}">
						<div class="buttonActive">
							
							<div class="buttonContent">
								<button type="button" onclick="exportGas2();">导出Excel</button>
							</div>
						</div>
					</c:if>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>
	<table class="table" style="width:100%;" layoutH="185" style="table-layout:fixed">
		<thead>
			<tr>
				<th width="7%" align="center" >企业名称</th>
				<th width="7%" align="center" >监控点名称</th>
				<th width="7%" align="center" >时间节点</th>
				<th width="7%" align="center">SO2实测浓度(mg/㎥)</th>
				<th width="7%" align="center">SO2折算浓度(mg/㎥)</th>
				<th width="7%" align="center">NOx实测浓度(mg/㎥)</th>
				<th width="7%" align="center">NOx折算浓度(mg/㎥)</th>
				<th width="7%" align="center">TSP实测浓度(mg/㎥)</th>
				<th width="7%" align="center">TSP折算浓度(mg/㎥)</th>
				<th width="7%" align="center">标杆流量
					<c:if test="${gasSeeWay == '1' }">(m³/mon)</c:if>
					<c:if test="${gasSeeWay == '2' }">(m³/d)</c:if>
					<c:if test="${gasSeeWay == '3' }">(m³/h)</c:if>
					<c:if test="${gasSeeWay == '4' }">(m³/h)</c:if>
				</th>
				<th width="7%" align="center">含氧量(%)</th>
				<th width="7%" align="center">温度(℃)</th>
				<th width="7%" align="center">压力(Pa)</th>
				<th width="7%" align="center">流速(m/s)</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="historyDataGas" items="${page.result}">
				<tr>
					<td align="left" style="vertical-align: middle;" title="${historyDataGas.ENTERPRISE_NAME }">${historyDataGas.ENTERPRISE_NAME }</td>
					<td align="left" style="vertical-align: middle;" title="${historyDataGas.MON_NAME }">${historyDataGas.MON_NAME }</td>
					<td align="center" style="vertical-align: middle;" title="${historyDataGas.DATA_TIME }">${historyDataGas.DATA_TIME }</td>
					<td align="center">${historyDataGas.SO2_AVG }</td>
					<td align="center">${historyDataGas.SO2_AVGZS }</td>
					<%-- <td align="center"><c:if test="${historyDataGas.IS_SINTERING == 0}">${historyDataGas.SO2_COU }</c:if><c:if test="${historyDataGas.IS_SINTERING == 1}">-</c:if></td> --%>
					<td align="center">${historyDataGas.NOX_AVG }</td>
					<td align="center">${historyDataGas.NOX_AVGZS }</td> 
					<%-- <td align="center"><c:if test="${historyDataGas.IS_SINTERING == 0}">${historyDataGas.NOX_COU }</c:if><c:if test="${historyDataGas.IS_SINTERING == 1}">-</c:if></td> --%>
					<td align="center">${historyDataGas.TSP_AVG }</td>
					<td align="center">${historyDataGas.TSP_AVGZS }</td>
					<%-- <td align="center"><c:if test="${historyDataGas.IS_SINTERING == 0}">${historyDataGas.TSP_COU }</c:if><c:if test="${historyDataGas.IS_SINTERING == 1}">-</c:if></td> --%>
					<td align="center">${historyDataGas.POLE_FLOW }</td>
					<td align="center">${historyDataGas.O2_AVG }</td>
					<td align="center">${historyDataGas.TEMP_AVG }</td>
					<td align="center">${historyDataGas.ALL_PRESS }</td>
					<td align="center">${historyDataGas.SPEED_AVG }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<div class="panelBar">
	<div class="pages">
		<span>显示</span> <select class="combox" name="numPerPage"
			onchange="navTabPageBreak({numPerPage:this.value},'gas_box')">
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
	<div class="pagination" targetType="navTab" rel="gas_box"
		totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
		pageNumShown="5" currentPage="${page.currentPageNo }"></div>
</div>
