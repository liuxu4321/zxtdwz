<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css" media="screen">
.my-uploadify-button {
	background:none;
	border: none;
	text-shadow: none;
	border-radius:0;
}

.uploadify:hover .my-uploadify-button {
	background:none;
	border: none;
}

.fileQueue {
	width: 400px;
	height: 150px;
	overflow: auto;
	border: 1px solid #E5E5E5;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
<!--
//-->
</script>
	<div class="pageHeader">
		<div class="pageFormContent" >
			<form action="${context }/test/upload" method="post" id="form" enctype="multipart/form-data" onsubmit="return iframeCallback(this);">
			<table class="searchContent" border="0">
					<tr height="20px">
						<td>
							<input id="testFileInput2" type="file" name="file"/>
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li>
								<input type="image" src="${context }/styles/uploadify/img/upload.jpg" onclick="$('#testFileInput2').uploadify('upload', '*');"/>
								<input type="image" src="${context }/styles/uploadify/img/cancel.jpg" onclick="$('#testFileInput2').uploadify('cancel', '*');"/>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
