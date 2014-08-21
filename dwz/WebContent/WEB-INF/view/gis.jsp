<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	/*
	  制约条件改变方法
	  BY RENWEI 2013/11/21
	*/
	function conditionChange(buttonFlag){
		//非所有企业情况下
		var para="";
		if(buttonFlag == 0){
			var attentionCode = $("#kzcd option:selected").val();
			var kindCode = $("#wrlx option:selected").val();
			var industryCode = $("#hylb option:selected").val();
			$("#division_gis").loadUrl("${context }/division/init?divisionFlag=0&attentionCode="+attentionCode+"&kindCode="+kindCode+"&industryCode="+industryCode);
			para = "&attentionCode="+attentionCode+"&kindCode="+kindCode+"&industryCode="+industryCode;
		//所有企业情况下
		}else{
			$("#kzcd").val("");
			$("#wrlx").val("");
			$("#hylb").val("");
			$("#division_gis").loadUrl("${context }/division/init?divisionFlag=0");
		}
		//alert(para);
		flexGetEnterprise(para);
	}
</script>

	<div id="pageHeader">
		<table class="searchContent" border="0">
		<tr>
			<td>
				<a class="button" onclick="conditionChange(1)" style="height: 24px; margin-top: 0px; margin-left: 5px;"><span>所有企业</span></a>
			</td>
			<td style="vertical-align:middle;">
				<label style="margin-left:8px;">控制程度:</label>
				<select id="kzcd" onchange="conditionChange(0)"  style="margin-top: 2px; ">
					<option value="">所有</option>
					<c:forEach var="kzcdList" items="${kzcdList}">
						<option value="${kzcdList.id.subId}">${kzcdList.subName}</option>
					</c:forEach>
						<option value="3">省直属电厂</option>
				</select>
			</td>
			<td>
				<label style="margin-left:8px;">污染类型:</label>
				<select id="wrlx" onchange="conditionChange(0)"  style="margin-top: 2px; ">
					<option value="">所有</option>
					<c:forEach var="wrlxList" items="${wrlxList}">
						<c:if test="${wrlxList.id.subId !=2}">
							<option value="${wrlxList.id.subId}">${wrlxList.subName}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td>	
				<label style="margin-left:8px;">行业类别:</label>
				<select id="hylb" onchange="conditionChange(0)"  style="margin-top: 2px; ">
					<option value="">所有</option>
					<c:forEach var="hylbList" items="${hylbList}">
						<option value="${hylbList.id.subId}">${hylbList.subName}</option>
					</c:forEach>
				</select>
			</td>
			<td>
<!-- 				<a class="button" href="webroot/rtmonitor/moniter_zdybq_main.html" target="dialog" rel="" width="800" height="600" fresh="false" style="height: 24px; margin-left: 8px;"><span>自定义标签</span></a> -->
			</td>
		</tr>
		</table>
	</div>
	<iframe id="ifr" name="ifr"  width="100%" height="96%" src="${context }/indexGis" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
