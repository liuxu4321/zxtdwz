<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>
<form id="pagerForm" method="post"
	action="${context }/background/dic/wrw">
	<input type="hidden" name="pageNum" value="${currentPageNo }" /> <input
		type="hidden" name="numPerPage" value="${page.pageSize }" /> <input
		type="hidden" name="pollutantId" value="${pollutantId }" />
</form>
<style>
.loftDiv {
	width: 40%;
	float: left;
	margin-left: 5%;
	min-height: 400px;
}

.midleDiv {;
	width: 10%;
	float: left;
	min-height: 400px;
}

.rightDiv {
	width: 40%;
	float: left;
	min-height: 400px;
}

.divHeader {
	text-align: center;
	width: 49%;
	float: left;
	height: 30px;
}

.searchDive {
	border: solid 1px red;
	width: 44%;
	float: left;
	text-align: right;
}

.spanHeader {
	margin-top: 12px;
}
</style>
<script type="text/javascript">
	// ÒÆÓidéfromµÄÁÐ±íÖÐµÄßxÖÐíµ½idétoµÄÁÐ±íÖÐ
	function move(from, to) {
		// «@È¡ÒÆÓÔ´  
		var fromBox = document.getElementById(from);
		// «@È¡ÒÆÓÄ¿µÄµØ  
		var toBox = document.getElementById(to);
		// ®ÒÆÓÔ´´æÔÚßxÖÐír
		while (fromBox.selectedIndex != -1) {
			// ¢ÒÆÓÔ´ÖÐµÄßxÖÐíÌí¼Óµ½ÒÆÓÄ¿µÄµØµÄÄ©Î²  
			toBox.appendChild(fromBox.options[fromBox.selectedIndex]);
		}
	}

	function saveentAuth() {
		//已授权的企业ID
		var enterpriseIds = "";
		var selectBox = document.getElementById("rightBox");
		for ( var i = 0; i < selectBox.options.length; i++) {
			if (i == 0) {
				enterpriseIds += selectBox.options[i].value;
			} else {
				enterpriseIds += ",";
				enterpriseIds += selectBox.options[i].value;
			}

		}
		var actionUrl = "${context }/businessPlatfrom/gyqy/wrysq/sqgl/save?memberId=${memberId }&enterpriseIds="
				+ enterpriseIds;
		$(function() {
			ajaxTodo(actionUrl, ajaxCallBack);
		});
		//$("#wrysqglForm").attr("wrysqglform", actionUrl);
		//$("#wrysqglForm").submit();

	}
	function ajaxCallBack() {
		alertMsg.correct("操作成功");
		//当前活动页面关闭
		//navTab.closeCurrentTab();
		//return false;
	}
</script>
<div class="pageHeader">
	<form id="wrysqglForm"
		onsubmit="return navTabSearch(this);"
		action="${context }/businessPlatfrom/gyqy/wrysq/sqgl/${memberId }" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<%-- <td> 
						<span style="float: left;margin-top: 8px;">行政区划：</span>
						<input style="float: left;" name="areaCode.subName" type="text" class="required"  readonly="readonly"/>
						<input name="areaCode.subId" onpropertychange="getEnvironId();" type="hidden" readonly="readonly"/>
						<a style="float: left;" class="btnLook" href="${context }/businessPlatfrom/enterprise/areaCode/lookup" lookupGroup="areaCode"
							mask="true" max="false" height = "600" width="350" >所在地市</a>
					</td> --%>
					<td >
							行政区域：
						<select name="areaCode" id="areaCodeSelect" >
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }"
									<c:if test="${ac.key==areaCode }">selected='selected'</c:if>>${ac.value
									}</option>
							</c:forEach>
						</select>
					</td>
					<td>关注程度：<%-- <input type="text" name="pollutantId" value="${pollutantId }"/> --%>
						<select name="atTention">
							<option value="">所有</option>
							<c:forEach var="atTentionSelectMap" items="${atTentionSelectMap }">
								<option value="${atTentionSelectMap.key }"
									<c:if test="${atTentionSelectMap.key == atTention}">selected='selected'</c:if>>
									${atTentionSelectMap.value }</option>
							</c:forEach>
					</select>
					</td>
					<td>污染源类型：<%-- <input type="text" name="pollutantId" value="${pollutantId }"/> --%>
						<select name="kindCode">
							<option value="">所有</option>
							<c:forEach var="kindCodeSelectMap" items="${kindCodeSelectMap }">
								<option value="${kindCodeSelectMap.key }"
									<c:if test="${kindCodeSelectMap.key == kindCode}">selected='selected'</c:if>>
									${kindCodeSelectMap.value }</option>
							</c:forEach>
						</select>
					</td>
					<%-- <td>行业类别：<input type="text" name="pollutantId" value="${pollutantId }"/>
						<select name="industry">
							<option value="">所有</option>
							<c:forEach var="trade" items="${tradeSelectMap }">
								<option value="${trade.key }"
									<c:if test="${trade.key == industry}">selected='selected'</c:if>>
									${trade.value }</option>
							</c:forEach>
						</select>
					</td> --%>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<form id="wrwEdit" method="post"
		action="${context }/background/dic/hbjgsz/addAndSave?callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div layoutH="100">
			<div class="pageHeader">
				<h1 style="margin-left: 30px;">当前污染源范围:</h1>
			</div>
			<div>
				<div class="divHeader">
					<div class="spanHeader">
						<h2 style="color: green">未授权</h2>
					</div>
				</div>
				<div class="divHeader">
					<div class="spanHeader">
						<h2 style="color: green">已授权</h2>
					</div>
				</div>
			</div>
			<div>
				<div class="loftDiv">
					<select id="leftBox" multiple="multiple"
						style="height: 400px; width: 99%; min-width: 400px">
						<c:forEach var="enterprise" items="${enterpriseMap }">
							<option value="${enterprise.key }">${enterprise.value }</option>
						</c:forEach>
					</select>
				</div>
				<div class="midleDiv">
					<div style="height: 200px; width: 99%; float: left;">
						<input type="button"
							style="margin: 170px 0 0 38%; float: left; padding-left: 5px;"
							value="&gt;&gt;&ensp;" onclick="move('leftBox','rightBox')" />
					</div>
					<div style="height: 200px; width: 99%; float: left;">
						<input type="button"
							style="margin: 10px 0 0 38%; float: left; padding-left: 5px;"
							value="&lt;&lt;&ensp;" onclick="move('rightBox','leftBox')" />
					</div>
				</div>
				<div class="rightDiv">
					<select id="rightBox" multiple="multiple"
						style="height: 400px; width: 99%; min-width: 400px">
						<c:forEach var="enterprise" items="${entAuthMap }">
							<option value="${enterprise.key }">${enterprise.value }</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="formBar">
			<ul style="margin-right: 20px;">
				<li>
					<div class="buttonActive">
						<div class="buttonContent" onclick="saveentAuth();">
							<button type="button">保存</button>
						</div>
					</div>
				</li>
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button class="close" type="button">返回</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
