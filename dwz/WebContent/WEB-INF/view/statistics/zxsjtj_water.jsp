<!-- 在线数据统计-->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.bdsug{
	border:1px solid #817f82;
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
//根据第一列的某几行相同，合并对应行的某列
jQuery.fn.rowspan = function(colIdx) {
    return this.each(function() {
        var that;
        $('tr', this).each(function(row) {
            $('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
                if (that != null && $(this).attr('nameM') == $(that).attr('nameM')) {
                    rowspan = $(that).attr("rowSpan");
                    if (rowspan == undefined) {
                        $(that).attr("rowSpan", 1);
                        rowspan = $(that).attr("rowSpan");
                    }
                    rowspan = Number(rowspan) + 1;
                    $(that).attr("rowSpan", rowspan);
                    $(this).hide();
                } else {
                    that = this;
                }
            });
        });
    });
};

	//导出Excel
	function exportWater() {
		var waterQyName = encodeURI(encodeURI($('#waterQyNameSelect').find("option:selected").text()));//企业名
		//alert(waterQyName);
		var waterAreaCode = $('#waterAreaCodeSelect').val();//区域Code
		var waterSelectType = $('#waterSelectType').val();//统计方式
		
		var waterSelectDay = $('#waterSelectDay').val();
		var waterSelectMonth = $('#waterSelectMonth').val();
		var waterSelectYear1 = $('#waterSelectYear1').val();
		var waterSelectYear2 = $('#waterSelectYear2').val();
		var waterSelectYear3 = $('#waterSelectYear3').val();
		var waterSelectQuarter = $('#waterSelectQuarter').val();
		var waterCustomDay1 = $('#waterCustomDay1').val();
		var waterCustomDay2 = $('#waterCustomDay2').val();
		var ctrlType_Water = $('#ctrlType_Water').val();

		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#waterExcel').attr("href","${context }/statistics/zxsjtj/showZxsjtjWaterExcel?waterQyName="+
						waterQyName+"&waterAreaCode="+waterAreaCode+"&selectType="+waterSelectType+"&selectDay="+
						waterSelectDay+"&selectMonth="+waterSelectMonth+"&selectYear1="+waterSelectYear1+"&selectYear2="+
						waterSelectYear2+"&selectYear3="+waterSelectYear3+"&selectQuarter="+waterSelectQuarter+
						"&customDay1="+waterCustomDay1+"&customDay2="+waterCustomDay2+"&ctrlType_Water="+ctrlType_Water);
				$('#waterExcel').click();
			}
		});
	}
