<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="auto">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="${context }/statistics/historyData/gas" class="j-ajax" rel="gas_box"><span>废气</span></a></li>
					<li><a href="${context }/statistics/historyData/water" class="j-ajax" rel="water_box"><span>废水</span></a></li>
					<li><a href="${context }/statistics/historyData/ws" class="j-ajax" rel="ws_box"><span>污水</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" >
			<div id="gas_box"></div>
			<div id="water_box"></div>
			<div id="ws_box"></div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>