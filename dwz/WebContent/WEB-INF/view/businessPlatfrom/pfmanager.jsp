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
			<form id="sssss" action="${context }/businessPlatfrom/plantformruninfo/manager?navTabId=ptyxqkgl" onsubmit="return navTabSearch(this)"></form>
			<form action="${context }/businessPlatfrom/plantformruninfo/upload" method="post" id="form" enctype="multipart/form-data" onsubmit="return iframeCallback(this , test);">
			<table class="searchContent">
					<tr height="20px">
						<td>
							时间：
						</td>
						<td>
							<select name="years" id="myears">
								<option>2013</option>
								<option selected="selected">2014</option>
								<option>2015</option>
								<option>2016</option>
							</select>
						</td>
						<td>
							年
						</td>
						<td>
							<select name="months" id="mmonths">
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
						</td>
						<td>
							月
						</td>
						<td>
							文件：
						</td>
						<td>
							<input type="file" name="file" id="uploadImg"/>
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
	<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="delete" href="${context }/businessPlatfrom/plantformruninfo/remove?navTabId=ptyxqkgl&id={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="80">序号</th>
				<th width="120">时间</th>
				<th width="100">图片</th>
				<th width="150">上传人</th>
				<th width="80" align="center">上传时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="li" varStatus="i">
				<tr target="id" rel="${li.id }">
					<td>${i.count }</td>
					<td>${li.infoTime }</td>
					<td><a href="${context }/businessPlatfrom/plantformruninfo/findbyfilename?filePath=${li.filePath}&time=${li.infoTime}" target="navTab">点击查看文件</a></td>
					<td>${li.operUser }</td>
					<td>${li.uploadTime }</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	</div>
	<script type="text/javascript">
		function showPic(){
		     var x = document.getElementById("uploadImg"); 
		     var y = document.getElementById("reviewImg");
		     alert(x.value);
		     if(!x || !x.value || !y){
		    	 return; 
		     }
		     var patn = /\.jpg$|\.jpeg$|\.png$|\.gif$/i; 
		     if(patn.test(x.value)){  
		        y.src = "file://localhost/" + x.value;
		        y.style.display = "inline";
		      }
		     else{  alert("您选择的似乎不是图像文件。"); }
		}
		
		
</script>