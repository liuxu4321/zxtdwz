<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
.table_xxxx tr td {
	background-color: white;
}

.table_xxxx {
	width: 100%;
	border: 1px solid #d0d0d0;
	border-collapse: collapse;
	padding: 0;
	margin: 0;
}

.table_xxxx td {
	border: 1px solid #d0d0d0;
	height: 23px;
	font-size: 12px;
	padding: 1px 2px;
	padding-left: 5px;
}
</style>
<script type="text/javascript">
	function changeEw(ewId){
		var ewSelected = new Array();
		$("input[name='ews']:checked").each(function(){
			ewSelected.push($(this).val());
		});
		$("#ewChecked").val(ewId);
		$("#ewSecected").val(ewSelected);
		$("#ewSearch").submit();
	}
	
	function dismantleEquip(){
		var $equipId = $("tr[target='equipId'].selected").attr("rel");
		if($equipId == null || $equipId == ""){
			alertMsg.info("请选择要拆除的在线设备");
		}else{
			$(function(){ajaxTodo("${context }/businessPlatfrom/jkd/fsjkd/szsjcjy/eqRelevaneMonWater/delete?equipId="+$equipId,reflshThisnavTab);});
		}
	}
	
	function reflshThisnavTab(){
		$("#backWaterSetEqS").click();
	}
	//安装
	function onclickWaterJkdAz(){
		var equipId = $("tr[target='equipId'].selected").attr("rel");
		if (equipId == null || equipId == "") {
			alertMsg.info('请选择要安装的在线设备！');
		} else {
			$('#waterJkdAz').click();
		}
	}
</script>
<form id="pagerForm"
	action="${context }/businessPlatfrom/jkd/fsjkd/szzxjcyq/${monId }"
	method="post">
	<input type="hidden" name="ewChecked" value="${ewChecked }" /> <input
		type="hidden" name="ewSecected" value="${ewSecected }" />
</form>
<div class="pageContent" layoutH="10">
	<input type="hidden" name="isFlag" value="${isFlag }" /> <input
		type="hidden" name="monId" value="${monId }" /> <input type="hidden"
		name="enterpriseId" value="${enterpriseId }" />
	<!-- <div class="panel collapse">
		<h1>废水在线监测仪器基本信息</h1> -->
		<div class="pageHeader" style="display: none;">
			<div class="pageFormContent">
				<form id="ewSearch" onsubmit="return navTabSearch(this);"
					action="${context }/businessPlatfrom/jkd/fsjkd/szzxjcyq/${monId }"
					method="post">
					<input type="hidden" id="ewChecked" name="ewChecked"
						value="${ewChecked }" /> <input type="hidden" id="ewSecected"
						name="ewSecected" value="${ewSecected }" />
				</form>
			</div>
		</div>
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<%-- <li><a class="edit" target="selectedTodo" rel="ews" postType="string" href="${context }/businessPlatfrom/jkd/fsjkd/szzxjcyq/change/${monId }?&navTabId=fsjkd_${isFlag }&mwChecked=${monId }&callbackType=closeCurrent" title="确定要更换在线监测设备?"><span>确定</span></a></li> --%>
					<!--  <li><a class="add" href="${context }/businessPlatfrom/jkd/zxjcyqsz/add/dialog?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="dialog" rel="fsjkd_zxjcy_${isFlag }" title="添加监测仪器" width="850" height="725"><span>添加</span></a></li>-->
					<li><a class="add" href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/add?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="navTab" rel="zxjcyqsz_add" title="添加监测仪器" width="850" height="725"><span>添加</span></a></li>
					<li><a class="edit" href="javaScript:onclickWaterJkdAz();"
					title="请选择在线检测仪器！"><span>安装</span></a></li>
					<li><a class="delete" href="javaScript:dismantleEquip();"
						title="确定拆除？"><span>拆除</span></a></li>
					<li style="display: none;"><a id="backWaterSetEqS"
						style="display: none;" target="navTab"
						href="${context }/businessPlatfrom/jkd/fsjkd/szzxjcyq/${monId}"
						rel="fsjkd_zxjcy_${isFlag }"><span>设置在线监测仪</span></a></li>
					<li style="display:none;"><a target="dialog" rel="kd_jky_szwrw" style="display:none;" id="waterJkdAz"
						href="${context }/businessPlatfrom/jkd/fsjkd/szsjcjy/eqRelevaneMonWater/${monId }/{equipId}?isFlag=${isFlag }" title="请选择要监控的污染物及标准"></a></li>
				</ul>
			</div>
			<table class="list" width="100%">
				<thead>
					<tr>
						<!-- <th width="5%" align="center" style="font-weight:normal;">
							<input type="checkbox" group="ews" class="checkboxCtrl">
						</th> -->
						<th width="20%" align="center" style="font-weight: normal;">在线监测仪器名称</th>
						<th width="20%" align="center" style="font-weight: normal;">在线监测仪器型号</th>
						<th width="20%" align="center" style="font-weight: normal;">运维单位</th>
						
						<th width="20%" align="center" style="font-weight: normal;">所属数采仪</th>
						<!-- <th width="20%" align="center" style="font-weight: normal;">监测污染物</th> -->
						<!-- <th width="10%" align="center" style="font-weight:normal;">状态</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="eqwList" items="${eqWaterList }">
						<tr
							<%-- <c:if test="${eqwList.equipId==ewChecked }">class='selected'</c:if> --%>
							rel="${eqwList.equipId }" target="equipId"
							onclick="changeEw(${eqwList.equipId });">
							<td align="center">${eqwList.equipName }</td>
							<td align="center">${eqwList.equipType }</td>
							<td align="center">${eqwList.MAINTENNAME }</td>
							
							<td align="center">${eqwList.MN }</td>
							<%-- <td align="center">${eqwList.POLLUTANTNAME }</td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<!-- </div> -->
	</div>
