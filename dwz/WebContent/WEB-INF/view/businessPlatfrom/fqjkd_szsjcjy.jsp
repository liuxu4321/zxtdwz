<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	$("input[name='fqjkdForDgId']").change(
			function() {
				$("#fqjkdDgChecked").val(
						$("input[name='fqjkdForDgId']:checked").val());
				$("#fqjkd_dataGatherSearch").submit();
			});

	//回调函数刷新本页面
	function ajaxCallBack() {
		alertMsg.correct("操作成功");
		$("#backSzsjcjy").click();
	}

	//安装数采仪
	function installDataGather() {
		//alert(1);
		var $mn = $("tr[target='mn2'].selected").attr("rel");
		if($mn == null
				||$mn == ""){
			alertMsg.info("请选择数采仪");
		}else{
			//alert($mn2);
			$(function() {
				ajaxTodo(
						"${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/change/${monId }/"+$mn+"?navTabId=fqjkd_${isFlag }&mqChecked=${monId }",
						ajaxCallBack);
			});			
		}
	}

	//拆除数采仪
	function dismantleDataGather() {
		var $mn = $("tr[target='mn2'].selected").attr("rel");
		if($mn == null
				||$mn == ""){
			alertMsg.info("请选择数采仪");
		}else{
			$(function() {
				ajaxTodo(
						"${context }/businessPlatfrom/jkd/fqsjkd/szsjcjy/delte/"+$mn+"?navTabId=fqjkd_${isFlag }&mqChecked=${monId }",
						ajaxCallBack);
			});
		}
	}
</script>
<form id="pagerForm"
	action="${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/${monId }"
	method="post">
	<input type="hidden" name="fqjkdDgChecked" value="${fqjkdDgChecked }" />
</form>
<div class="pageContent" layoutH="10">
	<!-- <div class="panel collapse">
		<h1>数据采集仪基本信息</h1> -->
		<div class="pageHeader" style="display: none;">
			<div class="pageFormContent">
				<form id="fqjkd_dataGatherSearch"
					onsubmit="return navTabSearch(this);"
					action="${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/${monId }"
					method="post">
					<input type="hidden" id="fqjkdDgChecked" name="fqjkdDgChecked"
						value="${fqjkdDgChecked }" />
				</form>
			</div>
		</div>
		<div class="pageContent">
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="edit" href="javaScript:installDataGather();"
						title="确定安装此数据采集仪"><span>安装</span></a></li>
					<li><a class="delete" href="javaScript:dismantleDataGather();"
						title="确定拆除此数据采集仪"><span>拆除</span></a></li>
					<!-- 刷新链接 -->
					<li style="display: none;"><a style="display: none;"
						id="backSzsjcjy" target="navTab"
						href="${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/${monId }"
						rel="fqjkd_sjcjy_${isFlag }"><span>设置数据采集仪</span></a></li>
				</ul>
			</div>			
			<table class="list" width="100%">
				<thead>
					<tr>
						
						<td width="17%" align="center" >数据采集仪序号</td>
						<td width="16%" align="center" >SIM（UIM）卡号</td>
						<td width="16%" align="center" >设备型号</td>
						
						<td width="17%" align="center" >启用日期</td>
						<td width="16%" align="center" >运维单位</td>
						<td width="16%" align="center" >所属监控点</td>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="dataGather" items="${dataGatherList }">
						<tr rel="${dataGather.mn }" target="mn2">
							<td align="center">${dataGather.mn }</td>
							<td align="center">${dataGather.simno }</td>
							<td align="center">${dataGather.equipType }</td>
							
							<td align="center">${dataGather.startDate }</td>
							<td align="center">${dataGather.maintenName }</td>
							<td align="center">${dataGather.monName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<!-- </div> -->
	</div>
</div>
