<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<style>
#czdtab{
	border-collapse: collapse;
    border: none;
    width: 100%;
}
#czdtab td
{
    border: solid #456 1px;
    width: 25%;
    text-align: center;
}
#czdtab tr
{
    height: 25px;
}
</style>
<div class="pageContent">
	<form method="post" action="${context }/alarmMonitor/bjjk/bjcz/cz?callbackType=closeCurrent&navTabId=${dFlag == 1 ? 'cbbj_ljcb_detail' : 'sjyc_detail' }" class="pageForm required-validate"  onsubmit="return iframeCallback(this,dialogAjaxDone);" method="post" enctype="multipart/form-data">
		<input type="hidden" name="enterpriseId" value="${enterpriseId}">
		<input type="hidden" name="enterpriseName" value="${enterpriseName}">
		<input type="hidden" name="dFlag" value="${dFlag }">
		<input type="hidden" name="sTime" value="${stime }">
		<input type="hidden" name="strs" id="strs">
		<div class="pageFormContent" layoutH="60" style="min-height: 250px;">
			<h2 class="contentTitle" style="text-align: center;">报警处置单</h2>
			<div class="divider"></div>
			<table id="czdtab">
				<tr>
					<td align="center">企业名</td>
					<td colspan="3">${enterpriseName }</td>
				</tr>
				<tr>
					<td align="center">监控点名</td>
					<td colspan="3">${monName }</td>
				</tr>
				<tr>
					<td align="center">报警类别</td>
					<td>
						<c:out value="${dFlag == 1 ? '超标处置' : '异常处置' }"></c:out>
					</td>
					<td align="center">MN</td>
					<td></td>
				</tr>
				<tr>
					<td align="center">报警时间</td>
					<td colspan="3">${stime }</td>
					<!--<td align="center">处置时间</td>
					<td>
						<input class="date textInput readonly" type="text" readonly="true" value="" name="dTime" width="20">  
					</td>-->
				</tr>
				<tr>
					<td colspan="4"  align="center">报警处置</td>
				</tr>
				<tr>
					<td  align="center"><input type="radio" name="dMethod" value="1" checked="checked"></td>
					<td>通知领导</td>
					<td>领导姓名</td>
					<td><input type="text" name="dContent1"></td>
				</tr>
				<tr>
					<td align="center"><input type="radio" name="dMethod" value="2"></td>
					<td>通知执法人员</td>
					<td>执法人员单位及姓名</td>
					<td><input type="text"  name="dContent2"></td>
				</tr>
				<tr>
					<td align="center"><input type="radio" name="dMethod" value="3"></td>
					<td>通知运维单位</td>
					<td>运维单位名称</td>
					<td><input type="text" name="dContent3"></td>
				</tr>
				<tr>
					<td align="center"><input type="radio" name="dMethod" value="4"></td>
					<td>通知企业</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td align="center"><input type="radio" name="dMethod" value="5"></td>
					<td>自行处理</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td align="center"><input type="radio" name="dMethod" value="6"></td>
					<td>超标确认</td>
					<td></td>
					<td></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">增加凭证</td>
					<td colspan="2"> 
						<input type="file" name="filePZ" />
					</td>
				</tr>
				 
				<tr height="50">
					<td colspan="2" align="center">备注</td>
					<td colspan="2">
						<textarea class="textInput" rows="2" cols="30" name="dRemark"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
	var str;
	var dFlag = ${dFlag};
	if(dFlag == 1){
		str = $("#str").val();
	}else{
		str = $("#str1").val();
	}
	$("#strs").attr("value" , str);
</script>