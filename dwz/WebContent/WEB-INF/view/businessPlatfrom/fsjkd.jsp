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
	$(function(){
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
		 for(var i = 0 ;i < $lengthT ;i++ ){
			//获取下一条
			$closeTabId = $obj.attr("tabid");			
			$obj = $obj.next();
			if($closeTabId == $thisNavTbId ||
					$closeTabId == "main"){
				continue;
			}else {
				oldFlag = $closeTabId.substring($closeTabId.length-1);
				//flag区分变化
				if($flag != oldFlag){
					//关闭其他页面
					navTab.closeTab($closeTabId);
				}
			}
		}
	});
</script>
<script type="text/javascript">
	$(function(){
		var $hidEnterpriseId = "${enterpriseId }";
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
		}
	});
</script>
<script type="text/javascript">
	$("input[name='forMwId']").change(function() {
		$("#mwChecked").val($("input[name='forMwId']:checked").val());
		$("#monWaterSearch").submit();
	});
	function szwrw_onclick() {
		var $monId = $("tr[name='monWaterTr'].selected").attr("rel");
		if ($monId != null && $monId != "") {
			var $outfallWaterId = $("td[name='td_" + $monId + "_outfallWaterId']")
					.html();
			if ($outfallWaterId == null || $outfallWaterId == "") {
				alertMsg.info('请先将此监控点关联排放口！');
				return;
			} else {
				$("#szwrwJcd").attr("href" , "${context }/businessPlatfrom/gyqy/fspfkSzwrw/" + $outfallWaterId);
				$("#szwrwJcd").click();
			}
		} else {
			alertMsg.info('请先选中一个监控点！');
			return;
		}
	}
	function waterSetEq() {
		var $monId = $("tr[name='monWaterTr'].selected").attr("rel");
		if ($monId != null && $monId != "") {
			var $outfallWaterId = $(
					"td[name='td_" + $monId + "_outfallWaterId']").html();
			var $dateGatherWaterId = $("td[name='td_" + $monId + "_dateGatherWaterId']")
			.html();
			if ($outfallWaterId == null || $outfallWaterId == "") {
				alertMsg.info('请先将此监控点关联排放口！');
				return;
			}else if($dateGatherWaterId == null || $dateGatherWaterId == ""){
				alertMsg.info('请先将此监控点设置数采仪！');
				return;
			}else{
				$("#waterSetEqB").click();
			}
		} else {
			alertMsg.info('请先选中一个监控点！');
			return;
		}
	}
</script>
<form id="pagerForm"
	action="${context }/businessPlatfrom/jkd/fsjkd/${isFlag }"
	method="post">
	<input type="hidden" name="mwChecked" value="${mwChecked }" />
