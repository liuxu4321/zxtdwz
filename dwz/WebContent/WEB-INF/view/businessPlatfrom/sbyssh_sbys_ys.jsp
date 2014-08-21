<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!-- <script type="text/javascript">
	function dialogAjaxDone1(){
		//$.pdialog.closeCurrent();
		
		$("#backSbys").click();
		return false;
	}
</script> -->
<div class="pageContent" layoutH="0">
	<form id="sbysshYsEdit"  method="post" action="${context }/businessPlatfrom/gyqy/sbyssh/sbys/ys/save?navTabId=sbyssh_sbys&callbackType=closeCurrent"  
		class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="60">
			<input type="hidden" name="equipId" value="${equipId }"/>
			<input type="hidden" name="enterpriseId" value="${enterpriseId }"/>
			<input type="hidden" name="equipFlag" value="${equipFlag }"/>
			<a id = "backSbys" style="display: none;" href="${context }/businessPlatfrom/gyqy/sbyssh/sbys?mnId=${mnId }&enterpriseId=${enterpriseId }&equipFlag=${equipFlag }" target="dialog" 
				mask="true" title="设备验收" max="false" height="300" width="600" rel="sbyssh_sbys">
			<span>设备验收</span></a>
			<p>
				<label>验收单位：</label>
				<select name="environId" class="required combox">
					<c:forEach items="${envDeptMap }" var="envDept">
						<option value="${envDept.key }">${envDept.value }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>验 收 人：</label>
				<input type="text" name="checkMan" />
			</p>
			<p>
				<label>验收时间：</label>
				<span>
				<input type="text" name="checkDate" class="date required" readonly="readonly"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
				
					<!-- <input name="checkDate" type="text" class="date required" r/>
					<a class="inputDateButton" href="javascript:;">选择</a> -->
				</span>
			</p>
			<p>			
				<label> 是否通过：</label>
				<span>
					<input name="checkStatus"  type="radio" value="1" checked="checked"/>通过
					<input name="checkStatus"  type="radio" value="2"/>未通过
				</span>
			</p>
			<p>	
				<label>备注：</label>				
					<textarea name="reMark" rows="4" cols="30"></textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>	
				<li>
					<div class="button"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>