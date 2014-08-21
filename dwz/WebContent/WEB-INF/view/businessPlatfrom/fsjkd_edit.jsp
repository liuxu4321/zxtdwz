<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	function checkInput(_this, spanId) {
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
</script>
<div class="pageContent" layoutH="0">
	<form class="pageForm required-validate"
		action="${context }/businessPlatfrom/jkd/fsjkd/edit/save?navTabId=fsjkd_${monWater.enterprise.isFlag }&callbackType=closeCurrent"
		onsubmit="return validateCallback(this,navTabAjaxDone)" method="post">
		<div class="panel collapse">
			<h1>基本信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
						<dt>监控点名称：</dt>
						<dd>
							<input name="monName" class="required" type="text"
								value="${monWater.monName }" maxlength="100" /> <input
								name="monId" class="required" type="hidden"
								value="${monWater.monId }" />
						</dd>
					</dl>
					<dl>
						<dt>所属企业：</dt>
						<dd>
							<input class="required" type="text" readonly="readonly"
								value="${monWater.enterprise.enterpriseName }" /> <input
								name="enterprise.enterpriseId" type="hidden"
								value="${monWater.enterprise.enterpriseId }" />
						</dd>
					</dl>
					<dl>
						<dt>经度：</dt>
						<dd>
							<input name="longitude" value="${longitude1 }"
								class="degreee" type="text"
								style="float: none; width: 10%;" maxlength="3" />° <input
								name="longitude" value="${longitude2 }" class="clock"
								type="text" style="float: none; width: 10%;" maxlength="2" />′
							<input name="longitude" value="${longitude3 }"
								class="clock" type="text"
								style="float: none; width: 10%;" maxlength="2" />″
						</dd>
					</dl>
					<dl>
						<dt>纬度：</dt>
						<dd>
							<input name="latitude" value="${latitude1 }"
								class="degreee" type="text"
								style="float: none; width: 10%;" maxlength="3" />° <input
								name="latitude" value="${latitude2 }" class="clock"
								type="text" style="float: none; width: 10%;" maxlength="2" />′
							<input name="latitude" value="${latitude3 }"
								class="clock" type="text"
								style="float: none; width: 10%;" maxlength="2" />″
						</dd>
					</dl>
					<dl>
						<dt>排放去向：</dt>
						<dd>
							<select name="letDirec" class="required">
								<option value="">请选择</option>
								<c:forEach var="letDirec" items="${letDirecSelectMap }">
									<option value="${letDirec.key }"
										<c:if test="${letDirec.key==monWater.letDirec }">selected='selected'</c:if>>${letDirec.value
										}</option>
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
									<option value="${inoutType.key }"
										<c:if test="${inoutType.key==monWater.inoutType }">selected='selected'</c:if>>${inoutType.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>是否停用：</dt>
						<dd>
							<input type="radio" name="isValid" value="0"
								<c:if test="${monWater.isValid==0 }">checked='checked'</c:if> />是
							<input type="radio" name="isValid" value="1"
								<c:if test="${monWater.isValid==1 }">checked='checked'</c:if> />否
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
							<input name="address" type="text" value="${monWater.address }"
								maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>标志牌安装形式：</dt>
						<dd>
							<select name="signForm">
								<option value="">请选择</option>
								<c:forEach var="signForm" items="${signFormSelectMap }">
									<option value="${signForm.key }"
										<c:if test="${signForm.key==monWater.signForm }">selected='selected'</c:if>>${signForm.value
										}</option>
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
									<option value="${letRule.key }"
										<c:if test="${letRule.key==monWater.letRule }">selected='selected'</c:if>>${letRule.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>水域功能区类别：</dt>
						<dd>
							<select name="waterareaCode">
								<option value="">请选择</option>
								<c:forEach var="waterarea" items="${waterareaSelectMap }">
									<option value="${waterarea.key }"
										<c:if test="${waterarea.key==monWater.waterareaCode }">selected='selected'</c:if>>${waterarea.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>流向类型：</dt>
						<dd>
							<select name="flowtypeCode">
								<option value="">请选择</option>
								<c:forEach var="flowtype" items="${flowtypeSelectMap }">
									<option value="${flowtype.key }"
										<c:if test="${flowtype.key==monWater.flowtypeCode }">selected='selected'</c:if>>${flowtype.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>流向：</dt>
						<dd>
							<select name="outfallId">
								<option value="">请选择</option>
								<c:forEach var="outfall" items="${outfallSelectMap }">
									<option value="${outfall.key }"
										<c:if test="${outfall.key==monWater.outfallWater.outfallId }">selected='selected'</c:if>>${outfall.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>流量报警下限：</dt>
						<dd>
							<input name="alarmMin" type="text" value="${monWater.alarmMin }"
								onblur="checkInput(this,'checkInput1');" /> <span
								id="checkInput1" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>流量报警上限：</dt>
						<dd>
							<input name="alarmMax" type="text" value="${monWater.alarmMax }"
								onblur="checkInput(this,'checkInput2');" /> <span
								id="checkInput2" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>堰槽类型：</dt>
						<dd>
							<select name="grooveCode">
								<option value="">请选择</option>
								<c:forEach var="groove" items="${grooveSelectMap }">
									<option value="${groove.key }"
										<c:if test="${groove.key==monWater.grooveCode }">selected='selected'</c:if>>${groove.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>测流段长度(m)：</dt>
						<dd>
							<input name="segmentLong" type="text" maxlength="7"
								value="${monWater.segmentLong }"
								onblur="checkInput(this,'checkInput3');" /> <span
								id="checkInput3" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>水面宽度(m)：</dt>
						<dd>
							<input name="surfaceWidth" type="text" maxlength="7"
								value="${monWater.surfaceWidth }"
								onblur="checkInput(this,'checkInput4');" /> <span
								id="checkInput4" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>喉道宽度(m)：</dt>
						<dd>
							<input name="throatWidth" type="text" maxlength="7"
								value="${monWater.throatWidth }"
								onblur="checkInput(this,'checkInput5');" /> <span
								id="checkInput5" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>管径(cm)：</dt>
						<dd>
							<input name="pipeSize" type="text" maxlength="7"
								value="${monWater.pipeSize }"
								onblur="checkInput(this,'checkInput6');" /> <span
								id="checkInput6" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>采样位置：</dt>
						<dd>
							<input name="simpleAddress" type="text"
								value="${monWater.simpleAddress }" maxlength="50" />
						</dd>
					</dl>
					<dl>
						<dt>预处理方式：</dt>
						<dd>
							<input name="dealWay" type="text" value="${monWater.dealWay }"
								maxlength="100" />
						</dd>
					</dl>
					<dl>
						<dt>传输距离(m)：</dt>
						<dd>
							<input name="transDistance" type="text" maxlength="7"
								value="${monWater.transDistance }"
								onblur="checkInput(this,'checkInput7');" /> <span
								id="checkInput7" class="error" style="display: none;">输入格式为9999.99</span>
						</dd>
					</dl>
					<dl>
						<dt>备注：</dt>
						<dd>
							<textarea name="remark" maxlength="250">${monWater.remark }</textarea>
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