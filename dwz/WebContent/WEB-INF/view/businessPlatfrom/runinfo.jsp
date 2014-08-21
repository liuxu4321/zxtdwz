<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
	<div class="pageHeader">
		<div class="searchBar" >
			<form action="${context }/businessPlatfrom/plantformruninfo/findbytime" method="post" id="form"  onsubmit="return navTabSearch(this)" >
			<table class="searchContent">
					<tr height="20px">
						<td>
							时间：
						</td>
						<td>
							<select name="years" id = "years">
								<option>2013</option>
								<option selected="selected">2014</option>
								<option>2015</option>
								<option>2016</option>
								<option>2017</option>
								<option>2018</option>
								<option>2019</option>
								<option>2020</option>
							</select>
						</td>
						<td>
							年
						</td>
						<td>
							<select name="months" id = "months">
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
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li>
								<input type="submit" value="查看"/>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="pageContent">
	<c:choose>
		<c:when test="${ri != null }">
			<table class="table" width="100%">
				<tr align="center">
					<td>时间 ：${ri.infoTime } ；上传人：${ri.operUser }<input id="suiyi" type="hidden" value="${ri.infoTime }"/></td>
				</tr>
			</table>
			<div style="width:100%;height:655px; overflow:scroll; border:1px solid;"> 
				<%-- <img alt="" src="${context }/files/runinfoimage/${ri.filePath}" align="middle" width="100%" height="620px"> --%>
				<img alt="" src="${context }/files/runinfoimage/${ri.filePath}" align="middle"width="100%">
			</div> 
		</c:when>
		<c:otherwise>
			<table class="table" width="100%">
				<tr align="center">
					<td>查询显示图片，或该月没有上传图片
					<%-- <input id="suiyi" type="hidden" value="${ri.infoTime }"/> --%>
					<input id="suiyi" type="hidden" value="${ri.infoTime}"/>
					<input id="nyears" name="nyears" type= "hidden" value = "${year}"/>
					<input id="nmonths" name="nmonths" type="hidden" value = "${month}"/>
					</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
	<script type="text/javascript">
		if($("#suiyi").val() != ""){
			var year_month = $("#suiyi").val();
			var dates = year_month.split("-");
			$("#years").val(dates[0]);
			$("#months").val(dates[1]);
		}else{
			var nyears = $("#nyears").val();
			var nmonths = $("#nmonths").val();
			$("#years").val(nyears);
			$("#months").val(nmonths);
		}
	</script>