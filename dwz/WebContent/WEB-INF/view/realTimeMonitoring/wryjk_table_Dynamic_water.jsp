<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	/*
	* DWR
	*/
	var chartsMonWaterTableData =new Array();
	var dateTimeWaterTable = $("#dateTimeWaterTable").val();
	function getDWRMonWaterData() {
		var monId = $("#monId").val();
		dwrController.getRealTimeMonWaterData(monId,dateTimeWaterTable, getDWRMonWaterTableDataReturn);
	}
	
	function getDWRMonWaterTableDataReturn(data){
		chartsMonWaterTableData = data;
		dateTimeWaterTable = chartsMonWaterTableData[5];
	}
</script>

<script type="text/javascript">	
$(document).ready(function(){
	for(var i = 0; i<intervalArr.length;i++){
		if(intervalArr[i] != ""&&intervalArr[i] != null){
			window.clearInterval(intervalArr[i]);
		}
	}
	getDWRMonWaterData();
	intervalArr[4] = setInterval(function() {
		getDWRMonWaterData();
		var table = document.getElementById("dataTableD_water");
		if(chartsMonWaterTableData[4]=="1"){
			//table.deleteRow(9);
			var row = table.insertRow(0);
			var positionIndex=[5,0,1,6];
			for(var i=0;i<4;i++){
				var cell=document.createElement ("td"); 
				cell.style.textAlign = "center";
				if(i==0){
					var showDate = chartsMonWaterTableData[positionIndex[i]].substr(0,4)+"-"+chartsMonWaterTableData[positionIndex[i]].substr(4,2)+"-"
					+chartsMonWaterTableData[positionIndex[i]].substr(6,2)+" "+chartsMonWaterTableData[positionIndex[i]].substr(8,2)+":"
					+chartsMonWaterTableData[positionIndex[i]].substr(10,2)+":"+chartsMonWaterTableData[positionIndex[i]].substr(12,2);
					cell.innerHTML =showDate+"&nbsp";
				}else{
					cell.innerHTML = chartsMonWaterTableData[positionIndex[i]]+"&nbsp";
				}
				row.appendChild(cell);
			}
		}
	}, 15000);
});
</script>

<input type="hidden" id="dateTimeWaterTable" value="${dateTimeWaterTable}">
<input type="hidden" id="monId" value="${monId}">
<input type="hidden" id="monKind" value="${monKind}">
<table  class="table" layoutH="30" style="width: 98%;">
	<thead>
		<tr>
			<th width="25%" align="center">时间</th>
			<th width="25%" align="center">氨氮浓度(mg/L)</th>
			<th width="25%" align="center">化学需氧量浓度(mg/L)</th>
			<th width="25%" align="center">污水流量(m³/h)</th>
		</tr>
	</thead>
	<tbody id="dataTableD_water">
		<c:forEach var="resultData" items="${resultData}" varStatus="status">
			<tr>
				<td align="center">${resultData.dateTime}</td>
				<td align="center">${resultData.NHP}</td>
				<td align="center">${resultData.COD}</td>
				<td align="center">${resultData.WTD}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

