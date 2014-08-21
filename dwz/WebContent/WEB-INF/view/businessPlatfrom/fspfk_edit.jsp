<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" width="100%" layoutH="0">
	<form method="post"
		action="${context }/businessPlatfrom/pfk/fspfkEditAndSave?navTabId=fspfk_${enterprise.isFlag }&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>排放口名称：</label> <input class="required" type="text"
					name="outfallName" maxlength="100"
					value="${outfallWater.outfallName }" /> <input
					name="outfallId" class="required" type="hidden"
					value="${outfallWater.outfallId }" />
			</p>
			<p>
				<label>所属企业：</label> <input type="text" readonly="readonly"
					value="${outfallWater.enterprise.enterpriseName }" />
			</p>
			<p>
				<label>水域功能区类别：</label> <select name="waterareaCode" class="combox">
					<c:forEach var="waterare" items="${waterareaSelectMap }">
						<option value="${waterare.key }"
							<c:if test="${waterare.key == outfallWater.waterareaCode}">selected='selected'</c:if>>${waterare.value
							}</option>
					</c:forEach>
				</select>
			</p>
			<%-- <p>
				<label>排放口编号：</label> <input class="required" type="text"
					name="outfallId" readonly="readonly"
					value="${outfallWater.outfallId }" />
			</p> --%>
			<p>
				<label>流域：</label> <input type="text" name="watershedCode"
					value="${outfallWater.watershedCode }" />
			</p>
			<p>
				<label>排放去向：</label> <select name="letDirec" style="width:140px;">
					<c:forEach var="letdirec" items="${letDirecSelectMap }">
						<option value="${letdirec.key }"
							<c:if test="${letdirec.key == outfallWater.letDirec}">selected='selected'</c:if>>${letdirec.value
							}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>排放口位置：</label> <input type="text" name="address"
					value="${outfallWater.address }" maxlength="100" />
			</p>
			<p>
				<label>经度：</label> <span> <input class="degreee"
					name="longitude" type="text" style="width: 25px; float: left;"
					value="${longitude1 }" maxlength="3" /> <label
					style="float: left; width: 5px;">°</label> <input
					class="clock" name="longitude" type="text"
					style="width: 25px; float: left;" value="${longitude2 }"
					maxlength="2" /> <label style="float: left; width: 5px;">′</label>
					<input class="clock" name="longitude" type="text"
					style="width: 25px; float: left;" value="${longitude3 }"
					maxlength="2" /> <label style="float: left; width: 5px;">″</label>
				</span>
			</p>
			<p>
				<label>纬度：</label> <span> <input class="degreee"
					type="text" name="latitude" style="width: 25px; float: left;"
					value="${latitude1 }" maxlength="3" /> <label
					style="float: left; width: 5px;">°</label> <input
					class="clock" type="text" name="latitude"
					style="width: 25px; float: left;" value="${latitude2 }"
					maxlength="2" /> <label style="float: left; width: 5px;">′</label>
					<input class="clock" type="text" name="latitude"
					style="width: 25px; float: left;" value="${latitude3 }"
					maxlength="2" /> <label style="float: left; width: 5px;">″</label>

				</span>
			</p>
			<p>
				<label>排放规律：</label> <select name="letRule" class="combox">
					<c:forEach var="rule" items="${letRuleSelectMap }">
						<option value="${rule.key }"
							<c:if test="${rule.key == outfallWater.letRule}">selected='selected'</c:if>>${rule.value
							}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>标志牌安装形式：</label> <select name="signForm" class="combox">
					<c:forEach var="sign" items="${signFormSelectMap }">
						<option value="${sign.key }"
							<c:if test="${outfallWater.signForm == sign.key}">selected='selected'</c:if>>${sign.value
							}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>是否监控：</label> <input style="width: 20px;" type="radio"
					name="isMonitor"
					<c:if test="${outfallWater.isMonitor == 1}">checked='checked'</c:if>
					value="1" />是 <input style="width: 20px;" type="radio"
					name="isMonitor"
					<c:if test="${outfallWater.isMonitor == 0}">checked='checked'</c:if>
					value="0" />否
			</p>
			<p>
				<label>备注：</label>
				<textarea name="remark" rows="4" cols="30"
					maxlength="250">${outfallWater.remark }</textarea>
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