/////////////////////////////////////////////// 
//	
//				搜索提示
//
///////////////////////////////////////////////
	 //高亮的索引 
   var highLightIndex = -1; 
   //超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
   var timeoutId; 
   $(document).ready(function(){ 
      init(); 
      $('#waterQyNameSelect').bind('keyup',processKeyupWater); 
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
              if($('#waterQyNameSelect').val()==""){
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
      var pos = $('#waterQyNameSelect').position(); 
      var topPosition = pos.top+$('#waterQyNameSelect').height()+11; 
      var leftPosition = pos.left+5; 
      $('#auto_div_water').offset({top:topPosition,left:leftPosition}); 
      $('#auto_div_water').width($('#waterQyNameSelect').width() - 39); 
      uniteWaterTable(tbWater,5);
      changeTdWater();
   } 

   /** 
    * 处理Ajax请求 
    * @param data 
    */ 
   function processAjaxRequestWater(){ 
  	 var inputValue = $('#waterQyNameSelect').val();
  		$(function(){ajaxTodo("${context }/search/enterprise?pyjm="+inputValue,processAjaxResponseWater);});
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
	           word_div.click(getAutoText);
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
   function getAutoText(){ 
      //有高亮显示的则选中当前选中当前高亮的文本 
      if(highLightIndex != -1){ 
          $('#waterQyNameSelect').val($(this).html()); 
          $('#auto_div_water').html('').hide(); 
      } 
   } 

   /** 
    * 处理按下Enter键 
    * @param keyCode 
    */ 
   function processEnter(){ 
       if(highLightIndex != -1){ 
          $('waterQyNameSelect').val($('#auto_div_water').children().eq(highLightIndex).html()); 
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
       $('#waterQyNameSelect').val(words.eq(highLightIndex).html()); 
   } 

   /** 
    * 如果有高亮的则把高亮变白 
    */ 
   function changeToWhite(){ 
       if(highLightIndex != -1){ 
           $('#auto_div_water').children().eq(highLightIndex).css('background-color','white'); 
       } 
   } 
   //function onblurText(){
   //	$('#auto_div').hide();
   //}
   //function onfocusText(){
	//   if(document.getElementById("auto_div").innerHTML != ""){
	//    $('#auto_div').show();
	 //  }
   //}
///////////////////////////////////////////////   
//   功能：合并表格   
//   参数：tb－－需要合并的表格ID   
//   参数：colLength－－需要对前几列进行合并，比如，   
//   想合并前两列，后面的数据列忽略合并，colLength应为2   
//   缺省表示对全部列合并 
// ***只兼容IE***
///////////////////////////////////////////////   
function   uniteWaterTable(tb,colLength){
//   检查表格是否规整   
if   (!checkWaterTable(tb))   return;  
var   i=0;   
var   j=0;   
var   rowCount=tb.rows.length; //   行数   
var   colCount=tb.rows[0].cells.length; //   列数   
var   obj1=null;   
var   obj2=null;
var	serialNumber = (($("[name='waterPageDiv']").attr("currentPage") - 1)*$('#waterNumPerPage').val()) + 1;//序号初始化(第pageNo页 每页pageSize条数据)
//   为每个单元格命名   
for   (i=2;i<rowCount;i++){   
for   (j=0;j<colCount;j++){   
tb.rows[i].cells[j].id="tbWater__"   +   i.toString()   +   "_"   +   j.toString();   
}   
}

//按企业给序号赋值 
$('#tbWater__2_0').text(serialNumber);
obj1 = $('#tbWater__2_2');
	for   (j=2;j<rowCount;j++){   
	obj2 = $('#tbWater__'+j.toString()+'_2');
		if   (obj1.text()   ==   obj2.text()){
			$('#tbWater__'+j.toString()+'_0').text(serialNumber);
		}else{   
		serialNumber++;
		$('#tbWater__'+j.toString()+'_0').text(serialNumber);
		obj1=$('#tbWater__'+j.toString()+'_2');
		}   
	}
    $("#tbWater").rowspan(0);
    $("#tbWater").rowspan(1);
    $("#tbWater").rowspan(2);
    $("#tbWater").rowspan(3);
} 
/////////////////////////////////////////   
//   功能：检查表格是否规整   
//   参数：tb－－需要检查的表格ID   
/////////////////////////////////////////   
function   checkWaterTable(tb){   
if   (tb.rows.length==2)   return   false;   
if   (tb.rows[0].cells.length==0)   return   false; 
for   (var   i=2;i<tb.rows.length;i++){   
if   (tb.rows[2].cells.length   !=   tb.rows[i].cells.length)   return   false;   
}   
return   true;   
}   

/////////////筛选列
	 function changeTdWater(){
		 $("#pjzWaterTh").hide();
		 $("#pjzWaterTh1").hide();
		 $("td[name='pjzWaterTd']").hide();
		 
		 $("#pflWaterTh").hide();
		 $("#pflWaterTh1").hide();
		 $("td[name='pflWaterTd']").hide();
		 
		 $("#cbxsWaterTh").hide();
		 $("td[name='cbxsWaterTd']").hide();
		 
		 $("#sjycWaterTh").hide();
		 $("td[name='sjycWaterTd']").hide();
		 
		 $("#sjqsWaterTh").hide();
		 $("td[name='sjqsWaterTd']").hide();
		 
		  $("#lxcbWaterTh").hide();
		 $("td[name='lxcbWaterTd']").hide();
		 
		 var tdValue=$('#changeWaterTdValue').val();
		 if(tdValue != ''){
			 var arrayObj = new Array();
			 arrayObj = tdValue.split(',');
			 for(var i = 0;i<arrayObj.length;i++){
				 if(arrayObj[i] == '1'){
					 $("#pjzWaterTh").show();
					 $("#pjzWaterTh1").show();
					 $("td[name='pjzWaterTd']").show();
				 }else if(arrayObj[i] == '2'){
					 $("#pflWaterTh").show();
					 $("#pflWaterTh1").show();
					 $("td[name='pflWaterTd']").show();
				 }else if(arrayObj[i] == '3'){
					 $("#cbxsWaterTh").show();
					 $("td[name='cbxsWaterTd']").show();
				 }else if(arrayObj[i] == '4'){
					 $("#sjycWaterTh").show();
					 $("td[name='sjycWaterTd']").show();
				 }else if(arrayObj[i] == '5'){
					 $("#sjqsWaterTh").show();
					 $("td[name='sjqsWaterTd']").show();
				 }else if(arrayObj[i] == '6'){
					 $("#lxcbWaterTh").show();
					 $("td[name='lxcbWaterTd']").show();
				 }
			 }
		 }
	 }
	 //筛选列点击事件
	 function onclickWaterSxl(){
		 $('#sxlWaterId').attr('href','${context }/statistics/zxsjtj/zxsjtj_sxl_water');
		 $('#sxlWaterId').click();
	 }

	 </script>
	 <script type="text/javascript">
		//先给年下拉框赋内容
		var y = new Date().getFullYear();
		for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
			document.getElementById("waterSelectYear1").options.add(new   Option(i+"年",i));
			document.getElementById("waterSelectYear2").options.add(new   Option(i+"年",i));
			document.getElementById("waterSelectYear3").options.add(new   Option(i+"年",i));
		}

		var waterSelectYear1Value = $('#waterSelectYear1Value').val();
		var waterSelectYear2Value = $('#waterSelectYear2Value').val();
		var waterSelectYear3Value = $('#waterSelectYear3Value').val();
		if(waterSelectYear1Value != '' && waterSelectYear1Value != null){
			$("#waterSelectYear1").val(waterSelectYear1Value);
		}
		if(waterSelectYear2Value != '' && waterSelectYear2Value != null){
			$("#waterSelectYear2").val(waterSelectYear2Value);
		}
		if(waterSelectYear3Value != '' && waterSelectYear3Value != null){
			$("#waterSelectYear3").val(waterSelectYear3Value);
		}
		
		waterChangeSelect_sjcsyxl($("#waterSelectType").val());
		 function waterChangeSelect_sjcsyxl(item){
				var i = item;
				if(i == 1){
					$("#waterDay").show();
					$("#waterMonth").hide();
					$("#waterQuarter").hide();
					$("#waterYear").hide();
					$("#waterCustom1").hide();
					$("#waterCustom2").hide();
				}
				if(i == 2){
					$("#waterDay").hide();
					$("#waterMonth").show();
					$("#waterQuarter").hide();
					$("#waterYear").hide();
					$("#waterCustom1").hide();
					$("#waterCustom2").hide();
				}
				if(i == 3){
					$("#waterDay").hide();
					$("#waterMonth").hide();
					$("#waterQuarter").show();
					$("#waterYear").hide();
					$("#waterCustom1").hide();
					$("#waterCustom2").hide();
				}
				if(i == 4){
					$("#waterDay").hide();
					$("#waterMonth").hide();
					$("#waterQuarter").hide();
					$("#waterYear").show();
					$("#waterCustom1").hide();
					$("#waterCustom2").hide();
				}
				if(i == 5){
					$("#waterDay").hide();
					$("#waterMonth").hide();
					$("#waterQuarter").hide();
					$("#waterYear").hide();
					$("#waterCustom1").show();
					$("#waterCustom2").show();
				}
			 }
		 
		//选择行政区划
		 function changeSelectAreaCode(){
		 	var areaCode = $('#waterAreaCodeSelect').val();
		 	$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode+"&dataFlg=2",AjaxDoneSelect);});
		 }
		 //取得对应小类别回调方法(行政区划->污染源类型->企业名称)
		 function AjaxDoneSelect(jsonStr){
		 	var jsonObj = jQuery.parseJSON(jsonStr);
		 	var optionstring = "<option></option>";
		 	for(var item in jsonObj){
		 		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		 		}
		 	jQuery("#waterQyNameSelect").html(optionstring);
		 	
		 	//$("#pollutantType2").val("1");
		 	//jQuery("#monId2").html("<option></option>");
		 }
		//选择企业名称
		 function changeSelectEnt(_this){
		 	var enterpriseId = _this.value;
		 	var pollutantType = $('#pollutantType2').val();
		 	if(enterpriseId == '' || enterpriseId == null){
		 		jQuery("#monId2").html("<option></option>");
		 		return;
		 	}
		 	$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetMonName?navTabId=xlb&enterpriseId="+enterpriseId+"&pollutantType="+pollutantType,AjaxDoneSelect1);});
		 }
		function fun1()
		{
			var ll = $('#waterQyNameSelect').find("option:selected").text();
			$('#waterQyName').val(ll);
		}
