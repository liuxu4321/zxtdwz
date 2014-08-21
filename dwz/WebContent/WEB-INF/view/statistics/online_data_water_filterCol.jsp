<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

$(document).ready(function(){
    var filterCol = $("#filterColIdWater").val();
    
    $('input[type="checkbox"][name="col"]').each(
        function(){
           var _id = $(this).attr("id");
	       if(filterCol.indexOf(_id)>=0) {
		       $(this).attr("checked","checked");
		    }
    });
    
})

function getColVal(){ 
	var selectedItems = new Array(); 
	$("input[@name='col[]']:checked").each(
		function() {
			var _args = DWZ.jsonEval($(this).val());
			selectedItems.push(_args["id"]);
		}
	); 
	
	$('#filterColIdWater').val(selectedItems); 
	
	filterColWaterVis();
}


</script>

<div class="pageContent">
      <div class="pageFormContent">
          <p>
             <input type="checkbox" id="cod" name="col" value="{id:'cod'}"/>化学需氧量
          </p>
          <p>
             <input type="checkbox" id="hnh"  name="col" value="{id:'hnh'}"/>氨氮
          </p>
          <p>
          </p>
          <p style="display: none;">
             <input type="checkbox" id="z" name="col" value="{id:''}" checked="checked"  />
          </p>
      </div>
      <div class="formBar">
          <ul>
              <li><div class="buttonActive"><div class="buttonContent"><button type="button" multLookup="col" onclick="getColVal()">确定</button></div></div></li>
              <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
          </ul>
      </div>
</div>