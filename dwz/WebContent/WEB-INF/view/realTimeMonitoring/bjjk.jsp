<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="auto">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="${context }/alarmMonitor/cbbj" class="j-ajax" rel="cbbj_box"><span>超标报警</span></a></li><!-- webroot/rtmonitor/moniter_bjjk_cbbj.html -->
					<li><a href="${context }/alarmMonitor/sjyc" class="j-ajax" rel="sjyc_box"><span>数据异常</span></a></li><!-- webroot/rtmonitor/moniter_bjjk_sjyc.html -->
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<div id="cbbj_box"></div>
			<div id="sjyc_box"></div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>