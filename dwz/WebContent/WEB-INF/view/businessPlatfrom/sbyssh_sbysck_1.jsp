<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" layoutH="20">
	<table >
			<tr>
				<td width="80" height="30" align="center">验收单位：</td>
				<td colspan="2">
					<select name="type" class="required combox" style="width: 100PX">
						<option value="0" selected="selected">德阳市环保局</option>
						<option value="1">市辖区环保局</option>
						<option value="2">旌阳市环保局</option>
						<option value="3">中江县环保局</option>
						<option value="4">罗江县环保局</option>
					</select>
				</td>
			</tr>		
			<tr>
				<td width="80" align="center" height="30" >验 收 人：</td>
				<td colspan="2">
					<input type="text" size="40"></input>
				</td>
			</tr>		
			<tr>
				<td width="80" align="center" height="30" >验收时间：</td>
				<td>
					<nobr>
						<input name="name"  type="text" class="date" size="35"/>						
					</nobr>
				</td>
				<td><a class="inputDateButton" href="javascript:;">选择</a></td>
			</tr>		
			<tr>
				<td width="80" align="center" height="30" >是否通过：</td>
				<td colspan="2">
					<input name="name"  type="radio"/>通过
					<input name="name"  type="radio"/>未通过
				</td>
			</tr>	
				<tr>
				<td width="80" align="center">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
				<td colspan="2">
					<textarea rows="4" cols="30"></textarea>
				</td>
			</tr>		
			<tr>	
		</tbody>
	</table>
	<div class="formBar">
		<ul>	
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">保存</button></div></div>
			</li>
		</ul>
	</div>
</div>