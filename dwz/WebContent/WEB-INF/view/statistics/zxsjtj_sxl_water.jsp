<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
    var filterCol = $("#changeWaterTdValue").val();
    
    $('input[type="checkbox"][name="orgId"]').each(
        function(){
           var _id = $(this).attr("id");
	       if(filterCol.indexOf(_id)>=0) {
		       $(this).attr("checked","checked");
		    }
    });
    
})

function getColValW(){ 
	var selectedItems = new Array(); 
	$("input[@name='orgId[]']:checked").each(
		function() {
			var _args = DWZ.jsonEval($(this).val());
			selectedItems.push(_args["idWater"]);
		}
	); 
	
	$('#changeWaterTdValue').val(selectedItems); 
	
	changeTdWater();
}
</script>
<div class="pageContent">
      <div class="pageFormContent">
          <p>
             <input type="checkbox" id="1" name="orgId" value="{idWater:'1'}"/>平均值
          </p>
          <p>
             <input type="checkbox" id="2"  name="orgId" value="{idWater:'2'}"/>排放量
          </p>
          <p>
             <input type="checkbox" id="3"  name="orgId" value="{idWater:'3'}"/>超标小时数
          </p>
          <p>
             <input type="checkbox" id="4"  name="orgId" value="{idWater:'4'}"/>数据异常小时数
          </p>
          <p>
             <input type="checkbox" id="5"  name="orgId" value="{idWater:'5'}"/>数据缺失小时数
          </p>
          <p>
             <input type="checkbox" id="6"  name="orgId" value="{idWater:'6'}"/>连续超标最大小时数
          </p>
          <p style="display: none;">
             <input type="checkbox" id="z" name="orgId" value="{idWater:''}" checked="checked"  />
          </p>
      </div>
      <div class="formBar">
          <ul>
              <li><div class="buttonActive"><div class="buttonContent"><button type="button" multLookup="orgId" onclick="getColValW()">确定</button></div></div></li>
              <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
          </ul>
      </div>
</div>