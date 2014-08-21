<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" layoutH="0">	
	<form class="pageForm required-validate"
		action="${context }/businessPlatfrom/dataGather/sjcjyxx/add/save?navTabId=sjcjyxx_${enterprise.isFlag }&callbackType=closeCurrent"
		onsubmit="return validateCallback(this,navTabAjaxDone)" method="post">
		<div class="panel collapse">
			<h1>基本信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
						<dt>数采仪序号：</dt>
						<dd>
							<input class="required alphanumeric" type="text" name="mn" />
						</dd>
					</dl>
					<dl>
						<dt>所属企业：</dt>
						<dd>
							<input class="required" type="text" readonly="readonly"
								value="${enterprise.enterpriseName }" /> <input type="hidden"
								name="enterprise.enterpriseId"
								value="${enterprise.enterpriseId }" />
						</dd>
					</dl>
					<%-- <dl>
						<dt>所属监控点：</dt>
						<dd>
							<select name="monId">
								<option value="">请选择</option>
								<c:forEach var="mon" items="${monSelectMap }">
									<option value="${mon.key }">${mon.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl> --%>
					<dl>
						<dt>SIM卡号：</dt>
						<dd>
							<input type="text" name="simno" />
						</dd>
					</dl>
					<dl>
						<dt>计算公式：</dt>
						<dd>
							<select name="calcId" class="required">
								<option value="">请选择</option>
								<c:forEach var="calc" items="${calcSelectMap }">
									<option value="${calc.key }">${calc.value }</option>
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
									<option value="${datatrans.key }">${datatrans.value }</option>
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
									<option value="${maintenance.maintenId }">${maintenance.maintenName
										}</option>
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
									<option value="${vendor.vendorId }">${vendor.vendorName
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>启用日期：</dt>
						<dd>
							<input type="text" name="startDate" class="date"
								readonly="readonly" /> <a class="inputDateButton"
								href="javascript:;">选择</a>
						</dd>
					</dl>
					<dl>
						<dt>上报IP地址1：</dt>
						<dd>
							<input type="text" name="ip1" />
						</dd>
					</dl>
					<dl>
						<dt>上报端口号1：</dt>
						<dd>
							<input type="text" name="port1" />
						</dd>
					</dl>
					<dl>
						<dt>上报IP地址2：</dt>
						<dd>
							<input type="text" name="ip2" />
						</dd>
					</dl>
					<dl>
						<dt>上报端口号2：</dt>
						<dd>
							<input type="text" name="port2" />
						</dd>
					</dl>
					<dl>
						<dt>上报IP地址3：</dt>
						<dd>
							<input type="text" name="ip3" />
						</dd>
					</dl>
					<dl>
						<dt>上报端口号3：</dt>
						<dd>
							<input type="text" name="port3" />
						</dd>
					</dl>
					<dl>
						<dt>上报IP地址4：</dt>
						<dd>
							<input type="text" name="ip4" />
						</dd>
					</dl>
					<dl>
						<dt>上报端口号4：</dt>
						<dd>
							<input type="text" name="port4" />
						</dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="panel close collapse">
			<h1>备案登记信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<!-- <table class="table_sjcjyxx">
						<col width="20%" align="right"/>
						<col width="30%" align="left"/>
						<col width="20%" align="right"/>
						<col width="30%" align="left"/>
						<tr>
							<td>适用性检测报告名称：</td>
							<td colspan="3">
								<input type="text" />
							</td>
						</tr>
						<tr>
							<td>设备出厂编号：</td>
							<td>
								<input type="text" />
							</td>
							<td>代理商：</td>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<td>生产许可证编号：</td>
							<td>
								<input type="text" />
							</td>
							<td>环保产品认证编号：</td>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<td>接收信号类型：</td>
							<td>
								<select>
									<option></option>
								</select>
							</td>
							<td>通讯协议：</td>
							<td>
								<select>
									<option></option>
									<option>212协议</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>设备型号：</td>
							<td>
								<input type="text" />
							</td>
							<td>显示单元显示项目名称：</td>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<td>数字输入通道数量：</td>
							<td>
								<input type="text" />
							</td>
							<td>模拟量输入通道数量：</td>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<td>开关量输入通道数量：</td>
							<td>
								<input type="text" />
							</td>
							<td>存储容量（KB）：</td>
							<td>
								<input type="text" />
							</td>
						</tr>
						<tr>
							<td>备注：</td>
							<td colspan="3" style="border-top:0;">
								<textarea style="width:100%;margin:0;border:0;" rows="4"></textarea>
							</td>
						</tr>
					</table>
					<div class="div_btn">
						<ul>
							<li>
								<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
							</li>
							<li>
								<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
							</li>
						</ul>
					</div> -->
					<dl>
						<dt>适用性检测报告名称：</dt>
						<dd>
							<input type="text" name="reportName" />
						</dd>
					</dl>
					<dl>
						<dt>设备出厂编号：</dt>
						<dd>
							<input type="text" name="equipNo" />
						</dd>
					</dl>
					<dl>
						<dt>代理商：</dt>
						<dd>
							<input type="text" name="agent" />
						</dd>
					</dl>
					<dl>
						<dt>接收信号类型：</dt>
						<dd>
							<select name="signalTypecode">
								<option value="">请选择</option>
								<c:forEach var="signalType" items="${signalTypeSelectMap }">
									<option value="${signalType.key }">${signalType.value
										}</option>
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
									<option value="${protocol.key }">${protocol.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>设备型号：</dt>
						<dd>
							<input type="text" name="equipType" />
						</dd>
					</dl>
					<dl>
						<dt>显示单元显示项目名称：</dt>
						<dd>
							<input type="text" name="itemName" />
						</dd>
					</dl>
					<dl>
						<dt>数字输入通道数量：</dt>
						<dd>
							<input type="text" name="digitalNum" />
						</dd>
					</dl>
					<dl>
						<dt>模拟量输入通道数量：</dt>
						<dd>
							<input type="text" name="analogNum" />
						</dd>
					</dl>
					<dl>
						<dt>开关量输入通道数量：</dt>
						<dd>
							<input type="text" name="switchNum" />
						</dd>
					</dl>
					<dl>
						<dt>存储容量（KB）：</dt>
						<dd>
							<input type="text" name="storageCapacity" />
						</dd>
					</dl>
					<dl>
						<dt>备注：</dt>
						<dd>
							<textarea name="remark"></textarea>
						</dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">提交</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>