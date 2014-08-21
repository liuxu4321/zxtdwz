<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" layoutH="0">	
	<form class="pageForm required-validate" action="${context }/businessPlatfrom/dataGather/sjcjyxx/edit/save?navTabId=sjcjyxx_${dataGather.enterprise.isFlag }" onsubmit="return validateCallback(this,navTabAjaxDone)" method="post">
		<div class="panel collapse">
			<h1>基本信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
						<dt>数采仪序号：</dt>
						<dd><input class="required" type="text" name="mn" value="${dataGather.mn }" readonly="readonly" /></dd>
					</dl>
					<dl>
						<dt>所属企业：</dt>
						<dd>
							<input class="required" type="text" readonly="readonly" value="${dataGather.enterprise.enterpriseName }" />
							<input type="hidden" name="enterprise.enterpriseId" value="${dataGather.enterprise.enterpriseId }" />
						</dd>
					</dl>
					<dl <c:if test="${dataGather.isUsed !=1 || mon.monId == null }">style='display:none;'</c:if> >
						<dt>所属监控点：</dt>
						<dd>
							<input type="text" value="${mon.monName }" readonly="readonly" />
							<input type="hidden" name="monId" value="${mon.monId }" readonly="readonly" />
						</dd>
					</dl>
					<dl>
						<dt>SIM卡号：</dt>
						<dd><input type="text" name="simno" value="${dataGather.simno }" /></dd>
					</dl>
					<dl>
						<dt>计算公式：</dt>
						<dd>
							<select name="calcId" class="required">
								<option value="">请选择</option>
								<c:forEach var="calc" items="${calcSelectMap }">
									<option value="${calc.key }" <c:if test="${calc.key==dataGather.calcId }">selected='selected'</c:if> >${calc.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>数据传输方式：</dt>
						<dd>
							<select name="datatransCode">
								<option value="">请选择</option>
								<c:forEach var="datatrans" items="${datatransSelectMap }">
									<option value="${datatrans.key }" <c:if test="${datatrans.key==dataGather.datatransCode }">selected='selected'</c:if>>${datatrans.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>运维单位：</dt>
						<dd>
							<select name="maintenId">
								<option value="">请选择</option>
								<c:forEach var="maintenance" items="${maintenanceList }">
									<option value="${maintenance.maintenId }" <c:if test="${maintenance.maintenId==dataGather.maintenance.maintenId }">selected='selected'</c:if>>${maintenance.maintenName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>生产厂商：</dt>
						<dd>
							<select name="vendorId">
								<option value="">请选择</option>
								<c:forEach var="vendor" items="${vendorList }">
									<option value="${vendor.vendorId }" <c:if test="${vendor.vendorId==dataGather.vendor.vendorId }">selected='selected'</c:if>>${vendor.vendorName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>上报IP地址1：</dt>
						<dd><input type="text" name="ip1" value="${dataGather.ip1 }" /></dd>
					</dl>
					<dl>
						<dt>上报端口号1：</dt>
						<dd><input type="text" name="port1" value="${dataGather.port1 }" /></dd>
					</dl>
					<dl>
						<dt>上报IP地址2：</dt>
						<dd><input type="text" name="ip2" value="${dataGather.ip2 }" /></dd>
					</dl>
					<dl>
						<dt>上报端口号2：</dt>
						<dd><input type="text" name="port2" value="${dataGather.port2 }" /></dd>
					</dl>
					<dl>
						<dt>上报IP地址3：</dt>
						<dd><input type="text" name="ip3" value="${dataGather.ip3 }" /></dd>
					</dl>
					<dl>
						<dt>上报端口号3：</dt>
						<dd><input type="text" name="port3" value="${dataGather.port3 }" /></dd>
					</dl>
					<dl>
						<dt>上报IP地址4：</dt>
						<dd><input type="text" name="ip4" value="${dataGather.ip4 }" /></dd>
					</dl>
					<dl>
						<dt>上报端口号4：</dt>
						<dd><input type="text" name="port4" value="${dataGather.port4 }" /></dd>
					</dl>
					<dl>
						<dt>启用日期：</dt>
						<dd>
							<input type="text" name="startDate" class="date" readonly="readonly" value="<fmt:formatDate value='${dataGather.startDate }' pattern='yyyy-MM-dd'/>"/>
							<a class="inputDateButton" href="javascript:;">选择</a>
						</dd>
					</dl>
					<!-- 2013 12 12 delete star -->
					<%-- <dl>
						<dt>是否启用：</dt>
						<dd>
							<input type="radio" name="isUsed" value="1" <c:if test="${dataGather.isUsed==1 }">checked='checked'</c:if>/>在用
							<input type="radio" name="isUsed" value="0" <c:if test="${dataGather.isUsed==0 }">checked='checked'</c:if>/>停用
						</dd>
					</dl>--%>
					<!-- 2013 12 12 delete star -->
					<dl>
						<dt>是否可用：</dt>
						<dd>
							<input type="radio" name="isValid" value="1" <c:if test="${dataGather.isValid==1 }">checked='checked'</c:if>/>可用<!-- <span style="color: green;">(启用)</span> -->
							<input type="radio" name="isValid" value="0" <c:if test="${dataGather.isValid==0 }">checked='checked'</c:if>/>不可用<span style="color: red;">(删除)</span>
						</dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="panel close collapse">
			<h1 style="margin-top:5px;margin-bottom:5px;">备案登记信息</h1>
			<div class="pageFormContent">
				<fieldset>					
					<dl>
						<dt>适用性检测报告名称：</dt>
						<dd><input type="text" name="reportName" value="${dataGather.reportName }" /></dd>
					</dl>
					<dl>
						<dt>设备出厂编号：</dt>
						<dd><input type="text" name="equipNo" value="${dataGather.equipNo }" /></dd>
					</dl>
					<dl>
						<dt>代理商：</dt>
						<dd><input type="text" name="agent" value="${dataGather.agent }" /></dd>
					</dl>
					<dl>
						<dt>接收信号类型：</dt>
						<dd>
							<select name="signalTypecode">
								<option value="">请选择</option>
								<c:forEach var="signalType" items="${signalTypeSelectMap }">
									<option value="${signalType.key }" <c:if test="${signalType.key==dataGather.signalTypecode }">selected='selected'</c:if>>${signalType.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>通讯协议：</dt>
						<dd>
							<select name="protocolCode">
								<option value="">请选择</option>
								<c:forEach var="protocol" items="${protocolSelectMap }">
									<option value="${protocol.key }" <c:if test="${protocol.key==dataGather.protocolCode }">selected='selected'</c:if>>${protocol.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>设备型号：</dt>
						<dd><input type="text" name="equipType" value="${dataGather.equipType }" /></dd>
					</dl>
					<dl>
						<dt>显示单元显示项目名称：</dt>
						<dd><input type="text" name="itemName" value="${dataGather.itemName }" /></dd>
					</dl>
					<dl>
						<dt>数字输入通道数量：</dt>
						<dd><input type="text" name="digitalNum" value="${dataGather.digitalNum }" /></dd>
					</dl>
					<dl>
						<dt>模拟量输入通道数量：</dt>
						<dd><input type="text" name="analogNum" value="${dataGather.analogNum }" /></dd>
					</dl>
					<dl>
						<dt>开关量输入通道数量：</dt>
						<dd><input type="text" name="switchNum" value="${dataGather.switchNum }" /></dd>
					</dl>
					<dl>
						<dt>存储容量（KB）：</dt>
						<dd><input type="text" name="storageCapacity" value="${dataGather.storageCapacity }" /></dd>
					</dl>
					<dl>
						<dt>备注：</dt>
						<dd><textarea name="remark">${dataGather.remark }</textarea></dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>