<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<script type="text/javascript">
	function changeEg(egId, egSelected){
		$("#egChecked").val(egId);
		$("#egSecected").val(egSelected);
		$("#egSearch").submit();
	}
	
	function dismantleEquipG(){
		var $equipId = $("tr[target='equipId'].selected").attr("rel");
		if($equipId == null || $equipId == ""){
			alertMsg.info("请选择要拆除的在线设备");
		}else{
			$(function(){ajaxTodo("${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/eqRelevaneMonGas/delete/"+$equipId,reflshThisnavTabG);});
		}
	}
	
	function reflshThisnavTabG(){
		$("#backGasSetEq").click();
	}
	//安装
	function onclickGasJkdAz(){
		var equipId = $("tr[target='equipId'].selected").attr("rel");
		if (equipId == null || equipId == "") {
			alertMsg.info('请选择要安装的在线设备！');
		} else {
			$('#gasJkdAz').click();
		}
	}
</script>
<form id="pagerForm"
	action="${context }/businessPlatfrom/jkd/fsjkd/szzxjcyq/${monId }"
	method="post">
	<input type="hidden" name="egChecked" value="${egChecked }" /> <input
		type="hidden" name="egSecected" value="${egSecected }" />
</form>
<div class="pageContent" layoutH="10">
	<!-- <div class="panel collapse">
		<h1>废气在线监测仪器基本信息</h1> -->
	<div class="pageHeader" style="display: none;">
		<div class="pageFormContent">
			<form id="egSearch" onsubmit="return navTabSearch(this);"
				action="${context }/businessPlatfrom/jkd/fqjkd/szzxjcyq/${monId }"
				method="post">
				<input type="hidden" id="egChecked" name="egChecked"
					value="${egChecked }" /> <input type="hidden" id="egSecected"
					name="egSecected" value="${egSecected }" />
			</form>
		</div>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<%-- <li><a class="edit" target="selectedTodo" rel="egs" postType="string" href="${context }/businessPlatfrom/jkd/fqjkd/szzxjcyq/change/${monId }?navTabId=fqjkd_${isFlag }&mwChecked=${monId }&callbackType=closeCurrent" title="确定要更换数据采集仪?"><span>确定</span></a></li> --%>
				<!--  <li><a class="add" href="${context }/businessPlatfrom/jkd/zxjcyqsz/add/dialog?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="dialog" rel="fqjkd_zxjcy_${isFlag }" title="添加监测仪器" width="850" height="725"><span>添加</span></a></li>-->
				<li><a class="add" href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/add?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="navTab" rel="zxjcyqsz_add" title="添加监测仪器" width="850" height="725"><span>添加</span></a></li>
				<li><a class="edit" href="javaScript:onclickGasJkdAz();"
					title="请选择在线检测仪器！"><span>安装</span></a></li>
				<li><a class="delete" href="javaScript:dismantleEquipG();"
					title="确定拆除？"><span>拆除</span></a></li>
				<%-- <li><a class="add" href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/add?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="navTab" rel="zxjcyqsz_add" title="添加监测仪器"><span>添加</span></a></li> --%>
				<li style="display: none;"><a id="backGasSetEq"
					style="display: none;" class="edit" target="navTab"
					href="${context }/businessPlatfrom/jkd/fqjkd/szzxjcyq/${monId}"
					rel="fqjkd_zxjcy_${isFlag }"><span>设置在线监测仪</span></a></li>
				<li style="display: none;"><a rel="kd_jky_szwrw" target="dialog" style="display:none" id="gasJkdAz"
					href="${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/eqRelevaneMonGas/${monId }/{equipId}?isFlag=${isFlag }" title="请选择要监控的污染物及标准"></a></li>
			</ul>
		</div>
		<input type="hidden" name="isFlag" value="${isFlag }" /> <input
			type="hidden" name="monId" value="${monId }" /> <input type="hidden"
			name="enterpriseId" value="${enterpriseId }" />
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="20%" align="center" style="font-weight: normal;">在线监测仪器名称</th>
					<th width="20%" align="center" style="font-weight: normal;">在线监测仪器型号</th>
					<th width="20%" align="center" style="font-weight: normal;">运维单位</th>
					<th width="20%" align="center" style="font-weight: normal;">所属数采仪</th>
					<!-- <th width="20%" align="center" style="font-weight: normal;">监测污染物</th> -->

				</tr>
			</thead>
			<tbody>
				<c:forEach var="eqgList" items="${eqGasList }">
					<tr
						<%-- <c:if test="${eqgList.equipId==egChecked }">class='selected'</c:if> --%>
						rel="${eqgList.equipId }" target="equipId"
						onclick="changeEg(${eqgList.equipId },{egs});">
						<td align="center">${eqgList.equipName }</td>
						<td align="center">${eqgList.equipType }</td>
						<td align="center">${eqgList.maintenance.maintenName }</td>
						<td align="center">${eqgList.dataGather.mn }</td>
						<%-- <td align="center">${eqgList.blowoffStandard.pollutant.pollutantName
							}</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- </div> -->
	</div>
</div>

