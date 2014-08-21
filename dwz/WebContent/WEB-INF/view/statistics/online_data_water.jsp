<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
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

$(document).ready(function(){
	//
    $("#mnWater").val('${mnWater}');
	//
    waterDTypeChange();
	//
	// 20140709 zmzhao 设置隐藏域初始值
	var selectedItems = new Array(); 
	selectedItems.push('cod');
	selectedItems.push('hnh');
	$('#filterColIdWater').val(selectedItems);
    filterColWaterVis();
});

function onlineWaterFormSubmit(){ 
	var gasQyId = $("#waterQyId").val();
    if(gasQyId==''){
        alertMsg.info('请选择污染源后重新提交！');
        return;
    }
    var nmWater = $("#nmWater").val();
    if(nmWater==''){
        alertMsg.info('请选择监控点后重新提交！');
        return;
    }
	$("#onlineWaterForm").submit();
} 


/** 
* 处理Ajax请求 监控点
* @param data 
*/ 
function ajaxRequestWaterJkd(waterQyId){ 
	ajaxTodo("${context }/statistics/onlineData/getJkd?qyId="+waterQyId+"&type=water",ajaxRequestWaterJkdBack);
} 

/** 
* 处理Ajax请求 back
* @param data 
*/ 
function ajaxRequestWaterJkdBack(json){ 
	$("#nmWater").empty();
	for (var i = 0;i < json.length; i++)
    {
        var h="<option value='"+json[i]["MN"]+"'>"+json[i]["MON_NAME"]+"</option>";
        $("#nmWater").append(h);
    }
} 

/** 
* 数据类型 change
* @param data 
*/ 
function waterDTypeChange(){ 
	/* var waterDType = $("#waterDType").val();
	$("#dayWater").hide();
	$("#monthWater").hide();
	$("#quarterWater").hide();
	$("#yearWater").hide();
	
	switch(waterDType)
	{
		case "day":
			$("#dayWater").show();
		  break;
		case "month":
			$("#monthWater").show();
		  break;
		case "quarter":
			$("#quarterWater").show();
			  break;
		case "year":
			$("#yearWater").show();
			  break;
		default:
	} */
	
	//先给年下拉框赋内容
	$("#selectYear_mW").empty();
	$("#selectYear_qW").empty();
	$("#selectYear_yW").empty();
	var y = new Date().getFullYear();
	for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
		document.getElementById("selectYear_mW").options.add(new   Option(i+"年",i));
		document.getElementById("selectYear_qW").options.add(new   Option(i+"年",i));
		document.getElementById("selectYear_yW").options.add(new   Option(i+"年",i));
	}
	var selectYear_m2 = $('#selectYear_m2').val();
	var selectYear_q2 = $('#selectYear_q2').val();
	var selectYear_y2 = $('#selectYear_y2').val();
	
	if(selectYear_m2 != '' && selectYear_m2 != null){
		$("#selectYear_mW").val(selectYear_m2);
	}
	if(selectYear_q2 != '' && selectYear_q2 != null){
		$("#selectYear_qW").val(selectYear_q2);
	}
	if(selectYear_y2 != '' && selectYear_y2 != null){
		$("#selectYear_yW").val(selectYear_y2);
	}
	
	var waterDType = $("#waterDType").val();
	if(waterDType == 'day'){
		$("#dayWater").show();
		$("#monthWater").hide();
		$("#quarterWater").hide();
		$("#yearWater").hide();
	}
	if(waterDType == 'month'){
		$("#dayWater").hide();
		$("#monthWater").show();
		$("#quarterWater").hide();
		$("#yearWater").hide();
	}
	if(waterDType == 'quarter'){
		$("#dayWater").hide();
		$("#monthWater").hide();
		$("#quarterWater").show();
		$("#yearWater").hide();
	}
	if(waterDType == 'year'){
		$("#dayWater").hide();
		$("#monthWater").hide();
		$("#quarterWater").hide();
		$("#yearWater").show();
	}
} 

/** 
* 筛选列
* @param data 
*/ 

function filterWaterCol(){ 
	$('#filterColWater').click();
}

