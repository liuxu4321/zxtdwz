<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form id="wrwEdit"  method="post" action="${context }/background/dic/pfbzgl/add/save?navTabId=pfbzgl&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<!-- <p>
				<label>生产商ID：</label>
				<input type="text" id="vendorId" name="vendorId" class="required number" maxlength="15" onblur="checkId();"/>
				<span id="checkVenderID" class="error" style="display: none;">生产商ID已存在</span>
			</p> -->
			<p>			
				<label>污染物名称：</label>				
				<select name="pollutantId1" class="required">
					<c:forEach var="pollutant" items="${pollutMap }">
						<option value="${pollutant.key }">${pollutant.value }</option>
					</c:forEach>
				</select>			
			</p>
			
			<p>
				<label>标准适用年限：</label>
				<input type="text" name="endDate" maxlength="100"/>
			</p>
			
			<p>
				<label>标准适用范围：</label>
				<!-- <input type="text" name="rangeCode" maxlength="25"/> -->
				<select name="rangeCode">
					<c:forEach var="rangeCode" items="${rangeCodeSelectMap }">
						<option value="${rangeCode.key }">${rangeCode.value }</option>
					</c:forEach>
				</select>	
			</p>
			<p>
				<label>标准级别：</label>
				<select name="standardLevel">
					<c:forEach var="level" items="${standardLevelSelectMap }">
						<option value="${level.key }">${level.value }</option>
					</c:forEach>
				</select>				
			</p>
			<p>
				<label>标准类型：</label>
				<select name=typeCode>
					<c:forEach var="typeCode" items="${typeCodeSelectMap }">
						<option value="${typeCode.key }">${typeCode.value }</option>
					</c:forEach>
				</select>				
			</p>
			<p>
				<label>标准值：</label>
				<input type="text" name="standardValue"  maxlength="10" class="number"/>
			</p>
			<p>
				<label>备注：</label>
				<textarea rows="4" name="remark" maxlength="250"></textarea>
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