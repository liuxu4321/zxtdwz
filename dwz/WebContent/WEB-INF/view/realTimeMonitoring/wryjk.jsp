<!-- 污染源监控默认首页 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<style>
<!--
#line1, #line2{width: 6px; background:#E5EDEF; float:left;cursor:e-resize;}
-->
</style>
<script type="text/javascript">
	/*
	  加载行政区划树形结构
	  BY RENWEI 2013/11/21
	*/
	$(document).ready(function(){
		$("#Monitoring_left").loadUrl("${context }/division/init?divisionFlag=1");
		$("#Monitoring_left").animate({scrollTop:0},1500);
	});
	
	/*
	  制约条件改变方法
	  BY RENWEI 2013/11/21
	*/
	function conditionChange(buttonFlag){
		//非所有企业情况下
		if(buttonFlag == 0){
			var attentionCode = $("#kzcd option:selected").val();
			var kindCode = $("#wrlx option:selected").val();
			var industryCode = $("#hylb option:selected").val();
			$("#Monitoring_left").loadUrl("${context }/division/init?divisionFlag=1&attentionCode="+attentionCode+"&kindCode="+kindCode+"&industryCode="+industryCode);
		//所有企业情况下
		}else{
			$("#kzcd").val("");
			$("#wrlx").val("");
			$("#hylb").val("");
			$("#Monitoring_left").loadUrl("${context }/division/init?divisionFlag=1");
		}
	}
	
	
	
	/*
	 * jQuery.Resize by wuxinxi007
	 * Date: 2011-5-14
	 * blog : http://wuxinxi007.cnblogs.com/
	 */
    $(function () {
        //绑定需要拖拽改变大小的元素对象
        bindResize(document.getElementById('Monitoring_left'), document.getElementById('line1'),480 , 220);
    });
	
	function bindResize(el,ln,maxWidth , minWidth){
	    //初始化参数
	    var els = el.style,
			//鼠标的 X 和 Y 轴坐标
			x = y = 0;
		//邪恶的食指
		$(ln).mousedown(function(e){
			//按下元素后，计算当前鼠标与对象计算后的坐标
			x = e.clientX - el.offsetWidth,
			y = e.clientY - el.offsetHeight;
			//在支持 setCapture 做些东东
			el.setCapture ? (
				//捕捉焦点
				el.setCapture(),
				//设置事件
				el.onmousemove = function(ev){
					mouseMove(ev || event)
				},
				el.onmouseup = mouseUp
			) : (
				//绑定事件
				$(document).bind("mousemove",mouseMove).bind("mouseup",mouseUp)
			)
			//防止默认事件发生
			e.preventDefault()
		});
		//移动事件
		function mouseMove(e){
		    //宇宙超级无敌运算中...
		    if ((e.clientX - x) <= maxWidth && (e.clientX - x) >= minWidth) {
		        els.width = e.clientX - x + 'px',
			els.height = els.height
		    }
		}
		//停止事件
		function mouseUp(){
			//在支持 releaseCapture 做些东东
			el.releaseCapture ? (
				//释放焦点
				el.releaseCapture(),
				//移除事件
				el.onmousemove = el.onmouseup = null
			) : (
				//卸载事件
				$(document).unbind("mousemove", mouseMove).unbind("mouseup", mouseUp)
			)
		}
	}
</script>

<div class="pageContent" style="width: 100%;overflow: auto;">
	<div id="pageHeader" style="height: 25px;">
		<table class="searchContent" border="0">
		<tr>
			<td>
				<a class="button" onclick="conditionChange(1)" style="height: 24px; margin-top: 0px; margin-left: 5px;"><span>所有企业</span></a>
			</td>
			<td style="vertical-align:middle;">
				<label style="margin-left:8px;">控制程度:</label>
				<select id="kzcd" onchange="conditionChange(0)"  style="margin-top: 2px; ">
					<option value="">所有</option>
					<c:forEach var="kzcdList" items="${kzcdList}">
						<option value="${kzcdList.id.subId}">${kzcdList.subName}</option>
					</c:forEach>
						<option value="99">省直管电厂</option>
				</select>
			</td>
			<td>
				<label style="margin-left:8px;">污染类型:</label>
				<select id="wrlx" onchange="conditionChange(0)"  style="margin-top: 2px; ">
					<option value="">所有</option>
					<c:forEach var="wrlxList" items="${wrlxList}">
						<c:if test="${wrlxList.id.subId !=2}">
							<option value="${wrlxList.id.subId}">${wrlxList.subName}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td>	
				<label style="margin-left:8px;">行业类别:</label>
				<select id="hylb" onchange="conditionChange(0)"  style="margin-top: 2px; ">
					<option value="">所有</option>
					<c:forEach var="hylbList" items="${hylbList}">
						<option value="${hylbList.id.subId}">${hylbList.subName}</option>
					</c:forEach>
				</select>
			</td>
			<td>
<!-- 				<a class="button" href="webroot/rtmonitor/moniter_zdybq_main.html" target="dialog" rel="" width="800" height="600" fresh="false" style="height: 24px; margin-left: 8px;"><span>自定义标签</span></a> -->
			</td>
		</tr>
		</table>
	</div>
	<div id="Monitoring_left" layoutH="27" style="float:left; display:block; overflow:none; width:220px; border:solid 1px #CCC; line-height:21px; ">
	</div>
	<div id="line1" layoutH="25"></div>
	<div id="MainBox_Middle" class="unitBox" style="margin-left:223px;border:solid 1px #CCC;" layoutH="1">
	</div>
	
</div>

