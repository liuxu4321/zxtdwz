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
    $("#mn").val('${mn}');
	//
    gasDTypeChange();
	//
	qoryColVis();
	//
	// 20140709 zmzhao 设置隐藏域初始值
	var selectedItems = new Array(); 
	selectedItems.push('tsp');
	selectedItems.push('so2');
	selectedItems.push('nox');
	$('#filterColId').val(selectedItems);
    filterColVis();
	//
  
});

function onlineGasFormSubmit(){ 
	var gasQyId = $("#gasQyId").val();
    if(gasQyId==''){
    	alertMsg.info('请选择污染源后重新提交！');
    	return;
    }
    
    var mnGas = $("#mnGas").val();
    if(mnGas==''){
        alertMsg.info('请选择监控点后重新提交！');
        return;
    }
    $("#onlineGasForm").submit();
} 

/** 
* 处理Ajax请求 监控点
* @param data 
*/ 
function ajaxRequestGasJkd(gasQyId){ 
	ajaxTodo("${context }/statistics/onlineData/getJkd?qyId="+gasQyId+"&type=gas",ajaxRequestGasJkdBack);
} 

/** 
* 处理Ajax请求 back
* @param data 
*/ 
function ajaxRequestGasJkdBack(json){ 
	$("#mnGas").empty();
	for (var i = 0;i < json.length; i++)
    {
        var h="<option value='"+json[i]["MN"]+"'>"+json[i]["MON_NAME"]+"</option>";
        $("#mnGas").append(h);
    }
} 

/** 
* 数据类型 change
* @param data 
*/ 
function gasDTypeChange(){ 
	/* var gasDType = $("#gasDType").val();
	$("#day").hide();
	$("#month").hide();
	$("#quarter").hide();
	$("#year").hide();
	
	switch(gasDType)
	{
		case "day":
			$("#day").show();
		  break;
		case "month":
			$("#month").show();
		  break;
		case "quarter":
			$("#quarter").show();
			  break;
		case "year":
			$("#year").show();
			  break;
		default:
	} */
	//先给年下拉框赋内容
	$("#selectYear_m").empty();
	$("#selectYear_q").empty();
	$("#selectYear_y").empty();
	var y = new Date().getFullYear();
	for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
		document.getElementById("selectYear_m").options.add(new   Option(i+"年",i));
		document.getElementById("selectYear_q").options.add(new   Option(i+"年",i));
		document.getElementById("selectYear_y").options.add(new   Option(i+"年",i));
	}
	var selectYear_m1 = $('#selectYear_m1').val();
	var selectYear_q1 = $('#selectYear_q1').val();
	var selectYear_y1 = $('#selectYear_y1').val();
	
	if(selectYear_m1 != '' && selectYear_m1 != null){
		$("#selectYear_m").val(selectYear_m1);
	}
	if(selectYear_q1 != '' && selectYear_q1 != null){
		$("#selectYear_q").val(selectYear_q1);
	}
	if(selectYear_y1 != '' && selectYear_y1 != null){
		$("#selectYear_y").val(selectYear_y1);
	}
	
	var gasDType = $("#gasDType").val();
	if(gasDType == 'day'){
		$("#day").show();
		$("#month").hide();
		$("#quarter").hide();
		$("#year").hide();
	}
	if(gasDType == 'month'){
		$("#day").hide();
		$("#month").show();
		$("#quarter").hide();
		$("#year").hide();
	}
	if(gasDType == 'quarter'){
		$("#day").hide();
		$("#month").hide();
		$("#quarter").show();
		$("#year").hide();
	}
	if(gasDType == 'year'){
		$("#day").hide();
		$("#month").hide();
		$("#quarter").hide();
		$("#year").show();
	}
	
} 

/** 
* 筛选列
* @param data 
*/ 

function filterCol(){ 
	$('#filterCol').click();
}

/** 
* 筛选列 显示隐藏
* @param data 
*/ 

