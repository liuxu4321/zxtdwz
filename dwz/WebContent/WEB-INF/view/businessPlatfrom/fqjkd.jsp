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
	/***区分企业类型****/
	$(function() {
		var $flag = "${isFlag }";
		var $obj = $(".navTab-tab li");
		//获取当前打开的tab 对象
		var $lengthT = $obj.length;
		//当前打开的tabId
		var $closeTabId;
		//获取当前选中的tabId
		var $thisNavTbId = $(".navTab-tab li[class*='selected']").attr("tabid");
		//截取当前打开的tabId的区分
		var oldFlag;
		for ( var i = 0; i < $lengthT; i++) {
			//获取下一条
			$closeTabId = $obj.attr("tabid");
			$obj = $obj.next();
			if ($closeTabId == $thisNavTbId || $closeTabId == "main") {
				continue;
			} else {
				oldFlag = $closeTabId.substring($closeTabId.length - 1);
				//flag区分变化
				if ($flag != oldFlag) {
					//关闭其他页面
					navTab.closeTab($closeTabId);
				}
			}
		}
	});
</script>
<script type="text/javascript">
	$(function() {
		var $hidEnterpriseId = "${enterpriseId }";
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
		}
	});
</script>
<script type="text/javascript">
	$("input[name='forMgId']").change(function() {
		$("#mgChecked").val($("input[name='forMgId']:checked").val());
		$("#monGasSearch").submit();
	});
	function szwrw_onclick() {
		var $monId = $("tr[name='monGasTr'].selected").attr("rel");
		if ($monId != null && $monId != "") {
			var $outfallGasId = $("td[name='td_" + $monId + "_outfallGasId']")
					.html();
			if ($outfallGasId == null || $outfallGasId == "") {
				alertMsg.info('请先将此监控点关联排放口！');
				return;
			} else {
				$("#szwrwJcdGas").attr("href" , "${context }/businessPlatfrom/gyqy/fqpfkSzwrw/" + $outfallGasId);
				$("#szwrwJcdGas").click();
			}
		} else {
			alertMsg.info('请先选中一个监控点！');
			return;
		}
	}

	function gasSetEq() {
		var $monId = $("tr[name='monGasTr'].selected").attr("rel");
		if ($monId != null && $monId != "") {
			var $outfallGasId = $("td[name='td_" + $monId + "_outfallGasId']")
					.html();
			var $dateGatherGasId = $("td[name='td_" + $monId + "_dateGatherGasId']")
			.html();
			if ($outfallGasId == null || $outfallGasId == "") {
				alertMsg.info('请先将此监控点关联排放口！');
				return;
			}else if($dateGatherGasId == null || $dateGatherGasId == ""){
				alertMsg.info('请先将此监控点设置数采仪！');
				return;
			}else {
				$("#gasSetEqB").click();
			}
		} else {
			alertMsg.info('请先选中一个监控点！');
			return;
		}
	}
</script>
<form id="pagerForm"
	action="${context }/businessPlatfrom/jkd/fqjkd/${isFlag }"
	method="post">
	<input type="hidden" name="mgChecked" value="${mgChecked }" />
