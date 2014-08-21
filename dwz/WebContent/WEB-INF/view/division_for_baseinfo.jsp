<!-- 行政区划-实时监控 -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.bdsug{
	border-top-color:#817f82;
	border-right-color:#817f82;
	border-bottom-color:#817f82;
	border-left-color:#817f82;
	border-top-width:1px;
	border-right-width:1px;
	border-bottom-width:1px;
	border-left-width:1px;
	border-top-style:solid;
	border-right-style:solid;
	border-bottom-style:solid;
	border-left-style:solid;
	background-attachment:scroll;
	position:absolute;
	background-repeat:repeat;
	background-position-x:0%;
	background-position-y:0%;
	background-origin:padding-box;
	background-clip:border-box;
	background-color:rgb(255, 255, 255);
	left:2;
	top:0;
	z-index: 100;
}
</style>
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
			onClick: nodeOnClick
		},
		view: {
			fontCss: getFontCss
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
	
	/*
		Tree初始化
	*/
	function zTreeAjax(json){
		for(var i=0;i<json.length;i++){
			if(i==0){
				json[i].open = "true";
			}
			json[i].icon = "${context }/"+json[i].icon;
		}
		var t = $("#tree_for_baseinfo");
		//后台传来的默认选中节点的ID
		var selectedNodeId = $("#selectedNodeId").val();
		t = $.fn.zTree.init(t, setting, json);
		var zTree = $.fn.zTree.getZTreeObj("tree_for_baseinfo");
		//通过ID获取节点实例
		selectedNode = zTree.getNodeByParam("id", selectedNodeId);
		//选中
		zTree.selectNode(selectedNode);
		//打开
		//nodeOnClick(null,null,selectedNode,null);
	}
	
	/*
		节点选择
	*/
	function nodeOnClick(event, treeId, treeNode, clickFlag) {
		var Node = document.getElementById("hiddenlink_Tree_for_baseinfo");
		//控制程度
		var attentionCode = $("#attentionCode").val();
		//污染类型
		var kindCode = $("#kindCode").val();
		//行业类别
		var industryCode = $("#industryCode").val();
		Node.setAttribute("href","${context }/businessPlatfrom/enterprise/qyDetail/" + treeNode.id);
		Node.setAttribute("title",treeNode.name);
		Node.click();
	}
	
	/*
		模糊查询节点
	*/
	function searchTreeNodes(){
		updateNodes(false);
		var zTree = $.fn.zTree.getZTreeObj("tree_for_baseinfo");
		var keyValue = document.getElementById("key_for_baseinfo").value;
		keyValue = jQuery.trim(keyValue);
		if(keyValue != null&&keyValue != ""){
			nodeList = zTree.getNodesByParamFuzzy("name", keyValue);
			updateNodes(true);
		}

	}
	
	/*
		设置查询到的节点的样式
	*/
	function updateNodes(highlight) {
		var zTree = $.fn.zTree.getZTreeObj("tree_for_baseinfo");
		for( var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;
			zTree.selectNode(nodeList[i]);
			zTree.updateNode(nodeList[i]);
		}
	}
	
	/*
		节点样式更改
	*/
	function getFontCss(treeId, treeNode) {
		return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
	}
	
	/*
		加载树形结构
	*/
	$(document).ready(function(){
		var attentionCode = $("#attentionCode").val();
		var kindCode = $("#kindCode").val();
		var industryCode = $("#industryCode").val();
		$(function(){ajaxTodo("${context }/division/init/baseinfo?attentionCode="+attentionCode+"&kindCode="+kindCode+"&industryCode="+industryCode,zTreeAjax);});
	});
	/******************************搜索提示开始**** anxl 2014-01-10*****************************/
	 //高亮的索引 
   var highLightIndex = -1; 
   //超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
   var timeoutId; 
   $(document).ready(function(){ 
      init(); 
      $('#key_for_baseinfo').bind('keyup',processKeyup); 
   }); 

   /** 
    * 处理键盘按下后弹起的事件 
    * @param event 
    */ 
   function processKeyup(event){ 
         var myEvent = event || windows.event; 
         var keyCode = myEvent.keyCode; 
         //输入是字母，或者退格键则需要重新请求 
         if((keyCode >= 65 && keyCode <= 90) || keyCode == 8){ 
              //以下两行代码是为了防止用户快速输入导致频繁请求服务器 
              //这样便可以在用户500ms内快速输入的情况下，只请求服务器一次 
              //大大提高服务器性能 
              if($('#key_for_baseinfo').val()==""){
           	   $('#auto_div').html('');
           	   $('#auto_div').hide();
              }else{
               highLightIndex = -1; 
               clearTimeout(timeoutId); 
               timeoutId = setTimeout(processAjaxRequest,700); 
              }
         //处理上下键(up,down) 
         }else if(keyCode == 38 || keyCode == 40){ 
             processKeyUpAndDown(keyCode); 
         //按下了回车键 
         }else if(keyCode == 13){ 
             processEnter(); 
         } 
    } 

   /*** 
    * 初始化弹出框列表的位置，大小 
    */ 
   function init(){ 
      $('#auto_div').hide(); 
      var pos = $('#key_for_baseinfo').position(); 
      var topPosition = pos.top+$('#key_for_baseinfo').height()+10; 
      var leftPosition = pos.left+5; 
      $('#auto_div').offset({top:topPosition,left:leftPosition}); 
      $('#auto_div').width($('#key_for_Monitoring').width() + 5); 
      //$('#auto_div').css('position','absolute'); 
   } 

   /** 
    * 处理Ajax请求 
    * @param data 
    */ 
   function processAjaxRequest(){ 
  	 var inputValue = $('#key_for_baseinfo').val();
  		$(function(){ajaxTodo("${context }/search/enterprise?pyjm="+inputValue,processAjaxResponse);});
   } 

   /** 
    * 处理Ajax回复 
    * @param data Ajax请求得到的返回结果为dom文档对象 
    */ 
   function processAjaxResponse(jsonStr){
   	if(jsonStr.length > 0){
	    	$('#auto_div').html('').show(); 
	        for(var i = 0 ; i < jsonStr.length ; i++){
	           var word_div = $('<div style="cursor: default;margin:3px 3px 3px 3px;"></div>'); 
	           word_div.html(jsonStr[i]);
	           word_div.hover(fnOver,fnOut); 
	           word_div.click(getAutoText);
	           $('#auto_div').append(word_div); 
	        } 
   	}else{
   		$('#auto_div').hide();
   	}
   } 

   /** 
    * 处理鼠标滑过 
    */ 
   function fnOver(){ 
       //alert($(this)); 
        changeToWhite(); 
        $(this).css('background-color','#cccccc'); 
        //alert($(this).index()); 
        highLightIndex = $(this).index(); 
        //下面一行注释掉了，百度搜索也没这功能，就是鼠标移动时，跟着改变搜索框的内容 
        //$('#auto_txt').val($('#auto_div').children().eq(highLightIndex).html()); 
   } 
    
   /** 
    * 处理鼠标移除 
    */ 
   function fnOut(){ 
       $(this).css('background-color','white'); 
   } 

   /** 
    * 得到自动填充文本 
    */ 
   function getAutoText(){ 
      //有高亮显示的则选中当前选中当前高亮的文本 
      if(highLightIndex != -1){ 
          $('#key_for_baseinfo').val($(this).html()); 
          $('#auto_div').html('').hide(); 
      } 
   } 

   /** 
    * 处理按下Enter键 
    * @param keyCode 
    */ 
   function processEnter(){ 
       if(highLightIndex != -1){ 
          $('key_for_baseinfo').val($('#auto_div').children().eq(highLightIndex).html()); 
          $('#auto_div').html('').hide(); 
       } 
   } 

   /** 
    * 处理按上下键的情况 
    */ 
   function processKeyUpAndDown(keyCode){ 
       var words = $('#auto_div').children(); 
       var num = words.length; 
       if(num <= 0) return; 
       changeToWhite(); 
       highLightIndex = ((keyCode != 38 ? num + 1:num - 1)+highLightIndex) % num; 
       words.eq(highLightIndex).css('background-color','#cccccc'); 
       $('#key_for_baseinfo').val(words.eq(highLightIndex).html()); 
   } 

   /** 
    * 如果有高亮的则把高亮变白 
    */ 
   function changeToWhite(){ 
       if(highLightIndex != -1){ 
           $('#auto_div').children().eq(highLightIndex).css('background-color','white'); 
       } 
   } 
   //function onblurText(){
   //	$('#auto_div').hide();
   //}
   //function onfocusText(){
	//   if(document.getElementById("auto_div").innerHTML != ""){
	//    $('#auto_div').show();
	 //  }
   //}
   /******************************搜索提示结束*********************************/
</SCRIPT>
<div class="accordion" fillSpace="sideBar">
<div class="accordionContent">
	<input type="hidden" id="attentionCode" value="${attentionCode}" >
	<input type="hidden" id="kindCode" value="${kindCode}" >
	<input type="hidden" id="industryCode" value="${industryCode}" >
	<input type="hidden" id="selectedNodeId" value="${selectedNodeId}" >
	<div class="bdsug" id="auto_div"></div>
<table style=" width: 100%;" >
	<tr>
		<td colspan="2">
			<a class="button" onclick="searchTreeNodes()" style="margin-left: 3px;"><span>所有</span></a>
			<a class="button" onclick="searchTreeNodes()" style="margin-left: 3px;"><span>国控</span></a>
			<a class="button" onclick="searchTreeNodes()" style="margin-left: 3px;"><span>电厂</span></a>
			<a class="button" onclick="searchTreeNodes()" style="margin-left: 3px;"><span>污水</span></a>
		</td>
	</tr>
	<tr>
		<td width="122px">
			<input class="empty" id="key_for_baseinfo" style="width: 138px;margin-left: 3px;margin-top:6px; ">
		</td>
		<td align="left">
			<a class="button" onclick="searchTreeNodes()" style="margin-left: 3px;margin-top:6px; "><span>检索</span></a>
		</td>
	</tr>
</table>
<hr>
	<ul id="tree_for_baseinfo" class="ztree"></ul>		
	<a id="hiddenlink_Tree_for_baseinfo" href="" target="navTab" rel="qyDetail"></a>
</div>
</div>