function filterColVis(){
	$('[name*="tsp"]').show();
	$('[name*="so2"]').show();
	$('[name*="nox"]').show();
    var filterColId = $('#filterColId').val(); 
    var array = new Array('tsp','so2','nox');
	//var _array = filterColId.split(",");
	//20140709 zmzhao 判断刷选列是否在数组中，如果在，则显示，不在隐藏
	for(var i=0;i<array.length;i++){
		if(filterColId.indexOf(array[i])==-1 ){
			$('[name*='+array[i]+']').hide();
		}
	}
}


/** 
* 季度 或 年  列 显示隐藏
* @param data 
*/ 

function qoryColVis(){
	if('quarter'=='${gasDType}'||'year'=='${gasDType}'){
	    
	    $("#nox3").attr("colspan",2);
	    $("#so23").attr("colspan",2);
	    $("#tsp3").attr("colspan",2);
	    
	    $("[name*='qory']").hide();
	}else{
	    
	    $("#nox3").attr("colspan",3);
	    $("#so23").attr("colspan",3);
	    $("#tsp3").attr("colspan",3);
	    
	    $("[name*='qory']").show();
	}
}

//导出Excel
function exportOnlineGas() {
    var entId = $('#gasQyId').val();//企业名
    var mn = $('#mnGas').val();//mn
    var gasDType = $('#gasDType').val();//类别
    var selectDay = $('#selectDay').val();//
    var selectYear_m = $('#selectYear_m').val();//
    var selectMonth = $('#selectMonth').val();//
    var selectYear_q = $('#selectYear_q').val();//
    var selectQuarter = $('#selectQuarter').val();//
    var selectYear_y = $('#selectYear_y').val();//
    var filterCol = $('#filterColId').val();//

    alertMsg.confirm('确定导出Excel?', {
            okCall : function() {
                $("#onlineGasExcel").attr(
                        "href",
                        "${context }/statistics/onlineData/showGasExcel?entId="+ entId + 
                        		"&mn=" + mn + 
                        		"&gasDType=" + gasDType + 
                        		"&selectDay=" + selectDay + 
                        		"&selectYear_m=" + selectYear_m + 
                        		"&selectMonth=" + selectMonth + 
                        		"&selectYear_q=" + selectYear_q + 
                        		"&selectQuarter=" + selectQuarter + 
                        		"&selectYear_y=" + selectYear_y + 
                        		"&filterCol=" + filterCol
                                );
            $("#onlineGasExcel").click();
        }
    });
    
}

