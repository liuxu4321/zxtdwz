<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<style>
	.div_btn {
		width:100%;
	}
	.div_btn ul {
		margin-top:5px;
		margin-bottom:5px;
		float:right;
		margin-right:5px;
	}
	.div_btn ul li {
		float:left;
		margin-left:10px;
	}
</style>

<script type="text/javascript">
	function  checkMaintenId(){
		 $(function(){ajaxTodo("${context }/background/dic/ywdw/checkMaintenId?navTabId=wrw&maintenId="+$('#maintenId').val(),addcheckAjaxDone);});
	}
	 function addcheckAjaxDone(json){
		if(json==1){
			$("#checkWrwID").attr({style: "display:none"});
		}else{
			$("#checkWrwID").attr({style: "display:block"});			
		}
	} 
</script>

<div class="pageContent">
	<form id="wrwEdit"  method="post" action="${context }/background/dic/ywdw/add/save?navTabId=ywdw&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
			<!-- <p>
				<label>运维商ID：</label>
				<input type="text" id="maintenId" name="maintenId" class="required number" maxlength="10" onblur="checkMaintenId();"/>
				<span id="checkWrwID" class="error" style="display: none;">污染物ID已存在</span>
			</p> -->
			
			<p>
				<label>所属行政区划：</label>
				<input class="required" name="areaCode.subName" type="text" readonly style="float:left;"/>
				<input name="areaCode.subId" type="hidden" readonly="readonly"/>
				<a style="float:none;" class="btnLook" href="${context }/businessPlatfrom/enterprise/areaCode/lookup" 
					lookupGroup="areaCode"  width="240" height="460" mask="true" max="false" rel="areaCode_lookup">所属行政区划</a>
				<%-- <select name="areaCode" class="required">
					<c:forEach items="${subClassSet }" var="subClass">
						<option value="${subClass.id.subId }">${subClass.subName }</option>
					</c:forEach>
					<option value="0" selected="selected">test</option>
				</select> --%>
			</p>
			
			<p>
				<label>运维商名称：</label>
				<input type="text" name="maintenName" class="required" maxlength="50"/>
			</p>
			<p>			
				<label>地址：</label>
				<input type="text" name="address" maxlength="50"/>
				
			</p>
		
			
			<p>
				<label>联系人：</label>
				<input type="text" name="linkman" class="required" maxlength="25"/>
			</p>
			<p>
				<label>电话：</label>
				<input type="text" name="tel" class="required"  maxlength="20"/>
			</p>
			<p>
				<label>邮箱：</label>
				<input type="text" name="mail" class="email" maxlength="50"/>
			</p>
			<p>
				<label>法人：</label>
				<input type="text" name="legalMan" maxlength="20"/>
			</p>		
			<p>
				<label>资质类型：</label>
				<input type="text" name="qualifyCode" maxlength="20"/>
			</p>
			<p>
				<label>资质证书编号：</label>
				<input type="text" name="qualifyNo" maxlength="20"/>
			</p>
			<p>
				<label>资质有效期限：</label>
				<input type="text" name="qualifyEnddate" maxlength="20" class="date"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p>
				<label>是否有效：</label><!-- 【0:否;1:是】 -->
				<input type="radio" name="isValid" value="0" checked="checked"/>否
				<input type="radio" name="isValid" value="1"/>是
			</p>
			<p>
				<label>备注：</label>
				<textarea  style="width:99%;border:0;" rows="4" name="remark" maxlength="250"></textarea>
			</p>
		</div>
		<!-- </table> -->
		<div class="div_btn">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>