<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_zxjcyqxx input {
		border:0;
		width:80%;
	}
	.table_zxjcyqxx select {
		width:80%;
		height:23px;
	}
	.table_zxjcyqxx {
		width:100%;
		margin-top:5px;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_zxjcyqxx td {
		border:1px solid #d0d0d0;
		height:25px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.div_btn {
		width:100%;
	}
	.div_btn ul {
		margin-top:5px;
		margin-bottom:5px;
		float:right;
		margin-right:5px;
	}
	.div_btn ul li {
		float:left;
		margin-left:10px;
	}
</style>
<script type="text/javascript">

/*
 * 水/气监测设备切换
 */
$('input[name="jcyqlx"]').change(function(){
	$("#div_zxjcyqxx_s").hide();
	$("#div_zxjcyqxx_q").hide();
	$("#"+$('input[name="jcyqlx"]:checked').val()).show();
})
/*
 * 运维商下拉框联动
 */
function maintenanceSelect(object,index){
	if(index==1){
		document.getElementById("Mlinkman_1").innerText = object.options(object.selectedIndex).linkman;
		document.getElementById("Mtel_1").innerText = object.options(object.selectedIndex).tel;
	}else if(index==2){
		document.getElementById("Mlinkman_2").innerText = object.options(object.selectedIndex).linkman;
		document.getElementById("Mtel_2").innerText = object.options(object.selectedIndex).tel;
	}
}
/**
 * 生产商下拉框联动
 */
function vendorSelect(object,index){
	if(index==1){
		document.getElementById("Vlinkman_1").innerText = object.options(object.selectedIndex).linkman;
		document.getElementById("Vtel_1").innerText = object.options(object.selectedIndex).tel;
		document.getElementById("licenceNo_1").innerText = object.options(object.selectedIndex).licenceNo;
		document.getElementById("certificateNo_1").innerText = object.options(object.selectedIndex).certificateNo;
	}else if(index==2){
		document.getElementById("Vlinkman_2").innerText = object.options(object.selectedIndex).linkman;
		document.getElementById("Vtel_2").innerText = object.options(object.selectedIndex).tel;
		document.getElementById("licenceNo_2").innerText = object.options(object.selectedIndex).licenceNo;
		document.getElementById("certificateNo_2").innerText = object.options(object.selectedIndex).certificateNo;
	}
}

/**
 * 提交表单、关闭当前页
 */
function submitAddGas(){
	$('#gasButton').submit();
	$.pdialog.closeCurrent();
	return false;
}
function submitAddWater(){
	$('#waterButton').submit();
	$.pdialog.closeCurrent();
	return false;
}

</script>
<div class="pageContent">
	<div class="pageHeader">
		<table class="searchContent" border="0">
			<tr>
				<td>
					<input name="jcyqlx" type="radio" value="div_zxjcyqxx_s" checked="checked" />废水在线监测仪器
					<input name="jcyqlx" type="radio" value="div_zxjcyqxx_q" />废气在线监测仪器
				</td>
			</tr>
		</table>
	</div>		
		
	<div id="div_zxjcyqxx_s" class="pageFormContent">
		<form method="post" action="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/add/water?navTabId=fsjkd_zxjcy_${enIsFlag }" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
			<input type="hidden" name="enterpriseId" value="${enterpriseId}">
			<div class="pageFormContent">
				<p>
					<label>在线监测仪器名称：</label>
					<input class="required" type="text" name="equipName" maxlength="100"/>
				</p>
				<p>
					<label>在线监测仪器型号：</label>
					<input class="required" type="text" name="equipType" maxlength="50"/>
				</p>
				<p>
					<label>最小量程：</label>
					<input class="required number" class="text" type="text"  name="minValue" maxlength="20"/>
				</p>
				<p>
					<label>最大量程：</label>
					<input class="required  number" class="text" type="text"  name="maxValue" maxlength="20"/>
				</p>
				<p>
					<label>启用日期：</label>
					<input type="text" name="startDate" class="date" value=""/><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>代理商：</label>
					<input class="text" type="text" name="agentName" maxlength="200"/>
				</p>
				<p>
					<label>运维单位：</label>
						<select name="Maintenance.maintenId" id="maintenId" onchange="maintenanceSelect(this,1)">
							<option value="">请选择</option>
							<c:forEach var="maintenanceList" items="${maintenanceList}">
								<option value="${maintenanceList.maintenId}" linkman="${maintenanceList.linkman}" tel="${maintenanceList.tel}">${maintenanceList.maintenName}</option>
							</c:forEach>
						</select>
				</p>
				<p>
					<label>运维单位联系人：</label>
					<input class="text" type="text"  name="Maintenance.linkman" id = "Mlinkman_1" readonly/>
				</p>
				<p>
					<label>运维单位联系电话：</label>
					<input class="text" type="text"  name="Maintenance.tel" id = "Mtel_1" readonly/>
				</p>
				<p>
					<label>生产厂商：</label>
						<select name="Vendor.vendorId" id="vendor" onchange="vendorSelect(this,1)">
							<option value="">请选择</option>
							<c:forEach var="vendorList" items="${vendorList}">
								<option value="${vendorList.vendorId}" linkman="${vendorList.linkman}" tel="${vendorList.tel}" licenceNo="${vendorList.licenceNo}" certificateNo="${vendorList.certificateNo}">${vendorList.vendorName}</option>
							</c:forEach>
						</select>
				</p>
				<p>
					<label>生产厂商联系人：</label>
					<input class="text" type="text" name="Vendor.linkman" id = "Vlinkman_1"  readonly/>
				</p>
				<p>
					<label>生产厂商联系电话：</label>
					<input class="text" type="text"  name="Vendor.tel" id = "Vtel_1" readonly/>
				</p>
				<p>
					<label>生产许可证编号：</label>
					<input class="text" type="text" name="Vendor.licenceNo"  id = "licenceNo_1"  readonly/>
				</p>
				<p>
					<label>环保产品认证编号：</label>
					<input class="text" type="text" name="Vendor.certificateNo" id = "certificateNo_1" readonly/>
				</p>
				<p >
					<label>设备出厂编号：</label>
					<input class="text" type="text" name="equipNo" maxlength="50"/>
				</p>
			</div>
			<h1 style="margin-left:10px;">备案登记信息</h1>
			<div class="pageFormContent">
				<p>
					<label>适用性检测报告名称：</label>
					<input class="text" type="text"  name="reportName" maxlength="100"/>
				</p>
				<p>
					<label>测量项目：</label>
					<input class="text" type="text" name="measureItem" maxlength="100" />
				</p>
				<p>
					<label>测试方法：</label>
					<input class="text" type="text" name="measureWay" maxlength="100" />
				</p>
				<p>
					<label>检出限：</label>
					<input class="text" type="text" name="lod" maxlength="100" />
				</p>
				<p>
					<label>试剂名称：</label>
					<input class="text" type="text" name="reagentName" maxlength="100" />
				</p>
				<p>
					<label>试剂浓度：</label>
					<input class="text" type="text" name="reagentDensity" maxlength="6" />
				</p>
				<p>
					<label>试剂有效期：</label>
					<input type="text" name="reagentEndtime" class="date" value=""/><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>加热消解温度：</label>
					<input class="text" type="text" name="clearTemp" maxlength="6" />
				</p>
				<p>
					<label>加热消解时间：</label>
					<input class="text" type="text" name="clearDate" maxlength="6" />
				</p>
				<p>
					<label>标准曲线参数：</label>
					<input class="text" type="text" name="standardParam" maxlength="50" />
				</p>
				<p>
					<label>转换系数：</label>
					<input class="text" type="text" name="converFactor" maxlength="50" />
				</p>
				<p>
				</p>
				<p>
					<label>备注：</label>
					<textarea style="width: 50%" rows="4"  name="remark" maxlength="500"></textarea>
				</p>
			</div>
			<div class="div_btn">
				<ul>
					<li>
						<div class="buttonActive"><div class="buttonContent"><button onclick="submitAddWater();" id="waterButton">保存</button></div></div>
					</li>
					<li>
						<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
					</li>
				</ul>
			</div>
		</form>
	</div>

	<div id="div_zxjcyqxx_q" class="pageFormContent" style="display:none;">
		<form method="post" action="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/add/gas?navTabId=fqjkd_zxjcy_${enIsFlag }" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
			<input type="hidden" name="enterpriseId" value="${enterpriseId}">
			<div class="pageFormContent">
				<p>
					<label>在线监测仪器名称：</label>
					<input class="required" type="text" name="equipName" maxlength="100"/>
				</p>
				<p>
					<label>在线监测仪器型号：</label>
					<input class="required" type="text" name="equipType" maxlength="50"/>
				</p>
				<p>
					<label>最小量程：</label>
					<input class="required" class="text" type="text"  name="minValue" maxlength="6"/>
				</p>
				<p>
					<label>最大量程：</label>
					<input class="required" class="text" type="text"  name="maxValue" maxlength="6"/>
				</p>
				<p>
					<label>启用日期：</label>
					<input type="text" name="startDate" class="date" value=""/><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>运维单位：</label>
						<select name="Maintenance.maintenId" id="maintenId" onchange="maintenanceSelect(this,2)">
							<option value="">请选择</option>
							<c:forEach var="maintenanceList" items="${maintenanceList}">
								<option value="${maintenanceList.maintenId}" linkman="${maintenanceList.linkman}" tel="${maintenanceList.tel}">${maintenanceList.maintenName}</option>
							</c:forEach>
						</select>
				</p>
				<p>
					<label>运维单位联系人：</label>
					<input class="text" type="text"  name="Maintenance.linkman" id = "Mlinkman_2" readonly/>
				</p>
				<p>
					<label>运维单位联系电话：</label>
					<input class="text" type="text"  name="Maintenance.tel" id = "Mtel_2" readonly/>
				</p>
				<p>
					<label>生产厂商：</label>
						<select name="Vendor.vendorId" id="vendor" onchange="vendorSelect(this,2)">
							<option value="">请选择</option>
							<c:forEach var="vendorList" items="${vendorList}">
								<option value="${vendorList.vendorId}" linkman="${vendorList.linkman}" tel="${vendorList.tel}" licenceNo="${vendorList.licenceNo}" certificateNo="${vendorList.certificateNo}">${vendorList.vendorName}</option>
							</c:forEach>
						</select>
				</p>
				<p>
					<label>生产厂商联系人：</label>
					<input class="text" type="text" name="Vendor.linkman" id = "Vlinkman_2"  readonly/>
				</p>
				<p>
					<label>生产厂商联系电话：</label>
					<input class="text" type="text"  name="Vendor.tel" id = "Vtel_2" readonly/>
				</p>
				<p>
					<label>生产许可证编号：</label>
					<input class="text" type="text" name="Vendor.licenceNo"  id = "licenceNo_2"  readonly/>
				</p>
				<p>
					<label>环保产品认证编号：</label>
					<input class="text" type="text" name="Vendor.certificateNo" id = "certificateNo_2" readonly/>
				</p>
				<p>
					<label>代理商：</label>
					<input class="text" type="text" name="agentName" maxlength="100"/>
				</p>
				<p >
					<label>设备出厂编号：</label>
					<input class="text" type="text" name="equipNo" maxlength="50"/>
				</p>
			</div>
			<h1 style="margin-left:10px;">备案登记信息</h1>
			<div class="pageFormContent">
				<p>
					<label>适用性检测报告名称：</label>
					<input class="text" type="text" name="reportName"  maxlength="100"/>
				</p>
				<p>
					<label>测量项目：</label>
					<input class="text" type="text" name="measureItem" maxlength="100" />
				</p>
				<p>
					<label>测试方法：</label>
					<input class="text" type="text" name="measureWay" maxlength="100" />
				</p>
				<p>
					<label>检出限：</label>
					<input class="text" type="text" name="lod"  maxlength="100"/>
				</p>
				<p>
					<label>气水分离冷凝器温度：</label>
					<input class="text" type="text" name="condenserTemp" maxlength="6" />
				</p>
				<p>
					<label>气水分离滤芯正常色：</label>
					<input class="text" type="text" name="normalColor" maxlength="20" />
				</p>
				<p>
					<label>稀释比(稀释法)：</label>
					<input class="text" type="text" name="lowRatio"  maxlength="6"/>
				</p>
				<p>
					<label>稀释气流量(稀释法)：</label>
					<input class="text" type="text" name="lowFlow"  maxlength="6"/>
				</p>
				<p>
					<label>稀释气压力：</label>
					<input class="text" type="text" name="lowPress"  maxlength="6"/>
				</p>
				<p>
					<label>样品气流量：</label>
					<input class="text" type="text" name="sampleFlow" maxlength="6" />
				</p>
				<p>
					<label>样品气压力：</label>
					<input class="text" type="text" name="samplePress"  maxlength="6"/>
				</p>
				<p>
					<label>NO2转换器温度：</label>
					<input class="text" type="text" name="no2Temp" maxlength="6" />
				</p>
				<p>
					<label>速度场系数：</label>
					<input class="text" type="text" name="speedNum"  maxlength="6"/>
				</p>
				<p>
					<label>空气过量系数：</label>
					<input class="text" type="text" name="airNum" maxlength="6" />
				</p>
				<p>
					<label>皮托管系数K值：</label>
					<input class="text" type="text" name="kvalue" maxlength="6" />
				</p>
				<p>
					<label>烟道截面积：</label>
					<input class="text" type="text" name="channelArea" maxlength="6" />
				</p>
				<p></p>
				<p></p>
				<p>
					<label>备注：</label>
					<textarea  style="width:50%;" rows="4"  name="remark" maxlength="500"></textarea>
				</p>
			</div>
			<div class="div_btn">
				<ul>
					<li>
						<div class="buttonActive"><div class="buttonContent"><button onclick="submitAddGas();" id="gasButton">保存</button></div></div>
					</li>
					<li>
						<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>
