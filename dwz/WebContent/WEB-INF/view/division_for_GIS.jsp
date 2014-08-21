<!-- 行政区划-GIS -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<SCRIPT type="text/javascript" >
	var zTree;
	var demoIframe;
	var nodeList = [];
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
			onClick: nodeOnClick,
			beforeClick: beforeClick
		},
		view: {
			fontCss: getFontCss
		}
	};
	
	function beforeClick(treeId, treeNode) {
		flexCenter(treeNode.id,treeNode.kind);
	}
	
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
			if(i==0){
				json[i].open = "true";
			}
			json[i].icon = "${context }/"+json[i].icon;
		}
		var t = $("#tree_for_GIS");
		var selectedNodeId = $("#selectedNodeId").val();
		t = $.fn.zTree.init(t, setting, json);
		var zTree = $.fn.zTree.getZTreeObj("tree_for_GIS");
		selectedNode = zTree.getNodeByParam("id", selectedNodeId);
		zTree.selectNode(selectedNode);
	}
	
	/*
	//节点选中
	*/
	function nodeOnClick(event, treeId, treeNode, clickFlag) {
		var Node = document.getElementById("hiddenlink_Tree_for_GIS");
		//var attentionCode = $("#attentionCode").val();
		//var kindCode = $("#kindCode").val();
		//var industryCode = $("#industryCode").val();
		//alert(treeNode.getAttribute("kind"));
		
		if(treeNode.aurl != ""&&treeNode.aurl != null){
			Node.setAttribute("href",treeNode.aurl);
			Node.setAttribute("target",treeNode.target);
			Node.setAttribute("rel",treeNode.rel);
			Node.setAttribute("title",treeNode.name);
			Node.click();
		}
	}
	
	/*
	//模糊查询节点
	*/
	function searchTreeNodes(){
		updateNodes(false);
		var zTree = $.fn.zTree.getZTreeObj("tree_for_GIS");
		var keyValue = document.getElementById("key_for_GIS").value;
		keyValue = jQuery.trim(keyValue);
		if(keyValue != null&&keyValue != ""){
			nodeList = zTree.getNodesByParamFuzzy("name", keyValue);
			updateNodes(true);
		}
	}
	
	/*
	//设置查询到的节点的样式
	*/
	function updateNodes(highlight) {
		var zTree = $.fn.zTree.getZTreeObj("tree_for_GIS");
		for( var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;
			zTree.selectNode(nodeList[i]);
			zTree.updateNode(nodeList[i]);
		}
	}
	
	/*
	//节点样式更改
	*/
	function getFontCss(treeId, treeNode) {
		return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
	}
	
	/*
	//加载树形结构
	*/
	$(document).ready(function(){
		var attentionCode = $("#attentionCode").val();
		var kindCode = $("#kindCode").val();
		var industryCode = $("#industryCode").val();
		$(function(){ajaxTodo("${context }/division/init/gis?attentionCode="+attentionCode+"&kindCode="+kindCode+"&industryCode="+industryCode,zTreeAjax);});
	});
  </SCRIPT>

<div class="accordion" fillSpace="sideBar">
	<input type="hidden" id="attentionCode" value="${attentionCode}" >
	<input type="hidden" id="kindCode" value="${kindCode}" >
	<input type="hidden" id="industryCode" value="${industryCode}" >
	<input type="hidden" id="selectedNodeId" value="${selectedNodeId}" >
	<table style=" width: 100%;" >
		<tr>
			<td width="122px">
				<input class=""  id="key_for_GIS" style="width: 120px;margin-left: 10px;margin-top:6px; ">
			</td>
			<td align="left">
				<a class="button" onclick="searchTreeNodes()" style="margin-top:6px; "><span>检索</span></a>
			</td>
		</tr>
	</table>
	<hr>
	<div class="accordionContent">
		<ul id="tree_for_GIS" class="ztree" style="width:300px; overflow:auto; height: 530px;"></ul>		
	</div>
	<a id="hiddenlink_Tree_for_GIS" href="" target="navTab" rel="" title=""></a>
</div>

