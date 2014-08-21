<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--

//根据选中的监控点和污染物查询累计超标详细信息
function jkdWrwClick1(){
	var enterpriseId = $('#enterpriseIdWczs').val();//企业ID
	var dataFlg = $('#dataFlgWczs').val();// 污染物类型【1:废气;2:废水】 20140703 zmhao
	var monId = $("[name='sel_mon_id_cbtj_wczs']").val();//监控点ID
	var pollutId = $("[name='sel_pollut_id_cbtj_wczs']").val();//污染物ID
	//alert(pollutId);
	var dateStartWczs = $('#dateStartWczs').val();//开始时间
	var dateEndWczs = $('#dateEndWczs').val();//结束时间  
	$('#jkdSelect_wczs').attr('href','${context }/alarmMonitor/cbbj/wczs?enterpriseId='+enterpriseId+'&dataFlg='+dataFlg+'&WczsFlag=1'+'&mon_id='+monId+'&pollut_id='+pollutId+'&dateStart='+dateStartWczs+'&dateEnd='+dateEndWczs);
	$('#jkdSelect_wczs').click();
}

//导出Excel
function exportWczs() {
	var enterpriseIdWczs = $('#enterpriseIdWczs').val();//企业ID 
	var dataFlgWczs = $('#dataFlgWczs').val();//污染物类型【1:废气;2:废水】 20140703 zmhao
	var selPollutId = $('#sel_pollut_id_cbtj_wczs').val();//污染物ID
	var selMonId = $('#sel_mon_id_cbtj_wczs').val();//监控点ID
	var excelWczsDateStart = $('#dateStartWczs').val();//开始时间
	var excelWczsDateEnd = $('#dateEndWczs').val();//结束时间 
	//var WczsFlag = $('#WczsFlg').val();//结束时间 

	alertMsg.confirm('确定导出Excel?', {
		okCall: function(){
			$('#wczsExcel').attr("href","${context }/alarmMonitor/cbbj/wczs/showLjcbExcel?enterpriseIdWczs="+
					enterpriseIdWczs +"&dataFlgWczs="+dataFlgWczs +"&excelWczsDateStart="+excelWczsDateStart+"&excelWczsDateEnd="+
					excelWczsDateEnd+"&selPollutId="+selPollutId+"&selMonId="+
					selMonId+"&WczsFlag=1");
			$('#wczsExcel').click();
		}
	});
}

function cbcz(){
	var enterpriseIdWczs = $('#enterpriseIdWczs').val();
	var enterpriseNameWczs = $('#enterpriseNameWczs').val();
	var r = $('input[name="r"]');
	var str = "";
	var c = 0;
	for(var i = 0 ; i < r.length ; i++){
		if(r[i].checked){
			str += r[i].value + ";";
			c++;
		}
	}
	if(c == 0){
		alertMsg.info("没选中任何数据");
		return false;
	}else{
		alertMsg.confirm('确定对选中的' + c + '条记录进行处置?', {
			okCall: function(){
				/*
					enterpriseId 企业id
					enterpriseName 企业名称
					c 处理条数
					dFlag 处置类型  超标处置 or 异常处置
				*/
				var url = "${context }/alarmMonitor/wczs/cbbjcz?enterpriseId="+
				enterpriseIdWczs+"&enterpriseName="+enterpriseNameWczs+"&c="+c+"&dFlag="+1;
				
				$("#str").attr("value" , str);
				$('#overDispose').attr("href",url);
				$('#overDispose').click();
			}
		});
	}
}
//-->
</script>


<input type="hidden" name="enterpriseId" id="enterpriseId"/>
<input type="hidden" name="enterpriseName" id="enterpriseName"/>
<input type="hidden" name="str" id="str"/>
<input type="hidden" name="c" id="c"/>
<input type="hidden" name="dFlag" id="dFlag"/>


