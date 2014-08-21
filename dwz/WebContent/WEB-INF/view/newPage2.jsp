<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
 /*
 	通过双击事件选择功能菜单方法
 */
 function changePage_sheet2(Object){
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
	default:
		aLink=document.getElementById("hiddenlink_10");break;
	}
	aLink.click();
 }
</script>
<div style="display: none;">
	<a id="hiddenlink_1" href="webroot/rtmonitor/wryjk_main.html" target="navTab" rel="wryjk_main">污染源监控</a>
	<a id="hiddenlink_2" href="webroot/rtmonitor/ztyl_main.html" target="navTab" rel="ztyl_main">总体预览</a>
	<a id="hiddenlink_3" href="webroot/rtmonitor/gsyl.html" target="navTab" rel="gsyl">辖区一览</a>
	<a id="hiddenlink_4" href="webroot/rtmonitor/sjcsyxl_main.html" target="navTab" rel="sjcsyxl_main">数据传输有效率</a>
	<a id="hiddenlink_5" href="webroot/rtmonitor/moniter_tjbb_main.html" target="navTab" rel="moniter_tjbb_main">统计报表</a>
	<a id="hiddenlink_6" href="webroot/rtmonitor/moniter_bjjk.html" target="navTab" rel="moniter_bjjk">报警监控</a>
	<a id="hiddenlink_7" href="webroot/rtmonitor/moniter_pfltj.html" target="navTab" rel="moniter_pfltj">排放量统计</a>
	<a id="hiddenlink_8" href="webroot/rtmonitor/lssj_main.html" target="navTab" rel="lssj_main">历史数据</a>
	<a id="hiddenlink_9">运营单位走查记录</a>
	<a id="hiddenlink_10">运营单位故障记录</a>
</div>
<div class="pageContent" layoutH="0" style="height:500;background-color: #C7E8EB">
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('1')">
			<a href="#" title="污染源监控">
				<img alt="" src="${context }/styles/img/icon/wryjk.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">污染监控</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;"ondblclick="changePage_sheet2('2')">
			<a href="#" title="总体预览">
				<img alt="" src="${context }/styles/img/icon/ztyl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">总体预览</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('3')">
			<a href="#" title="辖区一览">
				<img alt="" src="${context }/styles/img/icon/xqyl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">辖区一览</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('4')">
			<a href="#" title="数据传输有效率">
				<img alt="" src="${context }/styles/img/icon/sjccyxl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">数据传输</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('5')">
			<a href="#" title="统计报表">
				<img alt="" src="${context }/styles/img/icon/tjbb.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">统计报表</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('6')">
			<a href="#" title="报警监控">
				<img alt="" src="${context }/styles/img/icon/bjjk.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">报警监控</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('7')">
			<a href="#" title="排放量统计">
				<img alt="" src="${context }/styles/img/icon/pfzlyj.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:15px; width:100%; text-align: center;">排放量</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('8')">
			<a href="#" title="历史数据">
				<img alt="" src="${context }/styles/img/icon/tjfx.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">历史数据</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('9')">
			<a href="#" title="运营单位走查记录">
				<img alt="" src="${context }/styles/img/icon/ywdw.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">走查记录</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet2('10')">
			<a href="#" title="运营单位故障记录">
				<img alt="" src="${context }/styles/img/icon/yydwgzjl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">故障记录</label>
			</a>
		</div>
	</div>
</div>