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
	function test(json){
		alertMsg.info(json.message);
		$("#sssss").submit();
	}
	function AjaxDoneSelect(json){
		
	}
</script>
	<div class="pageHeader">
		<div class="searchBar" >
			<form action="${context }/statistics/yxxsh/manager/uploadfile" method="post" id="form" enctype="multipart/form-data" onsubmit="return iframeCallback(this);">
			<table class="searchContent">
					<tr height="20px">
						<td>
							年份：
						</td>
						<td>
							<select name="year">
								<option>2013</option>
								<option selected="selected">2014</option>
								<option>2015</option>
								<option>2016</option>
							</select>
						</td>
						<td>
							季度：
						</td>
						<td>
							<select name="quarter">
								<option value="一季度" >一季度</option>
								<option value="二季度" >二季度</option>
								<option value="三季度" >三季度</option>
								<option value="四季度" >四季度</option>
							</select>
						</td>
						<td>
							文件：
						</td>
						<td>
							<input type="file" name="file" />
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li>
								<input type="submit" value="提交"/>
								<input type="reset" value="取消"/>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	