<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
 /*
 	通过双击事件选择功能菜单方法
 */
 function changePage_desktop(Object){
	 aLink=document.getElementById("hiddenlink_desktop");
	 aLink.setAttribute("href",'${context }/'+Object.getAttribute("url"));
	 aLink.setAttribute("target",Object.getAttribute("target"));
	 aLink.setAttribute("rel",Object.getAttribute("rel"));
	 aLink.setAttribute("title",Object.getAttribute("atitle"));
	aLink.click();
 }
 
 $(document).ready(
	function (){
		var mod = $("#modId").val();
		var pc = $(".pageContent");
		if(mod != null || mod != ''){
			if(mod == 2){
				pc.css('background' , 'url(${context }/styles/img/bgmod2.png) no-repeat');
			}
			if(mod == 3){
				pc.css('background' , 'url(${context }/styles/img/bgmod3.png) no-repeat');
			}
			if(mod == 4){
				pc.css('background' , 'url(${context }/styles/img/bgmod1.png) no-repeat');
			}
			if(mod == 5){
				pc.css('background' , 'url(${context }/styles/img/bgmod4.png) no-repeat');
			}
			pc.css('height' , 500);
			pc.css('background-position' , 'right bottom');
		}
	}		 
 );
</script>
<div style="display: none;">
	<a id="hiddenlink_desktop" href="" target="navTab" rel="">环保机构设置</a>
</div>
<input type="hidden" id="modId" value="${moduleId }"/>
<div class="pageContent" layoutH="0">
	<c:forEach var="menus" items="${menus}">
		<c:if test="${menus.isTitle == 1}">
			<div class="sortDrag" style="width:90px;margin:5px;float:left;min-height:100px;text-align: center">
				<div style="padding:5px;margin:5px; height: 90px;" url="${menus.aurl}" target="${menus.target}" rel="${menus.rel}" atitle="${menus.name}" ondblclick="changePage_desktop(this)">
						<img alt="" src="${context }/${menus.menuImg}" style="width: 64px;height: 64px;margin-top: 4px;">
						${menus.title}
				</div>
			</div>
		</c:if>
	</c:forEach>
</div>