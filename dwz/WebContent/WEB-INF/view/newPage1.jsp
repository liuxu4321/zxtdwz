<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
 /*
 	通过双击事件选择功能菜单方法
 */
 function changePage_sheet3(Object){
	switch(Object){
	case '1':
		aLink=document.getElementById("hiddenlink_1");break;
	case '2':
		aLink=document.getElementById("hiddenlink_2");break;
	case '3':
		aLink=document.getElementById("hiddenlink_3");break;
	case '4':
		aLink=document.getElementById("hiddenlink_4");break;
	default:
		aLink=document.getElementById("hiddenlink_5");break;
	}
	aLink.click();
 }
</script>
<div style="display: none;">
	<a id="hiddenlink_1" href="${context }/businessPlatfrom/enterprise/qylb/<%=Constant.QYLX_YBGYQY %>" target="navTab" rel="qylb">工业企业列表</a>
	<a id="hiddenlink_2" href="${context }/businessPlatfrom/enterprise/qylb/<%=Constant.QYLX_WSCLC %>" target="navTab" rel="wsclc">污水处理厂企业列表</a>
	<%-- <a id="hiddenlink_3" href="${context }/businessPlatfrom/enterprise/qylb/<%=Constant.QYLX_GFCZDW %>" target="navTab" rel="gfczdw">固废处置单位企业列表</a> --%>
	<a id="hiddenlink_4" href="webroot/rtmonitor/sjxy_main.html" target="navTab" rel="sjxy_main">数据修约</a>
	<a id="hiddenlink_5" href="webroot/rtmonitor/moniter_pzgl.html" target="navTab" rel="moniter_pzgl">凭证管理</a>
</div>
<div class="pageContent" layoutH="0" style="height:500;background-color: #C7E8EB" >
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet3('1')">
			<a href="#" title="工业企业列表">
				<img alt="" src="${context }/styles/img/icon/ybgyqy.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">工业企业</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet3('2')">
			<a  href="#" title="污水处理厂企业列表">
				<img alt="" src="${context }/styles/img/icon/wsclc.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">污水处理</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet3('3')">
			<a  href="#" title="固废处置单位企业列表">
				<img alt="" src="${context }/styles/img/icon/gfczdw.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">固废处置</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet3('4')">
			<a href="#" title="数据修约">
				<img alt="" src="${context }/styles/img/icon/sjxy.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">数据修约</label>
			</a>
		</div>
	</div>
	<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px">
		<div style="padding:5px;margin:5px; height: 90px;" ondblclick="changePage_sheet3('5')">
			<a href="#" title="凭证管理">
				<img alt="" src="${context }/styles/img/icon/pzgl.png" style="width: 64px;height: 64px;margin-top: 4px;">
				<label style="margin-top: 2px;margin-left:8px; width:100%; text-align: center;">凭证管理</label>
			</a>
		</div>
	</div>
</div>