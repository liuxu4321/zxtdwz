<!-- 左侧菜单栏 -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<SCRIPT type="text/javascript" >
	var zTree;
	var demoIframe;
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			onClick: nodeOnClick
		}
	};
	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
		htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
		maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
		h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
	}
	
	function zTreeAjax(json){
		for(var i=0;i<json.length;i++){
			json[i].icon = "${context }/"+json[i].icon;
		}
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, json);
	}
	
	function nodeOnClick(event, treeId, treeNode, clickFlag) {
		var Node = document.getElementById("hiddenlink_Tree");
		if(treeNode.aurl != ""&&treeNode.aurl != null){
			Node.setAttribute("href",treeNode.aurl);
			Node.setAttribute("target",treeNode.target);
			Node.setAttribute("rel",treeNode.rel);
			Node.setAttribute("title",treeNode.name);
			Node.click();
		}
	}
	
	$(document).ready(function(){
		$(function(){ajaxTodo("${context }/menu/ajax?moduleId="+$("#moduleId").val(),zTreeAjax);});
	});
  </SCRIPT>

<div class="accordion" fillSpace="sideBar">
	<div class="accordionContent">
	<input id="moduleId" type="hidden" value="${moduleId}" >
		<ul id="tree" class="ztree" style="width:187px; overflow:auto;"></ul>
		<a id="hiddenlink_Tree" href="" target="navTab" rel="" title=""></a>	
	</div>
</div>

