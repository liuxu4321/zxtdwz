<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
 /*
 	通过双击事件选择功能菜单方法
 */
 function changePage_sheet4(Object){
	switch(Object){
	case '1':
		aLink=document.getElementById("hiddenlink_1");break;
	case '2':
		aLink=document.getElementById("hiddenlink_2");break;
	case '3':
		aLink=document.getElementById("hiddenlink_3");break;
	case '4':
		aLink=document.getElementById("hiddenlink_4");break;
	case '5':
		aLink=document.getElementById("hiddenlink_5");break;
	case '6':
		aLink=document.getElementById("hiddenlink_6");break;
	case '7':
		aLink=document.getElementById("hiddenlink_7");break;
	case '8':
		aLink=document.getElementById("hiddenlink_8");break;
	case '9':
		aLink=document.getElementById("hiddenlink_9");break;
	case '10':
		aLink=document.getElementById("hiddenlink_10");break;
	case '11':
		aLink=document.getElementById("hiddenlink_11");break;
	case '12':
		aLink=document.getElementById("hiddenlink_12");break;
	default:
		aLink=document.getElementById("hiddenlink_13");break;
	}
	aLink.click();
 }
</script>
<div style="display: none;">
	<a id="hiddenlink_1" href="webroot/background/hbjgsz.html" target="navTab" rel="hbjgsz">环保机构设置</a>
	<a id="hiddenlink_2" href="webroot/background/pfbzsz.html" target="navTab" rel="pfbzsz">排放标准设置</a>
	<a id="hiddenlink_3" href="webroot/background/zsbzsz.html" target="navTab" rel="zsbzsz">征收标准设置</a>
	<a id="hiddenlink_4" href="webroot/background/qylxzh.html" target="navTab" rel="qylxzh">企业类型转换</a>
	<a id="hiddenlink_5" href="webroot/background/rzgl.html" target="navTab" rel="rzgl">日志管理</a>
	<a id="hiddenlink_6" href="webroot/background/dlb.html" target="navTab" rel="dlb">大类别</a>
	<a id="hiddenlink_7" href="webroot/background/xlb.html" target="navTab" rel="xlb">小类别</a>
	<a id="hiddenlink_8" href="webroot/background/wrw.html" target="navTab" rel="wrw">污染物</a>
	<a id="hiddenlink_9" href="webroot/background/ywdw.html" target="navTab" rel="ywdw">运维单位</a>
	<a id="hiddenlink_10" href="webroot/background/sblx.html" target="navTab" rel="sblx">设备类型</a>
	<a id="hiddenlink_11" href="webroot/sysmanager/jsgl.html" target="navTab" rel="jsgl">角色管理</a>
	<a id="hiddenlink_12" href="webroot/sysmanager/yhgl.html" target="navTab" rel="yhgl">用户管理</a>
	<a id="hiddenlink_13" href="webroot/sysmanager/txlscx.html" target="navTab" rel="txlscx">提醒历史查询</a>
</div>
<div class="pageContent" layoutH="0" style="height:500;background-color: #C7E8EB">
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('1')">
			<a href="#" title="环保机构设置">
				<img alt="" src="${context }/styles/img/icon/hbjgsz.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">环保机构</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('2')">
			<a href="#" title="排放标准设置">
				<img alt="" src="${context }/styles/img/icon/pfbzsz.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">排放标准</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('3')">
			<a href="#" title="征收标准设置">
				<img alt="" src="${context }/styles/img/icon/zsbzsz.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">征收标准</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('4')">
			<a href="#" title="企业类型转换">
				<img alt="" src="${context }/styles/img/icon/qylxzh.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">类型转换</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('5')">
			<a href="#" title="日志管理">
				<img alt="" src="${context }/styles/img/icon/rzgl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">日志管理</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('6')">
			<a href="#" title="大类别">
				<img alt="" src="${context }/styles/img/icon/dlb.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:15px; width:100%; text-align: center;">大类别</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('7')">
			<a href="#" title="小类别">
				<img alt="" src="${context }/styles/img/icon/xlb.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:15px; width:100%; text-align: center;">小类别</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('8')">
			<a href="#" title="污染物">
				<img alt="" src="${context }/styles/img/icon/wrw.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:15px; width:100%; text-align: center;">污染物</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('9')">
			<a href="#" title="运维单位">
				<img alt="" src="${context }/styles/img/icon/ywdw.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">运维单位</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('10')">
			<a href="#" title="设备类型">
				<img alt="" src="${context }/styles/img/icon/sblx.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">设备类型</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('11')">
			<a href="#" title="角色管理">
				<img alt="" src="${context }/styles/img/icon/jsgl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">角色管理</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('12')">
			<a href="#" title="用户管理">
				<img alt="" src="${context }/styles/img/icon/yhgl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">用户管理</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet4('13')">
			<a href="#" title="提醒历史查询">
				<img alt="" src="${context }/styles/img/icon/txls.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px;width:100%; text-align: center;">提醒历史</label>
			</a>
		</div>
	</div>
</div>