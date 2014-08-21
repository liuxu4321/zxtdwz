<!-- 这里做数据字典 -->
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

    String.prototype.endWith=function(oString){  
		var   reg=new   RegExp(oString+"$");  
		return   reg.test(this);     
	};  
    var dicTree;
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
        var t = $("#tree_for_dic");
        //后台传来的默认选中节点的ID
        t = $.fn.zTree.init(t, setting, json);
        var dicTree = $.fn.zTree.getZTreeObj("tree_for_dic");

        var selectedNodeId = $("#selectedNodeId").val();
         //通过ID获取节点实例
        var sNode = dicTree.getNodeByParam("id", selectedNodeId);
        //选中
        if(sNode!=null){
        	dicTree.selectNode(sNode);
            //打开
            //$("#"+selectedNodeId).click();
            nodeOnClick(null,'key_for_dic',sNode); 
            dicTree.expandNode(sNode, true); 
        }
        
    }
    
    var addUrlB ="${context}/background/dic/dlb/add?navTabId=dic_index";
    var delUrlB ="${context}/background/dic/dlb/delete/{id}?navTabId=dic_index";
    var editUrlB ="${context}/background/dic/dlb/edit/{id}?navTabId=dic_index";
    
    var addUrlS ="${context}/background/dic/xlb/addn/{id}?navTabId=dic_index";
    var delUrlS ="${context}/background/dic/xlb/delete/{id}?navTabId=dic_index";
    var editUrlS ="${context}/background/dic/xlb/editn/{id}?navTabId=dic_index";
    
    /*
        节点选择
    */
    function nodeOnClick(event, treeId, treeNode) {
    	var idss = treeNode.id;
    	var selectedUrl ="&selectedNodeId="+treeNode.id;
    	//大分类
        if(idss=="0"){
        	$('#dicAdd').attr("href",addUrlB);
        	$('#id').val('');
        }
    	//sub
    	if(idss!="0"){
    		if(idss.endWith("p")){
    			$('#dicAdd').attr("href",addUrlS+selectedUrl);
    	        $('#dicDel').attr("href",delUrlB);
    	        $('#dicEdit').attr("href",editUrlB+selectedUrl);
    	        $('#id').val(idss.substring(0,idss.length-1));
    		}
    		if(idss.endWith("s")){
    			$('#dicAdd').attr("href",addUrlS+selectedUrl);
    	        $('#dicDel').attr("href",delUrlS);
    	        $('#dicEdit').attr("href",editUrlS+selectedUrl);
    	        $('#id').val(idss.substring(0,idss.length-1));
            }
    	} 
    }
    
    /*
        模糊查询节点
    */
    function searchTreeNodesforDic(){
        updateNodes(false);
        var dicTree = $.fn.zTree.getZTreeObj("tree_for_dic");
        var keyValue = document.getElementById("key_for_dic").value;
        keyValue = jQuery.trim(keyValue);
        if(keyValue != null&&keyValue != ""){
            nodeList = dicTree.getNodesByParamFuzzy("name", keyValue);
            updateNodes(true);
        }
    }
    
    /*
        设置查询到的节点的样式
    */
    function updateNodes(highlight) {
        var dicTree = $.fn.zTree.getZTreeObj("tree_for_dic");
        for( var i=0, l=nodeList.length; i<l; i++) {
            nodeList[i].highlight = highlight;
            dicTree.selectNode(nodeList[i]);
            dicTree.updateNode(nodeList[i]);
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
        $(function(){ajaxTodo("${context }/background/dic/class/ajax",zTreeAjax);});
    });
    
    /******************************搜索提示开始**** anxl 2014-01-10*****************************/
     //高亮的索引 
   var highLightIndex = -1; 
   //超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
   var timeoutId; 
   
   $(document).ready(function(){ 
      init(); 
      $('#key_for_dic').bind('keyup',processKeyup); 
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
              if($('#key_for_dic').val()==""){
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
      var pos = $('#key_for_dic').position(); 
      var topPosition = pos.top+$('#key_for_dic').height()+10; 
      var leftPosition = pos.left+5; 
      $('#auto_div').offset({top:topPosition,left:leftPosition}); 
      $('#auto_div').width($('#key_for_dic').width() + 5); 
      //$('#auto_div').css('position','absolute'); 
   } 

   /** 
    * 处理Ajax请求 
    * @param data 
    */ 
   function processAjaxRequest(){ 
     var inputValue = $('#key_for_dic').val();
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
          $('#key_for_dic').val($(this).html()); 
          $('#auto_div').html('').hide(); 
      } 
   } 

   /** 
    * 处理按下Enter键 
    * @param keyCode 
    */ 
   function processEnter(){ 
       if(highLightIndex != -1){ 
          $('key_for_dic').val($('#auto_div').children().eq(highLightIndex).html()); 
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
       $('#key_for_dic').val(words.eq(highLightIndex).html()); 
   } 

   /** 
    * 如果有高亮的则把高亮变白 
    */ 
   function changeToWhite(){ 
       if(highLightIndex != -1){ 
           $('#auto_div').children().eq(highLightIndex).css('background-color','white'); 
       } 
   } 
   
   /******************************搜索提示结束*********************************/
</SCRIPT>
<div class="pageHeader" >
       <div class="searchBar">
           <table class="searchContent">
               <tr>
                   <td>
                   分类名称：<input class="empty" id="key_for_dic" style="width: 140px;margin-left: 10px;margin-top:6px; ">
                   </td>
               </tr>
           </table>
       </div>
       <div class="searchBar">
           <div class="subBar">
               <ul>
                   <li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="searchTreeNodesforDic()">查询</button></div></div></li>
               </ul>
           </div>
       </div>
</div>
<div class="pageContent" layoutH="0">
    <div class="panelBar">
        <ul class="toolBar">
            <li>
                <a class="add" href="${context}/background/dic/dlb/add/{id}" id="dicAdd" target="dialog" width="520" height="460" mask="true" max="false" rel="sblx_add">
                    <span>添加</span></a>
            </li>
            <li><a class="delete" href="${context }/background/dic/dlb/delete/{id}?navTabId=dic_index"  id="dicDel"
                    target="ajaxTodo" title="确定要删除这个分类吗?">
                    <span>删除</span>
                </a>
            </li>
            <li>
                <a class="edit" href="${context }/background/dic/dlb/edit/{id}"  id="dicEdit"
                    target="dialog"  width="520" height="460" mask="true" max="false" rel="sblx_edit">
                    <span>修改</span>
                </a>
            </li>
        </ul>
    </div>
	<div class="accordionContent" layoutH="110">
	    <ul id="tree_for_dic" class="ztree" style="width:400px; overflow:auto;"></ul>
	    <input type="hidden" id="id">
	    <input type="hidden" id="selectedNodeId" value="${selectedNodeId}" >
	</div>
</div>
