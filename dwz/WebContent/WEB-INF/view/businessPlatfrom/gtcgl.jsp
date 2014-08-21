<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
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
<div class="pageContent sortDrag" selector="h1" layoutH="42">
	<!-- 企业信息 -->
	<form onsubmit="return navTabSearch(this);" id="pagerForm" method="post" action="${context }/businessPlatfrom/gtc/gtcgl" >
	</form>
	<div class="panel collapse"  defH="60">
		<h1>企业</h1>
		<div id="w_list_print" >
			<table class="list" width="99%" targetType="navTab" asc="asc" desc="desc">
				<thead>
					<tr >
						<td width="50%" align="center">企业名称</td>
						<td width="40%" align="center">关停产状态</td>
						<td width="10%" align="center">操作</td>						
					</tr>			
				</thead>
				<tbody>
					<c:if test="${enterpriseName != null}">		
						<tr target="sid_user" rel="1">
							<td align="center">${enterpriseName}</td>
							<c:if test="${enterpriseStopFlag == 0}">
							<td align="center">生产</td>
							</c:if>
							<c:if test="${enterpriseStopFlag == 1}">
							<td align="center">停产</td>
							</c:if>
							<td  align="center">
							<!-- <div class="buttonActive" style="float: inherit;"><div class="buttonContent"> --> 
								<a href="${context }/businessPlatfrom/gtc/gtcgl/master?enterpriseId=${enterpriseId}" id="detail" target="navTab"
									mask="true" title="企业关停产管理" max="false" height="500" width="700" rel="gtcgl_master" fresh = "true">关停产管理</a>
							<!-- </div></div>	 -->
						</td>
						</tr>	
					</c:if>		
				</tbody>
			</table>
		</div>
	</div>
	<!-- 排口信息 -->
	<div class="panel collapse" defH="164">
		<h1>排口</h1>
		<div id="w_list_print">
			<table class="list" width="99%" targetType="navTab" asc="asc" desc="desc">
				<thead>
					<tr>
						<td width="25%" align="center">排口名称</td>
						<td width="25%" align="center">排口位置</td>
						<td width="25%" align="center">排口类型</td>
						<td width="15%" align="center">关停产状态</td>
						<td width="10%" align="center">操作</td> 	
					</tr>
				</thead>
				<tbody>			
					<c:forEach var="stopInfoList" items="${stopInfoList}">
						<tr target="sid_user" rel="2">
						
							<td align="center">${stopInfoList.OUTFALLNAME}</td>
							<td align="center">${stopInfoList.ADDRESS}</td>
							<c:if test="${stopInfoList.OUTTYPE == 1}">
								<td align="center">废气</td>
							</c:if>
							<c:if test="${stopInfoList.OUTTYPE == 2}">
								<td align="center">废水</td>
							</c:if>
							<c:if test="${stopInfoList.STOPID == null}">
								<td align="center">生产</td>
							</c:if>
							<c:if test="${stopInfoList.STOPID != null}">
								<td align="center">停产</td>
							</c:if>
							<td align="center">
									<a href="${context }/businessPlatfrom/gtc/gtcgl/master?outFallId=${stopInfoList.OUTFALLID}&enterpriseId=${enterpriseId}" id="detail" target="navTab"
										mask="true" title="排口关停产管理" max="false" height="500" width="700" rel="gtcgl_master">关停产管理</a>
							</td>
						</tr>	
					</c:forEach>		
				</tbody>
			</table>
			</div>
	</div>
</div>