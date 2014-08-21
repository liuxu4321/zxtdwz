<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%-- <s:text name="ui.title" /> --%></title>
<link href="${context }/styles/dwz/themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="${context }/styles/dwz/themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="${context }/styles/dwz/themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="${context }/styles/dwz/js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="${context }/styles/dwz/js/jquery.validate.js" type="text/javascript"></script>
<%-- <script src="${context }/styles/dwz/js/dwz.min.js" type="text/javascript"></script>
<script src="${context }/styles/dwz/js/dwz.regional.zh.js" type="text/javascript"></script> --%>
<script type="text/javascript">

function toggleBox(boxId){
	var $box = $("#"+boxId);
	if ($box.is(":visible")) $box.slideUp();
	else $box.slideDown();
}
function myValidate(){
	alert(1);
	var userName = $("#userName").val().trim();
	var passWord = $("#passWord").val().trim();
	if(userName.length == 0 && passWord.length == 0){
		$("#userNameValidate").hide().html("<b style='background:red;color:#fff;'>必填&nbsp;</b>");
		$("#passWordValidate").hide().html("<b style='background:red;color:#fff;'>必填&nbsp;</b>");
		$("#userNameValidate").fadeIn();
		$("#passWordValidate").fadeIn();
	}
	if(userName.length == 0){
		$("#userNameValidate").hide().html("<b style='background:red;color:#fff;'>必填&nbsp;</b>");
		$("#userNameValidate").fadeIn();
		return false;
	}
	if(passWord.length == 0){
		$("#passWordValidate").hide().html("<b style='background:red;color:#fff;'>必填&nbsp;</b>");
		$("#passWordValidate").fadeIn();
		return false;
	}
	return true;
}
function toggleSpan(inputId , spanId){
	alert(1);
	var $input = $("#"+inputId);
	var $span = $("#"+spanId);
	if($input.val().length != 0 && $input.val() != null){
		if ($span.is(":visible")) $span.fadeOut();
	}
}

function validateCallback(form){
	var userName = form.userName.value;
	if(userName == ''){
		return false;
	}else{
		return false;
	}
}
</script>
<style type="text/css">

    .checkbox, .radio {
      width: 19px;
      height: 25px;
      padding: 0 5px 0 0;
      background: url(checkbox.png) no-repeat;
      display: block;
      clear: left;
      float: left;
    }
    .radio {
      background: url(radio.png) no-repeat;
    }
    .select {
      position: absolute;
      width: 158px;
      height: 21px;
      padding: 0 24px 0 8px;
      color: #fff;
      font: 12px/21px arial,sans-serif;
      background: url(select.png) no-repeat;
      overflow: hidden;
    }

</style>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<img src="${context }/styles/img/loginlogo.png" />
			</h1>

			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="http://www.lnepb.gov.cn/"  target="_blank">省厅</a></li>
						<li><a href="http://www.sepa.gov.cn/" target="_blank">环保部</a></li>
					</ul>
				</div>
				<h2 class="login_title">请在这登陆</h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm"><!-- validateCallback(this) -->
				<form method="post" action="${context }/authority/member/login">
					<c:if test="${!empty loginError}"><p style="color: red">&nbsp;&nbsp;&nbsp;${loginError}</p></c:if>
					<p>
						<label><fmt:message key="form.username"/></label>
						<input type="text" id="userName" name="userName" size="18" class="login_input required"/>
						<span id="userNameValidate"/>
					</p>
					<p>
						<label><fmt:message key="form.pwd"/></label>
						<input type="password" id="passWord" name="passWord" size="19" class="login_input required"/>
						<span id="passWordValidate"/>
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;<input type="checkbox" name="autoLogin" value="1" style="border: 0;"/>&nbsp;&nbsp;&nbsp;下次自动登陆
					</p>
					<!--<p>
						<label>验证码：</label>
						<input class="code" type="text" size="5" />
						<span><img src="themes/default/images/header_bg.png" alt="" width="75" height="24" /></span>
					</p>-->
					
					<div class="login_bar">
						<input class="sub" type="submit" value=""/>
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="${context }/styles/img/logintitle.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="javascript:toggleBox('forgotPwd')"><fmt:message key="msg.forget.password"/>?</a>
					<c:if test="${!empty message }">
						<span style="color: red">(<c:out value="${message}"></c:out>)</span>
					</c:if>
					
					</li>
					
					<li id="forgotPwd" style="background: none; display: none">
					<form method="post" action="${context }/authority/member/findpassword" onsubmit="return validateCallback(this);">
						<p>
							<label><fmt:message key="form.username"/></label>
							<input type="text" id="userName" name="userName" class="textInput required" size="20"/>
							<span class="info">输入用户名来找回您的密码，密码将会发至您的邮箱中.</span>
						</p>
						<p><input type="submit" value="找回"/></p>
					</form>
					</li>
				</ul>

				<div class="login_inner">
					<p>调整设置污染物的操作模式</p>
					<p>重新设计了数据字典操作方式</p>
					<p>对部分查询功能进行了优化</p>
					<p>修改了程序中发现的BUG</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright <fmt:message key="ui.copyrights"/>
		</div>
	</div>
</body>
</html>
