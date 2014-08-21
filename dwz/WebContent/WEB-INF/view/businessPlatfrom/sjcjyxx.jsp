<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_pskjbxx {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_pskjbxx td, th{
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	
	.table_xxxx tr td {
		background-color: white;
	}
	.table_xxxx {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_xxxx td{
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
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
	$("input[name='forDgId']").change(function(){
		$("#dgChecked").val($("input[name='forDgId']:checked").val());
		$("#dataGatherSearch").submit();
	});
</script>
<form id="pagerForm" action="${context }/businessPlatfrom/dataGather/sjcjyxx/${isFlag }" method="post">
	<input type="hidden" name="dgChecked" value="${dgChecked }" />
</form>
<div class="pageContent" layoutH="10">	
	<div class="panel collapse">
		<h1>${enterpriseName } => 数据采集仪基本信息</h1>
		<div class="pageHeader" style="display:none;">
			<div class="pageFormContent" >
				<form id="dataGatherSearch" onsubmit="return navTabSearch(this);" action="${context }/businessPlatfrom/dataGather/sjcjyxx/${isFlag }" method="post">
					<input type="hidden" id="dgChecked" name="dgChecked" value="${dgChecked }" />
				</form>
			</div>
		</div>
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add"  target="navTab" href="${context }/businessPlatfrom/dataGather/sjcjyxx/add/${enterpriseId }" rel="sjcjyxxAdd_${isFlag }"><span>添加</span></a></li>
					<li><a class="edit" target="navTab" href="${context }/businessPlatfrom/dataGather/sjcjyxx/edit/{mn}" rel="sjcjyxxEdit_${isFlag }"><span>修改</span></a></li>
					<li><a class="delete" target="ajaxTodo" href="${context }/businessPlatfrom/dataGather/sjcjyxx/delete/{mn}" title="确定要删除吗?"><span>删除</span></a></li>
				</ul>
			</div>
			<table class="list" width="100%" >
				<thead>
					<tr>
						<th width="10%" align="center" style="font-weight:normal;"></th>
						<th width="40%" align="center" style="font-weight:normal;">数据采集仪序号</th>
						<th width="40%" align="center" style="font-weight:normal;">SIM（UIM）卡号</th>
						<!-- <th width="40%" align="center" style="font-weight:normal;">监控点位置</th> -->
						<th width="10%" align="center" style="font-weight:normal;">状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dataGather" items="${dataGatherList }" varStatus="vs">
						<tr rel="${dataGather.mn }" target="mn">
							<td align="center">
								<input type="radio" name="forDgId" value="${dataGather.mn }" <c:if test="${dataGather.mn==dgChecked }">checked='checked'</c:if> />
							</td>
							<td align="center">${dataGather.mn }</td>
							<td align="center">${dataGather.simno }</td>
							<td align="center">
								<c:choose>
									<c:when test="${dataGather.isValid==1 }">可用</c:when>
									<c:otherwise>不可用</c:otherwise>
								</c:choose>
							</td>
							<!-- <td>$</td> -->
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>
	<div class="panel close collapse">
		<h1>数采仪详细信息</h1>
		<div>
			<table class="table_xxxx">
				<col width="15%" align="right"/>
				<col width="35%" align="center"/>
				<col width="15%" align="right"/>
				<col width="35%" align="center"/>
				<tr>
					<td>数采仪序号：</td>
					<td>${curDG.mn }</td>
					<td>所属企业：</td>
					<td>${curDG.enterprise.enterpriseName }</td>
				</tr>
				<tr>
					<td>所属监控点：</td>
					<td><%-- ${curDG.monWater==null?curDG.monGas.monName:curDG.monWater.monName } --%></td>
					<td>SIM卡号：</td>
					<td>${curDG.simno }</td>
				</tr>
				<tr>
					<td>数据传输方式：</td>
					<td>${datatransSelectMap[curDG.datatransCode] }</td>
					<td>运维单位：</td>
					<td>${curDG.maintenance.maintenName }</td>
				</tr>
				<tr>
					<td>运维单位联系人：</td>
					<td>${curDG.maintenance.linkman }</td>
					<td>运维单位联系电话：</td>
					<td>${curDG.maintenance.tel }</td>
				</tr>
				<tr>
					<td>生产厂商：</td>
					<td>${curDG.vendor.vendorName }</td>
					<td>生产厂商联系人：</td>
					<td>${curDG.vendor.linkman }</td>
				</tr>
				<tr>
					<td>生产厂商联系电话：</td>
					<td>${curDG.vendor.tel }</td>
					<td>启用日期：</td>
					<td><fmt:formatDate value='${curDG.startDate }' pattern='yyyy-MM-dd'/>
				</tr>
				<tr>
					<td>上报IP地址1：</td>
					<td>${curDG.ip1 }</td>
					<td>上报端口号1：</td>
					<td>${curDG.port1 }</td>
				</tr>
				<tr>
					<td>上报IP地址2：</td>
					<td>${curDG.ip2 }</td>
					<td>上报端口号2：</td>
					<td>${curDG.port2 }</td>
				</tr>
				<tr>
					<td>上报IP地址3：</td>
					<td>${curDG.ip3 }</td>
					<td>上报端口号3：</td>
					<td>${curDG.port3 }</td>
				</tr>
				<tr>
					<td>上报IP地址4：</td>
					<td>${curDG.ip4 }</td>
					<td>上报端口号4：</td>
					<td>${curDG.port4 }</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="panel close collapse">
		<h1>备案登记信息</h1>
		<div>
			<table class="table_xxxx">
				<col style="width:15%;text-align:right;" />
				<col style="width:35%;text-align:center;" />
				<col style="width:15%;text-align:right;" />
				<col style="width:35%;text-align:center;" />
				<tr>
					<td>适用性检测报告名称：</td>
					<td colspan="3">${curDG.reportName }</td>
				</tr>
				<tr>
					<td>设备出厂编号：</td>
					<td>${curDG.equipNo }</td>
					<td>代理商：</td>
					<td>${curDG.agent }</td>
				</tr>
				<tr>	
					<td>接收信号类型：</td>
					<td>${signalTypeSelectMap[curDG.signalTypecode] }</td>
					<td>通讯协议：</td>
					<td>${protocolSelectMap[curDG.protocolCode] }</td>
				</tr>
				<tr>
					<td>设备型号：</td>
					<td>${curDG.equipType }</td>
					<td>显示单元显示项目名称：</td>
					<td>${curDG.itemName }</td>
				</tr>
				<tr>
					<td>数字输入通道数量：</td>
					<td>${curDG.digitalNum }</td>
					<td>模拟量输入通道数量：</td>
					<td>${curDG.analogNum }</td>
				</tr>
				<tr>
					<td>开关量输入通道数量：</td>
					<td>${curDG.switchNum }</td>
					<td>存储容量（KB）：</td>
					<td>${curDG.storageCapacity }</td>
				</tr>
				<tr>
					<td>状态：</td>
					<td colspan="3">
						<c:choose>
							<c:when test="${curDG.isUsed==1 }">在用</c:when>
							<c:otherwise>停用</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td colspan="3" style="border-top:0;">${curDG.remark }</td>
				</tr>
			</table>
		</div>
	</div>
</div>
