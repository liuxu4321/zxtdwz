<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" width="100%" layoutH="0">
	<form id="pwdChangeform" method="post" action="${context }/authority/member/toSaveUserPwd"  
		  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone);"><!-- onsubmit="return iframeCallback(this, dialogAjaxDone);"> -->

	<div class="pageFormContent nowrap" layoutH="97">

			<dl>
				<dt>账号:</dt>
				<dd>
					<input name="userName" class="required"  readonly="readonly" size="18" type="text" value="${member.userName }"/>
				</dd>
			</dl>
			<dl>
				<dt>现在密码：</dt>
				<dd>
					<input id="now_pwd" type="password" name="now_pwd"  size="19" class="required" />
					
				</dd>
			</dl>
			<dl>
				<dt>新密码：</dt>
				<dd>
					<input id="new_password" type="password" name="new_password" size="19" class="required" minlength="6" maxlength="20" alt="字母、数字、下划线 6-20位"/>
					
				</dd>
			</dl>
			<dl>
				<dt>确认密码：</dt>
				<dd>
					<input type="password"  id="repassword" name="repassword" class="required"  size="19" equalto="#new_password"/>
					
				</dd>
			</dl>
			
			
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>				
				<li>
					<div class="buttonActive"><div class="buttonContent"><button onclick="editMemberInfo();" type="button">保存</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
	function editMemberInfo(){
		
		$("#pwdChangeform").submit();
		/*
		var $identityCard = $("input[name='memberInfo.cardNo']").val();
		if(IdCardValidate($identityCard)||
				$identityCard == "" ||
				$identityCard == null){
			$("#pwdChangeform").submit();
		}else{
			alertMsg.error("你输入的身份证号码有误。请重新输入！");
		}*/
	}

	
</script>