</form>
<div class="pageContent" width="100%" layoutH="0">
	<div class="panel collapse">
		<h1>${enterpriseName } => 废水监控点</h1>
		<div class="pageHeader" style="display: none;">
			<div class="pageFormContent">
				<form id="monWaterSearch" onsubmit="return navTabSearch(this);"
					action="${context }/businessPlatfrom/jkd/fsjkd/${isFlag }"
					method="post">
					<input type="hidden" id="mwChecked" name="mwChecked"
						value="${mwChecked }" />
				</form>
			</div>
		</div>
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" target="navTab"
						href="${context }/businessPlatfrom/jkd/fsjkd/add/${enterpriseId }"
						rel="fsjkd_add_${isFlag }"><span>添加</span></a></li>
					<li><a class="edit" target="navTab"
						href="${context }/businessPlatfrom/jkd/fsjkd/edit/{monId}"
						rel="fsjkd_edit_${isFlag }"><span>修改</span></a></li>
					<li><a class="delete" target="ajaxTodo"
						href="${context }/businessPlatfrom/jkd/deleteMonPoint/2/{monId}"
						title="确定要删除吗?"><span>删除</span></a></li>
					<li class="line">line</li>
					<li><a class="edit" href="javaScript:szwrw_onclick();"><span>设置污染物</span></a></li>
					<!-- rel="fsjkd_szwrw"target="navTab" -->
					<li><a class="edit" style="display: none;" id="szwrwJcd"
						href="${context }/businessPlatfrom/jkd/fsjkd/szwrw/{monId}"
						rel="pfk_szwrw" target="navTab"><span>设置污染物</span></a></li>
					<li><a class="edit" target="navTab"
						href="${context }/businessPlatfrom/jkd/fsjkd/szsjcjy/{monId}"
						rel="fsjkd_sjcjy_${isFlag }"><span>设置数据采集仪</span></a></li>
					<li><a id="waterSetEqA" class="edit"
						href="javaScript:waterSetEq();"><span>设置在线监测仪</span></a> <a
						id="waterSetEqB" style="display: none;" target="navTab"
						href="${context }/businessPlatfrom/jkd/fsjkd/szzxjcyq/{monId}"
						rel="fsjkd_zxjcy_${isFlag }"><span>设置在线监测仪</span></a></li>
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
					<c:forEach var="monWater" items="${monWaterList }">
						<tr rel="${monWater.monId }" target="monId" name="monWaterTr">
							<td align="center"><input type="radio" name="forMwId"
								value="${monWater.monId }"
								<c:if test="${monWater.monId==mwChecked }">checked='checked'</c:if> />
							</td>
							<td name="td_${monWater.monId }_outfallWaterId"
								style="display: none;">${monWater.outfallWater.outfallId }</td>
							<td name="td_${monWater.monId }_dateGatherWaterId"
								style="display: none;">${monWater.dataGather.mn }</td>
							<td align="center">${monWater.monName }</td>
							<td align="center">${monWater.address }</td>
							<td align="center">${monWater.outfallWater.outfallName }</td>
							<td align="center"><c:if test="${monWater.isValid == 0 }">停用</c:if>
								<c:if test="${monWater.isValid == 1 }">在用</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="panel close collapse">
		<h1>废水监控点详细信息</h1>
		<div>
			<table class="table_xxxx">
				<col width="15%" align="right" />
				<col width="35%" align="center" />
				<col width="15%" align="right" />
				<col width="35%" align="center" />
				<tr>
					<td align="right">监控点名称：</td>
					<td align="left" colspan="3">${curMon.monName }</td>
				</tr>
				<tr>
					<td align="right">所属企业：</td>
					<td align="center">${curMon.enterprise.enterpriseName }</td>
					<td align="right">是否有效：</td>
					<td align="center"><c:if test="${curMon.isValid == 1 }">有效</c:if>
						<c:if test="${curMon.isValid == 0 }">无效</c:if></td>
				</tr>
				<tr>
					<td align="right">经度：</td>
					<td align="center">${curMon.longitude }</td>
					<td align="right">纬度：</td>
					<td align="center">${curMon.latitude }</td>
				</tr>
				<tr>
					<td align="right">排放去向：</td>
					<td align="center">${letDirecSelectMap[curMon.letDirec] }</td>
					<td align="right">进出口类型：</td>
					<td align="center">${inoutTypeSelectMap[curMon.inoutType] }</td>
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
					<td align="right">标志牌安装形式：</td>
					<td align="center">${signFormSelectMap[curMon.signForm] }</td>
				</tr>
				<tr>
					<td align="right">排放规律：</td>
					<td align="center">${letRuleSelectMap[curMon.letRule] }</td>
					<td align="right">水域功能区类别：</td>
					<td align="center">${waterareaSelectMap[curMon.waterareaCode]
						}</td>
				</tr>
				<tr>
					<td align="right">流向类型：</td>
					<td align="center">${flowtypeSelectMap[curMon.flowtypeCode] }</td>
					<td align="right">流向排口：</td>
					<td align="center">${curMon.outfallWater.outfallName }</td>
				</tr>
				<tr>
					<td align="right">流量报警下限：</td>
					<td align="center">${curMon.alarmMin }</td>
					<td align="right">流量报警上限：</td>
					<td align="center">${curMon.alarmMax }</td>
				</tr>
				<tr>
					<td align="right">堰槽类型：</td>
					<td align="center">${inoutTypeSelectMap[curMon.inoutType] }</td>
					<td align="right">测流段长度(m)：</td>
					<td align="center">${curMon.segmentLong }</td>
				</tr>
				<tr>
					<td align="right">水面宽度(m)：</td>
					<td align="center">${curMon.surfaceWidth }</td>
					<td align="right">喉道宽度(m)：</td>
					<td align="center">${curMon.throatWidth }</td>
				</tr>
				<tr>
					<td align="right">管径(cm)：</td>
					<td align="center">${curMon.pipeSize }</td>
					<td align="right">采样位置：</td>
					<td align="center">${curMon.simpleAddress }</td>
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
					<c:forEach var="ew" items="${curMon.dataGather.equipmentWaters }">
						<%-- <c:forEach var="bs" items="${ew.blowoffStandard }"> --%>
						<tr>
							<td align="center">${ew.blowoffStandard.pollutant.chineseName
								}</td>
							<td align="center"><c:forEach var="typeCode"
									items="${typeCodeSelectMap }">
									<c:if test="${ew.blowoffStandard.typeCode == typeCode.key }">${typeCode.value }</c:if>
								</c:forEach></td>
							<td align="center"><c:forEach var="level"
									items="${standardLevelSelectMap }">
									<c:if test="${ew.blowoffStandard.standardLevel == level.key }">${level.value }</c:if>
								</c:forEach></td>
							<td align="center">${ew.blowoffStandard.rangeCode }</td>
							<td align="center">${ew.blowoffStandard.standardValue }</td>
							<td align="center">${ew.blowoffStandard.pollutant.alarmMin }</td>
							<td align="center">${ew.blowoffStandard.pollutant.alarmMax }</td>
						</tr>
						<%-- </c:forEach> --%>
					</c:forEach>
				</tbody>
			</table>
			<table class="list" width="100%" style="margin-top: 5px;">
				<thead>
					<tr>
						<th align="center" style="width: 10%; font-weight: normal;">数据采集仪序号</th>
						<th align="center" style="width: 13%; font-weight: normal;">SIM（UIM）卡号</th>
						<th align="center" style="width: 34%; font-weight: normal;">运维单位</th>
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
						<th align="center" style="width: 10%; font-weight: normal;">在线监测仪器名称</th>
						<th align="center" style="width: 20%; font-weight: normal;">在线监测仪器型号</th>
						<th align="center" style="width: 20%; font-weight: normal;">所监测污染物</th>
						<th align="center" style="width: 10%; font-weight: normal;">最小量程</th>
						<th align="center" style="width: 10%; font-weight: normal;">最大量程</th>
						<th align="center" style="width: 20%; font-weight: normal;">运维单位</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ew" items="${curMon.dataGather.equipmentWaters }">
						<tr>
							<td align="center">${ew.equipName }</td>
							<td align="center">${ew.equipType }</td>
							<td align="center">${ew.blowoffStandard.pollutant.chineseName
								}</td>
							<td align="center">${ew.minValue }</td>
							<td align="center">${ew.maxValue }</td>
							<td align="center">${ew.maintenance.maintenName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
