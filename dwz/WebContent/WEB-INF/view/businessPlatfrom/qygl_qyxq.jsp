<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_jbxx {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_jbxx td {
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.table_jbxx a {
		margin-right:40px;
	}
	sup {
		font-size: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var $hidEnterpriseId = "${enterprise.enterpriseId }";
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
		}
	});
</script>
<div class="pageContent" width="100%" layouth="0">
	<table class="table_jbxx">
		<col width="12%" align="right"/>
		<col width="22%" align="left"/>
		<col width="12%" align="right"/>
		<col width="22%" align="left"/>
		<col width="12%" align="right"/>
		<col width="222%" align="left"/>
		<tr>
			<td style="color:red;">*企业名称：</td>
			<td colspan="5">${enterprise.enterpriseName }</td>
		</tr>
		<tr>
			<td style="color:green;">简名：</td>
			<td>${enterprise.briefName }</td>
			<td style="color:green;">拼音简名：</td>
			<td style="">${enterprise.pellName }</td>
			<td style="color:red;">*监控类型：</td>
			<td>${kindSelectMap[enterprise.kindCode] }</td>
		</tr>
		<tr>
			<td style="color:red;">*所属行政区划：</td>
			<td>${areaName }</td>
			<td style="color:red;">*隶属关系：</td>
			<td>${relationSelectMap[enterprise.relationCode] }</td>
			<td style="color:green;">行业类别：</td>
			<td>${industryName }</td>
		</tr>
		<tr>
			<td style="color:red;">*中心经度：</td>
			<td style="">${longitude }</td>
			<td style="color:red;">*中心纬度：</td>
			<td>${latitude }</td>
			<td style="color:green;">关注程度：</td>
			<td>${attentionSelectMap[enterprise.attentionCode] }</td>
		</tr>
		<tr>
			<td style="color:red;">*法人代码：</td>
			<td style="">${enterprise.legalCode }</td>
			<td style="color:green;">法人：</td>
			<td>${enterprise.legalMan }</td>
			<td style="color:green;">国控类型：</td>
			<td>${stateCtrlSelectMap[enterprise.stateCtrlcode] }</td>
		</tr>
		<tr>
			<td style="color:green;">环保负责人：</td>
			<td>${enterprise.envirMan }</td>
			<td style="color:green;">专职环保人员数：</td>
			<td>${enterprise.envirMannum }</td>
			<!-- 去掉环保机构业务 -->
			<td style="color:red;"></td>
			<td style=""></td>
			<%-- <td style="color:red;">*所属环保机构：</td>
			<td style="">${envDeptSelectMap[enterprise.environmentCode] }</td> --%>
		</tr>
		<tr>
			<td style="color:green;">注册类型：</td>
			<td>${registerSelectMap[enterprise.registerKind] }</td>
			<td style="color:green;">面积(m<sup>2</sup>)：</td>
			<td>${enterprise.square }</td>
			<td style="color:green;">所属流域：</td>
			<td>${watershedName }</td>
		</tr>
		<tr>
			<td style="color:red;">*企业规模：</td>
			<td>${scaleSelectMap[enterprise.scale] }</td>
			<td style="color:green;">投产日期：</td>
			<td><fmt:formatDate value='${enterprise.productDate }' pattern='yyyy-MM-dd'/></td>
			<td style="color:red;">*是否有效：</td>
			<td>
				<c:choose>
					<c:when test="${enterprise.isValid=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td style="color:green;">电话：</td>
			<td>${enterprise.tel }</td>
			<td style="color:green;" >传真：</td>
			<td>${enterprise.fax }</td>
			<td style="color:green;">邮政编码：</td>
			<td>${enterprise.zipCode }</td>
		</tr>
		<tr>
			<td style="color:green;">开户银行：</td>
			<td>${enterprise.bankName }</td>
			<td style="color:green;">银行账号：</td>
			<td>${enterprise.bankAccount }</td>
			<td style="color:green;">电子邮箱：</td>
			<td>${enterprise.mail }</td>
		</tr>
		<tr>
			<td style="color:red;">*单位地址：</td>
			<td colspan="5">${enterprise.address }</td>
		</tr>
		<tr>
			<td style="color:green;">企业网址：</td>
			<td colspan="3">${enterprise.website }</td>
			<td style="color:green;">是否供暖企业：</td>
			<td colspan="3">
				<c:choose>
					<c:when test="${enterprise.isHeat=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td style="color:red;">*是否监控：</td>
			<td>
				<c:choose>
					<c:when test="${enterprise.isMonitor=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
			<td style="color:red;">*是否直管电厂：</td>
			<td>
				<c:choose>
					<c:when test="${enterprise.isStraight=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
			<td style="color:green;">30万千瓦电力企业：</td>
			<td>
				<c:choose>
					<c:when test="${enterprise.isKw=='1' }">是</c:when>
					<c:otherwise>否</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td style="color:green;">备注：</td>
			<td colspan="5" style="border-top:0;padding-right:5px;">
				<textarea style="width:75%;margin:0;border:0;" rows="3" readonly>${enterprise.remark }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<!-- 修改：去掉两个操作，直接返回 -->
				<!-- <a class="button" style="float:right;" target="" href="#" max="" rel="">
					<span>修改</span>
				</a>
				<a class="button" mask="true" style="float:right;" target="dialog" href="webroot/background/qygl_add.html" max="false" width="900" height="500" rel="qygl_add" title="添加企业基本信息">
					<span>添加</span>
				</a> -->
				<div class="buttonActive" style="float:right">
					<div class="buttonContent">
						<button type="button" class="close">返回</button>
					</div>
				</div>
				
			</td>
		</tr>
	</table>
</div>