<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	function checkInput1(_this, spanId) {//输入格式为9999.99
		var inputValue = _this.value;
		if (inputValue.match(/^\d{0,4}(\.\d{1,2})?$/) != null) {
			var $dasd = $("span[style*='block'][class='error']").size();
			document.getElementById(spanId).style.display = "none";
			if ($dasd == 1) {
				document.getElementById("submitBtn").disabled = false;
			}
			return false;
		} else {
			document.getElementById(spanId).style.display = "block";
			document.getElementById("submitBtn").disabled = true;
			return false;
		}
	}

	function checkInput2(_this, spanId) {//输入格式为99.9999
		var inputValue = _this.value;
		if (inputValue.match(/^\d{0,2}(\.\d{1,4})?$/) != null) {
			var $dasd = $("span[style*='block'][class='error']").size();
			document.getElementById(spanId).style.display = "none";
			if ($dasd == 1) {
				document.getElementById("submitBtn").disabled = false;
			}
			return false;
		} else {
			document.getElementById(spanId).style.display = "block";
			document.getElementById("submitBtn").disabled = true;
			return false;
		}
	}
</script>
<div class="pageContent" layoutH="0">
	<form class="pageForm required-validate"
		action="${context }/businessPlatfrom/jkd/fqjkd/add/save?navTabId=fqjkd_${enterprise.isFlag }&callbackType=closeCurrent"
		onsubmit="return validateCallback(this,navTabAjaxDone)" method="post">
		<div class="panel collapse">
			<h1>基本信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
						<dt>监控点名称：</dt>
						<dd>
							<input name="monName" type="text" class="required"
								maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>所属企业：</dt>
						<dd>
							<input class="required" type="text" readonly="readonly"
								value="${enterprise.enterpriseName }" /> <input
								name="enterprise.enterpriseId" type="hidden"
								value="${enterprise.enterpriseId }" />
						</dd>
					</dl>
					<dl>
						<dt>经度：</dt>
						<dd>
							<input name="longitude" class="degreee" type="text"
								style="float: none; width: 10%;" maxlength="3" />° <input
								name="longitude" class="clock" type="text"
								style="float: none; width: 10%;" maxlength="2" />′ <input
								name="longitude" class="clock" type="text"
								style="float: none; width: 10%;" maxlength="2" />″
						</dd>
					</dl>
					<dl>
						<dt>纬度：</dt>
						<dd>
							<input name="latitude" class="degreee" type="text"
								style="float: none; width: 10%;" maxlength="3" />° <input
								name="latitude" class="clock" type="text"
								style="float: none; width: 10%;" maxlength="2" />′ <input
								name="latitude" class="clock" type="text"
								style="float: none; width: 10%;" maxlength="2" />″
						</dd>
					</dl>
					<dl>
						<dt>流向：</dt>
						<dd>
							<select name="outfallGas.outfallId" class="required">
								<option value="">请选择</option>
								<c:forEach var="outfall" items="${outfallSelectMap }">
									<option value="${outfall.key }">${outfall.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>进出口类型：</dt>
						<dd>
							<select name="inoutType" class="required">
								<option value="">请选择</option>
								<c:forEach var="inoutType" items="${inoutTypeSelectMap }">
									<option value="${inoutType.key }">${inoutType.value }</option>
								</c:forEach>
							</select>
							<span style="color: red;">*</span>
						</dd>
					</dl>
					<dl>
						<dt>是否烧结：</dt>
						<dd>
							<input name="isSintering" type="radio" value="1">是 <input
								name="isSintering" type="radio" value="0" checked="checked">否
						</dd>
					</dl>
					<dl>
						<dt>烟道截面积：</dt>
						<dd>
							<input name="crossArea" type="text" class="required"
								maxlength="7" onblur="checkInput1(this,'checkInput1');" /> <span
								id="checkInput1" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>空气系数：</dt>
						<dd>
							<input name="airCoefficient" type="text" class="required"
								maxlength="7" onblur="checkInput2(this,'checkInput2');" /> <span
								id="checkInput2" class="error" style="display: none;">输入格式为99.9999</span>
						</dd>
					</dl>
					<dl>
						<dt>斜率：</dt>
						<dd>
							<input name="rakeTatio" type="text" class="required "
								maxlength="7" onblur="checkInput2(this,'checkInput3');" /> <span
								id="checkInput3" class="error" style="display: none;">输入格式为99.9999</span>
						</dd>
					</dl>
					<dl>
						<dt>截距：</dt>
						<dd>
							<input name="intercept" type="text" class="required"
								maxlength="7" onblur="checkInput2(this,'checkInput4');" /> <span
								id="checkInput4" class="error" style="display: none;">输入格式为99.9999</span>
						</dd>
					</dl>
					<dl>
						<dt>含湿量：</dt>
						<dd>
							<input name="waterContent" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput12');"  class="required"/> <span
								id="checkInput12" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>流向类型：</dt>
						<dd>
							<select name="flowtypeCode" class="required">
								<option value="">请选择</option>
								<c:forEach var="flowtype" items="${flowtypeSelectMap }">
									<option value="${flowtype.key }">${flowtype.value }</option>
								</c:forEach>
							</select>
							<span style="color: red;">*</span>
						</dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="panel close collapse">
			<h1>备案登记信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
						<dt>位置：</dt>
						<dd>
							<input name="address" type="text" maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>废气监控点类型：</dt>
						<dd>
							<select name="monTypecode">
								<option value="">请选择</option>
								<c:forEach var="monType" items="${monTypeSelectMap }">
									<option value="${monType.key }">${monType.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>标志牌安装形式：</dt>
						<dd>
							<select name="signForm">
								<option value="">请选择</option>
								<c:forEach var="signForm" items="${signFormSelectMap }">
									<option value="${signForm.key }">${signForm.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>排放规律：</dt>
						<dd>
							<select name="letRule">
								<option value="">请选择</option>
								<c:forEach var="letRule" items="${letRuleSelectMap }">
									<option value="${letRule.key }">${letRule.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>气域功能区类别：</dt>
						<dd>
							<select name="gasCode">
								<option value="">请选择</option>
								<c:forEach var="gasCode" items="${gasCodeSelectMap }">
									<option value="${gasCode.key }">${gasCode.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>监控点高度(m)：</dt>
						<dd>
							<input name="monHigh" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput5');" /> <span
								id="checkInput5" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>出口内径：</dt>
						<dd>
							<input name="exitInner" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput6');" /> <span
								id="checkInput6" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>燃料分类：</dt>
						<dd>
							<select name="burnTypecode">
								<option value="">请选择</option>
								<c:forEach var="burnType" items="${burnTypeSelectMap }">
									<option value="${burnType.key }">${burnType.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>燃烧方式：</dt>
						<dd>
							<select name="burnModecode">
								<option value="">请选择</option>
								<c:forEach var="burnMode" items="${burnModeSelectMap }">
									<option value="${burnMode.key }">${burnMode.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>是否两控区：</dt>
						<dd>
							<input name="isTowctrl" type="radio" value="1" checked="checked" />是
							<input name="isTowctrl" type="radio" value="1" />否
						</dd>
					</dl>
					<dl>
						<dt>两控区类型：</dt>
						<dd>
							<select name="twoctrlCode">
								<option value="">请选择</option>
								<c:forEach var="twoctrl" items="${twoctrlSelectMap }">
									<option value="${twoctrl.key }">${twoctrl.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>燃烧设备用途：</dt>
						<dd>
							<select name="burnUsecode">
								<option value="">请选择</option>
								<c:forEach var="burnUse" items="${burnUseSelectMap }">
									<option value="${burnUse.key }">${burnUse.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>设备名称：</dt>
						<dd>
							<input name="deviceName" type="text" maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>车间工段名称：</dt>
						<dd>
							<input name="workName" type="text" maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>流量报警下限：</dt>
						<dd>
							<input name="alarmMin" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput7');" /> <span
								id="checkInput7" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>流量报警上限：</dt>
						<dd>
							<input name="alarmMax" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput8');" /> <span
								id="checkInput8" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>排气筒高度(m)：</dt>
						<dd>
							<input name="stackHigh" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput9');" /> <span
								id="checkInput9" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>采样位置：</dt>
						<dd>
							<input name="sampleLoc" type="text" maxlength="50" />
						</dd>
					</dl>
					<dl>
						<dt>采样位置排气筒截面积：</dt>
						<dd>
							<input name="sampleSquare" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput10');" /> <span
								id="checkInput10" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>采样方式：</dt>
						<dd>
							<select name="sampleCode">
								<option value="">请选择</option>
								<c:forEach var="sample" items="${sampleSelectMap }">
									<option value="${sample.key }">${sample.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>预处理方式：</dt>
						<dd>
							<input name="dealWay" type="text" maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>传输距离(m)：</dt>
						<dd>
							<input name="transDistance" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput11');" /> <span
								id="checkInput11" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<!-- <dl>
						<dt>含湿量：</dt>
						<dd>
							<input name="waterContent" type="text" maxlength="7"
								onblur="checkInput1(this,'checkInput12');" /> <span
								id="checkInput12" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl> -->
					<dl>
						<dt>备注：</dt>
						<dd>
							<textarea name="remark" maxlength="250"></textarea>
						</dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button id="submitBtn" type="submit">提交</button>
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