</div>
<%-- <td align="center">
								<input type="checkbox" name="ews" value="${eqwList.equipId }" <c:if test="${ewSelectedMap[eqwList.equipId]==true }">checked='checked'</c:if> />
							</td> --%>
<%--<c:forEach var="eqws" items="${addedEqWaters }">
					 	<tr
							<c:if test="${eqws.equipId==ewChecked }">class='selected'</c:if>
							rel="${eqws.equipId }" target="equipId"
							onclick="changeEw(${eqws.equipId });">
							<td align="center">
								<input type="checkbox" name="ews" value="${eqws.equipId }" <c:if test="${ewSelectedMap[eqws.equipId]==true }">checked='checked'</c:if> />
							</td>
							<td align="center">${eqws.equipName }</td>
							<td align="center">${eqws.equipType }</td>
							<td align="center">${eqws.maintenance.maintenName }</td>
							<td align="center">${eqws.dataGather.mn }</td>
							<td align="center">${eqws.blowoffStandard.pollutant.pollutantName
								}</td>
							<td align="center">
								<c:choose>
									<c:when test="${eqws.isStop==1 }">在用</c:when>
									<c:when test="${eqws.isStop==0 }">停用</c:when>
								</c:choose>
							</td>
						</tr> 
					</c:forEach>--%>
<%-- <div class="panel close collapse">
		<h1>详细信息</h1>
		<div>
			<table class="table_xxxx">
				<col width="15%" align="right" />
				<col width="35%" align="center" />
				<col width="15%" align="right" />
				<col width="35%" align="center" />
				<tr>
					<td>所属企业：</td>
					<td>${curEW.enterprise.enterpriseName }</td>
					<td>是否启用：</td>
					<td><c:if test="${curEW.isStop==1 }">启用</c:if> <c:if
							test="${curEW.isStop==0 }">停用</c:if></td>
				</tr>
				<tr>
					<td>设备名称：</td>
					<td>${curEW.equipName }</td>
					<td>设备型号：</td>
					<td>${curEW.equipType }</td>
				</tr>
				<tr>
					<td>所属数采仪：</td>
					<td>${curEW.dataGather.mn }</td>
					<td>监控污染物：</td>
					<td>${curEW.blowoffStandard.pollutant.pollutantName }</td>
				</tr>
				<tr>
					<td>最小量程：</td>
					<td>${curEW.minValue }</td>
					<td>最大量程：</td>
					<td>${curEW.maxValue }</td>
				</tr>
				<tr>
					<td>运维单位：</td>
					<td>
						${curEW.maintenance.maintenName }
					</td>
					<td>生产厂商：</td>
					<td>
						${curEW.vendor.vendorName }
					</td>
				</tr>
				<tr>
					<td>代理商：</td>
					<td>${curEW.agentName }</td>
					<td>设备出厂编号：</td>
					<td>${curEW.equipNo }</td>
				</tr>
				<tr>
					<td>启用日期：</td>
					<td><fmt:formatDate value="${curEW.startDate }"
							pattern="yyyy-MM-dd" /></td>
					<td>是否安装：</td>
					<td><c:if test="${curEW.isSet==1 }">是</c:if> <c:if
							test="${curEW.isSet==0 }">否</c:if></td>
				</tr>
				<tr>
					<td>安装位置：</td>
					<td>${curEW.setLoc }</td>
					<td>安装时间：</td>
					<td><fmt:formatDate value="${curEW.setDate }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>验收状态：</td>
					<td><c:if test="${curEW.checkStatus==0 }">未验收</c:if> <c:if
							test="${curEW.checkStatus==1 }">通过</c:if> <c:if
							test="${curEW.checkStatus==2 }">未通过</c:if></td>
					<td>验收单位：</td>
					<td>${curEW.environId }</td>
				</tr>
				<tr>
					<td>验收人：</td>
					<td>${curEW.checkMan }</td>
					<td>验收时间：</td>
					<td>${curEW.checkDate }</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td colspan="3">${curEW.remark }</td>
				</tr>
			</table>
		</div>
	</div> --%>
<%-- <div class="panel close collapse">
		<h1>备案登记信息</h1>
		<div>
			<table class="table_xxxx">
				<col style="width: 15%; text-align: right;" />
				<col style="width: 35%; text-align: center;" />
				<col style="width: 15%; text-align: right;" />
				<col style="width: 35%; text-align: center;" />
				<tr>
					<td>适用性检测报告名称：</td>
					<td colspan="3">${curEW.reportName }</td>
				</tr>
				<tr>
					<td>测量项目：</td>
					<td>${curEW.measureItem }</td>
					<td>测试方法：</td>
					<td>${curEW.measureWay }</td>
				</tr>
				<tr>
					<td>检出限：</td>
					<td>${curEW.lod }</td>
					<td>试剂名称：</td>
					<td>${curEW.reagentName }</td>
				</tr>
				<tr>
					<td>试剂浓度：</td>
					<td>${curEW.reagentDensity }</td>
					<td>试剂有效期：</td>
					<td>${curEW.reagentEndtime }</td>
				</tr>
				<tr>
					<td>加热消解温度：</td>
					<td>${curEW.clearTemp }</td>
					<td>加热消解时间：</td>
					<td>${curEW.clearDate }</td>
				</tr>
				<tr>
					<td>标准曲线参数：</td>
					<td>${curEW.standardParam }</td>
					<td>转换系数：</td>
					<td>${curEW.converFactor }</td>
				</tr>
			</table>
		</div>
	</div> --%>
