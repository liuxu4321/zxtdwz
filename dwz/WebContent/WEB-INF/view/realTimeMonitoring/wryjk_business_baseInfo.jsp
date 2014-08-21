<!-- 污染源监控企业级 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!--基本信息点击后主页 2013/09/23 BY RenWei -->
<table style="height: 508px;margin-left: 5px;" border='1'>
  <tr>
    <td width="11%" align="center">污染源名称:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.ENTERPRISE_NAME}</td>
    <td width="12%" align="center">污染源地址:</td>
    <td width="54%" align="center" colspan="3">${EnterpriseParticularInfo.ADDRESS}</td>
  </tr>

  <tr>
    <td width="11%" align="center">行政区划:</td>
    <td width="23%"align="center">${EnterpriseParticularInfo.AREA_NAME}</td>
    <td width="12%"align="center">隶属关系:</td>
    <td width="19%"align="center">${EnterpriseParticularInfo.RELATION_NAME}</td>
    <td width="13%" align="center">注册类型:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.REGISTER_KIND}</td>
  </tr>

  <tr>
    <td width="11%" align="center">法定代表人:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.LEGAL_MAN}</td>
    <td width="12%" align="center">法人代码:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.LEGAL_CODE}</td>
    <td width="13%" align="center">行业类别:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.INDUSTRY_CODE}</td>
  </tr>
  
  <tr>
    <td width="11%" align="center">单位类型:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.IS_FLAG}</td>
    <td width="12%" align="center">污染源规模:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.SCALE}</td>
    <td width="13%" align="center">占地面积(m2):</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.SQUARE}</td>
  </tr>

  <tr>
    <td width="11%" align="center">污染源类别:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.KIND_NAME}</td>
    <td width="12%" align="center">关注程度:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.ATTENTION_NAME}</td>
    <td width="13%" align="center">流域:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.WATERSHED_NAME}</td>
  </tr>

  <tr>
    <td width="11%" align="center">中心经度:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.LONGITUDE}</td>
    <td width="12%" align="center">中心纬度:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.LATITUDE}</td>
    <td width="13%" align="center">投产日期:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.PRODUCT_DATE}</td>
  </tr>
  
  <tr>
    <td width="11%" align="center">联系人:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.LEGAL_MAN}</td>
    <td width="32%" align="center" colspan="2">是否30万千瓦电力企业:</td>
    <td width="35%" align="center" colspan="2">${EnterpriseParticularInfo.IS_KW}</td>
  </tr>

   <tr>
    <td width="11%" align="center">联系电话:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.TEL}</td>
    <td width="12%" align="center">传真:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.FAX}</td>
    <td width="13%" align="center">电子邮箱:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.MAIL}</td>
  </tr>

  <tr>
    <td width="11%" align="center">邮政编码:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.ZIP_CODE}</td>
    <td width="12%" align="center">污染源网址:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.WEBSITE}</td>
    <td width="13%" align="center">开户银行:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.BANK_NAME}</td>
  </tr>

  <tr>
    <td width="11%" align="center">银行账号:</td>
    <td width="23%" align="center">${EnterpriseParticularInfo.BANK_ACCOUNT}</td>
    <td width="12%" align="center">环保负责人:</td>
    <td width="19%" align="center">${EnterpriseParticularInfo.ENVIR_MAN}</td>
    <td width="13%" align="center">专职环保人数:</td>
    <td width="22%" align="center">${EnterpriseParticularInfo.ENVIR_MANNUM}</td>
  </tr>
  <tr>
  	<td width="11%" align="center">备注:</td>
    <td width="89%" align="center" colspan="5">${EnterpriseParticularInfo.REMARK}</td>
  </tr>

</table>

