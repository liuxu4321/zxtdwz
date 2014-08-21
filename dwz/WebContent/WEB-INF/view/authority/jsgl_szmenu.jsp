<!-- 左侧菜单栏 -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>
<SCRIPT type="text/javascript">
	var zTree;
	var demoIframe;

	var setting = {
		view : {
			dblClickExpand : false,
			showLine : true,
			selectedMulti : false
		},
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : ""
			}
		},
		callback : {
			//onClick : nodeOnClick
		}
	};

	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight, htmlH = demoIframe
				.contents().find("html").get(0).scrollHeight, maxH = Math.max(
				bodyH, htmlH), minH = Math.min(bodyH, htmlH), h = demoIframe
				.height() >= maxH ? minH : maxH;
		if (h < 530)
			h = 530;
		demoIframe.height(h);
	}

	function zTreeAjax(json) {
		var t = $("#newTree");
		t = $.fn.zTree.init(t, setting, json);
	}

	$(document).ready(
			function() {
				$(function() {
					ajaxTodo(
							"${context }/authority/member/jsgl/szmenu/getmenu?roleId=${roleId}",
							zTreeAjax);
				});
			});

	//数据保存
	function test() {
		var treeObj = $.fn.zTree.getZTreeObj("newTree");
		var nodes = treeObj.getCheckedNodes(true);
		var nodesLength = nodes.length;
		var menusIds = "";
		for(var i = 0; i < nodesLength ;i++){
			if(i == nodesLength-1){
				menusIds += nodes[i].id;
			}else{
				menusIds += nodes[i].id + ",";
			}
		}
		$("#szMenuform").attr("action","${context }/authority/member/jsgl/szmenu/save?menusIds="+menusIds+"&navTabId=jsgl&callbackType=closeCurrent");
		$("#szMenuform").submit();
	}
</SCRIPT>
	<form method="post" id="szMenuform"
		action="${context }/authority/member/jsgl/szmenu/save?navTabId=jsgl&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone);">
		<input type="hidden" name="roleId" value="${roleId}"/>
	</form>
	<div class="accordion" fillSpace="sideBar" layoutH="38">
		<div class="accordionContent">
			<ul id="newTree" class="ztree" style="width: 187px; overflow: auto;"></ul>
			<ul class="tree treeFolder">
				<a id="newHiddenlink_Tree" href="" target="navTab" rel="" title=""></a>
			</ul>
		</div>
	</div>

<div class="formBar">
	<ul>
		<li><div class="buttonActive">
				<div class="buttonContent">
					<button type="submit" onclick="test();">保存</button>
				</div>
			</div></li>
		<li>
			<div class="button">
				<div class="buttonContent">
					<button type="button" class="close">返回</button>
				</div>
			</div>
		</li>
	</ul>
</div>
