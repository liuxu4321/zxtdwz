<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_hybz select {width:85%; height:23px;}
	.table_hybz {width:100%; border-collapse: collapse; padding:0; margin-top:10px;}
	.table_hybz tr td {height:25px; font-size: 12px; padding:1px 2px;}
</style>
<script type="text/javascript">
	/*关闭当前弹出页*/
	/* $("#closeXzpfbz").click(function(){
		$.pdialog.closeCurrent();
		return false;}); */
		/*选择带回*/
		$("#choiceXzpfbz").click(function(){
			var standardId = $("tr[name='standardIdTr'].selected").attr("rel");
			if(standardId != null){
				var pollutantName = $("td[name='pollutantName_"+standardId+"']").find("div").html();
				var typeCode = $("td[name='typeCode_"+standardId+"']").find("div").html();
				var rangeCode = $("td[name='rangeCode_"+standardId+"']").find("div").html();
				var endDate = $("td[name='endDate_"+standardId+"']").find("div").html();
				var standardLevel = $("td[name='standardLevel_"+standardId+"']").find("div").html();
				var standardValue = $("td[name='standardValue_"+standardId+"']").find("div").html().trim();
				$.bringBack({standardId: standardId ,
							pollutantName: pollutantName,
							typeCode: typeCode,
							rangeCode: rangeCode,
							endDate: endDate,
							standardLevel: standardLevel,
							standardValue: standardValue
							});
				}else{
					alertMsg.info("请选择排放标准！");
				}
			});
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li id="choiceXzpfbz"><a class="add"><span>保存</span></a></li>
			<li id="closeXzpfbz"><a class="delete" ><span>返回</span></a></li>
		</ul>
	</div>	
	
	<table class="table" width="100%" layoutH="70">
		<col align="center"/>
		<thead>
			<tr>				
				<th align="center" width="14%">污染物名称</th>
				<th align="center" width="13%">标准类型</th>
				<th align="center" width="18%">标准适用年限</th>
				<th align="center" width="19%">标准适用范围</th>
				
				<th align="center" width="12%">标准级别</th>
				<th align="center" width="12%">标准值</th>
				<th align="center" width="17%">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="blowoffStandard" items="${page.result }">				
				<tr rel="${blowoffStandard.standardId }" target="standardId" name="standardIdTr">
					<td name="pollutantName_${blowoffStandard.standardId }" align="center">${blowoffStandard.pollutant.chineseName }</td>
					<td name="typeCode_${blowoffStandard.standardId }" align="center"><%-- ${blowoffStandard.typeCode } --%>
						<c:forEach var="typeCode" items="${typeCodeSelectMap }">
							<c:if test="${blowoffStandard.typeCode == typeCode.key }">${typeCode.value }</c:if>
						</c:forEach>
					</td>
					<td name="endDate_${blowoffStandard.standardId }" align="center">${blowoffStandard.endDate }</td>
					<td name="rangeCode_${blowoffStandard.standardId }" align="center">
						<c:forEach var="rangeCode" items="${rangeCodeSelectMap }">
							<c:if test="${blowoffStandard.rangeCode == rangeCode.key }">${rangeCode.value }</c:if>
						</c:forEach>
					</td>
					
					<%-- <td align="center">
						${blowoffStandard.standardLevel }
					</td> --%>
					<td align="center" name="standardLevel_${blowoffStandard.standardId }">
						<c:forEach var="level" items="${standardLevelSelectMap }">
							<c:if test="${blowoffStandard.standardLevel == level.key }">${level.value }</c:if>
						</c:forEach>
					</td>
					<td align="center" name="standardValue_${blowoffStandard.standardId }">
						${blowoffStandard.standardValue }
					</td>
					<td align="center">${blowoffStandard.remark }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	