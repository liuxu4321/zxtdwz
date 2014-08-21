<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>
<!-- 数据传输有效率首页 2013/09/23 BY RenWei -->
<style type="text/css">
.bdsug{
	position:relative;
	top:100px;
	left:0px;
	border:1px solid #817f82;
	background-attachment:scroll;
	background-repeat:repeat;
	background-position:0%;
	background-origin:padding-box;
	background-clip:border-box;
	background-color:rgb(255, 255, 255);
	z-index: 100;
}
</style>
<script type="text/javascript">
	
	$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container_1',
                type: 'column'
            },
            title: {
                text: '数据传输有效率'
            },
            xAxis: {
                categories: [${area}]
            },
            yAxis: {
                min: 0,
                max:100,
                title: {
                    text: 'values'
                },
                labels: {
                	format: '{value} %'
           			}
            },
            legend: {
                layout: 'horizontal',
                backgroundColor: '#FFFFFF',
                align: 'left',
                verticalAlign: 'top',
                x: 60,
                y: 0,
                floating: true,
                shadow: true
            },
            tooltip: {
                formatter: function() {
                    return ''+
                        this.x +': '+ this.y +' %';
                }
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
                series: [{
                name: '传输有效率',
                //data: [49.9, 71.5, 99.4, 89.2, 80.0, 92.0, 60.6, 70.5, 95.4, 66.1, 95.6, 54.4 , 55.3 , 66.9 , 99.4 , 66.5]
                data: [${csyxlArray}]
    
            }, {
                name: '传输率',
                //data: [83.6, 78.8, 98.5, 93.4, 88.0, 84.5, 78.0, 77.3, 91.2, 83.5, 99.6, 92.3 , 55.3 , 66.9 , 99.4 , 66.5]
                data: [${cslArray}]
            }, {
                name: '有效率',
                //data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2 , 55.3 , 66.9 , 99.4 , 66.5]
                data: [${yxlArray}]
            }]
        });
    });
});

</script>
<script type="text/javascript">
 function changeSelect_sjcsyxl(item){
	var i = item;
	if(i == 1){
		$("#day").show();
		$("#month").hide();
		$("#quarter").hide();
		$("#year").hide();
		$("#custom1").hide();
		$("#custom2").hide();
	}
	if(i == 2){
		$("#day").hide();
		$("#month").show();
		$("#quarter").hide();
		$("#year").hide();
		$("#custom1").hide();
		$("#custom2").hide();
	}
	if(i == 3){
		$("#day").hide();
		$("#month").hide();
		$("#quarter").show();
		$("#year").hide();
		$("#custom1").hide();
		$("#custom2").hide();
	}
	if(i == 4){
		$("#day").hide();
		$("#month").hide();
		$("#quarter").hide();
		$("#year").show();
		$("#custom1").hide();
		$("#custom2").hide();
	}
	if(i == 5){
		$("#day").hide();
		$("#month").hide();
		$("#quarter").hide();
		$("#year").hide();
		$("#custom1").show();
		$("#custom2").show();
	}
 }
 
 function monTypeChinge(monType){
	 document.getElementById("monType").value = monType;
	 document.getElementById("enterpriseName").value = document.getElementById("enterprise").value;
	 $("#sjcsyxlForm").submit();
 }
 
 function sjcsyxlExport(){
	 var enterpriseName = encodeURI(encodeURI($('#enterpriseName').val()));//企业名
		var areaCode = $('#areaCode').val();//区域Code
		var selectType = $('#selectType').val();//统计方式
		
		var selectDay = $('#selectDay').val();
		var selectMonth = $('#selectMonth').val();
		var selectYear1 = $('#selectYear1').val();
		var selectYear2 = $('#selectYear2').val();
		var selectYear3 = $('#selectYear3').val();
		var selectQuarter = $('#selectQuarter').val();
		var customDay1 = $('#customDay1').val();
		var customDay2 = $('#customDay2').val();
		var monType = $('#mon').val();
		var p01 = $('#p01').attr("checked");
		var p03 = $('#p03').attr("checked");
		var p060 = $('#p060').attr("checked");
		var p011 = $('#p011').attr("checked");
		var p02 = $('#p02').attr("checked");

		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#sjcsyxlExcel').attr("href","${context }/DataTransController/sjcsyxlExport?selectType="+selectType+
						"&selectDay="+selectDay+"&selectMonth="+selectMonth+"&selectYear1="+selectYear1+
						"&selectYear2="+selectYear2+"&selectYear3="+selectYear3+"&selectQuarter="+selectQuarter+
						"&customDay1="+customDay1+"&customDay2="+customDay2+"&monType="+monType+
						"&enterpriseName="+enterpriseName+"&areaCode="+areaCode+"&p01="+p01+"&p02="+p02+"&p03="+p03+"&p011="+p011+"&p060="+p060);
				$('#sjcsyxlExcel').click();
			}
		});
 }
 /* function validateCustomDate(){
	 var c1 = document.getElementById("customDay1").value;
	 var c2 = document.getElementById("customDay2").value;
	 var year1  = c1.substr(0 , 4);
	 var month1  = c1.substr(5 , 2);
	 var day1  = c1.substr(8 , 2);
	 var year2  = c1.substr(0 , 4);
	 var month2  = c1.substr(5 , 2);
	 var day2  = c1.substr(8 , 2);
	 if(year1 > year2){
		 alert
	 }
 } */
 /******************************搜索提示开始*********************************/
 //高亮的索引 