</form>
<div class="pageContent" width="100%" layoutH="0">
	<div class="panel collapse">
		<h1>${enterpriseName } => 废气监控点</h1>
		<div class="pageHeader" style="display: none;">
			<div class="pageFormContent">
				<form id="monGasSearch" onsubmit="return navTabSearch(this);"
					action="${context }/businessPlatfrom/jkd/fqjkd/${isFlag }"
					method="post">
					<input type="hidden" id="mgChecked" name="mgChecked"
						value="${mgChecked }" />
				</form>
			</div>
		</div>
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" target="navTab"
						href="${context }/businessPlatfrom/jkd/fqjkd/add/${enterpriseId }"
						rel="fqjkd_add_${isFlag }"><span>添加</span></a></li>
					<li><a class="edit" target="navTab"
						href="${context }/businessPlatfrom/jkd/fqjkd/edit/{monId}"
						rel="fqjkd_edit_${isFlag }"><span>修改</span></a></li>
					<li><a class="delete" target="ajaxTodo"
						href="${context }/businessPlatfrom/jkd/deleteMonPoint/1/{monId}"
						title="确定要删除吗?"><span>删除</span></a></li>
					<li class="line">line</li>
					<li><a class="edit" href="javaScript:szwrw_onclick();"><span>设置污染物</span></a></li>
					<!-- rel="fqjkd_szwrw"target="navTab" -->
					<li><a class="edit" style="display: none;" id="szwrwJcdGas"
						href="${context }/businessPlatfrom/jkd/fqjkd/szwrw/{monId}"
						rel="pfk_szwrw" target="navTab"><span>设置污染物</span></a></li>
					<li><a class="edit" target="navTab"
						href="${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/{monId}"
						rel="fqjkd_sjcjy_${isFlag }"><span>设置数据采集仪</span></a></li>
					<li><a id="gasSetEqA" class="edit"
						href="javaScript:gasSetEq();"><span>设置在线监测仪</span></a> <a
						id="gasSetEqB" style="display: none;" class="edit" target="navTab"
						href="${context }/businessPlatfrom/jkd/fqjkd/szzxjcyq/{monId}?enterpriseId=${enterpriseId }"
						rel="fqjkd_zxjcy_${isFlag }"><span>设置在线监测仪</span></a></li>
				</ul>
			</div>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="5%" align="center" style="font-weight: normal;"></th>
						<th align="center" style="font-weight: normal; display: none;"></th>
						<th width="25%" align="center" style="font-weight: normal;">监控点名称</th>
						<th width="40%" align="center" style="font-weight: normal;">监控点位置</th>
						<th width="25%" align="center" style="font-weight: normal;">流向</th>
						<th width="25%" align="center" style="font-weight: normal;">状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="monGas" items="${monGasList }">
						<tr rel="${monGas.monId }" target="monId" name="monGasTr">
							<td align="center"><input type="radio" name="forMgId"
								value="${monGas.monId }"
								<c:if test="${monGas.monId==mgChecked }">checked='checked'</c:if> />
							</td>
							<td name="td_${monGas.monId }_outfallGasId"
								style="display: none;">${monGas.outfallGas.outfallId }</td>
							<td name="td_${monGas.monId }_dateGatherGasId"
								style="display: none;">${monGas.dataGather.mn }</td>
							<td align="center">${monGas.monName }</td>
							<td align="center">${monGas.address }</td>
							<td align="center">${monGas.outfallGas.outfallName }</td>
							<td align="center"><c:if test="${monGas.isValid == 0 }">停用</c:if>
								<c:if test="${monGas.isValid == 1 }">在用</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="panel close collapse">
		<h1>废气监控点详细信息</h1>
		<div>
			<table class="table_xxxx">
				<col width="15%" align="right" />
				<col width="35%" align="center" />
				<col width="15%" align="right" />
				<col width="35%" align="center" />
				<tr>
					<td align="right">监控点名称：</td>
					<td align="center">${curMon.monName }</td>
					<td align="right">是否有效：</td>
					<td align="center"><c:if test="${curMon.isValid == 1 }">有效</c:if>
						<c:if test="${curMon.isValid == 0 }">无效</c:if></td>
				</tr>
				<tr>
					<td align="right">所属企业：</td>
					<td align="center">${curMon.enterprise.enterpriseName }</td>
					<td align="right">是否烧结：</td>
					<td align="center"><c:if test="${curMon.isSintering == 1 }">是</c:if>
						<c:if test="${curMon.isSintering == 0 }">否</c:if></td>
				</tr>
				<tr>
					<td align="right">经度：</td>
					<td align="center">${curMon.longitude }</td>
					<td align="right">纬度：</td>
					<td align="center">${curMon.latitude }</td>
				</tr>
				<tr>
					<td align="right">流向：</td>
					<td align="center">${curMon.outfallGas.outfallName }</td>
					<td align="right">进出口类型：</td>
					<td align="center">${inoutTypeSelectMap[curMon.inoutType] }</td>
				</tr>
				<tr>
					<td align="right">烟道截面积：</td>
					<td align="center">${curMon.crossArea }</td>
					<td align="right">空气系数：</td>
					<td align="center">${curMon.airCoefficient }</td>
				</tr>
				<tr>
					<td align="right">斜率：</td>
					<td align="center">${curMon.rakeTatio }</td>
					<td align="right">截距：</td>
					<td align="center">${curMon.intercept }</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="panel close collapse">
		<h1>备案登记信息</h1>
		<div>
			<table class="table_xxxx">
				<col style="width: 15%;" />
				<col style="width: 35%;" />
				<col style="width: 15%;" />
				<col style="width: 35%;" />
				<tr>
					<td align="right">位置：</td>
					<td align="center">${curMon.address }</td>
					<td align="right">废气监控点类型：</td>
					<td align="center">${monTypeSelectMap[curMon.monTypecode] }</td>
				</tr>
				<tr>
					<td align="right">标志牌安装形式：</td>
					<td align="center">${signFormSelectMap[curMon.signForm] }</td>
					<td align="right">排放规律：</td>
					<td align="center">${letRuleSelectMap[curMon.letRule] }</td>
				</tr>
				<tr>
					<td align="right">气域功能区类别：</td>
					<td align="center">${gasCodeSelectMap[curMon.gasCode] }</td>
					<td align="right">监控点高度：</td>
					<td align="center">${curMon.monHigh }</td>
				</tr>
				<tr>
					<td align="right">出口内径：</td>
					<td align="center">${curMon.exitInner }</td>
					<td align="right">燃料分类：</td>
					<td align="center">${burnTypeSelectMap[curMon.burnTypecode] }</td>
				</tr>
				<tr>
					<td align="right">燃烧方式：</td>
					<td align="center">${burnModeSelectMap[curMon.burnModecode] }</td>
					<td align="right">是否两控区：</td>
					<td align="center"><c:if test="${curMon.isTowctrl == 1 }">是</c:if>
						<c:if test="${curMon.isTowctrl == 0 }">否</c:if></td>
				</tr>
				<tr>
					<td align="right">两控区类型：</td>
					<td align="center">${twoctrlSelectMap[curMon.twoctrlCode] }</td>
					<td align="right">燃烧设备用途：</td>
					<td align="center">${burnUseSelectMap[curMon.burnUsecode] }</td>
				</tr>
				<tr>
					<td align="right">设备名称：</td>
					<td align="center">${curMon.deviceName }</td>
					<td align="right">车间工段名称：</td>
					<td align="center">${curMon.workName }</td>
				</tr>
				<tr>
					<td align="right">流向类型：</td>
					<td align="center">${flowtypeSelectMap[curMon.flowtypeCode] }</td>
					<td align="right">采样位置排气筒截面积：</td>
					<td align="center">${curMon.sampleSquare }</td>
				</tr>
				<tr>
					<td align="right">流量报警下限：</td>
					<td align="center">${curMon.alarmMin }</td>
					<td align="right">流量报警上限：</td>
					<td align="center">${curMon.alarmMax }</td>
				</tr>
				<tr>
					<td align="right">采样位置：</td>
					<td align="center">${curMon.sampleLoc }</td>
					<td align="right">采样方式：</td>
					<td align="center">${sampleSelectMap[curMon.sampleCode] }</td>
				</tr>
				<tr>
					<td align="right">采样位置排气筒截面积：</td>
					<td align="center">${curMon.sampleSquare }</td>
					<td align="right">含湿量：</td>
					<td align="center">${curMon.waterContent }</td>
				</tr>
				<tr>
					<td align="right">预处理方式：</td>
					<td align="center">${curMon.dealWay }</td>
					<td align="right">传输距离(m)：</td>
					<td align="center">${curMon.transDistance }</td>
				</tr>
				<tr>
					<td align="right">备注：</td>
					<td align="center" colspan="3">${curMon.remark }</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="panel close collapse">
		<h1>监控点配置信息</h1>
		<div>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th align="center" style="width: 10%; font-weight: normal;">污染物名称</th>
						<th align="center" style="width: 10%; font-weight: normal;">标准类别</th>
						<th align="center" style="width: 10%; font-weight: normal;">标准级别</th>
						<th align="center" style="width: 30%; font-weight: normal;">适用范围</th>
						<th align="center" style="width: 10%; font-weight: normal;">排放标准</th>
						<th align="center" style="width: 10%; font-weight: normal;">浓度报警下限</th>
						<th align="center" style="width: 10%; font-weight: normal;">浓度报警上限</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="eg" items="${curMon.dataGather.equipmentGases }">
						<%-- <c:forEach var="bs" items="${eg.blowoffStandard }"> --%>
						<tr>
							<td align="center">${eg.blowoffStandard.pollutant.chineseName
								}</td>
							<td align="center"><c:forEach var="typeCode"
									items="${typeCodeSelectMap }">
									<c:if test="${eg.blowoffStandard.typeCode == typeCode.key }">${typeCode.value }</c:if>
								</c:forEach></td>
							<td align="center"><c:forEach var="level"
									items="${standardLevelSelectMap }">
									<c:if test="${eg.blowoffStandard.standardLevel == level.key }">${level.value }</c:if>
								</c:forEach></td>
							<td align="center">${eg.blowoffStandard.rangeCode }</td>
							<td align="center">${eg.blowoffStandard.standardValue }</td>
							<td align="center">${eg.blowoffStandard.pollutant.alarmMin }</td>
							<td align="center">${eg.blowoffStandard.pollutant.alarmMax }</td>
						</tr>
						<%-- </c:forEach> --%>
					</c:forEach>
				</tbody>
			</table>
			<table class="list" width="100%" style="margin-top: 5px;">
				<thead>
					<tr>
						<th align="center" style="width: 15%; font-weight: normal;">数据采集仪序号</th>
						<th align="center" style="width: 15%; font-weight: normal;">SIM（UIM）卡号</th>
						<th align="center" style="width: 40%; font-weight: normal;">运维单位</th>
						<th align="center" style="width: 15%; font-weight: normal;">运维单位联系人</th>
						<th align="center" style="width: 15%; font-weight: normal;">运维单位联系电话</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center">${curMon.dataGather.mn }</td>
						<td align="center">${curMon.dataGather.simno }</td>
						<td align="center">${curMon.dataGather.maintenance.maintenName
							}</td>
						<td align="center">${curMon.dataGather.maintenance.linkman }</td>
						<td align="center">${curMon.dataGather.maintenance.tel }</td>
					</tr>
				</tbody>
			</table>
			<table class="list" width="100%" style="margin-top: 5px;">
				<thead>
					<tr>
						<th align="center" style="width: 20%; font-weight: normal;">在线监测仪器名称</th>
						<th align="center" style="width: 20%; font-weight: normal;">在线监测仪器型号</th>
						<th align="center" style="width: 20%; font-weight: normal;">所监测污染物</th>
						<th align="center" style="width: 10%; font-weight: normal;">最小量程</th>
						<th align="center" style="width: 10%; font-weight: normal;">最大量程</th>
						<th align="center" style="width: 20%; font-weight: normal;">运维单位</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="eg" items="${curMon.dataGather.equipmentGases }">
						<tr>
							<td align="center">${eg.equipName }</td>
							<td align="center">${eg.equipType }</td>
							<td align="center">${eg.blowoffStandard.pollutant.chineseName
								}</td>
							<td align="center">${eg.minValue }</td>
							<td align="center">${eg.maxValue }</td>
							<td align="center">${eg.maintenance.maintenName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
