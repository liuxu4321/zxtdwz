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
	function exportGas() {
		//var gasQyName = encodeURI(encodeURI($('#gasQyName').val()));//企业名
		
		var gasQyName = encodeURI(encodeURI($('#gasQyNameSelect').find("option:selected").text()));//企业名
		
		var gasAreaCode = $('#gasAreaCodeSelect').val();//区域Code
		var gasSelectType = $('#gasSelectType').val();//统计方式
		
		var gasSelectDay = $('#gasSelectDay').val();
		var gasSelectMonth = $('#gasSelectMonth').val();
		var gasSelectYear1 = $('#gasSelectYear1').val();
		var gasSelectYear2 = $('#gasSelectYear2').val();
		var gasSelectYear3 = $('#gasSelectYear3').val();
		var gasSelectQuarter = $('#gasSelectQuarter').val();
		var gasCustomDay1 = $('#gasCustomDay1').val();
		var gasCustomDay2 = $('#gasCustomDay2').val();  
		var ctrlType = $('#ctrlTypeHalf').val();    //   baib 20140522
		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#gasExcel').attr("href","${context }/statistics/zxsjtj/showZxsjtjGasExcel?gasQyName="+
						gasQyName+"&gasAreaCode="+gasAreaCode+"&selectType="+gasSelectType+"&selectDay="+
						gasSelectDay+"&selectMonth="+gasSelectMonth+"&selectYear1="+gasSelectYear1+"&selectYear2="+
						gasSelectYear2+"&selectYear3="+gasSelectYear3+"&selectQuarter="+gasSelectQuarter+
						"&customDay1="+gasCustomDay1+"&customDay2="+gasCustomDay2+"&ctrlType="+ctrlType);
				$('#gasExcel').click();
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
      $('#gasQyNameSelect').bind('keyup',processKeyupGas); 
   }); 

   /** 
    * 处理键盘按下后弹起的事件 
    * @param event 
    */ 
   function processKeyupGas(event){ 
         var myEvent = event || windows.event; 
         var keyCode = myEvent.keyCode; 
         //输入是字母，或者退格键则需要重新请求 
         if((keyCode >= 65 && keyCode <= 90) || keyCode == 8){ 
              //以下两行代码是为了防止用户快速输入导致频繁请求服务器 
              //这样便可以在用户500ms内快速输入的情况下，只请求服务器一次 
              //大大提高服务器性能 
              if($('#gasQyNameSelect').val()==""){
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
      var pos = $('#gasQyNameSelect').position(); 
      var topPosition = pos.top+$('#gasQyNameSelect').height()+11; 
      var leftPosition = pos.left+5; 
      $('#auto_div_gas').offset({top:topPosition,left:leftPosition}); 
      $('#auto_div_gas').width($('#gasQyNameSelect').width() - 39); 
      uniteGasTable(tbGas,1);
      changeTdGas();
   } 

   /** 
    * 处理Ajax请求 
    * @param data 
    */ 
   function processAjaxRequestGas(){ 
  	 var inputValue = $('#gasQyNameSelect').val();
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
	           word_div.click(getAutoText);
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
   function getAutoText(){ 
      //有高亮显示的则选中当前选中当前高亮的文本 
      if(highLightIndex != -1){ 
          $('#gasQyNameSelect').val($(this).html()); 
          $('#auto_div_gas').html('').hide(); 
      } 
   } 

   /** 
    * 处理按下Enter键 
    * @param keyCode 
    */ 
   function processEnter(){ 
       if(highLightIndex != -1){ 
          $('gasQyNameSelect').val($('#auto_div_gas').children().eq(highLightIndex).html()); 
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
       $('#gasQyNameSelect').val(words.eq(highLightIndex).html()); 
   } 

   /** 
    * 如果有高亮的则把高亮变白 
    */ 
   function changeToWhite(){ 
       if(highLightIndex != -1){ 
           $('#auto_div_gas').children().eq(highLightIndex).css('background-color','white'); 
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
// 兼容IE FF
///////////////////////////////////////////////   
function   uniteGasTable(tb,colLength){
 //   检查表格是否规整
if   (!checkGasTable(tb))   return;
 
var   i=0;   
var   j=0;   
var   rowCount=tb.rows.length; //   行数   
var   colCount=tb.rows[0].cells.length; //   列数   
var   obj1=null;   
var   obj2=null;
var	serialNumber = (($("[name='gasPageDiv']").attr("currentPage") - 1)*$('#gasNumPerPage').val()) + 1;//序号初始化(第pageNo页 每页pageSize条数据)
//   为每个单元格命名   
for   (i=2;i<rowCount;i++){   
for   (j=0;j<colCount;j++){   
tb.rows[i].cells[j].id="tbGas__"   +   i.toString()   +   "_"   +   j.toString();   
}   
}

//按企业给序号赋值 
	$('#tbGas__2_0').text(serialNumber);
	obj1 = $('#tbGas__2_2');
		for   (j=2;j<rowCount;j++){
		obj2 = $('#tbGas__'+j.toString()+'_2');
			if   (obj1.text()   ==   obj2.text()){
				$('#tbGas__'+j.toString()+'_0').text(serialNumber);
			}else{   
			serialNumber++;
			$('#tbGas__'+j.toString()+'_0').text(serialNumber);
			obj1=$('#tbGas__'+j.toString()+'_2');
			}
		}
    
    $("#tbGas").rowspan(0);
    $("#tbGas").rowspan(1);
    $("#tbGas").rowspan(2);
    $("#tbGas").rowspan(3);
}   
/////////////////////////////////////////   
//   功能：检查表格是否规整   
//   参数：tb－－需要检查的表格ID   
/////////////////////////////////////////   
function   checkGasTable(tb){   
if   (tb.rows.length==2)   return   false;   
if   (tb.rows[0].cells.length==0)   return   false; 
for   (var   i=2;i<tb.rows.length;i++){   
if   (tb.rows[2].cells.length   !=   tb.rows[i].cells.length)   return   false;   
}   
return   true;   
}
/////////////筛选列
function changeTdGas(){

	 $("#pjzGasTh").hide();
	 $("#pjzGasTh1").hide();
	 $("td[name='pjzGasTd']").hide();
	 
	 $("#pflGasTh").hide();
	 $("#pflGasTh1").hide();
	 $("td[name='pflGasTd']").hide();
	 
	 $("#cbxsGasTh").hide();
	 $("td[name='cbxsGasTd']").hide();
	 
	 $("#sjycGasTh").hide();
	 $("td[name='sjycGasTd']").hide();
	 
	 $("#sjqsGasTh").hide();
	 $("td[name='sjqsGasTd']").hide();
	 
	 $("#lxcbGasTh").hide();
	 $("td[name='lxcbGasTd']").hide();
	 
	 var tdValue=$('#changeGasTdValue').val();
	 if(tdValue != ''){
		 var arrayObj = new Array();
		 arrayObj = tdValue.split(',');
		 for(var i = 0;i<arrayObj.length;i++){
			 if(arrayObj[i] == '1'){
				 $("#pjzGasTh").show();
				 $("#pjzGasTh1").show();
				 $("td[name='pjzGasTd']").show();
			 }else if(arrayObj[i] == '2'){
				 $("#pflGasTh").show();
				 $("#pflGasTh1").show();
				 $("td[name='pflGasTd']").show();
			 }else if(arrayObj[i] == '3'){
				 $("#cbxsGasTh").show();
				 $("td[name='cbxsGasTd']").show();
			 }else if(arrayObj[i] == '4'){
				 $("#sjycGasTh").show();
				 $("td[name='sjycGasTd']").show();
			 }else if(arrayObj[i] == '5'){
				 $("#sjqsGasTh").show();
				 $("td[name='sjqsGasTd']").show();
			 }else if(arrayObj[i] == '6'){
				 $("#lxcbGasTh").show();
				 $("td[name='lxcbGasTd']").show();
			 }
		 }
	 }
}
//筛选列点击事件
function onclickGasSxl(){
	 $('#sxlGasId').attr('href','${context }/statistics/zxsjtj/zxsjtj_sxl_gas');
	 $('#sxlGasId').click();
}
</script>
<script type="text/javascript">
	//先给年下拉框赋内容
	var y = new Date().getFullYear();
	for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
		document.getElementById("gasSelectYear1").options.add(new   Option(i+"年",i));
		document.getElementById("gasSelectYear2").options.add(new   Option(i+"年",i));
		document.getElementById("gasSelectYear3").options.add(new   Option(i+"年",i));
	}
	var gasSelectYear1Value = $('#gasSelectYear1Value').val();
	var gasSelectYear2Value = $('#gasSelectYear2Value').val();
	var gasSelectYear3Value = $('#gasSelectYear3Value').val();
	if(gasSelectYear1Value != '' && gasSelectYear1Value != null){
		$("#gasSelectYear1").val(gasSelectYear1Value);
	}
	if(gasSelectYear2Value != '' && gasSelectYear2Value != null){
		$("#gasSelectYear2").val(gasSelectYear2Value);
	}
	if(gasSelectYear3Value != '' && gasSelectYear3Value != null){
		$("#gasSelectYear3").val(gasSelectYear3Value);
	}
	gasChangeSelect_sjcsyxl($("#gasSelectType").val());
	 function gasChangeSelect_sjcsyxl(item){
			var i = item;
			if(i == 1){
				$("#gasDay").show();
				$("#gasMonth").hide();
				$("#gasQuarter").hide();
				$("#gasYear").hide();
				$("#gasCustom1").hide();
				$("#gasCustom2").hide();
			}
			if(i == 2){
				$("#gasDay").hide();
				$("#gasMonth").show();
				$("#gasQuarter").hide();
				$("#gasYear").hide();
				$("#gasCustom1").hide();
				$("#gasCustom2").hide();
			}
			if(i == 3){
				$("#gasDay").hide();
				$("#gasMonth").hide();
				$("#gasQuarter").show();
				$("#gasYear").hide();
				$("#gasCustom1").hide();
				$("#gasCustom2").hide();
			}
			if(i == 4){
				$("#gasDay").hide();
				$("#gasMonth").hide();
				$("#gasQuarter").hide();
				$("#gasYear").show();
				$("#gasCustom1").hide();
				$("#gasCustom2").hide();
			}
			if(i == 5){
				$("#gasDay").hide();
				$("#gasMonth").hide();
				$("#gasQuarter").hide();
				$("#gasYear").hide();
				$("#gasCustom1").show();
				$("#gasCustom2").show();
			}
		 }
	 
	//选择行政区划
	 function changeSelectAreaCode(){
	 	var areaCode = $('#gasAreaCodeSelect').val();
	 	$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode +"&dataFlg=1",AjaxDoneSelect);});
	 }
	 //取得对应小类别回调方法(行政区划->污染源类型->企业名称)
	 function AjaxDoneSelect(jsonStr){
		 //alert(jsonStr);
	 	var jsonObj = jQuery.parseJSON(jsonStr);
	 	var optionstring = "<option></option>";
	 	for(var item in jsonObj){
	 		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
	 		}
	 	jQuery("#gasQyNameSelect").html(optionstring);
	 	
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
		var ll = $('#gasQyNameSelect').find("option:selected").text();
		$('#gasQyName').val(ll);
	}
	
	
</script>
<form id="pagerForm" method="post"
	action="${context }/statistics/zxsjtj/1">
	<input type="hidden" name="pageNum" value="${currentPageNo }"/>
	<input type="hidden" name="numPerPage" value="${page.pageSize }" id="gasNumPerPage"/> 
	<input type="hidden" name="gasQyName"  value="${gasQyName }" />   
	<!--<input  style="display:none" class="required" id="gasQyName" name="gasQyName" value="${gasQyName }" />--> 
	<input type="hidden" name="gasAreaCode" value="${gasAreaCode }" />
	<input type="hidden" name="gasSelectType" value="${gasSelectType }" /> 
	<input type="hidden" name="gasSelectDay" value="${gasSelectDay }" />
	<input type="hidden" name="gasSelectMonth" value="${gasSelectMonth }" />
	<input type="hidden" name="gasSelectYear1" value="${gasSelectYear1 }" />
	<input type="hidden" name="gasSelectYear2" value="${gasSelectYear2 }" />
	<input type="hidden" name="gasSelectYear3" value="${gasSelectYear3 }" />
	<input type="hidden" name="gasSelectQuarter" value="${gasSelectQuarter }" />
	<input type="hidden" name="gasCustomDay1" value="${gasCustomDay1 }" />
	<input type="hidden" name="gasCustomDay2" value="${gasCustomDay2 }" />
	<input type="hidden" name="ctrlType" value="${ctrlType }" />
	<input type="hidden" name="org3.idGas" value="${changeGasTdValue }" />
</form>

<a id="gasExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<div class="bdsug" id="auto_div_gas"></div>
<div class="pageHeader">
	<form id="zxsjtjGasForm" onsubmit="return navTabSearch(this);"
		action="${context }/statistics/zxsjtj/1" method="post">
		<div class="pageFormContent">
			<table class="searchContent" border="0">
				<tr height="20px">
							<!--  -->
					<td><label style="width: 80px; text-align: right">
							行政区域：</label> <select name="gasAreaCode" id="gasAreaCodeSelect" onchange="changeSelectAreaCode();"> 
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }"
									<c:if test="${ac.key==gasAreaCode }">selected='selected'</c:if>>${ac.value
									}</option>
							</c:forEach>
					</select></td>
					<!-- <td><label style="width: 90px; text-align: right">企业名称：</label>
						<input type="text" value="${gasQyName}" name="gasQyName" id="gasQyName" size="40"/></td> -->
						
					<td>
						<label style="text-align: right;">企业名称：</label>
						<select name="gasQyNamell" id="gasQyNameSelect" style="width:180px;" onchange="fun1()">
							<option></option>
							<c:forEach var="en" items="${enterpriseNameSelectMap }">
								<option value="${en.key }" <c:if test="${en.value==gasQyName }">selected='selected'</c:if>>
									${en.value}
								</option>
							</c:forEach>
						</select>
						<input type="hidden" name="gasQyName" id="gasQyName" value="${gasQyName}" />
					</td>
						
					<td><label style="width: 80px; text-align: right">
							统计方式：</label>
							<select id="gasSelectType" name="gasSelectType" onchange="gasChangeSelect_sjcsyxl(this.value)">
								<option value="1" <c:if test="${gasSelectType == 1 }">selected = "selected"</c:if>>日</option>
								<option value="2" <c:if test="${gasSelectType == 2 }">selected = "selected"</c:if>>月</option>
								<option value="3" <c:if test="${gasSelectType == 3 }">selected = "selected"</c:if>>季度</option>
								<option value="4" <c:if test="${gasSelectType == 4 }">selected = "selected"</c:if>>年</option>
								<option value="5" <c:if test="${gasSelectType == 5 }">selected = "selected"</c:if>>自定义</option>
							</select></td>
						<td id="gasDay" style="">
						
							<label style="width:40px; text-align: right" >时间：</label>
							<input class="date textInput readOnly" type="text" maxdate="{%y}-%M-{%d-1}" name="gasSelectDay"  value="${gasSelectDay }" id="gasSelectDay"/>
						</td>
						<td>
							<label style="width:80px; text-align: right" >控制程度：</label>
							<select name="ctrlType" id="ctrlTypeHalf" onchange="changeSelectsForEnt();">
								<option></option>
								<c:forEach var="ct" items="${ctrlTypeSelectMap }">
									<option value="${ct.key }" <c:if test="${ct.key==ctrlType }">selected='selected'</c:if>>${ct.value }</option>
								</c:forEach>
							</select>
						</td>
						<td id="gasMonth"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<select id="gasSelectYear1" name="gasSelectYear1"></select><input type="hidden" value="${gasSelectYear1}" id="gasSelectYear1Value"/>
							<select id="gasSelectMonth" name="gasSelectMonth">
								<option value="01" <c:if test="${gasSelectMonth == '01' }">selected = "selected"</c:if>>一月</option>
								<option value="02" <c:if test="${gasSelectMonth == '02' }">selected = "selected"</c:if>>二月</option>
								<option value="03" <c:if test="${gasSelectMonth == '03' }">selected = "selected"</c:if>>三月</option>
								<option value="04" <c:if test="${gasSelectMonth == '04' }">selected = "selected"</c:if>>四月</option>
								<option value="05" <c:if test="${gasSelectMonth == '05' }">selected = "selected"</c:if>>五月</option>
								<option value="06" <c:if test="${gasSelectMonth == '06' }">selected = "selected"</c:if>>六月</option>
								<option value="07" <c:if test="${gasSelectMonth == '07' }">selected = "selected"</c:if>>七月</option>
								<option value="08" <c:if test="${gasSelectMonth == '08' }">selected = "selected"</c:if>>八月</option>
								<option value="09" <c:if test="${gasSelectMonth == '09' }">selected = "selected"</c:if>>九月</option>
								<option value="10" <c:if test="${gasSelectMonth == '10' }">selected = "selected"</c:if>>十月</option>
								<option value="11" <c:if test="${gasSelectMonth == '11' }">selected = "selected"</c:if>>十一月</option>
								<option value="12" <c:if test="${gasSelectMonth == '12' }">selected = "selected"</c:if>>十二月</option>
							</select>
						</td>
						
						
						<td id="gasQuarter"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<select id="gasSelectYear2" name="gasSelectYear2"></select><input type="hidden" value="${gasSelectYear2}" id="gasSelectYear2Value"/>
							<select id="gasSelectQuarter" name="gasSelectQuarter">
								<option value="1" <c:if test="${gasSelectQuarter == '1' }">selected = "selected"</c:if>>一季度</option>
								<option value="2" <c:if test="${gasSelectQuarter == '2' }">selected = "selected"</c:if>>二季度</option>
								<option value="3" <c:if test="${gasSelectQuarter == '3' }">selected = "selected"</c:if>>三季度</option>
								<option value="4" <c:if test="${gasSelectQuarter == '4' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						
						
						<td id="gasYear"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<select id="gasSelectYear3" name="gasSelectYear3"></select><input type="hidden" value="${gasSelectYear3}" id="gasSelectYear3Value"/>
						</td>
						
						<td id="gasCustom1"  style="display:none;">
							<label style="width:40px; text-align: right" >时间：</label>
							<input class="date textInput readOnly" readonly="readonly" type="text" maxdate="{%y}-%M-{%d-1}" name="gasCustomDay1" id="gasCustomDay1" value="${gasCustomDay1 }"/>
						</td>
						<td id="gasCustom2"  style="display:none;">
							<label style="width:20px; text-align: right" >至：</label>
							<input class="date textInput readOnly" readonly="readonly" type="text" maxdate="{%y}-%M-{%d-1}" name="gasCustomDay2" id="gasCustomDay2" value="${gasCustomDay2 }"/>
						</td>
						<td>
							<label style="width:80px;" ><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="onclickGasSxl();" >筛选列</button></div></div></label>
							<input style="display:none" id="changeGasTdValue" name="org3.idGas" value="${changeGasTdValue}" size="40" type="text" postField="keyword" suggestFields="id" lookupGroup="org3" />
                    		<a style="display:none" id="sxlGasId" lookupGroup="org3" width="400" height="285"><span>筛选列</span></a><!-- 筛选列 -->
						</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportGas();">导出Excel</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
	<table class="list" layoutH="110" style="table-layout:fixed;width:100%;" id="tbGas">
		<thead>
			<tr>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >序号</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >行政区域</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >企业名称</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" >监控点编号</th>
				<th width="9%" colspan="2" align="center" style="font-weight: normal;">污染物｜标准</th>
				<th width="9%" align="center" id="pjzGasTh" style="font-weight: normal;">平均值</th>
				<th width="9%" align="center" id="pflGasTh" style="font-weight: normal;">排放量</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="cbxsGasTh">超标小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="sjycGasTh">数据异常小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="sjqsGasTh">数据缺失小时数</th>
			    <th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center" id="lxcbGasTh">连续超标最大小时数</th>
				<th width="9%" rowspan="2" style="vertical-align: middle;font-weight: normal;" align="center">备注</th>
			</tr>
			<tr>
				<th align="center" colspan="2" style="font-weight: normal;">毫克/立方米</th>
				<th align="center" id="pjzGasTh1" style="font-weight: normal;">毫克/立方米</th>
				<th align="center" id="pflGasTh1" style="font-weight: normal;">千克</th>
			</tr>
		</thead>
		
		<tbody>
			 <c:forEach var="zxsjtjGas" items="${page.result}">
				<tr>
				 	<td width="5%" align="center" nameM="${zxsjtjGas.ENTER_ID}"></td>
				 	<td width="5%" align="center" nameM="${zxsjtjGas.ENTER_ID}">${zxsjtjGas.SUB_NAME }</td>
					<td width="8%" align="left" nameM="${zxsjtjGas.ENTER_ID}">${zxsjtjGas.ENTER_NAME }</td>
					<td width="8%" align="center" nameM="${zxsjtjGas.MON_ID}">${zxsjtjGas.MON_NAME }</td>
					<td width="4%" align="center">${zxsjtjGas.WRW_NAME }</td>
					<td width="4%" align="center">${zxsjtjGas.STD_VAL }</td>
					<td width="8%" align="center" name="pjzGasTd">${zxsjtjGas.WRW_AVG }</td>
					<td width="8%" align="center" name="pflGasTd">${zxsjtjGas.WRW_COU }</td>
					<td width="8%" align="center" name="cbxsGasTd">${zxsjtjGas.WRW_OVER }</td>
					<td width="8%" align="center" name="sjycGasTd">${zxsjtjGas.WRW_ERR }</td>
					<td width="8%" align="center" name="sjqsGasTd">${zxsjtjGas.WRW_LOST }</td>
					<td width="8%" align="center" name="lxcbGasTd" nameM="${zxsjtjGas.MON_ID}">${zxsjtjGas.CONTINUOUS_OVER }</td>
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
		<div class="pagination" targetType="navTab" name="gasPageDiv"
			totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
			pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>