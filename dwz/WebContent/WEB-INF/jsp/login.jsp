<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%-- <s:text name="ui.title" /> --%></title>
<link href="${context }/styles/dwz/themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="${context }/styles/dwz/themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="${context }/styles/dwz/themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="${context }/styles/dwz/js/jquery-1.7.2.min.js" type="text/javascript"></script>

<script type="text/javascript">

function toggleBox(boxId){
	var $box = $("#"+boxId);
	if ($box.is(":visible")) $box.slideUp();
	else $box.slideDown();
}

</script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<img src="${context }/styles/dwz/themes/default/images/logo.png" />
			</h1>

			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="/management/index!index.do">Home</a></li>
						<li><a href="http://weibo.com/dwzui" target="_blank">微博</a></li>
					</ul>
				</div>
				<h2 class="login_title">Please log in here</h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<form method="post" action="/passport!login.do">
					<c:if test="${!empty message}"><p style="color: red">${message}</p></c:if>
					<p>
						<label>Username：</label>
						<input type="text" name="app_username" size="20" class="login_input" />
					</p>
					<p>
						<label>Password：</label>
						<input type="password" name="app_password" size="20" class="login_input" />
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
			<div class="login_banner"><img src="${context }/styles/dwz/themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="javascript:toggleBox('forgotPwd')">Forgot Password?</a></li>
					<li id="forgotPwd" style="background: none; display: none">
					<form method="post" action="/myaccount/member.do?method=forgetPassword" onsubmit="return validateCallback(this);">
						<p>
							<label>Username：</label>
							<input type="text" name="userName" class="textInput required" size="20"/>
							<span class="info">Please enter your username to retrieve your password.</span>
						</p>
						<p><input type="submit" value="Submit"/></p>
					</form>
					</li>
				</ul>

				<div class="login_inner">
					<p>Test User: admin</p>
					<p>Password: 123456</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2009 iQ-Energy Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>