/** 
* 筛选列 显示隐藏
* @param data 
*/ 

function filterColWaterVis(){
	$('[name="hnh"]').show();
	$('[name="cod"]').show();
    var filterColId = $('#filterColIdWater').val(); 
	//var _array = filterColId.split(",");
	var array = new Array('cod','hnh');
	/* for(var i=0;i<_array.length;i++){
		if(_array[i]!=''){
			$('[name='+_array[i]+']').hide();
		}
	} */
	//20140709 zmzhao判断刷选列是否在数组中，如果在，则显示，不在隐藏
	for(var i=0;i<array.length;i++){
		if(filterColId.indexOf(array[i])==-1 ){
			$('[name*='+array[i]+']').hide();
		}
	}
}

//导出Excel
function exportOnlineWater() {
    var entId = $('#waterQyId').val();//企业名
    var nmWater = $('#nmWater').val();//mn
    var waterDType = $('#waterDType').val();//类别
    var selectDay = $('#selectDayW').val();//
    var selectYear_m = $('#selectYear_mW').val();//
    var selectMonth = $('#selectMonthW').val();//
    var selectYear_q = $('#selectYear_qW').val();//
    var selectQuarter = $('#selectQuarterW').val();//
    var selectYear_y = $('#selectYear_yW').val();//
    var filterCol = $('#filterColIdWater').val();//

    alertMsg.confirm('确定导出Excel?', {
            okCall : function() {
                $("#onlineWaterExcel").attr(
                        "href",
                        "${context }/statistics/onlineData/showWaterExcel?entId="+ entId + 
                        		"&nmWater=" + nmWater + 
                        		"&waterDType=" + waterDType + 
                        		"&selectDay=" + selectDay + 
                        		"&selectYear_m=" + selectYear_m + 
                        		"&selectMonth=" + selectMonth + 
                        		"&selectYear_q=" + selectYear_q + 
                        		"&selectQuarter=" + selectQuarter + 
                        		"&selectYear_y=" + selectYear_y + 
                        		"&filterColWater=" + filterCol
                                );
            $("#onlineWaterExcel").click();
        }
    });
    
}

