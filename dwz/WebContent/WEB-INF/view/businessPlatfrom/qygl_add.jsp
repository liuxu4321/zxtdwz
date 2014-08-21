<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
sup {
	font-size: 10px;
}
</style>


<div class="pageContent" width="100%" layoutH="0">
	<form class="pageForm required-validate" id="qyglform"
		action="${context }/businessPlatfrom/enterprise/qygl/add/save?navTabId=qylb_${isFlag }&callbackType=closeCurrent"
		onsubmit="return validateCallback(this,navTabAjaxDone)" method="post">
		<input type="hidden" name="isFlag" value='1'/>
		<div class="panel collapse">
			<h1>企业信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
					
						<dt>企业名称</dt>
						<dd>
							<input class="required" type="text" name="enterpriseName" />
							<%-- <input type="text" name="enterpriseid" value= "${enterpriseid }"/> --%>
						</dd>
					</dl>
					<dl>
						<dt>所属行政区划：</dt>
						<dd>
							<%-- <input class="required" name="areaCode.subName" type="text"
								readonly style="float: left;" />
							<input name="areaCode.subId"
								type="hidden" /> <a style="float: none;" class="btnLook"
								href="${context }/businessPlatfrom/enterprise/areaCode/lookup"
								lookupGroup="areaCode" width="520" height="480" mask="true"
								max="false">所属行政区划</a> --%>
							<select name="areaCode">
								<c:forEach var="areaCodeM" items="${areaCodeMap }">
									<option value="${areaCodeM.key }"
										<c:if test="${areaCodeM.key==areaCode }">selected="selected"</c:if>>${areaCodeM.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>隶属关系：</dt>
						<dd>
							<select class="required" name="relationCode">
								<!-- <option value="">请选择</option> -->
								<c:forEach var="relation" items="${relationSelectMap }">
									<option value="${relation.key }">${relation.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>监控类型：</dt>
						<dd>
							<select class="required" name="kindCode">
								<!-- <option value="">请选择</option> -->
								<c:forEach var="kind" items="${kindSelectMap }">
									<option value="${kind.key }">${kind.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<!-- 
					<dl>
						<dt>关注程度：</dt>
						<dd>
							<select name="attentionCode">
								<c:forEach var="attention" items="${attentionSelectMap }">
									<option value="${attention.key }">${attention.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl> 
					-->
								<!-- <option value="">请选择</option> -->
					<dl>
						<dt>中心经度：</dt>
						<dd>
							<input style="float: none; width: 10%;" name="longitude"
								class="required degreee" type="text" maxlength="3" />° <input
								style="float: none; width: 10%;" name="longitude"
								class="required clock" type="text" maxlength="2" />′ <input
								style="float: none; width: 10%;" name="longitude"
								class="required clock" type="text" maxlength="2" />″
						</dd>
					</dl>
					<dl>
						<dt>中心纬度：</dt>
						<dd>
							<input style="float: none; width: 10%;" name="latitude"
								class="required degreee" type="text" maxlength="3" />° <input
								style="float: none; width: 10%;" name="latitude"
								class="required clock" type="text" maxlength="2" />′ <input
								style="float: none; width: 10%;" name="latitude"
								class="required clock" type="text" maxlength="2" />″
						</dd>
					</dl>
					<dl>
						<dt>法人代码：</dt>
						<dd>
							<input class="required" type="text" name="legalCode" />
						</dd>
					</dl>
					<!-- 去掉环保机构业务 -->
					<%-- <dl>
						<dt>所属环保机构：</dt>
						<dd>
							<select class="" name="environmentCode">
								<!-- <option value="">请选择</option> -->
								<c:forEach var="environment" items="${envDeptSelectMap }">
									<option value="${environment.key }">${environment.value
										}</option>
								</c:forEach>
							</select>
						</dd>
					</dl> --%>
					<dl>
						<dt>企业规模：</dt>
						<dd>
							<select class="required" name="scale">
								<!-- <option value="">请选择</option> -->
								<c:forEach var="scale" items="${scaleSelectMap }">
									<option value="${scale.key }">${scale.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<%-- <dl>
						<dt>企业类型：</dt>
						<dd>
							<select class="required" name="isFlag">
								<!-- <option value="">请选择</option> -->
								<c:forEach var="flag" items="${flagSelectMap }">
									<option value="${flag.key }"
										<c:if test="${flag.key == isFlag }">selected = 'selected'</c:if>>${flag.value
										}</option>
								</c:forEach>
							</select>
							<input type="hidden" name="isFlag" value='1'/>
						</dd>
					</dl> --%>
					<dl>
						<dt>是否直管电厂：</dt>
						<dd>
							<input type="radio" value="1" name="isStraight"  />是
							<input type="radio" value="0" name="isStraight" checked="checked"/>否
						</dd>
					</dl>
					<dl>
						<dt>是否监控：</dt>
						<dd>
							<input type="radio" value="1" name="isMonitor" checked="checked" />是
							<input type="radio" value="0" name="isMonitor" />否
						</dd>
					</dl>
					<dl>
						<dt>关注程度：</dt>
						<dd>
							<%-- <select name="attentionCode" >
								<c:forEach var="attention" items="${attentionSelectMap }">
									<option value="${attention.key }" >${attention.value }</option>
								</c:forEach>
							</select> --%>
							<select name="attentionCode">
								<option value="" selected = "selected">所有</option>
								<option value="1"  > 国控</option>
								<option value="2" >市控</option>
								<option value="3"  >省直电厂</option>
							</select>
						</dd>
					</dl> 
					<dl>
						<dt>行业类别：</dt>
						<dd>
							<input name="industryCode.industryName" type="text" readonly
								style="float: left;" class="required"/> <input name="industryCode.industryId"
								type="hidden" /> <a style="float: none;" class="btnLook"
								href="${context }/businessPlatfrom/enterprise/industryCode/lookup"
								lookupGroup="industryCode">行业类别</a>
						</dd>
					</dl>
					<!-- <dl>
					<dt>*是否有效：</dt>
					<dd>
						<input type="radio" value="1" name="isValid" checked="checked" />是
						<input type="radio" value="0" name="isValid" />否
					</dd>
				</dl> -->
				</fieldset>
			</div>
		</div>
		<div class="panel close collapse">
			<h1>企业详细信息</h1>
			<div class="pageFormContent">
				<fieldset>
					<dl>
						<dt>简名：</dt>
						<dd>
							<input type="text" name="briefName" />
						</dd>
					</dl>
					<dl>
						<dt>拼音简名：</dt>
						<dd>
							<input type="text" name="pellName" />
						</dd>
					</dl>
					<dl>
						<dt>地址：</dt>
						<dd>
							<input type="text" name="address" />
						</dd>
					</dl>
					<dl>
						<dt>邮编：</dt>
						<dd>
							<input type="text" name="zipCode" />
						</dd>
					</dl>
					<dl>
						<dt>电话：</dt>
						<dd>
							<input type="text" name="tel" />
						</dd>
					</dl>
					<dl>
						<dt>传真：</dt>
						<dd>
							<input type="text" name="fax" />
						</dd>
					</dl>
					<dl>
						<dt>邮箱：</dt>
						<dd>
							<input type="text" name="mail" />
						</dd>
					</dl>
					<%-- <dl>
						<dt>关注程度：</dt>
						<dd>
							<select name="attentionCode">
								<option value="">请选择</option>
								<c:forEach var="attention" items="${attentionSelectMap }">
									<option value="${attention.key }">${attention.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl> --%>
					<dl>
						<dt>国控类别：</dt>
						<dd>
							<select name="stateCtrlcode">
								<option value="">请选择</option>
								<c:forEach var="stateCtrl" items="${stateCtrlSelectMap }">
									<option value="${stateCtrl.key }">${stateCtrl.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>开户银行：</dt>
						<dd>
							<input type="text" name="bankName" />
						</dd>
					</dl>
					<dl>
						<dt>银行账户：</dt>
						<dd>
							<input type="text" name="bankAccount" />
						</dd>
					</dl>
					<dl>
						<dt>法人：</dt>
						<dd>
							<input type="text" name="legalMan" />
						</dd>
					</dl>
					<dl>
						<dt>环保负责人：</dt>
						<dd>
							<input type="text" name="envirMan" />
						</dd>
					</dl>
					<dl>
						<dt>环保人数</dt>
						<dd>
							<input type="text" name="envirMannum" />
						</dd>
					</dl>
					<!-- 
					<dl>
						<dt>行业类别：</dt>
						<dd>
							<input name="industryCode.industryName" type="text" readonly
								style="float: left;" /> <input name="industryCode.industryId"
								type="hidden" /> <a style="float: none;" class="btnLook"
								href="${context }/businessPlatfrom/enterprise/industryCode/lookup"
								lookupGroup="industryCode">行业类别</a>
						</dd>
					</dl>
					 -->
					<dl>
						<dt>企业网址：</dt>
						<dd>
							<input type="text" name="website" />
						</dd>
					</dl>
					<dl>
						<dt>注册类型：</dt>
						<dd>
							<select name="registerKind">
								<option value="">请选择</option>
								<c:forEach var="register" items="${registerSelectMap }">
									<option value="${register.key }">${register.value }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt>
							面积(m<sup>2</sup>)：
						</dt>
						<dd>
							<input type="text" name="square" />
						</dd>
					</dl>
					<dl>
						<dt>所属流域：</dt>
						<dd>
							<input name="watershedCode.watershedName" type="text" readonly
								style="float: left;" /> <input name="watershedCode.watershedId"
								type="hidden" /> <a style="float: none;" class="btnLook"
								href="${context }/businessPlatfrom/enterprise/watershedCode/lookup"
								lookupGroup="watershedCode">所属流域</a>
						</dd>
					</dl>
					<dl>
						<dt>是否30W千瓦电力：</dt>
						<dd>
							<input value="1" name="isKw" type="radio"  />是
							<input value="0" name="isKw" type="radio" checked="checked"/>否
						</dd>
					</dl>
					<dl>
						<dt>是否供暖企业：</dt>
						<dd>
							<input type="radio" value="1" name="isHeat"  />是
							<input type="radio" value="0" name="isHeat" checked="checked"/>否
						</dd>
					</dl>
					<dl>
						<dt>投产日期：</dt>
						<dd>
							<input type="text" name="productDate" class="date"
								readonly="readonly" /> <a class="inputDateButton"
								href="javascript:;">选择</a>
						</dd>
					</dl>
					<dl>
						<dt>是否有效：</dt>
						<dd>
							<input type="radio" value="1" name="isvalid"  />是
							<input type="radio" value="0" name="isvalid" checked="checked"/>否
						</dd>
					</dl>
					<dl>
						<dt>备注：</dt>
						<dd>
							<textarea name="remark" rows="1"></textarea>
						</dd>
					</dl>
				</fieldset>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent" >
							<button type="submit">提交</button> 
							<!-- <button onclick="qygladd();">提交</button> -->
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
		<!-- <div class="div_btn">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div> -->
	</form>
</div>
