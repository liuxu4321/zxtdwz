<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionContent">
		<ul class="tree treeFolder">
			<li><a>工业企业基本信息</a>
				<ul>
					<li><a
						href="${context }/businessPlatfrom/enterprise/qylb/<%=Constant.QYLX_YBGYQY %>"
						target="navTab" rel="qylb_<%=Constant.QYLX_YBGYQY %>">工业企业列表</a></li>
					<li><a
						href="${context }/businessPlatfrom/enterprise/zxgl/<%=Constant.QYLX_YBGYQY %>"
						target="navTab" rel="zxgl_<%=Constant.QYLX_YBGYQY %>"
						title="注销管理(工业企业)">注销管理</a></li>
					<li class="collapse"><a>工业企业信息维护</a>
						<ul>
							<li><a
								href="${context }/businessPlatfrom/enterprise/jbxxwh/<%=Constant.QYLX_YBGYQY %>"
								title="基本信息维护(工业企业)" target="navTab"
								rel="jbxxwh_<%=Constant.QYLX_YBGYQY %>">基本信息维护</a></li>
							<li><a
								href="${context }/businessPlatfrom/pfk/fspfk/<%=Constant.QYLX_YBGYQY %>"
								title="废水排放口(工业企业)" target="navTab"
								rel="fspfk_<%=Constant.QYLX_YBGYQY %>">废水排放口</a></li>
							<li><a
								href="${context }/businessPlatfrom/jkd/fsjkd/<%=Constant.QYLX_YBGYQY %>"
								title="废水监控点(工业企业)" target="navTab"
								rel="fsjkd_<%=Constant.QYLX_YBGYQY %>">废水监控点</a></li>
							<li><a
								href="${context }/businessPlatfrom/gyqy/fqpfk/<%=Constant.QYLX_YBGYQY %>"
								title="废气排放口(工业企业)" target="navTab"
								rel="fqpfk_<%=Constant.QYLX_YBGYQY %>">废气排放口</a></li>

							<li><a
								href="${context }/businessPlatfrom/jkd/fqjkd/<%=Constant.QYLX_YBGYQY %>"
								title="废气监控点(工业企业)" target="navTab"
								rel="fqjkd_<%=Constant.QYLX_YBGYQY %>">废气监控点</a></li>

							<!-- <li><a href="webroot/background/gfwrwsz.html" target="navTab" rel="gfwrwsz">固废污染物设置</a></li> -->
							<li><a
								href="${context }/businessPlatfrom/dataGather/sjcjyxx/<%=Constant.QYLX_YBGYQY %>"
								title="数据采集仪信息(工业企业)" target="navTab"
								rel="sjcjyxx_<%=Constant.QYLX_YBGYQY %>">数据采集仪信息</a></li>
							<!-- <li><a href="webroot/background/wrzlss.html" target="navTab" rel="wrzlss">污染治理设施</a></li> -->
							<li><a
								href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/<%=Constant.QYLX_YBGYQY %>"
								title="在线监测仪设置(工业企业)" target="navTab" rel="zxjcyqsz">在线监测仪设置</a></li>

							<li><a
								href="${context }/businessPlatfrom/gyqy/sbyssh/<%=Constant.QYLX_YBGYQY %>"
								title="设备验收审核(工业企业)" target="navTab"
								rel="xcdzhgl_body_<%=Constant.QYLX_YBGYQY %>">设备验收审核</a></li>
							<!-- <li><a href="webroot/background/gtcgl.html" target="navTab" rel="gtcgl">关停产管理</a></li> -->
							<li><a
								href="${context }/businessPlatfrom/gtc/gtcgl/<%=Constant.QYLX_YBGYQY %>"
								title="关停产管理(工业企业)" target="navTab" rel="gtcgl">关停产管理</a></li>
							<%-- <li><a href="${context }/businessPlatfrom/gyqy/zdybq" target="navTab" rel="zdybq">自定义标签</a></li> --%>
						</ul></li>
				</ul></li>
			<li><a>污水处理厂基本信息</a>
				<ul>
					<li><a
						href="${context }/businessPlatfrom/enterprise/qylb/<%=Constant.QYLX_WSCLC %>"
						target="navTab" rel="qylb_<%=Constant.QYLX_WSCLC %>">污水处理厂企业列表</a></li>
					<li><a
						href="${context }/businessPlatfrom/enterprise/zxgl/<%=Constant.QYLX_WSCLC %>"
						title="(污水处理厂)" target="navTab" rel="zxgl">注销管理</a></li>
					<li><a>污水处理厂信息维护</a>
						<ul>
							<li><a
								href="${context }/businessPlatfrom/enterprise/jbxxwh/<%=Constant.QYLX_WSCLC %>"
								title="(污水处理厂)" target="navTab"
								rel="jbxxwh_<%=Constant.QYLX_WSCLC %>">基本信息维护</a></li>
							<li><a
								href="${context }/businessPlatfrom/pfk/fspfk/<%=Constant.QYLX_WSCLC %>"
								title="废水排放口(污水处理厂)" target="navTab"
								rel="fspfk_<%=Constant.QYLX_WSCLC %>">废水排放口</a></li>
							<li><a
								href="${context }/businessPlatfrom/jkd/fsjkd/<%=Constant.QYLX_WSCLC %>"
								title="废水监控点(污水处理厂)" target="navTab"
								rel="fsjkd_<%=Constant.QYLX_WSCLC %>">废水监控点</a></li>
							<li><a
								href="${context }/businessPlatfrom/gyqy/fqpfk/<%=Constant.QYLX_WSCLC %>"
								title="废气排放口(污水处理厂)" target="navTab"
								rel="fqpfk_<%=Constant.QYLX_WSCLC %>">废气排放口</a></li>
							<li><a
								href="${context }/businessPlatfrom/jkd/fqjkd/<%=Constant.QYLX_WSCLC %>"
								title="废气监控点(污水处理厂)" target="navTab"
								rel="fqjkd_<%=Constant.QYLX_WSCLC %>">废气监控点</a></li>
							<!-- <li><a href="webroot/background/gfwrwsz.html" target="navTab" rel="gfwrwsz">固废污染物设置</a></li> -->
							<li><a
								href="${context }/businessPlatfrom/dataGather/sjcjyxx/<%=Constant.QYLX_WSCLC %>"
								title="数据采集仪信息(污水处理厂)" target="navTab"
								rel="sjcjyxx_<%=Constant.QYLX_WSCLC %>">数据采集仪信息</a></li>
							<!-- <li><a href="webroot/background/wrzlss.html" target="navTab" rel="wrzlss">污染治理设施</a></li> -->
							<li><a
								href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/<%=Constant.QYLX_WSCLC %>"
								title="在线监测仪设置(污水处理厂)" target="navTab"
								rel="zxjcyqsz_<%=Constant.QYLX_WSCLC %>">在线监测仪设置</a></li>
							<li><a
								href="${context }/businessPlatfrom/gyqy/sbyssh/<%=Constant.QYLX_WSCLC %>"
								title="设备验收审核(污水处理厂)" target="navTab"
								rel="xcdzhgl_body_<%=Constant.QYLX_WSCLC %>">设备验收审核</a></li>
							<li><a
								href="${context }/businessPlatfrom/gtc/gtcgl/<%=Constant.QYLX_WSCLC %>"
								title="关停产管理(污水处理厂)" target="navTab" rel="gtcgl">关停产管理</a></li>
							<!-- <li><a href="webroot/rtmonitor/moniter_zdybq_main.html" target="navTab" rel="moniter_zdybq_main">自定义标签</a></li> -->
						</ul></li>
				</ul></li>
			<%-- <li><a>固废处置单位基本信息</a>
				<ul>
					<li><a href="${context }/businessPlatfrom/enterprise/qylb/<%=Constant.QYLX_GFCZDW %>" target="navTab" rel="qylb_<%=Constant.QYLX_GFCZDW %>">固废处置单位企业列表</a></li>
					<li><a>固废处置单位信息维护</a>
						<ul>
							<li><a href="${context }/businessPlatfrom/enterprise/jbxxwh/<%=Constant.QYLX_GFCZDW %>" target="navTab" rel="jbxxwh_<%=Constant.QYLX_GFCZDW %>">基本信息维护</a></li>
							<li><a href="${context }/businessPlatfrom/pfk/fspfk/<%=Constant.QYLX_GFCZDW %>" target="navTab" rel="fspfk_<%=Constant.QYLX_GFCZDW %>">废水排放口</a></li>
							<li><a href="${context }/businessPlatfrom/jkd/fsjkd/<%=Constant.QYLX_GFCZDW %>" target="navTab" rel="fsjkd_<%=Constant.QYLX_GFCZDW %>">废水监控点</a></li>
							<li><a href="webroot/background/fqpfk.html" target="navTab" rel="fqpfk">废气排放口</a></li>
							<li><a href="webroot/background/fqjkd.html" target="navTab" rel="fqjkd">废气监控点</a></li>
							<li><a href="webroot/background/gfwrwsz.html" target="navTab" rel="gfwrwsz">固废污染物设置</a></li>
							<li><a href="${context }/businessPlatfrom/equipment/sjcjyxx/<%=Constant.QYLX_GFCZDW %>" target="navTab" rel="sjcjyxx_<%=Constant.QYLX_GFCZDW %>">数据采集仪信息</a></li>
							<li><a href="webroot/background/wrzlss.html" target="navTab" rel="wrzlss">污染治理设施</a></li>
							<li><a href="webroot/background/zxjcyqsz.html" target="navTab" rel="zxjcyqsz">在线监测仪设置</a></li>
							<li><a href="webroot/background/xcdzhgl_body.html" target="navTab" rel="xcdzhgl_body">设备验收审核</a></li>
							<li><a href="webroot/background/gtcgl.html" target="navTab" rel="gtcgl">关停产管理</a></li>
							<li><a href="webroot/background/zxgl.html" target="navTab" rel="zxgl">注销管理</a></li>
							<li><a href="webroot/rtmonitor/moniter_zdybq_main.html" target="navTab" rel="moniter_zdybq_main">自定义标签</a></li>
						</ul>
					</li>
				</ul>
			</li> --%>
			<!-- <li><a href="webroot/rtmonitor/moniter_jcdty.html" target="navTab" rel="moniter_jcdty">关停产管理</a></li> -->
			<li><a href="${context }/businessPlatfrom/gyqy/wrysq"
				target="navTab" rel="wrysq_main">污染源授权</a></li>
			<li><a href="javascript:void(0);">数据修约</a></li>
			<!-- target="navTab" rel="sjxy_main" -->
			<li><a href="javaScript:void(0);">凭证管理</a></li>
			<!--  target="navTab" rel="moniter_pzgl" -->
		</ul>
	</div>
</div>