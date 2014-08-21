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
 * 运维商下拉框联动
 */
function maintenanceSelect(object){
	document.getElementById("Mlinkman").innerText = object.options(object.selectedIndex).linkman;
	document.getElementById("Mtel").innerText = object.options(object.selectedIndex).tel;
}

/**
 * 生产商下拉框联动
 */
function vendorSelect(object){
	document.getElementById("Vlinkman").innerText = object.options(object.selectedIndex).linkman;
	document.getElementById("Vtel").innerText = object.options(object.selectedIndex).tel;
	document.getElementById("licenceNo").innerText = object.options(object.selectedIndex).licenceNo;
	document.getElementById("certificateNo").innerText = object.options(object.selectedIndex).certificateNo;
}

/**
 * 提交表单、关闭当前页
 */
function dialogAjaxDone(){
	$.pdialog.closeCurrent();
	return false;
}

</script>
<div class="pageContent">
	<form method="post" action="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/edit/water?navTabId=zxjcyqsz_${enIsFlag }&callbackType=closeCurrent" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
		<input type="hidden" name="enterpriseId" value="${enterpriseId}">
		<input type="hidden" name="equipId" value="${equipment.equipId}">
		<div class="pageFormContent">
			<p>
				<label>在线监测仪器名称：</label>
				<input class="required" type="text" name="equipName" value="${equipment.equipName}" maxlength="100"/>
			</p>
			<p>
				<label>在线监测仪器型号：</label>
				<input class="required" type="text" name="equipType" value="${equipment.equipType}" maxlength="50"/>
			</p>
			<p>
				<label>最小量程：</label>
				<input class="required number" class="text" type="text"  name="minValue" value="${equipment.minValue}" maxlength="20"/>
			</p>
			
			<p>
				<label>最大量程：</label>
				<input class="required number" class="text" type="text"  name="maxValue" value="${equipment.maxValue}" maxlength="20"/>
			</p>
			<p>
				<label>启用日期：</label>
				<input type="text" name="startDate" class="date" value="${equipment.startDate}"/><a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			
			<p>
				<label>代理商：</label>
				<input class="text" type="text" name="agentName" value="${equipment.agentName}" maxlength="200"/>
			</p>
			
			<p>
				<label>运维单位：</label>
				<select name="Maintenance.maintenId" id="maintenId" onchange="maintenanceSelect(this)" >
					<c:forEach var="maintenanceList" items="${maintenanceList}">
						<c:choose>
							<c:when test="${maintenanceList.maintenId == equipment.maintenance.maintenId}">
								<option value="${maintenanceList.maintenId}" linkman="${maintenanceList.linkman}" tel="${maintenanceList.tel}" selected="selected">${maintenanceList.maintenName}</option>								
							</c:when>
							<c:otherwise>
								<option value="${maintenanceList.maintenId}" linkman="${maintenanceList.linkman}" tel="${maintenanceList.tel}">${maintenanceList.maintenName}</option>								
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</p>
			
			<p>
				<label>运维单位联系人：</label>
				<input class="text" type="text"  name="Maintenance.linkman" id = "Mlinkman" value="${equipment.maintenance.linkman}" readonly/>
			</p>
			<p>
				<label>运维单位联系电话：</label>
				<input class="text" type="text"  name="Maintenance.tel" id = "Mtel" value="${equipment.maintenance.tel}" readonly/>
			</p>
			<p>
				<label>生产厂商：</label>
				<select name="Vendor.vendorId" id="vendor" onchange="vendorSelect(this)">
						<c:forEach var="vendorList" items="${vendorList}">
							<c:choose>
								<c:when test="${vendorList.vendorId == equipment.vendor.vendorId}">
									<option value="${vendorList.vendorId}" linkman="${vendorList.linkman}" tel="${vendorList.tel}" licenceNo="${vendorList.licenceNo}" certificateNo="${vendorList.certificateNo}" selected="selected">${vendorList.vendorName}</option>
								</c:when>
								<c:otherwise>
									<option value="${vendorList.vendorId}" linkman="${vendorList.linkman}" tel="${vendorList.tel}" licenceNo="${vendorList.licenceNo}" certificateNo="${vendorList.certificateNo}">${vendorList.vendorName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select>
			</p>
			<p>
				<label>生产厂商联系人：</label>
				<input class="text" type="text" name="Vendor.linkman" id = "Vlinkman" value="${equipment.vendor.linkman}" readonly/>
			</p>
			<p>
				<label>生产厂商联系电话：</label>
				<input class="text" type="text"  name="Vendor.tel" id = "Vtel" value="${equipment.vendor.tel}" readonly/>
			</p>
			<p>
				<label>生产许可证编号：</label>
				<input class="text" type="text" name="Vendor.licenceNo"  id = "licenceNo" value="${equipment.vendor.licenceNo}" readonly/>
			</p>
			<p>
				<label>环保产品认证编号：</label>
				<input class="text" type="text" name="Vendor.certificateNo" id = "certificateNo" value="${equipment.vendor.certificateNo}" readonly/>
			</p>
			<p >
				<label>设备出厂编号：</label>
				<input class="text" type="text" name="equipNo" value="${equipment.equipNo}" maxlength="50"/>
			</p>
		</div>
		<h1 style="margin-left:10px;">备案登记信息</h1>
		<div class="pageFormContent" layoutH="390">
			<p>
				<label>适用性检测报告名称：</label>
				<input class="text" type="text"  name="reportName" value="${equipment.reportName}" maxlength="100"/>
			</p>
			<p>
				<label>测量项目：</label>
				<input class="text" type="text" name="measureItem" value="${equipment.measureItem}" maxlength="100"/>
			</p>
			<p>
				<label>测试方法：</label>
				<input class="text" type="text" name="measureWay" value="${equipment.measureWay}" maxlength="100"/>
			</p>
			<p>
				<label>检出限：</label>
				<input class="text" type="text" name="lod" value="${equipment.lod}" maxlength="100"/>
			</p>
			<p>
				<label>试剂名称：</label>
				<input class="text" type="text" name="reagentName" value="${equipment.reagentName}"  maxlength="100"/>
			</p>
			<p>
				<label>试剂浓度：</label>
				<input class="text" type="text" name="reagentDensity" value="${equipment.reagentDensity}"  maxlength="6"/>
			</p>
			<p>
				<label>试剂有效期：</label>
				<input type="text" name="reagentEndtime" class="date" value="${equipment.reagentEndtime}"/><a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p>
				<label>加热消解温度：</label>
				<input class="text" type="text" name="clearTemp" value="${equipment.clearTemp}" maxlength="6"/>
			</p>
			<p>
				<label>加热消解时间：</label>
				<input class="text" type="text" name="clearDate" value="${equipment.clearDate}" maxlength="6"/>
			</p>
			<p>
				<label>标准曲线参数：</label>
				<input class="text" type="text" name="standardParam" value="${equipment.standardParam}" maxlength="50"/>
			</p>
			<p>
				<label>转换系数：</label>
				<input class="text" type="text" name="converFactor" value="${equipment.converFactor}" maxlength="50"/>
			</p>
			<p>
			</p>
			<p>
				<label>备注：</label>
				<textarea style="width: 50%" rows="4"  name="remark" maxlength="500">${equipment.remark}</textarea>
			</p>
		</div>
		<div class="div_btn">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
