<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form id="wrwEdit"  method="post" action="${context }/background/dic/pfbzgl/edit/save?navTabId=pfbzgl&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<!-- <p>
				<label>生产商ID：</label>
				<input type="text" id="vendorId" name="vendorId" class="required number" maxlength="15" onblur="checkId();"/>
				<span id="checkVenderID" class="error" style="display: none;">生产商ID已存在</span>
			</p> -->
			<p>			
				<label>污染物名称：</label>			
				<c:forEach var="rule" items="${pollutMap }">
					<%-- <option value="${rule.key }" <c:if test = "${bolowoffS.pollutant.pollutantId == rule.key }">selected='selected'</c:if> >${rule.value }</option> --%>
					<c:if test = "${bolowoffS.pollutant.pollutantId == rule.key }">
						<input type="text" name="" readonly="readonly" value="${rule.value }"/>
						<input type="hidden" name="pollutantId1" value="${rule.key }"/>
					</c:if>
				</c:forEach>	
				<!-- <select name="pollutantId1" class="required">
					
					
				</select>	 -->		
				<input type="hidden" name="standardId" value="${bolowoffS.standardId }"/>
			</p>
		
			
			<p>
				<label>标准适用年限：</label>
				<input type="text" name="endDate" value="${bolowoffS.endDate }" maxlength="100"/>
			</p>
			
			<p>
				<label>标准适用范围：</label>
				<%-- <input type="text" name="rangeCode" maxlength="25" value="${bolowoffS.rangeCode }"/> --%>
				<select name="rangeCode">
					<c:forEach var="rangeCode" items="${rangeCodeSelectMap }">
						<option value="${rangeCode.key }" <c:if test="${bolowoffS.rangeCode == rangeCode.key }">selected='selected'</c:if> >${rangeCode.value }</option>
					</c:forEach>
				</select>			
			</p>
				<p>
				<label>标准级别：</label>
				<select name="standardLevel">
					<c:forEach var="level" items="${standardLevelSelectMap }">
						<option value="${level.key }" <c:if test="${bolowoffS.standardLevel == level.key }">selected='selected'</c:if> >${level.value }</option>
					</c:forEach>
				</select>				
			</p>
			<p>
				<label>标准类型：</label>
				<select name=typeCode>
					<c:forEach var="typeCode" items="${typeCodeSelectMap }">
						<option value="${typeCode.key }" <c:if test="${bolowoffS.typeCode == typeCode.key }">selected='selected'</c:if> >${typeCode.value }</option>
					</c:forEach>
				</select>				
			</p>
			<p>
				<label>标准值：</label>
				<input type="text" name="standardValue"  maxlength="10" value="${bolowoffS.standardValue }" class="number"/>
			</p>
			
			<p>
				<label>备注：</label>
				<textarea rows="4" name="remark" maxlength="250">${bolowoffS.remark }</textarea>
			</p>
		</div>
		<!-- </table> -->
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