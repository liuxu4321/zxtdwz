<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<div class="pageContent">
	<form id="wrwEdit"  method="post" action="${context }/background/dic/sblx/edit/save?navTabId=sblx&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<p>
				<label>生产商ID：</label>
				<input type="text" id="vendorId" name="vendorId" readonly="readonly" value="${vendor.vendorId }"/>

			</p>
			<p>			
				<label>生产商名称：</label>
				<input type="text" name="vendorName" class="required" value="${vendor.vendorName }" maxlength="100"/>
				
			</p>			
			<p>
				<label>地址：</label>				
				<input type="text" name="address" value="${vendor.address }" maxlength="100"/>
			</p>
		
			
			<p>
				<label>联系人：</label>
				<input type="text" name="linkman" class="required" value="${vendor.linkman }" maxlength="10"/>
			</p>
			
			<p>
				<label>电话：</label>
				<input type="text" name="tel" class="required"  maxlength="25" value="${vendor.tel }"/>
			</p>
			<p>
				<label>邮箱：</label>
				<input type="text" name="mail" class="email" maxlength="25" value="${vendor.mail }"/>
			</p>
			<p>
				<label>生产许可证编号：</label>
				<input type="text" name="licenceNo"  maxlength="25" value="${vendor.licenceNo }"/>
			</p>
			<p>
				<label>环保产品认证编号：</label>
				<input type="text" name="certificateNo" maxlength="25" value="${vendor.certificateNo }"/>
			</p>		
			<p>
				<label>备注：</label>
				<textarea  style="width:99%;border:0;" rows="4" name="remark" maxlength="250" >${vendor.remark }</textarea>
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