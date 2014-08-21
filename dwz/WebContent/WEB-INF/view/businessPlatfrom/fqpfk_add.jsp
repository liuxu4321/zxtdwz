<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
.div_btn {
	width: 100%;
}

.div_btn ul {
	margin-top: 5px;
	margin-bottom: 5px;
	float: right;
	margin-right: 5px;
}

.div_btn ul li {
	float: left;
	margin-left: 10px;
}
</style>
<div class="pageContent" width="100%" layoutH="0">
	<form method="post"
		action="${context }/businessPlatfrom/gyqy/fqpfkAddSave?navTabId=fqpfk_${enterprise.isFlag }&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>排放口名称：</label> <input class="required" type="text"
					name="outfallName" maxlength="100" />
			</p>

			<p>
				<label>企业名称：</label> <input class="required" type="text"
					value="${enterprise.enterpriseName }" readonly="readonly" /> <input
					type="hidden" name="enterpriseId"
					value="${enterprise.enterpriseId }" />
			</p>

			<p>
				<label>废气排放口类型：</label> <select name="letType">
					<c:forEach var="letTyp" items="${letTypeSelectMap }">
						<option value="${letTyp.key }">${letTyp.value }</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>染料分类：</label> <select name="burnTypecode">
					<c:forEach var="burnTyp" items="${burnTypeSelectMap }">
						<option value="${burnTyp.key }">${burnTyp.value }</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>排放口位置：</label> <input type="text" name="address"
					maxlength="100" />
			</p>

			<p>
				<label>排放口高度（米）：</label> <input type="text" name="outfallHigh"
					maxlength="20" class="number" />
			</p>

			<p>
				<label>出口内径（米）：</label> <input type="text" name="exitInner"
					class="number" maxlength="20" />
			</p>

			<p>
				<label>经度：</label> <span> <input class="degreee"
					name="longitude" type="text" style="width: 25px; float: left;"
					maxlength="3" /> <label style="float: left; width: 5px;">°</label>
					<input class="clock" name="longitude" type="text"
					style="width: 25px; float: left;" maxlength="2" /> <label
					style="float: left; width: 5px;">′</label> <input
					class="clock" name="longitude" type="text"
					style="width: 25px; float: left;" maxlength="2" /> <label
					style="float: left; width: 5px;">″</label>
				</span>
			</p>

			<p>
				<label>排放规律：</label> <select name="letRule">
					<c:forEach var="letRul" items="${letRuleSelectMap }">
						<option value="${letRul.key }">${letRul.value }</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>纬度：</label> <span> <input class="degreee"
					type="text" name="latitude" style="width: 25px; float: left;" /> <label
					style="float: left; width: 5px;">°</label> <input
					class="clock" type="text" name="latitude"
					style="width: 25px; float: left;" /> <label
					style="float: left; width: 5px;">′</label> <input
					class="clock" type="text" name="latitude"
					style="width: 25px; float: left;" /> <label
					style="float: left; width: 5px;">″</label>

				</span>
			</p>

			<p>
				<label>燃烧方式：</label> <select name="burnModecode">
					<c:forEach var="burnMod" items="${burnModeSelectMap }">
						<option value="${burnMod.key }">${burnMod.value }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>标志牌安装形式：</label> <select name="signForm">
					<c:forEach var="signF" items="${signFromSelectMap }">
						<option value="${signF.key }">${signF.value }</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>是否两控区：</label> <input type="radio" style="width: 20px;"
					value="1" name="isTowctrl" />是 <input type="radio"
					style="width: 20px;" value="0" name="isTowctrl" />否
			</p>

			<p>
				<label>两控区类型：</label> <select name="twoctrlCode">
					<c:forEach var="twoct" items="${twoctrlSelectMap }">
						<option value="${twoct.key }">${twoct.value }</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>气域功能区类别：</label> <select name="domainCode">
					<c:forEach var="domain" items="${domainSelectMap }">
						<option value="${domain.key }">${domain.value }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>燃烧设备用途：</label> <select name="burnUsecode">
					<c:forEach var="runU" items="${runUseSelectMap }">
						<option value="${runU.key }">${runU.value }</option>
					</c:forEach>
				</select>
			</p>


			<p>
				<label>设备名称：</label> <input type="text" name="deviceName" />
			</p>

			<p>
				<label>车间工段名称：</label> <input type="text" name="workName" />
			</p>

			<p>
				<label>是否监控：</label> <input style="width: 20px;" type="radio"
					name="isMonitor" checked="checked" value="1" />是 <input
					style="width: 20px;" type="radio" name="isMonitor" value="0" />否
			</p>

			<p>
				<label>备注：</label>
				<textarea style="margin: 0; border: 0;" rows="4" cols="30"
					name="remark"></textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div>
				</li>
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="button" class="close">返回</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>