</script>
<div class="pageHeader">
<a id="onlineGasExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
	<form id="onlineGasForm" onsubmit="return navTabSearch(this);" action="${context }/statistics/onlineData/getGasData" method="post">
		<div class="pageFormContent">
			<table class="searchContent" border="0">
				<tr height="20px">
					<td>
					<input style="display:none" class="required" id="filterColId" name="filterCol.id" value="${filterColId}" size="40" type="text" postField="keyword" suggestFields="id" lookupGroup="filterCol" />
                    <a style="display:none" id="filterCol" href="${context }/statistics/onlineData/filterCol/gas" lookupGroup="filterCol" width="400" height="200"><span>筛选列</span></a><!-- 筛选列 -->
					
						<label style="width: 90px; text-align: right">污染源：</label> 
						<input id="gasQyId" name="ent.entId" value="${gasQyId}" type="hidden" /> 
						<input class="required" id="gasQyName" value="${gasQyName}" readonly="readonly" name="ent.entName" size="40" type="text" postField="keyword" suggestFields="entId,entName" lookupGroup="ent" /> 
						<a class="btnLook" href="${context }/statistics/onlineData/ent/gas" lookupGroup="ent">污染源</a>
					</td>
					<td>
						<label style="width: 80px; text-align: right">监控点： </label> 
						<select name="mnGas" id="mnGas">
						  <c:forEach var="ac" items="${gasJkdList }">
                                <option value="${ac.mn }" <c:if test="${ac.mn==mnGas }">selected='selected'</c:if>>
                                ${ac.mon_name}
                                </option>
                           </c:forEach>
						</select>
					</td>
					<td>
						<label style="width: 90px; text-align: right"> 数据类型： </label> 
						<select name="gasDType" id="gasDType" onchange="gasDTypeChange();">
								<option value="day" <c:if test="${gasDType=='day'}">selected='selected'</c:if>>日报表</option>
								<option value="month" <c:if test="${gasDType=='month'}">selected='selected'</c:if>>月报表</option>
								<option value="quarter" <c:if test="${gasDType=='quarter'}">selected='selected'</c:if>>季报表</option>
								<option value="year" <c:if test="${gasDType=='year'}">selected='selected'</c:if>>年报表</option>
						</select>
					</td>
						<td id="day" style="">
							<label style="width: 80px; text-align: right">时间：</label>
							<input class="date textInput readOnly" type="text" maxdate="{%y}-%M-{%d-1}" id="selectDay" name="selectDay"  value="${selectDay }"/>
						</td>
						<td id="month"  style="display:none;">
							<label style="width: 80px; text-align: right">时间：</label>
							<select id="selectYear_m" name="selectYear_m">
							</select><input type="hidden" value="${selectYear_m1}" id="selectYear_m1"/>
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
							<label style="width: 80px; text-align: right" >时间：</label>
							<select id="selectYear_q" name="selectYear_q">
							</select><input type="hidden" value="${selectYear_q1}" id="selectYear_q1"/>
							<select id="selectQuarter" name="selectQuarter">
								<option value="1" <c:if test="${selectQuarter == '1' }">selected = "selected"</c:if>>一季度</option>
								<option value="2" <c:if test="${selectQuarter == '2' }">selected = "selected"</c:if>>二季度</option>
								<option value="3" <c:if test="${selectQuarter == '3' }">selected = "selected"</c:if>>三季度</option>
								<option value="4" <c:if test="${selectQuarter == '4' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						<td id="year"  style="display:none;">
							<label style="width: 80px; text-align: right">时间：</label>
							<select id="selectYear_y" name="selectYear_y">
							</select><input type="hidden" value="${selectYear_y1}" id="selectYear_y1"/>
						</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="onlineGasFormSubmit()">查询</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportOnlineGas();">导出Excel</button></div></div></li>
					<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="filterCol();">筛选列</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
	<table class="list"  style="width:98%;" layoutH="80" style="table-layout:fixed">
		<thead>
	 		<tr>
				<th width="7%" align="center" rowspan="3" style="vertical-align: middle;font-weight: normal;">时间</th>
				<th name="tsp" id="tsp3" width="21%" align="center" colspan="3" style="font-weight: normal;">烟尘</th>
				<th name="so2" id="so23" width="21%" align="center" colspan="3" style="font-weight: normal;">二氧化硫</th>
				<th name="nox" id="nox3" width="21%" align="center" colspan="3" style="font-weight: normal;">氮氧化物</th>
				
				<th width="7%" align="center" style="font-weight: normal;">流量</th>
				<th width="7%" align="center" name="qory" style="font-weight: normal;">氧含量</th>
				<th width="7%" align="center" name="qory" style="font-weight: normal;">温度</th>
				<th width="7%" align="center" name="qory" style="font-weight: normal;">湿度</th>
			</tr>
			<tr>
				<th  name="tsp" align="center" style="font-weight: normal;">实测浓度</th>
				<th  name="tspqory" align="center" style="font-weight: normal;">折算浓度</th>
				<th  name="tsp" align="center" style="font-weight: normal;">排放量</th>
				
				<th  name="so2"  align="center" style="font-weight: normal;">实测浓度</th>
				<th  name="so2qory"  align="center" style="font-weight: normal;">折算浓度</th>
				<th  name="so2"  align="center" style="font-weight: normal;">排放量</th>
				
				<th  name="nox" align="center" style="font-weight: normal;">实测浓度</th>
				<th  name="noxqory" align="center" style="font-weight: normal;">折算浓度</th>
				<th  name="nox" align="center" style="font-weight: normal;">排放量</th>
				
				<th  align="center" rowspan="2" style="vertical-align: middle;font-weight: normal;">立方米</th>
				<th  align="center" name="qory" rowspan="2" style="vertical-align: middle;font-weight: normal;">百分比</th>
				<th  align="center" name="qory" rowspan="2" style="vertical-align: middle;font-weight: normal;">摄氏度</th>
				<th  align="center" name="qory" rowspan="2" style="vertical-align: middle;font-weight: normal;">百分比</th>
			</tr>
			
			<tr>
				<th  name="tsp" align="center" style="font-weight: normal;">毫克/立方米</th>
				<th  name="tspqory" align="center" style="font-weight: normal;">毫克/立方米</th>
				<th  name="tsp" align="center" style="font-weight: normal;">千克</th>
				
				<th  name="so2"  align="center" style="font-weight: normal;">毫克/立方米</th>
				<th  name="so2qory"  align="center" style="font-weight: normal;">毫克/立方米</th>
				<th  name="so2"  align="center" style="font-weight: normal;">千克</th>
				
				<th  name="nox" align="center" style="font-weight: normal;">毫克/立方米</th>
				<th  name="noxqory"  align="center" style="font-weight: normal;">毫克/立方米</th>
				<th  name="nox" align="center" style="font-weight: normal;">千克</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page}" var="result">
				<tr>
					<td align="center">${result.SJ}</td>
					
					<td name="tsp" align="center">
						<c:choose>
					       <c:when test="${result.TSP_AVG==null}">
					              /
					       </c:when>
					       <c:otherwise>
					              <fmt:formatNumber value="${result.TSP_AVG }" pattern="#0.000"></fmt:formatNumber>
					       </c:otherwise>
					    </c:choose>
					</td>
					<td name="tspqory" align="center">
					   <c:choose>
                           <c:when test="${result.TSP_AVGZS==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.TSP_AVGZS }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
					</td>
					
					<td name="tsp" align="center">
					   <c:choose>
                           <c:when test="${result.TSP_COU==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.TSP_COU }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
					</td>
					
					<td name="so2"  align="center">
                       <c:choose>
                           <c:when test="${result.SO2_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.SO2_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
                    
					<td name="so2qory"  align="center">
					   <c:choose>
                           <c:when test="${result.SO2_AVGZS==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.SO2_AVGZS }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					<td name="so2"  align="center">
					   <c:choose>
                           <c:when test="${result.SO2_COU==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.SO2_COU }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
                    
					<td name="nox" align="center">
					   <c:choose>
                           <c:when test="${result.NOX_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.NOX_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					<td name="noxqory" align="center">
					   <c:choose>
                           <c:when test="${result.NOX_AVGZS==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.NOX_AVGZS }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					<td name="nox" align="center">
					   <c:choose>
                           <c:when test="${result.NOX_COU==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.NOX_COU }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					
					<td align="center">
					    <c:choose>
                           <c:when test="${result.POLE_FLOW==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.POLE_FLOW }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					<td align="center" name="qory">
					   <c:choose>
                           <c:when test="${result.O2_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.O2_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					<td align="center" name="qory">
					    <c:choose>
                           <c:when test="${result.TEMP_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.TEMP_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
					<td align="center" name="qory">
					   <c:choose>
                           <c:when test="${result.HUMIDITY_AVG==null}">
                                  /
                           </c:when>
                           <c:otherwise>
                                  <fmt:formatNumber value="${result.HUMIDITY_AVG }" pattern="#0.000"></fmt:formatNumber>
                           </c:otherwise>
                        </c:choose>
                    </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
