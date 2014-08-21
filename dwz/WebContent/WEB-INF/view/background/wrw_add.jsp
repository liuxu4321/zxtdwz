<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>

<script type="text/javascript">
	function wrwIdCheck() {
		$(function() {
			ajaxTodo(
					"${context }/background/dic/wrw/wrwIdCheck?navTabId=wrw&pollutantId="
							+ $('#pollutant_Id').val(), addcheckAjaxDone);
		});
	}
	function addcheckAjaxDone(json) {
		if (json == 1) {
			$("#checkWrwID").attr({
				style : "display:none"
			});
		} else {
			$("#checkWrwID").attr({
				style : "display:block"
			});
		}
	}
</script>

<div class="pageContent">
	<form id="wrwEdit" method="post"
		action="${context }/background/dic/wrw/add/save?navTabId=wrw&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<p>
				<label>污染物ID：</label> <input type="text" id="pollutant_Id"
					name="pollutantId" class="required" maxlength="20"
					onblur="wrwIdCheck();" /> <span id="checkWrwID" class="error"
					style="display: none;">污染物ID已存在</span>
			</p>
			<p>
				<label>污染物英文名称：</label> <input type="text" name="pollutantName"
					class="required" maxlength="50" />

			</p>
			<p>
				<label>污染物中文名称：</label> <input type="text" name="chineseName"
					class="required" maxlength="50" />

			</p>
			<p>
				<label>污染物类型：</label> <input style="width: 20px;" type="radio"
					name="typeCode" checked="checked" value="1" />废水 <input
					style="width: 20px;" type="radio" name="typeCode" value="0" />废气
			</p>
			<p>
				<label>计量单位：</label> <select name="unitCode">
					<c:forEach items="${subClassSet }" var="subClass">
						<option value="${subClass.id.subId }">${subClass.subName
							}</option>
					</c:forEach>
				</select>
			</p>


			<p>
				<label>当量值：</label> <input type="text" name="equalValue"
					class="textInput number" maxlength="6" />
			</p>
			<p>
				<label>报警下限：</label> <input type="text" name="alarmMin"
					class="required textInput number" maxlength="6" />
			</p>
			<p>
				<label>报警上限：</label> <input type="text" name="alarmMax"
					class="required textInput number" maxlength="6" />
			</p>
			<p>
				<label>异常最小值：</label> <input type="text" name="abnormalMin"
					class="required textInput number" maxlength="6" />
			</p>
			<p>
				<label>异常最大值：</label> <input type="text" name="abnormalMax"
					class="required textInput number" maxlength="6" />
			</p>
			<p>
				<label>备注：</label>
				<textarea style="width: 99%; border: 0;" rows="4" name="remark"
					maxlength="250"></textarea>
			</p>
		</div>
		<!-- </table> -->
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