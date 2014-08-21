<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
.table_sbsh table th {
	text-align: left;
	border: 0px;
}

.paddingTop {
	padding-top: 5px;
	border: 0px;
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
		var $hidEnterpriseId = "${enterprise.enterpriseId }";
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
		}
	});
</script>
<script type="text/javascript">
<!--
	//-->
	function csh(equipFlag){
		if (equipFlag == "fq") {
			$("#fqCsh").click();
		} else {
			$("#fsCsh").click();
		}
	}
</script>
<div class="pageContent" layoutH="18" style="width: 100%">
	<div class="panel open collapse" style="margin-top: 10px;">
		<h1>
			<span>${enterprise.enterpriseName } => 设备验收审核</span>
		</h1>
		<div>
			<div class="panelBar">
				<input type="radio" style="padding-left: 20px;" name="fqfs" value="fq" onclick="csh('fq');"
					<c:if test="${equipFlag == 'gas' }">checked='checked'</c:if> />废气设备
				<input type="radio" name="fqfs" value="fs" onclick="csh('fs');"
					<c:if test="${equipFlag == 'water' }">checked='checked'</c:if>>废水设备
				<a style="display: none;" id="fqCsh"
					href="${context }/businessPlatfrom/gyqy/sbyssh/${isFlag }?equipFlag=<%=Constant.EQUIPTYPE_GAS %>"
					target="navTab" rel="xcdzhgl_body_${isFlag }" title="设备验收审核"><span>废气设备</span></a> <a
					style="display: none;" id="fsCsh"
					href="${context }/businessPlatfrom/gyqy/sbyssh/${isFlag }?equipFlag=<%=Constant.EQUIPTYPE_WATER %>"
					target="navTab" rel="xcdzhgl_body_${isFlag }" title="设备验收审核"><span>废水设备</span></a>
			</div>
			<table style="width: 100%; border: 0;">
				<tr>
					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>废气设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${fn:length(equipmentList) }</th>
					<th class="paddingTop" align="left" style="width: 9%;">台(套)</th>

					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>未验收设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${noCheckEq }</th>
					<th class="paddingTop" align="left" style="width: 9%;">台(套)</th>

					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>验收通过设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${checkPassEq }</th>
					<th class="paddingTop" align="left" style="width: 9%;">台(套)</th>

					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>验收未通过设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${checkNoPassEq }</th>
					<th class="paddingTop" align="left" style="width: 9%;">台(套)</th>
				</tr>

				<tr>
					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>未审核设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${noAudit }</th>
					<th class="paddingTop" align="left" style="width: 9%;">个</th>

					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>过期设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${datePass }</th>
					<th class="paddingTop" align="left" style="width: 9%;">个</th>

					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>审核未通过设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${auditNoPass }</th>
					<th class="paddingTop" align="left" style="width: 9%;">个</th>

					<th class="paddingTop" align="right"
						style="height: 30px; width: 10%;"><span>审核通过设备：</span></th>
					<th class="paddingTop" align="center"
						style="width: 6%; color: red;">${audiPass }</th>
					<th class="paddingTop" align="left" style="width: 9%;">个</th>
				</tr>
			</table>
		</div>
	</div>
	<div style="width: 100%" style="width:100%;" class="table_sbsh">
		<c:forEach var="checkList" items="${resultCheckAndAcceptList }">
			<div
				style="width: 48%; border: 1px solid #e66; margin: 5px; float: left; min-height: 100px">
				<%-- <form method="post" action="${context }/businessPlatfrom/gyqy/fqpfk"  class="pageForm required-validate" 
					onsubmit="return validateCallback(this,navTabAjaxDone);"> --%>
				<table>
					<tr>
						<th rowspan="8" width="33%"><img
							src="${context }/styles/img/icon/wrw.png"></th>
						<th style="width: 67%; height: 30px;" colspan="2">监控点名称：
							${checkList.monName } <input name="monId" type="hidden"
							value="${checkList.monId }" />
						</th>
					</tr>
					<tr>
						<th style="width: 67%; height: 30px;" colspan="2">验 收情 况：
							未验收: ${checkList.noCheck } 台 验收未通过: ${checkList.checkNoPassEq } 台
							验收通过: ${checkList.checkPassEq } 台</th>
					</tr>
					<tr>
						<th style="width: 67%; height: 30px;" colspan="2">审 核情 况：
							未审核: ${checkList.noAuditT } 台 审核未通过: ${checkList.auditNoPassT } 台
							审核通过: ${checkList.audiPassT } 台 审核过期: ${checkList.datePassT } 台</th>
					</tr>
					<tr>
						<th style="width: 100px; height: 30px; margin-left: 20px;">
							<div class="button">
								<a
									href="${context }/businessPlatfrom/gyqy/sbyssh/sbys?mnId=${checkList.mnId }&enterpriseId=${checkList.enterpriseId }&equipFlag=${equipFlag }"
									target="navTab" rel="sbyssh_sbys"> <span>设备验收</span></a>
							</div>
						</th>
						<th style="width: 100px; height: 30px; margin-left: 20px;">
							<div class="button">
								<a
									href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh?monId=${checkList.monId }&enterpriseId=${checkList.enterpriseId }&equipFlag=${equipFlag }"
									target="navTab" rel="sbyssh_sbsh"><span>有效性审核</span></a>
							</div>
						</th>
					</tr>
				</table>
				<!-- </form>	 -->
			</div>
		</c:forEach>
	</div>
</div>
