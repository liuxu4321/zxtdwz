<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>
<form id="pagerForm" method="post"
	action="${context }/businessPlatfrom/enterprise/qylb/${isFlag }">
	<input type="hidden" name="pageNum" value="${currentPageNo }" /> <input
		type="hidden" name="numPerPage" value="${page.pageSize }" /> <input
		type="hidden" name="enterpriseName" value="${enterpriseName }" /> <input
		type="hidden" name="province" value="${province }" /> <input
		type="hidden" name="city" value="${city }" /> <input type="hidden"
		name="district" value="${district }" /> <input type="hidden"
		name="attentionCode" value="${attentionCode }" /> 
		<input type="hidden" name="isFlag" value="${isFlag }" />
		<input type="hidden" name="kindCode" value="${kindCode }" />
		<input type="hidden" name="areaCode" value="${areaCode }" />
</form>
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
<script type="text/javascript">
	/***区分企业类型****/
	$(function() {
		var $flag = "${isFlag }";
		var $obj = $(".navTab-tab li");
		//获取当前打开的tab 对象
		var $lengthT = $obj.length;
		//当前打开的tabId
		var $closeTabId;
		//获取当前选中的tabId
		var $thisNavTbId = $(".navTab-tab li[class*='selected']").attr("tabid");
		//截取当前打开的tabId的区分
		var oldFlag;
		for ( var i = 0; i < $lengthT; i++) {
			//获取下一条
			$closeTabId = $obj.attr("tabid");
			$obj = $obj.next();
			if ($closeTabId == $thisNavTbId || $closeTabId == "main") {
				continue;
			} else {
				oldFlag = $closeTabId.substring($closeTabId.length - 1);
				//flag区分变化
				if ($flag != oldFlag) {
					//关闭其他页面
					navTab.closeTab($closeTabId);
				}
			}
		}
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#qyglCloseOthers").click();
	});

	function chooseEnt(_this) {
		var enterpriseId = $("tr[name='enterpriseTr'].selected").attr("rel");
		if (enterpriseId == null || enterpriseId == "") {
			alertMsg.info('请先选择一个企业！');
		} else {
			$('#chooseEnt').click();
		}
	}
	/******************************搜索提示开始*********************************/
	 //高亮的索引 
    var highLightIndex = -1; 
    //超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
    var timeoutId; 
    $(document).ready(function(){ 
       init(); 
       $('#auto_txt').bind('keyup',processKeyup); 
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
               if($('#auto_txt').val()==""){
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
       var pos = $('#auto_txt').position(); 
       var topPosition = pos.top+$('#auto_txt').height()+10; 
       var leftPosition = pos.left+5; 
       $('#auto_div').offset({top:topPosition,left:leftPosition}); 
       $('#auto_div').width($('#auto_txt').width() - 48); 
       //$('#auto_div').css('position','absolute'); 
    } 

    /** 
     * 处理Ajax请求 
     * @param data 
     */ 
    function processAjaxRequest(){ 
   	 var inputValue = $('#auto_txt').val();
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
           $('#auto_txt').val($(this).html()); 
           $('#auto_div').html('').hide(); 
       } 
    } 

    /** 
     * 处理按下Enter键 
     * @param keyCode 
     */ 
    function processEnter(){ 
        if(highLightIndex != -1){ 
           $('auto_txt').val($('#auto_div').children().eq(highLightIndex).html()); 
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
        $('#auto_txt').val(words.eq(highLightIndex).html()); 
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
    function changeSelectKindCode2(){
	//var kindCode = _this.value;
	var areaCode = $("#xzqh").val();
	var kindCode = $("#kindCode").val();
	var attentionCode = $("#attentionCode").val();
	//$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode,AjaxDoneSelect);});
	$(function(){ajaxTodo("${context }/businessPlatfrom/enterprise/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode+"&kindCode="+kindCode+"&attentionCode="+attentionCode,AjaxDoneSelect);});
}
    function jiankong(){
    	var areaCode = $("#xzqh").val();
    	var kindCode = $("#kindCode").val();
    	var attentionCode = $("#attentionCode").val();
    	//$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode+"&kindCode="+kindCode,AjaxDoneSelect);});
    	$(function(){ajaxTodo("${context }/businessPlatfrom/enterprise/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode+"&kindCode="+kindCode+"&attentionCode="+attentionCode,AjaxDoneSelect);});
    }

    function guanzhu(){
    	var areaCode = $("#xzqh").val();
    	var kindCode = $("#kindCode").val();
    	var attentionCode = $("#attentionCode").val();
    	//$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode+"&kindCode="+kindCode,AjaxDoneSelect);});
    	$(function(){ajaxTodo("${context }/businessPlatfrom/enterprise/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode+"&kindCode="+kindCode+"&attentionCode="+attentionCode,AjaxDoneSelect);});
    }
//取得对应小类别回调方法(行政区划->污染源类型->企业名称)
function AjaxDoneSelect(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#auto_txt").html(optionstring);
	
	/* $("#pollutantType2").val("1");
	jQuery("#monId2").html("<option></option>"); */
}


function qiye(){
	var ll = $('#auto_txt').find("option:selected").text();
	$('#enterpriseNamel').val(ll);
}
</script>
<div class="bdsug" id="auto_div"></div>
<div class="pageHeader">
	<div class="pageFormContent">
		<form onsubmit="return navTabSearch(this);"
			action="${context }/businessPlatfrom/enterprise/qylb/${isFlag }"
			method="post">
			<input type="hidden" name="isFlag" value="${isFlag }" />
			<table class="searchContent" border="0">
				<tr height="20px">
					
					<td><label style="width: 100px; text-align: right">所属行政区划：</label>
						<%-- <input name="areaCode.subName" type="text" readonly="readonly"
						value="${areaName }" /> <input name="areaCode.subId"
						type="hidden" readonly="readonly" value="${areaCode }" /> <a
						class="btnLook"
						href="${context }/businessPlatfrom/enterprise/areaCode/lookup"
						lookupGroup="areaCode" width="520" height="480" mask="true"
						max="false">所在地市</a> --%> 
						<select name="areaCode" onchange="changeSelectKindCode2();" id="xzqh">
							<c:forEach var="areaCodeM" items="${areaCodeMap }">
								<option value="${areaCodeM.key }"
									<c:if test="${areaCodeM.key==areaCode }">selected="selected"</c:if>>${areaCodeM.value
									}</option>
							</c:forEach>
					</select></td>
					<td><label style="width: 80px; text-align: right">关注程度：</label>
						<%-- <select name="attentionCode">
							<option value="">所有</option>
							<c:forEach var="attention" items="${attentionSelectMap }">
								<option value="${attention.key }"
									<c:if test="${attention.key==attentionCode }">selected="selected"</c:if>>${attention.value
									}</option>
							</c:forEach>
						</select> --%>
						<select name="attentionCode" id = "attentionCode" onchange="guanzhu();">
								<option value="" selected = "selected">所有</option>
								<option value="1" <c:if test="${attentionCode == '1' }">selected = "selected"</c:if>>国控</option>
								<option value="2" <c:if test="${attentionCode == '2' }">selected = "selected"</c:if>>市控</option>
								<option value="3" <c:if test="${attentionCode == '3' }">selected = "selected"</c:if>>省直电厂</option>
							</select>
					</td>
					<td><label style="width: 80px; text-align: right">监控类型：</label>
						<select name="kindCode" id="kindCode" onchange="jiankong();">
							<option value="" <c:if test="${kindCode eq ''}">selected="selected"</c:if>>所有</option>
							<option value="0" <c:if test="${kindCode eq '0'}">selected="selected"</c:if>>废水</option>
							<option value="1" <c:if test="${kindCode eq '1'}">selected="selected"</c:if>>废气</option>
							<option value="3" <c:if test="${kindCode eq '3'}">selected="selected"</c:if>>污水厂</option>
						</select>
					</td>
					<td>
							<!-- value="${enterpriseName}" -->
							<label style="width: 90px; text-align: right">企业名称：</label>
							<!--
							  <input type="text" id="auto_txt" name="enterpriseName" 
							value="${enterpriseName }" 
							size="50"/> 
							 -->
							<select name="auto_txt" id="auto_txt" style="width:200px;" onchange="qiye();">
								<option></option>
								<c:forEach var="qy" items="${qiyeNameSelectMap }">
									<%-- <option value="${qy.key }"<c:if test="${qy.key==enterpriseName }">selected='selected'</c:if>>
										${qy.value}
									</option> --%>
									<option value="${qy.key }"<c:if test="${qy.value==enterpriseName }">selected='selected'</c:if>>
										${qy.value}
									</option>
								</c:forEach>
							</select>
							<input type="hidden" name="enterpriseName" id="enterpriseNamel" value="${enterpriseName}" />
					</td>
					<c:if test="${selectedEnp_1 != null}">
						<td style="width:560px;">
							<label style="width: 560px; text-align: left;">
							当前选择企业：<a style="color:blue;" target="navTab" rel="qyDetail_${isFlag }" href="${context}/businessPlatfrom/enterprise/qyDetail/${selectedEnp_1}">${selectedEnpName_1}</a></label>
						</td>
					</c:if>
				</tr>
			</table>
			<div class="searchBar">
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
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" target="navTab"
				href="${context }/businessPlatfrom/enterprise/qygl/add/${isFlag }"
				rel="qyglAdd"><span>添加</span></a></li>
			<li><a class="edit" target="navTab"
				href="${context }/businessPlatfrom/enterprise/qygl/edit/{enterpriseId}"
				rel="qyglEdit_${isFlag }"><span>修改</span></a></li>
			<%-- <li><a class="delete" href="${context }/businessPlatfrom/enterprise/qygl/delete/{enterpriseId}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li> --%>
			<li><a class="delete"
				href="${context }/businessPlatfrom/enterprise/qygl/delete/{enterpriseId}"
				target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="edit"
				href="${context }/businessPlatfrom/enterprise/qyDetail/{enterpriseId}"
				target="navTab" rel="qyDetail_${isFlag }"><span>详细</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="chooseEnt(this);"><span>选择</span></a></li>
			<li><a id="chooseEnt" style="display: none;"
				href="${context }/businessPlatfrom/enterprise/qygl/insession/{enterpriseId}"
				target="ajaxTodo"><span>选择</span></a></li>
		</ul>
	</div>

	<table class="table" width="100%" layoutH="154">
		<thead>
			<tr>
				<!-- <th width="14%" align="center" style="font-weight: normal;">企业编号</th> -->
				<th width="30%" align="left" style="font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;企业名称</th>
				<th width="10%" align="center" style="font-weight: normal;">所属行政区划</th>
				
				<th width="10%" align="center" style="font-weight: normal;">监控类型</th>
				<th width="10%" align="center" style="font-weight: normal;">关注程度</th>
				
				<th width="10%" align="center" style="font-weight: normal;">是否直管电厂</th>
				<th width="10%" align="center" style="font-weight: normal;">是否可监控</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="enterprise" items="${page.result }">
				<tr rel="${enterprise.enterpriseId }" target="enterpriseId"
					name="enterpriseTr">
					<%-- <td align="center">${enterprise.enterpriseId }</td> --%>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;${enterprise.enterpriseName }</td>
					<td align="center">${areaCodeMap[enterprise.areaCode]}</td>
					
					<td align="center">
						<c:if test="${enterprise.kindCode == 0 }">废水</c:if>
						<c:if test="${enterprise.kindCode == 1 }">废气</c:if>
						<c:if test="${enterprise.kindCode == 2 }">废水、废气</c:if>
						<c:if test="${enterprise.kindCode == 3 }">污水处理厂</c:if>
						<c:if test="${enterprise.kindCode == 4 }">其他</c:if>
					</td>
					<%-- <td align="center">${stateCtrlSelectMap[enterprise.stateCtrlcode]}</td> --%>
					
					<!-- <td align="center">${attentionSelectMap[enterprise.attentionCode]}</td> -->
					<td align="center">
						<c:if test="${enterprise.attentionCode == 1 }">国控</c:if>
						<c:if test="${enterprise.attentionCode == 2 }">市控</c:if>
						<c:if test="${enterprise.attentionCode == 3 }">省直电厂</c:if>
					</td>
					<td align="center"><c:if test="${enterprise.isStraight=='1' }">直管电厂</c:if>
						<c:if test="${enterprise.isStraight=='0' }">非直管电厂</c:if></td>
					<td align="center"><c:if test="${enterprise.isMonitor=='1' }">可监控</c:if>
						<c:if test="${enterprise.isMonitor=='0' }">不可监控</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="30"
					<c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="50"
					<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"
					<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"
					<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select> <span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab"
			totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
			pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
</div>
