<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	/*
	* DWR
	*/
	var chartsMonGasTableData =new Array();
	var dateTimeGasTable = $("#dateTimeGasTable").val();
	function getDWRMonGasData() {
		var monId = $("#monId").val();
		dwrController.getRealTimeMonGasData(monId,dateTimeGasTable,getDWRMonGasTableDataReturn);
	}
	
	function getDWRMonGasTableDataReturn(data){
		chartsMonGasTableData = data;
		dateTimeGasTable = chartsMonGasTableData[7];
	}
</script>

<script type="text/javascript">

$(document).ready(function(){
	for(var i = 0; i<intervalArr.length;i++){
		if(intervalArr[i] != ""&&intervalArr[i] != null){
			window.clearInterval(intervalArr[i]);
		}
	}
	getDWRMonGasData();
	intervalArr[4] = setInterval(function() {
		getDWRMonGasData();
		var table = document.getElementById("dataTableD_gas");
		if(chartsMonGasData[6]=="1"){
			//table.deleteRow(9);
			var row = table.insertRow(0);
			var positionIndex=[7,0,1,2,8,9,10,11];
			for(var i=0;i<8;i++){
				var cell=document.createElement ("td"); 
				cell.style.textAlign = "center";
				if(i==1){
					var showDate = chartsMonGasTableData[positionIndex[i]].substr(0,4)+"-"+chartsMonGasTableData[positionIndex[i]].substr(4,2)+"-"
					+chartsMonGasTableData[positionIndex[i]].substr(6,2)+" "+chartsMonGasTableData[positionIndex[i]].substr(8,2)+":"
					+chartsMonGasTableData[positionIndex[i]].substr(10,2)+":"+chartsMonGasTableData[positionIndex[i]].substr(12,2);
					cell.innerHTML = showDate+"&nbsp";
				}else{
					cell.innerHTML = chartsMonGasTableData[positionIndex[i]]+"&nbsp";
				}
				row.appendChild(cell);
			}
		}
	}, 15000);
});
</script>
<input type="hidden" id="dateTimeGasTable" value="${dateTimeGasTable}">
<input type="hidden" id="monId" value="${monId}">
<input type="hidden" id="monKind" value="${monKind}">

<table class="table" layoutH="30"  style="width: 98%;">
	<thead>
		<tr>
			<th width="12.5%" align="center">时间</th>
			<th width="12.5%" align="center">氮氧化物浓度(mg/m³)</th>
			<th width="12.5%" align="center">烟尘浓度(mg/m³)</th>
			<th width="12.5%" align="center">二氧化硫浓度(mg/m³)</th>
			<th width="12.5%" align="center">氧(%)</th>
			<th width="12.5%" align="center">温度(℃)</th>
			<th width="12.5%" align="center">流速(m/s)</th>
			<th width="12.5%" align="center">流量(mg/m³)</th>
		</tr>
	</thead>
	<tbody id="dataTableD_gas">
		<c:forEach var="resultData" items="${resultData}" varStatus="status">
			<tr>
				<td align="center">${resultData.dateTime}</td>
				<td align="center">${resultData.NHX}</td>
				<td align="center">${resultData.TSP}</td>
				<td align="center">${resultData.SO2}</td>
				<td align="center">${resultData.O2}</td>
				<td align="center">${resultData.temperature}</td>
				<td align="center">${resultData.speed}</td>
				<td align="center">${resultData.flow}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