</script>
<div class="pageHeader">
<a id="onlineWaterExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
	<form id="onlineWaterForm" onsubmit="return navTabSearch(this);" action="${context }/statistics/onlineData/getWaterData" method="post">
		<div class="pageFormContent">
			<table class="searchContent" border="0">
				<tr height="20px">
					<td>
					<input style="display:none" class="required" id="filterColIdWater" name="filterColWater.id" value="${filterColId}" size="40" type="text" postField="keyword" suggestFields="id" lookupGroup="filterColWater" />
                    <a style="display:none" id="filterColWater" href="${context }/statistics/onlineData/filterCol/water" lookupGroup="filterColWater" width="400" height="200"><span>筛选列</span></a><!-- 筛选列 -->
					
						<label style="width: 90px; text-align: right">污染源：</label> 
						<input id="waterQyId" name="went.wentId" value="${waterQyId}" type="hidden" /> 
						<input class="required" id="waterQyName" readonly="readonly" value="${waterQyName}" name="went.wentName" size="40" type="text" postField="keyword" suggestFields="wentId,wentName" lookupGroup="went" /> 
						<a class="btnLook" href="${context }/statistics/onlineData/ent/water" lookupGroup="went">污染源</a>
					</td>
					<td>
						<label style="width: 80px; text-align: right">监控点： </label> 
						<select name="nmWater" id="nmWater">
						  <c:forEach var="ac" items="${waterJkdList }">
                                <option value="${ac.mn}" <c:if test="${ac.mn==mn }">selected='selected'</c:if>>
                                ${ac.mon_name}
                                </option>
                           </c:forEach>
						</select>
					</td>
					<td>
						<label style="width: 90px; text-align: right"> 数据类型： </label> 
						<select name="waterDType" id="waterDType" onchange="waterDTypeChange();">
								<option value="day" <c:if test="${waterDType=='day'}">selected='selected'</c:if>>日报表</option>
								<option value="month" <c:if test="${waterDType=='month'}">selected='selected'</c:if>>月报表</option>
								<option value="quarter" <c:if test="${waterDType=='quarter'}">selected='selected'</c:if>>季报表</option>
								<option value="year" <c:if test="${waterDType=='year'}">selected='selected'</c:if>>年报表</option>
						</select>
					</td>
						<td id="dayWater" style="">
							<label style="width: 80px; text-align: right">时间：</label>
							<input class="date textInput readOnly" type="text" maxdate="{%y}-%M-{%d-1}" id="selectDayW" name="selectDay" value="${selectDay }"/>
						</td>
						<td id="monthWater"  style="display:none;">
							<label style="width: 80px; text-align: right">时间：</label>
							<select id="selectYear_mW" name="selectYear_m">
							</select><input type="hidden" value="${selectYear_m2}" id="selectYear_m2"/>
							<select id="selectMonthW" name="selectMonth">
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
						<td id="quarterWater"  style="display:none;">
							<label style="width: 80px; text-align: right" >时间：</label>
							<select id="selectYear_qW" name="selectYear_q">
							</select><input type="hidden" value="${selectYear_q2}" id="selectYear_q2"/>
							<select id="selectQuarterW" name="selectQuarter">
								<option value="1" <c:if test="${selectQuarter == '1' }">selected = "selected"</c:if>>一季度</option>
								<option value="2" <c:if test="${selectQuarter == '2' }">selected = "selected"</c:if>>二季度</option>
								<option value="3" <c:if test="${selectQuarter == '3' }">selected = "selected"</c:if>>三季度</option>
								<option value="4" <c:if test="${selectQuarter == '4' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						<td id="yearWater"  style="display:none;">
							<label style="width: 80px; text-align: right">时间：</label>
							<select id="selectYear_yW" name="selectYear_y">
							</select><input type="hidden" value="${selectYear_y2}" id="selectYear_y2"/>
						</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="onlineWaterFormSubmit();">查询</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportOnlineWater();">导出Excel</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="filterWaterCol();">筛选列</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
	<table class="list"  style="width:98%;" layoutH="80" style="table-layout:fixed;">
		<thead>
	 		<tr>
				<th width="7%" align="center" rowspan="2" style="vertical-align: middle;font-weight: normal;" >时间</th>
				<th name="cod" width="21%" align="center" colspan="2" style="font-weight: normal;">化学需氧量</th>
				<th name="hnh" width="21%" align="center" colspan="2" style="font-weight: normal;">氨氮</th>
				<th width="7%" align="center" rowspan="2"  style="vertical-align: middle;font-weight: normal;">流量(吨)</th>
			</tr>
			<tr>
				<th  name="cod" align="center" style="font-weight: normal;">浓度(毫克/升)</th>
				<th  name="cod" align="center" style="font-weight: normal;">排放量(千克)</th>
				
				<th  name="hnh" align="center" style="font-weight: normal;">浓度(毫克/升)</th>
                <th  name="hnh" align="center" style="font-weight: normal;">排放量(千克)</th>
				
			</tr>
			
		</thead>
		<tbody>
			<c:forEach items="${page}" var="result">
				<tr>
					<td align="center">${result.SJ}</td>
					
					<td name="cod" align="center">
						<c:choose>
					       <c:when test="${result.COD_AVG==null}">
					              /
					       </c:when>
					       <c:otherwise>
					              <fmt:formatNumber value="${result.COD_AVG }" pattern="#0.000"></fmt:formatNumber>
					       </c:otherwise>
					    </c:choose>
					</td>
					<td name="cod" align="center">
					   <c:choose>
                           <c:when test="${result.COD_COU==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.COD_COU }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
					</td>
					
					<td name="hnh" align="center">
					   <c:choose>
                           <c:when test="${result.NHN_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.NHN_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
					</td>
					
					<td name="hnh"  align="center">
                       <c:choose>
                           <c:when test="${result.NHN_COU==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.NHN_COU }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
                    
					<td align="center">
					   <c:choose>
                           <c:when test="${result.WATER_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.WATER_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
                    
				</tr>
			</c:forEach>
		</tbody>
	</table>
