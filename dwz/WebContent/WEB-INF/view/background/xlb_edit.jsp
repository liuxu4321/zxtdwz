<!-- 小类别修改 画面 2013/10/14 BY RENWEI -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<style>
	.table_dlb input {
		border:0;
		width:80%;
	}
	.table_dlb select {
		width:80%;
		height:23px;
	}
	.table_dlb {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_dlb td {
		border:1px solid #d0d0d0;
		height:25px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
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
$(document).ready(function(){
	changeSelectsLable('${subClass.id.classId}');
});
 /*
 	画面初始化
 */
 function changeSelectsLable(classId){
	var selectsTr = document.getElementById("selectsTr");
	var textsTr = document.getElementById("textsTr");
	var fathersTr = document.getElementById("fathersTr");
	var selectsLable = document.getElementById("selectsLable");
	var textsLable = document.getElementById("textsLable");
	selectsTr.style.display = "none";
	textsTr.style.display = "none";
	fathersTr.style.display = "none";
	switch(classId){
	case '5': //流域
	case '8': //行业类别
	case '17'://行政区划
		fathersTr.style.display = "block";
		$(function(){ajaxTodo("${context }/background/dic/xlb/add/ajax?navTabId=xlb&classId="+classId,AjaxDoneFather);});break;
	case '9'://治理方法
		selectsLable.innerText = "治理类型:";
		selectsTr.style.display = "block";
		$(function(){ajaxTodo("${context }/background/dic/xlb/add/ajax?navTabId=xlb&classId="+classId,AjaxDoneSelect);});break;
	case '12'://排放规律
		selectsLable.innerText = "污染物类型:";
		selectsTr.style.display = "block";
		$(function(){ajaxTodo("${context }/background/dic/xlb/add/ajax?navTabId=xlb&classId="+classId,AjaxDoneSelect);});break;
	case '13'://排放去向
		selectsLable.innerText = "排放去向:";
		selectsTr.style.display = "block";
		$(function(){ajaxTodo("${context }/background/dic/xlb/add/ajax?navTabId=xlb&classId="+classId,AjaxDoneSelect);});break;
	case '11'://计量单位
		textsLable.innerText = "单位符号:";
		textsTr.style.display = "block";
		$(function(){ajaxTodo("${context }/background/dic/xlb/add/ajax?navTabId=xlb&classId="+classId,AjaxDoneSelect);});break;
	case '24'://数采仪通讯协议
	case '25'://数采仪接收信号类型
	case '26'://废水排口采样方式
	case '27'://水排口堰槽类型
	case '28'://运维单位资质类型
	case '29'://设备类型
		textsLable.innerText = "名称字母拼写:";
		textsTr.style.display = "block";break;
	case '22'://特征字典表
		selectsLable.innerText = "计量单位:";
		textsLable.innerText = "当量值:";
		textsTr.style.display = "block";
		selectsTr.style.display = "block";
		$(function(){ajaxTodo("${context }/background/dic/xlb/add/ajax?navTabId=xlb&classId="+classId,AjaxDoneSelect);});break;
		break;
	default:
		selectsTr.style.display = "none";
		textsTr.style.display = "none";
		fathersTr.style.display = "none";break;
	}
 }
 
 /*
	取得父节点AJAX回调方法
 */
 function AjaxDoneFather(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#fatherId").html(optionstring);
} 
 /*
	取得对应小类别回调方法
 */
 function AjaxDoneSelect(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#tempItem1").html(optionstring);
} 
</script>
<div class="pageContent">
	<form method="post" action="${context }/background/dic/xlb/edit/save?navTabId=dic_index&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<input type="hidden" name="classId" value="${subClass.id.classId}"/>
	<input type="hidden" name="subId" value="${subClass.id.subId}"/>
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>大类别：</label>
				<input type="text" name="className" class="required" maxlength="25" value="${baseClass.className }" disabled="disabled"/>
			</p>
			<p>
				<label>小类别ID：</label>
				<input type="text" name="subId" class="required" maxlength="20" value="${subClass.id.subId}" disabled="disabled"/>
			</p>
			<p>
				<label>小类别名称：</label>
								<input type="text" name="subName" class="required" maxlength="100" value="${subClass.subName }"/>
			</p>		
			<p id="selectsTr" style="display: none">
				<label id="selectsLable"></label>
				<select name="tempItem1" id="tempItem1">
					<option></option>
				</select>
			</p>
			<p id="textsTr" style="display: none">
				<label id="textsLable" ></label>
				<input type="text" name="tempItem2"  maxlength="100" value="${subClass.tempItem2}"/>
			</p>
			<p id="fathersTr" style="display: none">
				<label>父节点：</label>
				<select name="fatherId" id="fatherId">
					<option></option>
				</select>
			</p>
			<p>
				<label>是否有效：</label>
				<input style="width:20px;" type="radio" name="isValid" <c:if test="${subClass.isValid==1 }">checked="checked"</c:if> value="1"/>有效
				<input style="width:20px;" type="radio" name="isValid" <c:if test="${subClass.isValid==0 }">checked="checked"</c:if> value="0"/>无效
			</p>
			<p>
				<label>备注：</label>
				<textarea  style="width:245px;border:0;" rows="4" name="remark" maxlength="250">${subClass.remark }</textarea>
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