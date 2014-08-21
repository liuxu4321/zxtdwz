<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<div class="pageContent" layoutH="0">
	<form id="pollutantEdit" method="post" action="${context }/background/dic/wrw/edit/save?navTabId=wrw&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<p>
				<label>污染物ID：</label>
				<input type="text" name="pollutantId" value="${Pollutant.pollutantId  }" readonly="readonly"/>
			</p>
			<p>
				<label>污染物英文名称：</label>
				<input type="text" name="pollutantName" value="${Pollutant.pollutantName  }" class="required" maxlength="50"/>
			</p>
			<p>
				<label>污染物中文名称：</label>
				<input type="text" name="chineseName" value="${Pollutant.chineseName  }" class="required" maxlength="50"/>
			</p>
			<p>
				<label>污染物类型代码：</label>
				<input style="width:20px;" type="radio" name="typeCode" <c:if test="${Pollutant.typeCode==1 }">checked="checked"</c:if> value="1"/>废水
				<input style="width:20px;" type="radio" name="typeCode" <c:if test="${Pollutant.typeCode==0 }">checked="checked"</c:if> value="0"/>废气
			</p>
			<p>
				<label>计量单位代码：</label>
				<select name="unitCode">
					<c:forEach items="${subClassSet }" var="subClass">
						<option <c:if test="${subClass.id.subId == Pollutant.unitCode }">checked="checked"</c:if> value="${subClass.id.subId }">${subClass.subName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>当量值：</label>
				<input type="text" name="equalValue" value="${Pollutant.equalValue  }" class="textInput number"  maxlength="6"/>
			</p>
			<p>	
				<label>报警下限：</label>
				<input type="text" name="alarmMin" value="${Pollutant.alarmMin  }" class="required textInput number"  maxlength="6"/>
			</p>
			<p>
				<label>报警上限：</label>
				<input type="text" name="alarmMax" value="${Pollutant.alarmMax  }" class="required textInput number"  maxlength="6"/>
			</p>
			<p>	
				<label>异常最大值：</label>
				<input type="text" name="abnormalMax" value="${Pollutant.abnormalMax  }" class="required textInput number"  maxlength="6"/>
			</p>
			<p>
				<label>异常最小值：</label>
				<input type="text" name="abnormalMin" value="${Pollutant.abnormalMin  }" class="required textInput number"  maxlength="6"/>
			</p>
			<p>
				<label>备注：</label>
				<textarea  style="width:99%;border:1;" rows="4" name="remark" maxlength="250">${Pollutant.remark }</textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>