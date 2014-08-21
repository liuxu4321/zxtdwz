<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>
<style type="text/css">
.myList tr {
	height: 31px;
}

.table_hbjgsz {
	width: 100%;
	border: 1px solid #d0d0d0;
	border-collapse: collapse;
	padding: 0;
	margin-top: 5px;
}

.table_hbjgsz td {
	border: 1px solid #d0d0d0;
	height: 23px;
	font-size: 12px;
	padding: 1px 2px;
	padding-left: 5px;
}

.table_hbjgsz a {
	margin-right: 40px;
}
</style>
<script type="text/javascript">
	//取消保存
	function saveEnvironDept() {
		$("#wrwEdit").submit();
	}

	//跳转至设置下属环保机构
	$(function() {
		var $environId = $("input[name='environId']").val();
		if ($environId == null || $environId == "") {
			$("#szxshbjgA").attr("style", "display:none;");
			$("#szxshbjgB").attr("style", "display:block;");
		} else {
			$("#szxshbjgB").attr("style", "display:none;");
			$("#szxshbjgA").attr("style", "display:block;");
		}
	});
</script>
<div class="pageContent" layoutH="0">
	<form id="wrwEdit" method="post"
		action="${context }/background/dic/hbjgsz/hbjgszSaveSelf"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javaScript:saveEnvironDept();"
					title="确定保存?"> <span>保存</span>
				</a></li>
				<li><a id="deleteHbjg" class="delete"
					href="${context }/background/dic/hbjgsz" target="navTab"
					rel="hbjgsz" title="环保机构设置"> <span>取消</span>
				</a></li>
				<li><a class="edit"
					href="${context }/background/dic/hbjgsz/szxshbjg?environId=${environDept.environId }&areaCode=${environDept.areaCode }"
					target="dialog" id="szxshbjgA" mask="true" max="false" height="400"
					width="800" rel="szxshbjg_dialog"> <span>设置下级机构</span>
				</a></li>
				<li><a id="szxshbjgB" class="edit"> <span>设置下级机构</span>
				</a></li>
				<li><a class="edit"
					href="${context }/background/dic/hbjgsz/add" target="dialog"
					mask="true" max="false" height="400" width="800" rel="hbjgsz_add">
						<span>添加</span>
				</a></li>
			</ul>
		</div>
		<div class="pageFormContent" layoutH="60" style="margin-left: 100px;">
			<p>
				<label>本级编码：</label> <span><input name="environId"
					value="${environDept.environId }" readonly="readonly" /></span>
			</p>
			<p>
				<label>机构名称：</label> <span><input name="environName"
					value="${environDept.environName }" class="required"
					maxlength="100" /></span>
			</p>
			<p>
				<label>电话号码：</label> <span><input name="tel"
					value="${environDept.tel }" class="phone" /></span>
			</p>
			<p>
				<label>邮政编码：</label> <span><input name="zipCode"
					class="required" value="${environDept.zipCode }" maxlength="10" /></span>
			</p>
			<p>
				<label>传真：</label> <span><input name="fax"
					value="${environDept.fax }" maxlength="20" /></span>
			</p>
			<p>
				<label>地址：</label> <span><input name="address"
					value="${environDept.address }" maxlength="100" /></span>
			</p>
			<p>
				<label>负责人姓名：</label> <span><input name="leader"
					value="${environDept.leader }" maxlength="10" /></span>
			</p>
			<p>
				<label>负责人电话：</label> <span><input name="leaderTel"
					value="${environDept.leaderTel }" class="phone" /></span>
			</p>
			<p>
				<label>电子邮箱：</label> <span><input name="mail"
					value="${environDept.mail }" class="required email" maxlength="50" /></span>
			</p>
			<p>
				<label>所属行政区划：</label> <span><input name="areaCode"
					value="${environDept.areaCode }" readonly="readonly" /></span>
			</p>
			<p>
				<label>是否是督查中心：</label> <span><select name="isCenter">
						<option value="1"
							<c:if test="${environDept.isCenter == 1 }">selected='selected'</c:if>>是</option>
						<option value="0"
							<c:if test="${environDept.isCenter == 0 }">selected='selected'</c:if>>否</option>
				</select></span>
			</p>
			<p>
				<label>备注：</label>
				<textarea name="remark" rows="2" cols="" maxlength="250">${environDept.remark }</textarea>
			</p>
		</div>
	</form>
</div>