var highLightIndex = -1; 
//超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
var timeoutId; 
$(document).ready(function(){ 
  init(); 
  $('#enterprise').bind('keyup',processKeyupGas); 
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
          if($('#enterprise').val()==""){
       	   $('#auto_div_sjcs').html('');
       	   $('#auto_div_sjcs').hide();
          }else{
               highLightIndex = -1; 
               clearTimeout(timeoutId); 
               timeoutId = setTimeout(processAjaxRequestGas,700); 
          };
     //处理上下键(up,down) 
     }else if(keyCode == 38 || keyCode == 40){ 
         processKeyUpAndDown(keyCode); 
     //按下了回车键 
     }else if(keyCode == 13){ 
         processEnter(); 
     };
} 

/*** 
* 初始化弹出框列表的位置，大小 
*/ 
function init(){ 
  $('#auto_div_sjcs').hide(); 
  /* var pos = $('#enterprise').position(); 
  var topPosition = pos.top+$('#enterprise').height()+305; 
  var leftPosition = pos.left+6; 
  $('#auto_div_sjcs').offset({top:topPosition,left:leftPosition}); 
  $('#auto_div_sjcs').width($('#enterprise').width() - 48);  */
} 

/** 
* 处理Ajax请求 
* @param data 
*/ 
function processAjaxRequestGas(){ 
	 var inputValue = $('#enterprise').val();
		$(function(){ajaxTodo("${context }/search/enterprise?pyjm="+inputValue,processAjaxResponseGas);});
} 

/** 
* 处理Ajax回复 
* @param data Ajax请求得到的返回结果为dom文档对象 
*/ 
function processAjaxResponseGas(jsonStr){
	if(jsonStr.length > 0){
    	$('#auto_div_sjcs').html('').show(); 
        for(var i = 0 ; i < jsonStr.length ; i++){
           var word_div = $('<div style="cursor: default;margin:3px 3px 3px 3px;"></div>'); 
           word_div.html(jsonStr[i]);
           word_div.hover(fnOver,fnOut); 
           word_div.click(getAutoText);
           $('#auto_div_sjcs').append(word_div); 
        };
	}else{
		$('#auto_div_sjcs').hide();
	};
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
      $('#enterprise').val($(this).html()); 
      $('#auto_div_sjcs').html('').hide(); 
  } 
} 

/** 
* 处理按下Enter键 
* @param keyCode 
*/ 
function processEnter(){ 
   if(highLightIndex != -1){ 
      $('enterprise').val($('#auto_div_sjcs').children().eq(highLightIndex).html()); 
      $('#auto_div_sjcs').html('').hide(); 
   } 
} 

/** 
* 处理按上下键的情况 
*/ 
function processKeyUpAndDown(keyCode){ 
   var words = $('#auto_div_sjcs').children(); 
   var num = words.length; 
   if(num <= 0) return; 
   changeToWhite(); 
   highLightIndex = ((keyCode != 38 ? num + 1:num - 1)+highLightIndex) % num; 
   words.eq(highLightIndex).css('background-color','#cccccc'); 
   $('#enterprise').val(words.eq(highLightIndex).html()); 
} 

