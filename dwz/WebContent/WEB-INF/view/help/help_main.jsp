<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<table style="width: 100%;border-collapse:collapse;">
		<tr>
			<th style="width: 80%;">
				<div id="system_helpBox" class="unitBox">
					<div class="pageContent">
						<div layoutH="0" style="width: 99%;float:left; display:block; overflow:auto; border:solid 1px #CCC; line-height:21px; background:#fff">
							<div class="panelBar" defH="40" style="padding:10 0 0 5px;" >
								<h1>内容</h1>										
							</div>
							<div id="bzlr" style="padding: 5 0 0 5px;">
								<center><h2>自动监控系统总体预览需求</h2></center>
									<h6>1.数据完整性</h6><br>
									  &nbsp;&nbsp;&nbsp;&nbsp;保证数据的完整性,... ...	
									  <p>1</p>				 
							</div>
						 </div>						
					</div>
				</div>
			</th>
			<th style="width: 20%;">
				<div layoutH="0"
					style="float: right; display: block; overflow: auto; width: 100%; border: solid 1px #CCC; line-height: 21px; background: #fff">
					<div class="panelBar" defH="40" style="padding: 10 0 0 5px;">
						<h1>关键词</h1>
					</div>
					<ul class="tree treeFolder">
						<li><a id="ss" href="${context }/system/help_x"
							target="ajax" rel="system_helpBox">总体预览</a></li>
						<li><a href="${context }/system/help_x1"
							target="ajax" rel="system_helpBox">验收排口报表</a></li>
						<li><a href="${context }/system/help_x2"
							target="ajax" rel="system_helpBox">数据审核</a></li>
						<li><a href="${context }/system/help_x"
							target="ajax" rel="system_helpBox">废气在线监测数据报表</a></li>
						<li><a href="${context }/system/help_x"
							target="ajax" rel="system_helpBox">污染源报警情况报表</a></li>
						<li><a href="${context }/system/help_x"
							target="ajax" rel="system_helpBox">污染源有效率报表</a></li>
						<li><a href="${context }/system/help_x"
							target="ajax" rel="system_helpBox">污染源联网情况报表</a></li>
						<li><a href="${context }/system/help_x"
							target="ajax" rel="system_helpBox">废水在线监测报表</a></li>
					</ul>
				</div>
			</th>
		</tr>
	</table>
	<!-- <script type="text/javascript">
		$(function() {
			/* $("#system_helpBox").loadUrl('/WEB-INF/view/help/mhelp_body.jsp'); */
			$("#system_helpBox").load('${context }/system/help_x');
		});		
	</script>  -->
</div>


