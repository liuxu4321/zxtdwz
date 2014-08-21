<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<style type="text/css">
	ul.rightTools {float:right; display:block;}
	ul.rightTools li{float:left; display:block; margin-left:5px}
</style>
<script type="text/javascript">
	//生成环保机构ID
	function getEnvironId(){		
		var $areaCode = $("input[name='areaCode.subId']").val();
		if($areaCode != ""){			
			$(function(){ajaxTodo("${context }/background/dic/hbjgsz/add/getNewId?areaCode="+$areaCode ,areaCodeAjaxDone);});
		}
	}
	function areaCodeAjaxDone(json){
		document.getElementById("newEnvironId").innerText = json;
		document.getElementById("newEnvironName").innerText = $areaCode = $("input[name='areaCode.subName']").val()+"环保厅";
	}
</script>
<div class="pageContent" layoutH="0">
	<form id="wrwEdit"  method="post" action="${context }/background/dic/hbjgsz/hbjgszSave?navTabId=hbjgsz&callbackType=closeCurrent" 
		 class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>请选择：</label>
				<input name="areaCode.subName" type="text" class="required"  readonly="readonly"/>
				<input name="areaCode.subId" onpropertychange="getEnvironId();" type="hidden" readonly="readonly"/>
				<a class="btnLook" href="${context }/businessPlatfrom/enterprise/areaCode/lookup" lookupGroup="areaCode"
					mask="true" max="false" height = "600" width="350" >所在地市</a>
			</p>
			<p></p>
			<p>
				<label>本级编码：</label>
				<input id="newEnvironId" name="environId" class="required" readonly="readonly"/>
				<input type="hidden" name="parentId" class="required" value="${environId }" readonly="readonly"/>
			</p>
			
			<p>
				<label>上级环保机构编码：</label>
				<input name="parentId" class="required" readonly="readonly" value="${environId }"/>
			</p>
			<p>
				<label>机构名称：</label>
				<input id="newEnvironName" name="environName" class="required" maxlength="100"/>
			</p>
			<p>
				<label>电话号码：</label>
				<input name="tel" class="phone"/>
			</p>
			<p>
				<label>邮政编码：</label>
				<input name="zipCode" class="required" maxlength="10"/>
			</p>
			<p>
				<label>传真：</label>
				<input name="fax"  maxlength="20"/>
			</p>
			<p>
				<label>地址：</label>
				<input name="address" maxlength="100"/>
			</p>
			<p>
				<label>负责人姓名：</label>
				<input name="leader" maxlength="10"/>
			</p>
			<p>
				<label>负责人电话：</label>
				<input name="leaderTel"/>
			</p>
			<p>
				<label>电子邮箱：</label>
				<input name="mail" class="email required" maxlength="50"/>
			</p>
			<%--<p>
				<label>所属行政区划：</label>
				<input name="areaCode" value="${environDeptSelect.areaCode }"/>
			</p> --%>
			<p>
				<label>督查中心：</label>
				<input name="isCenter" type="radio" value="0"/>否
				<input name="isCenter" type="radio" value="1" checked="checked"/>是
			</p>
			<p>
				<label>备注：</label>
				<textarea name="remark" rows="2" cols="" maxlength="250"></textarea>
			</p>
			<p>
				<label></label>
				
			</p>
		</div>			
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button class="close" type="button">返回</button></div></div>
				</li>
			</ul>
		</div>	
	</form>
</div>