/** 
* 如果有高亮的则把高亮变白 
*/ 
function changeToWhite(){ 
   if(highLightIndex != -1){ 
       $('#auto_div_sjcs').children().eq(highLightIndex).css('background-color','white'); 
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
/******************************搜索提示结束*********************************/
 </script>
 
 <form id="pagerForm" method="post" action="${context }/DataTransController/sjcsyxl" onsubmit="return divSearch(this);">
	<input type="hidden" name="pageNum" value="${page.currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" /> 
	<input type="hidden" name="areaCode" value="${areaCode }" /> 
	<input type="hidden" name="enterpriseName" value="${enterpriseName }" /> 
	<input type="hidden" name="monType" value="${monType }" /> 
	<input type="hidden" name="p01" value="${pArray[0] }" /> 
	<input type="hidden" name="p02" value="${pArray[1] }" /> 
	<input type="hidden" name="p03" value="${pArray[2] }" /> 
	<input type="hidden" name="p060" value="${pArray[4] }" /> 
	<input type="hidden" name="p011" value="${pArray[3] }" /> 
	<input type="hidden" name="selectType" value="${selectType }" /> 
	<input type="hidden" name="selectDay" value="${selectDay }" /> 
	<input type="hidden" name="selectMonth" value="${selectMonth }" /> 
	<input type="hidden" name="selectYear1" value="${selectYear1 }" /> 
	<input type="hidden" name="selectYear2" value="${selectYear2 }" /> 
	<input type="hidden" name="selectYear3" value="${selectYear3 }" /> 
	<input type="hidden" name="selectQuarter" value="${selectQuarter }" /> 
	<input type="hidden" name="customDay1" value="${customDay1 }" /> 
	<input type="hidden" name="customDay2" value="${customDay2 }" /> 
</form>
 
 <a id="sjcsyxlExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<div class="pageContent" style="padding:5px;overflow: hidden;">
	
	<div id="jbsxBox" class="unitBox" style="margin-top:5px; border:1px #B8D0D6 solid; overflow: hidden;">
		<div class="pageHeader">
			<div class="searchBar">
				<form onsubmit="return navTabSearch(this);" action="${context }/DataTransController/sjcsyxl" id="sjcsyxlForm">
				<table class="searchContent">
					<tr>
						<td>
						<label style="width:60px; text-align: right" >行政区划：</label>
							<select name="areaCode" id="areaCode">
								<c:forEach var="areaCodeM" items="${areaMap }">
									<option value="${areaCodeM.key }" <c:if test="${areaCodeM.key==areaCode }">selected="selected"</c:if>>${areaCodeM.value}</option>
									<c:if test="${areaCodeM.key == '210000'}">
										<option value="111111" <c:if test="${areaCode == '111111' }">selected="selected"</c:if>>省直管</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td>
						<label style="width:60px; text-align: right" >统计方式：</label>
							<select name="selectType" onchange="changeSelect_sjcsyxl(this.value)" id="selectType">
								<option value="1" <c:if test="${selectType == 1 }">selected = "selected"</c:if>>日</option>
								<option value="2" <c:if test="${selectType == 2 }">selected = "selected"</c:if>>月</option>
								<option value="3" <c:if test="${selectType == 3 }">selected = "selected"</c:if>>季度</option>
								<option value="4" <c:if test="${selectType == 4 }">selected = "selected"</c:if>>年</option>
								<option value="5" <c:if test="${selectType == 5 }">selected = "selected"</c:if>>自定义</option>
							</select>
						</td>
						
						<td id="day" style="">
							<label style="width:30px; text-align: right" >时间：</label>
							<input class="date textInput readOnly" type="text" maxdate="{%y}-%M-{%d-1}" name="selectDay"  value="${selectDay }" id="selectDay"/>
						</td>
						
						<td id="month"  style="display:none;">
							<label style="width:30px; text-align: right" >时间：</label>
							<select id="selectYear1" name="selectYear1">
								<option value="2010"  <c:if test="${selectYear1 == '2010' }">selected = "selected"</c:if>>2010</option>
								<option value="2011"  <c:if test="${selectYear1 == '2011' }">selected = "selected"</c:if>>2011</option>
								<option value="2012"  <c:if test="${selectYear1 == '2012' }">selected = "selected"</c:if>>2012</option>
								<option value="2013"  <c:if test="${selectYear1 == '2013' }">selected = "selected"</c:if>>2013</option>
								<option value="2014"  <c:if test="${selectYear1 == '2014' }">selected = "selected"</c:if>>2014</option>
								<option value="2015"  <c:if test="${selectYear1 == '2015' }">selected = "selected"</c:if>>2015</option>
								<option value="2016"  <c:if test="${selectYear1 == '2016' }">selected = "selected"</c:if>>2016</option>
								<option value="2017"  <c:if test="${selectYear1 == '2017' }">selected = "selected"</c:if>>2017</option>
								<option value="2018"  <c:if test="${selectYear1 == '2018' }">selected = "selected"</c:if>>2018</option>
								<option value="2019"  <c:if test="${selectYear1 == '2019' }">selected = "selected"</c:if>>2019</option>
								<option value="2020"  <c:if test="${selectYear1 == '2020' }">selected = "selected"</c:if>>2020</option>
							</select>
							<select id="selectMonth" name="selectMonth">
								<option value="01" <c:if test="${selectMonth == '01' }">selected = "selected"</c:if>>一月</option>
								<option value="02" <c:if test="${selectMonth == '02' }">selected = "selected"</c:if>>二月</option>
								<option value="03" <c:if test="${selectMonth == '03' }">selected = "selected"</c:if>>三月</option>
								<option value="04" <c:if test="${selectMonth == '04' }">selected = "selected"</c:if>>四月</option>
								<option value="05" <c:if test="${selectMonth == '05' }">selected = "selected"</c:if>>五月</option>
								<option value="06" <c:if test="${selectMonth == '06' }">selected = "selected"</c:if>>六月</option>
								<option value="07" <c:if test="${selectMonth == '07' }">selected = "selected"</c:if>>七月</option>
								<option value="08" <c:if test="${selectMonth == '08' }">selected = "selected"</c:if>>八月</option>
								<option value="09" <c:if test="${selectMonth == '09' }">selected = "selected"</c:if>>九月</option>
								<option value="10" <c:if test="${selectMonth == '10' }">selected = "selected"</c:if>>十月</option>
								<option value="11" <c:if test="${selectMonth == '11' }">selected = "selected"</c:if>>十一月</option>
								<option value="12" <c:if test="${selectMonth == '12' }">selected = "selected"</c:if>>十二月</option>
							</select>
						</td>
						
						
						<td id="quarter"  style="display:none;">
							<label style="width:30px; text-align: right" >时间：</label>
							<select id="selectYear2" name="selectYear2">
								<option value="2010"  <c:if test="${selectYear2 == '2010' }">selected = "selected"</c:if>>2010</option>
								<option value="2011"  <c:if test="${selectYear2 == '2011' }">selected = "selected"</c:if>>2011</option>
								<option value="2012"  <c:if test="${selectYear2 == '2012' }">selected = "selected"</c:if>>2012</option>
								<option value="2013"  <c:if test="${selectYear2 == '2013' }">selected = "selected"</c:if>>2013</option>
								<option value="2014"  <c:if test="${selectYear2 == '2014' }">selected = "selected"</c:if>>2014</option>
								<option value="2015"  <c:if test="${selectYear2 == '2015' }">selected = "selected"</c:if>>2015</option>
								<option value="2016"  <c:if test="${selectYear2 == '2016' }">selected = "selected"</c:if>>2016</option>
								<option value="2017"  <c:if test="${selectYear2 == '2017' }">selected = "selected"</c:if>>2017</option>
								<option value="2018"  <c:if test="${selectYear2 == '2018' }">selected = "selected"</c:if>>2018</option>
								<option value="2019"  <c:if test="${selectYear2 == '2019' }">selected = "selected"</c:if>>2019</option>
								<option value="2020"  <c:if test="${selectYear2 == '2020' }">selected = "selected"</c:if>>2020</option>
							</select>
							<select id="selectQuarter" name="selectQuarter">
								<option value="1" <c:if test="${selectQuarter == '1' }">selected = "selected"</c:if>>一季度</option>
								<option value="2" <c:if test="${selectQuarter == '2' }">selected = "selected"</c:if>>二季度</option>
								<option value="3" <c:if test="${selectQuarter == '3' }">selected = "selected"</c:if>>三季度</option>
								<option value="4" <c:if test="${selectQuarter == '4' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						
						
						<td id="year"  style="display:none;">
							<label style="width:30px; text-align: right" >时间：</label>
							<select id="selectYear3" name="selectYear3">
								<option value="2010"  <c:if test="${selectYear3 == '2010' }">selected = "selected"</c:if>>2010</option>
								<option value="2011"  <c:if test="${selectYear3 == '2011' }">selected = "selected"</c:if>>2011</option>
								<option value="2012"  <c:if test="${selectYear3 == '2012' }">selected = "selected"</c:if>>2012</option>
								<option value="2013"  <c:if test="${selectYear3 == '2013' }">selected = "selected"</c:if>>2013</option>
								<option value="2014"  <c:if test="${selectYear3 == '2014' }">selected = "selected"</c:if>>2014</option>
								<option value="2015"  <c:if test="${selectYear3 == '2015' }">selected = "selected"</c:if>>2015</option>
								<option value="2016"  <c:if test="${selectYear3 == '2016' }">selected = "selected"</c:if>>2016</option>
								<option value="2017"  <c:if test="${selectYear3 == '2017' }">selected = "selected"</c:if>>2017</option>
								<option value="2018"  <c:if test="${selectYear3 == '2018' }">selected = "selected"</c:if>>2018</option>
								<option value="2019"  <c:if test="${selectYear3 == '2019' }">selected = "selected"</c:if>>2019</option>
								<option value="2020"  <c:if test="${selectYear3 == '2020' }">selected = "selected"</c:if>>2020</option>
							</select>
						</td>
						
						<td id="custom1"  style="display:none;">
							<label style="width:30px; text-align: right" >时间：</label>
							<input class="date textInput readOnly" readonly="readonly" type="text" maxdate="{%y}-%M-{%d-1}" name="customDay1" id="customDay1" value="${customDay1 }"/>
						</td>
						<td id="custom2"  style="display:none;">
							<label style="width:20px; text-align: right" >至：</label>
							<input class="date textInput readOnly" readonly="readonly" type="text" maxdate="{%y}-%M-{%d-1}" name="customDay2" id="customDay2" value="${customDay2 }"/>
						</td>
						<td>
							<label style="width:35px; text-align: right" >污染物：</label>
							<input type="checkbox" value="02" name="p02" id="p02" <c:if test="${pArray[1] != null}">checked="checked"</c:if>>二氧化硫</input>
							<input type="checkbox" value="01" name="p01" id="p01"<c:if test="${pArray[0] != null}">checked="checked"</c:if>>烟尘</input>
							<input type="checkbox" value="03" name="p03" id="p03"<c:if test="${pArray[2] != null}">checked="checked"</c:if>>氮氧化物</input>
							<input type="checkbox" value="060" name="p060" id="p060"<c:if test="${pArray[4] != null}">checked="checked"</c:if>>氨氮</input>
							<input type="checkbox" value="011" name="p011" id="p011"<c:if test="${pArray[3] != null}">checked="checked"</c:if>>化学需氧量</input>
						</td>
						<td>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">查询</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<input type="hidden" value="" id="enterpriseName" name="enterpriseName"/>
				<input type="hidden" value="1" id="monType" name="monType"/>
				</form>
			</div>
		</div>
		<div id="container_1" style="height:280px;margin:0 auto;"></div>
	</div>
	
	
	<div id="sjBox" class="unitBox" style="margin-top:5px; border:1px #B8D0D6 solid; overflow: hidden;">
		<div class="pageHeader">
			<div class="searchBar">
				<form id="sjform" action="">
					<table class="searchContent">
						<tr>
							<td>
								<label style="width:65px; text-align: right" >污染源名称：</label>
								<input class="textInput" suggesturl="demo/database/db_lookupSuggest.html" suggestfields="enterprise" name="enterprise" id="enterprise" size="50" value="${enterpriseName }" autocomplete="off"/>
							</td>
							<td>
								<label style="width:65px; text-align: right" >监控点类型：</label>
								<select id="mon" name="mon" onchange="monTypeChinge(this.value)">
									<option value="1" <c:if test="${monType == 1 }">selected = "selected"</c:if>>气监控点</option>
									<option value="2" <c:if test="${monType == 2 }">selected = "selected"</c:if>>水监控点</option>
								</select>
							</td>
							<td>
								<div class="buttonActive">
								<div class="buttonContent">
									<button type="button" onclick="sjcsyxlExport()">导出Excel</button>
								</div>
							</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="pageContent" id="adfadf">
		<table class="table" width="100%" layoutH="420" >
			<thead>
				<!--加判断显示不同的表头-->
				<tr>
					
					<th width="120" align="center">污染源名称</th>
					<th width="120" align="center">监控点名称</th>
					<th width="80" align="center">传输有效率</th>
					<c:if test="${monType == 1 }">
						<th width="80" align="center">TSP有效率</th>
						<th width="80" align="center">TSP传输率</th>
						<th width="80" align="center">SO2有效率</th>
						<th width="80" align="center">SO2传输率</th>
						<th width="80" align="center">NOX有效率</th>
						<th width="80" align="center">NOX传输率</th>
					</c:if>
					<c:if test="${monType == 2 }">
						<th width="80" align="center">COD有效率</th>
						<th width="80" align="center">COD传输率</th>
						<th width="80" align="center">氨氮有效率</th>
						<th width="80" align="center">氨氮传输率</th>
					</c:if>
				</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result }" var="result">
				<tr>
					<td>${result.ENTERPRISE_NAME }</td>
					<td>${result.MON_NAME }</td>
					<td>${result.CSYXL }%</td>
					<c:if test="${monType == 1 }">
						<c:if test="${pArray[0] != null}">
							<td>${result.TSP_YXL }%</td>
							<td>${result.TSP_CSL }%</td>
						</c:if>
						<c:if test="${pArray[0] == null}">
							<td>/</td>
							<td>/</td>
						</c:if>
						<c:if test="${pArray[1] != null}">
							<td>${result.SO2_YXL }%</td>
							<td>${result.SO2_CSL }%</td>
						</c:if>
						<c:if test="${pArray[1] == null}">
							<td>/</td>
							<td>/</td>
						</c:if>
						<c:if test="${pArray[2] != null}">
							<td>${result.NOX_YXL }%</td>
							<td>${result.NOX_CSL }%</td>
						</c:if>
						<c:if test="${pArray[2] == null}">
							<td>/</td>
							<td>/</td>
						</c:if>
					</c:if>
					<c:if test="${monType == 2 }">
						<c:if test="${pArray[3] != null}">
							<td>${result.COD_YXL }%</td>
							<td>${result.COD_CSL }%</td>
						</c:if>
						<c:if test="${pArray[3] == null}">
							<td>/</td>
							<td>/</td>
						</c:if>
						<c:if test="${pArray[4] != null}">
							<td>${result.NHN_YXL }%</td>
							<td>${result.NHN_CSL }%</td>
						</c:if>
						<c:if test="${pArray[4] == null}">
							<td>/</td>
							<td>/</td>
						</c:if>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
		<div class="panelBar">
			<div class="pages">
				<span>显示</span> <select class="combox" name="numPerPage"
					onchange="navTabPageBreak({numPerPage:this.value})">
					<option value="10"
						<c:if test="${page.pageSize == 10 }">selected="selected"</c:if>>10</option>
					<option value="30"
						<c:if test="${page.pageSize == 20 }">selected="selected"</c:if>>20</option>
					<option value="50"
						<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
					<option value="100"
						<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
					<option value="200"
						<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
				</select> <span>条，共${page.totalCount }条</span>
			</div>
			<div class="pagination" targetType="navTab"
				totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
				pageNumShown="5" currentPage="${page.currentPageNo }"></div>
		</div>
	</div>
	<input type="hidden" value="${selectType }" id="hidenSelectType"/>

</div>

<script type="text/javascript">
	changeSelect_sjcsyxl($("#hidenSelectType").val());
</script>

