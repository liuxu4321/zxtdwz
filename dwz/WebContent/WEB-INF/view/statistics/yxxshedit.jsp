<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<h2 class="contentTitle">信息维护</h2>
<div class="pageContent">
	<form method="post" action="${context }/statistics/yxxsh/manager/add" class="pageForm -validate" onsubmit="return validateCallback(this)">
		<c:if test="${info != null }">
			<input type="hidden" name="editFlag" value="1"/>
			<input type="hidden" name="id" value="${info.id }"/>
			<input type="hidden" name="ckYear" value="${info.ckYear }"/>
			<input type="hidden" name="ckQuarter" value="${info.ckQuarter }"/>
		</c:if>
		<div class="pageFormContent nowrap" layoutH="97">
			<dl>
				<dt>企业序号：</dt>
				<dd>
					<input type="text" name="enterpriseId" value="${info.enterpriseId }" calss="required"/>
				</dd>
			</dl>
			<dl>
				<dt>设备套数序号：</dt>
				<dd>
					<input type="text" name="equiptId" value="${info.equiptId }" calss="required"/>
				</dd>
			</dl>
			<dl>
				<dt>季度：</dt>
				<dd>
					<input type="text" name="jd" value="${info.jd }" calss="required"/>
				</dd>
			</dl>
			<dl>
				<dt>所在地市：</dt>
				<dd>
					<c:choose>
						<c:when test="${info != null }">
							<input type="text" name="szds" value="${info.szds }" calss="required"/>
						</c:when>
						<c:otherwise>
							<select name="szds">
								<option value="沈阳市" >沈阳市</option>
								<option value="大连市" >大连市</option>
								<option value="鞍山市" >鞍山市</option>
								<option value="抚顺市" >抚顺市</option>
								<option value="本溪市" >本溪市</option>
								<option value="丹东市" >丹东市</option>
								<option value="锦州市" >锦州市</option>
								<option value="营口市" >营口市</option>
								<option value="阜新市" >阜新市</option>
								<option value="辽阳市" >辽阳市</option>
								<option value="盘锦市" >盘锦市</option>
								<option value="铁岭市" >铁岭市</option>
								<option value="朝阳市" >朝阳市</option>
								<option value="葫芦岛" >葫芦岛</option>
								<option value="绥中县" >绥中县</option>
								<option value="昌图县" >昌图县</option>
							</select>
						</c:otherwise>
					</c:choose>
				</dd>
			</dl>
			<dl>
				<dt>企业名称：</dt>
				<dd>
					<input type="text" name="enterpriseName" value="${info.enterpriseName }" calss="" alt="请输入企业名称"/>
				</dd>
			</dl>
			
			<dl>
				<dt>法人代码：</dt>
				<dd>
					<input type="text" name="frdm" value="${info.frdm }" calss="" />
				</dd>
			</dl>
			<dl>
				<dt>污染源类别：</dt>
				<dd>
					<input type="text" name="wrylb" value="${info.wrylb }" calss="" />
				</dd>
			</dl>
			<dl>
				<dt>是否为13年国控源名单：</dt>
				<dd>
					<input type="text" name="sfgkmd" value="${info.sfgkmd }" calss=""  />
				</dd>
			</dl>

			<%-- <dl>
				<dt>污水厂规模（万吨/日）：</dt>
				<dd>
					<input type="text" name="wscgm" value="${info.wscgm }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>排放标准：</dt>
				<dd>
					<input type="text" name="pfbz" value="${info.pfbz }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>运营模式：</dt>
				<dd>
					<input type="text" name="yyms" value="${info.yyms }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>运营单位：</dt>
				<dd>
					<input type="text" name="yydw1" value="${info.yydw1 }" calss=""  />
				</dd>
			</dl> --%>
			
			<dl>
				<dt>行业类别：</dt>
				<dd>
					<input type="text" name="hylb" value="${info.hylb }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>是否安装：</dt>
				<dd>
					<input type="text" name="sfaz" value="${info.sfaz }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>未安装原因：</dt>
				<dd>
					<input type="text" name="wazyy" value="${info.wazyy }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>安装位置：</dt>
				<dd>
					<input type="text" name="azwz" value="${info.azwz }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>项目：</dt>
				<dd>
					<input type="text" name="xm" value="${info.xm }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>安装时间：</dt>
				<dd>
					<input type="text" name="azsj" value="${info.azsj }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>设备生产厂家：</dt>
				<dd>
					<input type="text" name="sbsccj" value="${info.sbsccj }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>运营单位：</dt>
				<dd>
					<input type="text" name="yydw2" value="${info.yydw2 }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>设备型号：</dt>
				<dd>
					<input type="text" name="sbxh" value="${info.sbxh }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>设备编号：</dt>
				<dd>
					<input type="text" name="sbbh" value="${info.sbbh }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>验收时间：</dt>
				<dd>
					<input type="text" name="yssj" value="${info.yssj }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>验收结果：</dt>
				<dd>
					<input type="text" name="ysjg" value="${info.ysjg }" calss=""  />
				</dd>
			</dl>
			
			<%-- <dl>
				<dt>未通过验收原因：</dt>
				<dd>
					<input type="text" name="wtgysyy" value="${info.wtgysyy }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>是否与市级监控中心联网：</dt>
				<dd>
					<input type="text" name="sfshilw" value="${info.sfshilw }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>是否与省级监控中心联网：</dt>
				<dd>
					<input type="text" name="sfshenglw" value="${info.sfshenglw }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>是否与国家联网：</dt>
				<dd>
					<input type="text" name="sfgjlw" value="${info.sfgjlw }" calss=""  />
				</dd>
			</dl>
			
			
			<dl>
				<dt>停产时间段：</dt>
				<dd>
					<input type="text" name="tcsjd" value="${info.tcsjd }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>停产总天数：</dt>
				<dd>
					<input type="text" name="tczts" value="${info.tczts }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>考核总天数：</dt>
				<dd>
					<input type="text" name="khzts" value="${info.khzts }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>有效日均值实际天数：</dt>
				<dd>
					<input type="text" name="yxrjzsjts" value="${info.yxrjzsjts }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>传输率）：</dt>
				<dd>
					<input type="text" name="csl" value="${info.csl }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>已验收的国控企业本季度是否做有效性审核：</dt>
				<dd>
					<input type="text" name="gksfsh" value="${info.gksfsh }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>未做有效性审核原因：</dt>
				<dd>
					<input type="text" name="gkwshyy" value="${info.gkwshyy }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>本季度是否上报自查报告：</dt>
				<dd>
					<input type="text" name="sfsczcbg" value="${info.sfsczcbg }" calss=""  />
				</dd>
			</dl> --%>
			
			<dl>
				<dt>比对监测开展时间：</dt>
				<dd>
					<input type="text" name="bdjckzsj" value="${info.bdjckzsj }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>未开展原因：</dt>
				<dd>
					<input type="text" name="bdjcwkzyy" value="${info.bdjcwkzyy }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>比对是否通过：</dt>
				<dd>
					<input type="text" name="bdsftg" value="${info.bdsftg }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>比对未通过原因：</dt>
				<dd>
					<input type="text" name="bdwtgyy" value="${info.bdwtgyy }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>本季度19号令现场核查核查次数：</dt>
				<dd>
					<input type="text" name="xchccs" value="${info.xchccs }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>19号令核查时间：</dt>
				<dd>
					<input type="text" name="hcsj" value="${info.hcsj }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>监督考核开展时间：</dt>
				<dd>
					<input type="text" name="jdkhkzsj" value="${info.jdkhkzsj }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>考核是否通过：</dt>
				<dd>
					<input type="text" name="jdkhsftg" value="${info.jdkhsftg }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>不通过原因：</dt>
				<dd>
					<input type="text" name="jdkhwtgyy" value="${info.jdkhwtgyy }" calss=""  />
				</dd>
			</dl>
			
			<%-- <dl>
				<dt>有效性审核通过时间段：</dt>
				<dd>
					<input type="text" name="yxxshtgsjd" value="${info.yxxshtgsjd }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>有效性审核通过天数：</dt>
				<dd>
					<input type="text" name="yxxshtgts" value="${info.yxxshtgts }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>有效性审核指数：</dt>
				<dd>
					<input type="text" name="yxxshzs" value="${info.yxxshzs }" calss=""  />
				</dd>
			</dl> --%>
			
			<dl>
				<dt>标志编号：</dt>
				<dd>
					<input type="text" name="bzbh" value="${info.bzbh }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>标志核发日期：</dt>
				<dd>
					<input type="text" name="bzhfrq" value="${info.bzhfrq }" calss=""  />
				</dd>
			</dl>
			
			<dl>
				<dt>标志有效期至：</dt>
				<dd>
					<input type="text" name="bzyxq" value="${info.bzyxq }" calss=""  />
				</dd>
			</dl>
			
			<%-- <dl>
				<dt>有效传输率：</dt>
				<dd>
					<input type="text" name="yxcsl" value="${info.yxcsl }" calss=""  />
				</dd>
			</dl> --%>
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
	
</div>



