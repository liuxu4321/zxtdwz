<!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<title>辽宁省重点污染源自动监控系统</title>
	<%-- <link href="${context }/styles/dwz/themes/default/style.css" rel="stylesheet" type="text/css" /> --%>
	<link href="${context }/styles/dwz/themes/azure/style.css" rel="stylesheet" type="text/css" />
	<link href="${context }/styles/dwz/themes/css/core.css" rel="stylesheet" type="text/css" />
	<link href="${context }/styles/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
	<script src="${context }/styles/dwz/js/speedup.js" type="text/javascript"></script>
 	<script src="${context }/styles/dwz/js/jquery-1.7.1.js" type="text/javascript"></script> 
	<script src="${context }/styles/dwz/js/jquery.cookie.js" type="text/javascript"></script>
	<script src="${context }/styles/dwz/js/jquery.validate.js" type="text/javascript"></script>
	<script src="${context }/styles/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
	<script src="${context }/styles/dwz/js/dwz.min.js" type="text/javascript"></script>
	<script src="${context }/styles/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
	<script src="${context }/styles/dwz/js/dwz.stable.js" type="text/javascript"></script>
	<script src="${context }/styles/gis/js/gis.js" type="text/javascript"></script>
	<!-- highCharts start -->
	<script src="${context }/styles/highcharts/js/highcharts.src.js" type="text/javascript"></script>
	<script src="${context }/styles/highcharts/js/modules/exporting.js" type="text/javascript"></script>
	<!-- highCharts  end  -->
	<!-- zTree start -->
	<script src="${context }/styles/ztree/jquery.ztree.core-3.5.js" type="text/javascript"></script>
	<script type="text/javascript" src="${context }/styles/ztree/jquery.ztree.excheck-3.5.js"></script>
	<!-- zTree  end  -->
	<!-- DWR start -->
	<script src="${context }/dwr/engine.js" type="text/javascript"></script>
	<script src="${context }/dwr/util.js" type="text/javascript" ></script>
	<script src="${context }/dwr/interface/listService.js" type="text/javascript"  ></script>
	<script src="${context }/dwr/interface/dwrController.js" type="text/javascript" ></script>
	<!-- DWR end  -->
	<!-- 周选择控件 开始-->
	<script src="${context }/styles/js/myweek.js" type="text/javascript"></script>
	<!-- 周选择控件 结束-->
	<link href="themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
	<link href="uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
	<!--[if IE]>
	<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
	<![endif]-->
	<!--[if lte IE 9]>
	<script src="js/speedup.js" type="text/javascript"></script>
	<![endif]-->
	<style type="text/css">
		#header{height:85px}
		#leftside, #container, #splitBar, #splitBarProxy{top:90px}
	</style>
	
	<script type="text/javascript">
	//定义放置JS定时器的数组
	var intervalArr=new Array();
	$(function(){
		DWZ.init("${context }/styles/dwz/dwz.frag.xml", {
			loginUrl:"${context }/login",	// 跳到登录页面
			debug:false,	// 调试模式 【true|false】
			callback:function(){
				initEnv();
				$("#themeList").theme({themeBase:"${context }/styles/dwz/themes"});
			}
		});
	});
	
	/*
		加载行政区划树形结构
		BY RENWEI 2013/11/21
	*/
	$(document).ready(function(){
		$("#division_gis").loadUrl("${context }/division/init?divisionFlag=0");
		$("#indexRight").loadUrl("${context }/gis/init");
		//禁用GIS
		 var indexLoadTimer = setTimeout(function() {//alert("当前版本GIS服务不可用！");
			 document.getElementById("hiddenlink_menu_"+2).click();
			 clearTimeout(indexLoadTimer);
		 },1000);
	});
	
	/*
		画面右侧菜单切换
		BY RENWEI 2013/11/11
	*/
	function changeIndexPage(Object){
		////禁用GIS
		//document.getElementById("hiddenlink_desktop_"+Object).click();
		
		if("1"==Object){
			//alert("当前版本GIS服务不可用！");
		}else{
			document.getElementById("hiddenlink_desktop_"+Object).click();
		}
	}
	
	</script>
	</head>
	<body scroll="no">
		<div id="layout">
			<div id="header">
				<div class="headerNav">
				<%-- <embed src="${context }/styles/img/title.swf" width="700" height="50" align="middle" wmode="transparent" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /> --%>
					<a class="logo" style="display:block;width:500px;">标志</a>
					<ul class="nav">
						<li><a><fmt:message key="msg.userinfo"><fmt:param value="${member.userName }"/></fmt:message></a></li>
						<%-- <li><a href="${context }/system/help" target="navTab" rel="main_help"><fmt:message key="ui.help"/></a></li> --%>
						<li><a href="${context }/authority/member/logout"><fmt:message key="ui.logout"/></a></li>
					</ul>
				</div>		
				<div id="navMenu">
				<ul>
					<c:forEach var="modules" items="${modules}">
						<c:choose>
							<c:when test="${modules.id == 1 }">
								<%-- 				省厅用					<li class="selected"><a href="${context }/${modules.url1 }?moduleId=${modules.id}" onclick="changeIndexPage('${modules.id}')"><span><img  style="vertical-align: middle;" src="${context }/${modules.imgUrl}">${modules.moduleName}</span></a></li> --%>
								<li class="selected"><span><img style="vertical-align: middle;" src="${context }/${modules.imgUrl}">${modules.moduleName}</span></li>
							</c:when>
							<c:otherwise>
								<li><a id="hiddenlink_menu_${modules.id}" href="${context }/${modules.url1 }?moduleId=${modules.id}" onclick="changeIndexPage('${modules.id}')"><span><img style="vertical-align: middle;" src="${context }/${modules.imgUrl}">${modules.moduleName}</span></a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
				<div style="display: none;">
					<c:forEach var="modules" items="${modules}">
						<a id="hiddenlink_desktop_${modules.id}"
							href="${context }/${modules.url2}?moduleId=${modules.id}"
							target="${modules.target}" rel="${modules.rel}"
							title="${modules.moduleName}" style=""></a>
					</c:forEach>
				</div>
			</div>
			</div>
			<div id="leftside">
				<div id="sidebar_s">
					<div class="collapse"><!--首页左侧菜单禁用 id="leftDiv" class="collapse_home" -->
						<div class="toggleCollapse"><div><!--首页左侧菜单禁用  id="iconDiv" style="display:none;" --></div></div>
					</div>
				</div>
				<div id="sidebar">
					<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>				
					<div id="division_gis"></div>
				</div>
			</div>
			<div id="container">
				<div id="navTab" class="tabsPage">
					<div class="tabsPageHeader">
						<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
							<ul class="navTab-tab">
								<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">首页</span></span></a></li>
							</ul>
						</div>
						<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
						<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
						<div class="tabsMore">more</div>
					</div>
					<ul class="tabsMoreList">
						<li style="display: block"><a href="javascript:;">首页</a></li>
					</ul>
					<div class="navTab-panel tabsPageContent layoutBox">
						<div class="page unitBox" layoutH="0">
						<div id="indexRight" layoutH="0"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">Copyright <fmt:message key="ui.copyrights"/></div>
	</body>
</html>
