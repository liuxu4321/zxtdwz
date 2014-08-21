<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionContent">
		<ul class="tree treeFolder">
			<li><a>系统设置</a>
				<ul>
					<li><a href="${context }/background/dic/hbjgsz" target="navTab" rel="hbjgsz">环保机构设置</a></li>
					<li><a href="${context }/background/dic/pfbzgl" target="navTab" rel="pfbzgl">排放标准设置</a></li>
					<!-- <li><a href="webroot/background/zsbzsz.html" target="navTab" rel="zsbzsz">征收标准设置</a></li> -->
					<!-- <li><a href="webroot/background/cssz.html" target="navTab" rel="cssz">参数设置</a></li> -->
					<!-- <li><a href="webroot/background/qylxzh.html" target="navTab" rel="qylxzh">企业类型转换</a></li> -->
					<li><a href="${context }/background/sys/rzgl" target="navTab" rel="rzgl">日志管理</a></li>
				</ul>
			</li>
			<li><a>字典表管理</a>
				<ul>
					<li><a href="${context }/background/dic/dlb" target="navTab" rel="dlb">大类别</a></li>
					<li><a href="${context }/background/dic/xlb/init" target="navTab" rel="xlb">小类别</a></li>
					<li><a href="${context }/background/dic/wrw" target="navTab" rel="wrw">污染物</a></li>
					<li><a href="${context }/background/dic/ywdw" target="navTab" rel="ywdw">运维单位</a></li>
					<li><a href="${context }/background/dic/sblx" target="navTab" rel="sblx">生产商</a></li>
				</ul>
			</li>
			<li><a href="${context }/authority/member/jsgl" target="navTab" rel="jsgl">角色管理</a></li>
			<li><a href="${context }/authority/member/yhgl" target="navTab" rel="yhgl">用户管理</a></li>
			<!-- <li><a href="webroot/sysmanager/txlscx.html" target="navTab" rel="txlscx">提醒历史查询</a></li> -->
		</ul>
	</div>
</div>




