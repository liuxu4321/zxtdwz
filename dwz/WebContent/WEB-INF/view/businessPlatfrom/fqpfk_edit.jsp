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
	<form id="wrwEdit" method="post"
		action="${context }/businessPlatfrom/gyqy/fqpfkEditAndSave?navTabId=fqpfk_${enterprise.isFlag }&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>排放口名称：</label> <input class="required" type="text"
					name="outfallName" value="${outfallGas.outfallName }" /> <input
					name="outfallId" class="required" type="hidden"
					value="${outfallGas.outfallId }" />
			</p>

			<p>
				<label>所属企业：</label> <input class="required" type="text"
					value="${outfallGas.enterprise.enterpriseName }"
					readonly="readonly" /> <input type="hidden" name="enterpriseId"
					value="${outfallGas.enterprise.enterpriseId }"/>
			</p>
			
			<p>
				<label>废气排放口类型：</label> <select name="letType">
					<c:forEach var="letTyp" items="${letTypeSelectMap }">
						<option value="${letTyp.key }"
							<c:if test="${letTyp.key == outfallGas.letType}">selected='selected'</c:if>>${letTyp.value
							}</option>
					</c:forEach>
				</select>
			</p>

			<%-- <p>
				<label>排放口编号：</label> <input class="required" type="text"
					name="outfallId" value="${outfallGas.outfallId }"
					readonly="readonly" />
			</p> --%>

			<p>
				<label>排放口位置：</label> <input type="text" name="address"
					value="${outfallGas.address }" />
			</p>

			<p>
				<label>排放口高度（米）：</label> <input type="text" name="outfallHigh"
					value="${outfallGas.outfallHigh }" />
			</p>

			<p>
				<label>出口内径（米）：</label> <input type="text" name="exitInner"
					value="${outfallGas.exitInner }" />
			</p>

			<p>
				<label>经度：</label>
				<span>
					<input class="degreee" name="longitude" type="text"
						style="width: 25px; float: left;" value="${longitude1 }" maxlength="3"/>
					<label style="float: left; width: 5px;">°</label>
					<input class="clock" name="longitude" type="text"
						style="width: 25px; float: left;" value="${longitude2 }" maxlength="2"/>
					<label style="float: left; width: 5px;">′</label>
					<input class="clock" name="longitude" type="text"
						style="width: 25px; float: left;" value="${longitude3 }" maxlength="2"/>
					<label style="float: left; width: 5px;">″</label>
				</span>
			</p>

			<p>
				<label>排放规律：</label> <select name="letRule">
					<c:forEach var="letRul" items="${letRuleSelectMap }">
						<option value="${letRul.key }"
							<c:if test="${letRul.key == outfallGas.letRule}">selected='selected'</c:if>>${letRul.value
							}</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>纬度：</label> 
				<span>
					<input class="degreee" type="text" name="latitude"
								style="width: 25px; float: left;" value="${latitude1 }" maxlength="3"/>
							<label style="float: left; width: 5px;">°</label>
							<input class="clock" type="text" name="latitude"
								style="width: 25px; float: left;" value="${latitude2 }" maxlength="2"/>
							<label style="float: left; width: 5px;">′</label>
							<input class="clock" type="text" name="latitude"
								style="width: 25px; float: left;" value="${latitude3 }" maxlength="2"/>
							<label style="float: left; width: 5px;">″</label>
				</span>
			</p>

			<p>
				<label>染料分类：</label> <select name="burnTypecode">
					<c:forEach var="burnTyp" items="${burnTypeSelectMap }">
						<option value="${burnTyp.key }"
							<c:if test="${burnTyp.key == outfallGas.burnTypecode}">selected='selected'</c:if>>${burnTyp.value
							}</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>燃烧方式：</label> <select name="burnModecode">
					<c:forEach var="burnMod" items="${burnModeSelectMap }">
						<option value="${burnMod.key }"
							<c:if test="${burnMod.key == outfallGas.burnModecode}">selected='selected'</c:if>>${burnMod.value
							}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>标志牌安装形式：</label> <select name="signForm">
					<c:forEach var="signF" items="${signFromSelectMap }">
						<option value="${signF.key }"
							<c:if test="${signF.key == outfallGas.signForm}">selected='selected'</c:if>>${signF.value
							}</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>是否两控区：</label>
					<input name="isTowctrl" value="0" type="radio"<c:if test="${outfallGas.isTowctrl == 0 }">checked='checked'</c:if>/>否
					<input name="isTowctrl" value="1" type="radio"<c:if test="${outfallGas.isTowctrl == 1 }">checked='checked'</c:if>/>是
			</p>

			<p>
				<label>两控区类型：</label> <select name="twoctrlCode">
					<c:forEach var="twoct" items="${twoctrlSelectMap }">
						<option value="${twoct.key }"
							<c:if test="${twoct.key == outfallGas.twoctrlCode}">selected='selected'</c:if>>${twoct.value
							}</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>气域功能区类别：</label> <select name="domainCode">
					<c:forEach var="domain" items="${domainSelectMap }">
						<option value="${domain.key }"
							<c:if test="${domain.key == outfallGas.domainCode}">selected='selected'</c:if>>${domain.value
							}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>燃烧设备用途：</label> <select name="burnUsecode">
					<c:forEach var="runU" items="${runUseSelectMap }">
						<option value="${runU.key }"
							<c:if test="${runU.key == outfallGas.burnUsecode}">selected='selected'</c:if>>${runU.value
							}</option>
					</c:forEach>
				</select>
			</p>


			<p>
				<label>设备名称：</label> <input type="text" name="deviceName"
					value="${outfallGas.deviceName }" />
			</p>

			<p>
				<label>车间工段名称：</label> <input type="text" name="workName"
					value="${outfallGas.workName }" />
			</p>

			<p>
				<label>是否监控：</label> <input style="width: 20px;" type="radio"
					name="isMonitor"
					<c:if test="${outfallGas.isMonitor == 1}">checked='checked'</c:if>
					value="1" />是
				<input style="width: 20px;" type="radio" name="isMonitor"
					<c:if test="${outfallGas.isMonitor == 0}">checked='checked'</c:if>
					value="0" />否
			</p>

			<p>
				<label>备注：</label>
				<textarea style="margin: 0; border: 0;" rows="4" cols="30"
					name="remark">${outfallGas.remark }</textarea>
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