</script>
<form id="pagerForm" method="post"
	action="${context }/statistics/zxsjtj/2">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" id="waterNumPerPage"/> 
	<input type="hidden" name="waterQyName" value="${waterQyName }" /> 
	<input type="hidden" name="waterAreaCode" value="${waterAreaCode }" />
	<input type="hidden" name="waterSelectType" value="${waterSelectType }" /> 
	<input type="hidden" name="waterSelectDay" value="${waterSelectDay }" />
	<input type="hidden" name="waterSelectMonth" value="${waterSelectMonth }" />
	<input type="hidden" name="waterSelectYear1" value="${waterSelectYear1 }" />
	<input type="hidden" name="waterSelectYear2" value="${waterSelectYear2 }" />
	<input type="hidden" name="waterSelectYear3" value="${waterSelectYear3 }" />
	<input type="hidden" name="waterSelectQuarter" value="${waterSelectQuarter }" />
	<input type="hidden" name="waterCustomDay1" value="${waterCustomDay1 }" />
	<input type="hidden" name="waterCustomDay2" value="${waterCustomDay2 }" />
	<input type="hidden" name="org3.idWater" value="${changeWaterTdValue }" />
	<input type="hidden" name="ctrlType_Water" value="${ctrlType_Water }" />
</form>

<a id="waterExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<div class="bdsug" id="auto_div_water"></div>
<div class="pageHeader">
	<form id="zxsjtjWaterForm" onsubmit="return navTabSearch(this);"
		action="${context }/statistics/zxsjtj/2" method="post">
		<div class="pageFormContent">
			<table class="searchContent" border="0">
				<tr height="20px">
					<!-- <td><label style="width: 90px; text-align: right">企业名称：</label>
						<input type="text" value="${waterQyName}" name="waterQyName" id="waterQyName" size="40"/></td>  -->
					<td><label style="width: 80px; text-align: right">
							行政区域：</label> <select name="waterAreaCode" id="waterAreaCodeSelect"  onchange="changeSelectAreaCode();">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }"
									<c:if test="${ac.key==waterAreaCode }">selected='selected'</c:if>>${ac.value
									}</option>
							</c:forEach>
					</select></td>
					<td>
						<label style="text-align: right;">企业名称：</label>
						<select name="waterQyNamell" id="waterQyNameSelect" style="width:180px;" onchange="fun1()">
							<option></option>
							<c:forEach var="en" items="${enterpriseNameSelectMap }">
								<option value="${en.key }" <c:if test="${en.value==waterQyName }">selected='selected'</c:if>>
									${en.value}
								</option>
							</c:forEach>
						</select>
						<input type="hidden" name="waterQyName" id="waterQyName" value="${waterQyName}"/>
					</td>
					<td><label style="width: 80px; text-align: right">
							统计方式：</label>
							<select id="waterSelectType" name="waterSelectType" onchange="waterChangeSelect_sjcsyxl(this.value)">
								<option value="1" <c:if test="${waterSelectType == 1 }">selected = "selected"</c:if>>日</option>
								<option value="2" <c:if test="${waterSelectType == 2 }">selected = "selected"</c:if>>月</option>
								<option value="3" <c:if test="${waterSelectType == 3 }">selected = "selected"</c:if>>季度</option>
								<option value="4" <c:if test="${waterSelectType == 4 }">selected = "selected"</c:if>>年</option>
								<option value="5" <c:if test="${waterSelectType == 5 }">selected = "selected"</c:if>>自定义</option>
							</select></td>
						<td id="waterDay" style="">
						
							<label style="width:40px; text-align: right" >时间：</label>
							<input class="date textInput readOnly" type="text" maxdate="{%y}-%M-{%d-1}" name="waterSelectDay"  value="${waterSelectDay }" id="waterSelectDay"/>
						</td>
						<td>
							<label style="width:80px; text-align: right" >控制程度：</label>
							<select name="ctrlType_Water" id="ctrlType_Water" onchange="changeSelectsForEnt();">
								<option></option>
								<c:forEach var="ct" items="${ctrlTypeSelectMap_Water }">
									<option value="${ct.key }" <c:if test="${ct.key==ctrlType_Water}">selected='selected'</c:if>>${ct.value }</option>
								</c:forEach>
							</select>
						</td>
						<td id="waterMonth"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<select id="waterSelectYear1" name="waterSelectYear1"></select><input type="hidden" value="${waterSelectYear1}" id="waterSelectYear1Value"/>
							<select id="waterSelectMonth" name="waterSelectMonth">
								<option value="01" <c:if test="${waterSelectMonth == '01' }">selected = "selected"</c:if>>一月</option>
								<option value="02" <c:if test="${waterSelectMonth == '02' }">selected = "selected"</c:if>>二月</option>
								<option value="03" <c:if test="${waterSelectMonth == '03' }">selected = "selected"</c:if>>三月</option>
								<option value="04" <c:if test="${waterSelectMonth == '04' }">selected = "selected"</c:if>>四月</option>
								<option value="05" <c:if test="${waterSelectMonth == '05' }">selected = "selected"</c:if>>五月</option>
								<option value="06" <c:if test="${waterSelectMonth == '06' }">selected = "selected"</c:if>>六月</option>
								<option value="07" <c:if test="${waterSelectMonth == '07' }">selected = "selected"</c:if>>七月</option>
								<option value="08" <c:if test="${waterSelectMonth == '08' }">selected = "selected"</c:if>>八月</option>
								<option value="09" <c:if test="${waterSelectMonth == '09' }">selected = "selected"</c:if>>九月</option>
								<option value="10" <c:if test="${waterSelectMonth == '10' }">selected = "selected"</c:if>>十月</option>
								<option value="11" <c:if test="${waterSelectMonth == '11' }">selected = "selected"</c:if>>十一月</option>
								<option value="12" <c:if test="${waterSelectMonth == '12' }">selected = "selected"</c:if>>十二月</option>
							</select>
						</td>
						
						
						<td id="waterQuarter"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<select id="waterSelectYear2" name="waterSelectYear2"></select><input type="hidden" value="${waterSelectYear2}" id="waterSelectYear2Value"/>
							<select id="waterSelectQuarter" name="waterSelectQuarter">
								<option value="1" <c:if test="${waterSelectQuarter == '1' }">selected = "selected"</c:if>>一季度</option>
								<option value="2" <c:if test="${waterSelectQuarter == '2' }">selected = "selected"</c:if>>二季度</option>
								<option value="3" <c:if test="${waterSelectQuarter == '3' }">selected = "selected"</c:if>>三季度</option>
								<option value="4" <c:if test="${waterSelectQuarter == '4' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						
						
						<td id="waterYear"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<select id="waterSelectYear3" name="waterSelectYear3"></select><input type="hidden" value="${waterSelectYear3}" id="waterSelectYear3Value"/>
						</td>
						
						<td id="waterCustom1"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<input class="date textInput readOnly" readonly="readonly" type="text" maxdate="{%y}-%M-{%d-1}" name="waterCustomDay1" id="waterCustomDay1" value="${waterCustomDay1 }"/>
						</td>
						<td id="waterCustom2"  style="display:none;">
							<label style="width:20px; text-align: right" >至：</label>
							<input class="date textInput readOnly" readonly="readonly" type="text" maxdate="{%y}-%M-{%d-1}" name="waterCustomDay2" id="waterCustomDay2" value="${waterCustomDay2 }"/>
						</td>
						<td>
							<label style="width:80px;" ><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="onclickWaterSxl()" >筛选列</button></div></div></label>
							<input style="display:none" id="changeWaterTdValue" name="org3.idWater" value="${changeWaterTdValue}" size="40" type="text" postField="keyword" suggestFields="id" lookupGroup="org3" />
                    		<a style="display:none" id="sxlWaterId" lookupGroup="org3" width="400" height="285"><span>筛选列</span></a><!-- 筛选列 -->
						</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit" >查询</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportWater();">导出Excel</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
	<table class="list" layoutH="110" style="table-layout:fixed;width:100%;" id="tbWater">
		<thead>
			<tr>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >序号</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >行政区域</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >企业名称</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >监控点编号</th>
				<th width="9%" colspan="2" align="center" style="font-weight: normal;">污染物｜标准</th>
				<th width="9%" align="center" id="pjzWaterTh" style="font-weight: normal;">平均值</th>
				<th width="9%" align="center" id="pflWaterTh" style="font-weight: normal;">排放量</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="cbxsWaterTh">超标小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="sjycWaterTh">数据异常小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="sjqsWaterTh">数据缺失小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="lxcbWaterTh">连续超标最大小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center">备注</th>
			</tr>
			<tr>
				<th align="center" colspan="2" style="font-weight: normal;">毫克/升</th>
				<th align="center" id="pjzWaterTh1" style="font-weight: normal;">毫克/升</th>
				<th align="center" id="pflWaterTh1" style="font-weight: normal;">千克</th>
			</tr>
		</thead>
		
		<tbody>
			 <c:forEach var="zxsjtjWater" items="${page.result}">
				<tr>
				 <td width="5%" align="center" nameM="${zxsjtjWater.ENTER_ID}"></td>
					<td width="8%" align="center" nameM="${zxsjtjWater.ENTER_ID }">${zxsjtjWater.SUB_NAME }</td>
					<td width="8%" align="left" nameM="${zxsjtjWater.ENTER_ID }">${zxsjtjWater.ENTER_NAME }</td>
					<td width="8%" align="center" nameM="${zxsjtjWater.MON_ID }">${zxsjtjWater.MON_NAME }</td>
					<td width="4%" align="center">${zxsjtjWater.WRW_NAME }</td>
					<td width="4%" align="center">${zxsjtjWater.STD_VAL }</td>
					<td width="8%" align="center" name="pjzWaterTd">${zxsjtjWater.WRW_AVG }</td>
					<td width="8%" align="center" name="pflWaterTd">${zxsjtjWater.WRW_COU }</td>
					<td width="8%" align="center" name="cbxsWaterTd">${zxsjtjWater.WRW_OVER }</td>
					<td width="8%" align="center" name="sjycWaterTd">${zxsjtjWater.WRW_ERR }</td>
					<td width="8%" align="center" name="sjqsWaterTd">${zxsjtjWater.WRW_LOST }</td>
					<td width="8%" align="center" name="lxcbWaterTd" nameM="${zxsjtjWater.MON_ID}">${zxsjtjWater.CONTINUOUS_OVER }</td>
					<td width="8%" align="center"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<div class="panelBar">
	<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="10" <c:if test="${page.pageSize == 10 }">selected="selected"</c:if>>10</option>
				<option value="20" <c:if test="${page.pageSize == 20 }">selected="selected"</c:if>>20</option>
				<option value="30" <c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="40"<c:if test="${page.pageSize == 40 }">selected="selected"</c:if>>40</option>
				<option value="50"<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
			</select>
			<span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" name="waterPageDiv"
			totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
			pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>