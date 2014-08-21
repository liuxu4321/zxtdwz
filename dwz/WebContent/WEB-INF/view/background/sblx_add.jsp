<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<script type="text/javascript">
	function  checkId(){
		var	$vendorId = $('#vendorId').val();
		if($vendorId != null && $vendorId != ""){			
			$(function(){ajaxTodo("${context }/background/dic/sblx/add/checkId?navTabId=sblx&vendorId="+$vendorId ,addcheckAjaxDone);});
		}
	}
	 function addcheckAjaxDone(json){
		if(json==1){
			$("#checkVenderID").attr({style: "display:none"});
		}else{
			$("#checkVenderID").attr({style: "display:block"});			
		}
	} 
</script>

<div class="pageContent">
	<form id="wrwEdit"  method="post" action="${context }/background/dic/sblx/add/save?navTabId=sblx&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<!-- <p>
				<label>生产商ID：</label>
				<input type="text" id="vendorId" name="vendorId" class="required number" maxlength="15" onblur="checkId();"/>
				<span id="checkVenderID" class="error" style="display: none;">生产商ID已存在</span>
			</p> -->
			<p>			
				<label>生产商名称：</label>
				<input type="text" name="vendorName" class="required" maxlength="100"/>
				
			</p>			
			<p>
				<label>地址：</label>				
				<input type="text" name="address" maxlength="100"/>
			</p>
		
			
			<p>
				<label>联系人：</label>
				<input type="text" name="linkman" class="required" maxlength="10"/>
			</p>
			
			<p>
				<label>电话：</label>
				<input type="text" name="tel" class="required"  maxlength="25"/>
			</p>
			<p>
				<label>邮箱：</label>
				<input type="text" name="mail" class="email" maxlength="25"/>
			</p>
			<p>
				<label>生产许可证编号：</label>
				<input type="text" name="licenceNo"  maxlength="25"/>
			</p>
			<p>
				<label>环保产品认证编号：</label>
				<input type="text" name="certificateNo" maxlength="25"/>
			</p>		
			<p>
				<label>备注：</label>
				<textarea  style="width:99%;border:0;" rows="4" name="remark" maxlength="250"></textarea>
			</p>
		</div>
		<!-- </table> -->
		<div class="formBar">
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