<a id="jkdSelect_wczs" target="navTab" style="display:none;" title="未处置小时数"  rel="cbbj_wczs_detail"></a>
<a id="wczsExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<a id="overDispose" style="display:none" title="报警处置单" width="600" height="450" target="dialog" ></a><!-- 处置-->
<div class="pageHeader">
	<div class="pageFormContent" >
		<form onsubmit="return divSearch(this, 'cbbj_box');" action="${context }/alarmMonitor/cbbj/wczs" method="post">
		<input type="hidden" id="enterpriseIdWczs" value="${enterprise_id}"/>
		<input type="hidden" id="dataFlgWczs" value="${data_Flg}"/> <!-- 20170703 zmzhao 隐藏域dataFlg  WczsFlag-->  
		<input type="hidden" id="WczsFlg" value="${Wczs_Flag}"/> <!-- 20170703 zmzhao 隐藏域dataFlg  WczsFlag-->  
		<input type="hidden" id="enterpriseNameWczs" value="${enterprise_name}"/>
		<input type="hidden" id="dateStartWczs" value="${ dateStartWczs}"/>
		<input type="hidden" id="dateEndWczs" value="${ dateEndWczs}"/>
			<table class="searchContent">
				<tr height="20px">
					<td>
						<label style="width:240px; text-align: right;" >企业名称：${enterprise_name }</label>
					</td>
					<td>
						<label style="width:150px; text-align: right;">污染物名称：</label>
					</td>
					<td>
						<select name="sel_pollut_id_cbtj_wczs" id="sel_pollut_id_cbtj_wczs" onchange="jkdWrwClick1();">
							<option></option>
							<c:forEach var="pollutant" items="${pollutMap }">
								<option value="${pollutant.key }" <c:if test="${pollutant.key==pollut_id }">selected='selected'</c:if>>${pollutant.value }</option>
							</c:forEach>
						</select>	
					</td>
					<td>
						<label style="width:150px; text-align: right;">监控点名称：</label>
					</td>
					<td>
						<select name="sel_mon_id_cbtj_wczs" id="sel_mon_id_cbtj_wczs" onchange="jkdWrwClick1();">
							<option></option>
							<c:forEach var="mn" items="${ monNameSelectMap }">
								<option value="${mn.key }" <c:if test="${mn.key==mon_id }">selected='selected'</c:if>>${mn.value }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="searchBar" style = "display:none">
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportWczs();">导出Excel</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="cbcz();">超标处置</button></div></div></a></li>
			</ul>
		</div>
	</div>
</div>
	<table class="table" style="width:100%;" layoutH="122">
		<thead>
			<tr>
				<th width="16%" align="center" style="font-weight:normal;">监控点名称</th>
				<th width="16%" align="center" style="font-weight:normal;">污染物</th>
				<th width="16%" align="center" style="font-weight:normal;">采集时间</th>
				<th width="16%" align="center" style="font-weight:normal;">超标值</th>
				<th width="16%" align="center" style="font-weight:normal;">标准值</th>
				<th width="16%" align="center" style="font-weight:normal;">超标倍数</th>
				<!--  <th width="16%" align="center" style="font-weight:normal;"><input class="checkboxCtrl" type="checkbox" group="r"></th>-->
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${cbbjDetailList != null && fn:length(cbbjDetailList) != 0}">
					<c:forEach var="result" items="${cbbjDetailList }">
						<tr>
							<td align="center">${result.mon_name }</td>
							<td align="center">${result.chinese_name }</td>
							<td align="center">${result.data_time }</td>
							<td align="center">${result.cbz }</td>
							<td align="center">${result.standard_value }</td>
							<td align="center">${result.cbbs }</td>
					<!--  	<td align="center">
								<c:choose>
									<c:when test="${result.OVER_DISPOSE == '' || result.OVER_DISPOSE == null }">
										<input type="checkbox" name="r" value="${result.mon_name },${result.mn },${result.data_time },${result.chinese_name }">
									</c:when>
									<c:otherwise>   
										<a href="${context }/alarmMonitor/ljcb/ckczd/${result.OVER_DISPOSE}" target="dialog" width="600" height="400">已处置</a>
									</c:otherwise>
								</c:choose>
							</td>
							-->
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" colspan="6">
							<h1>没有数据。</h1>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
