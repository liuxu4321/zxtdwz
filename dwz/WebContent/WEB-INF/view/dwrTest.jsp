<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  

<script type="text/javascript">
	function update() {
		var name = dwr.util.getValue("demoName");
		dwrController.showMenu(name, function(data) {
			dwr.util.setValue("demoReply", data);
		});
	}
</script>


<p>
  Name:
  <input type="text" id="demoName"/>
  <input value="Send" type="button" onclick="update()"/>
  <br/>
  Reply: <span id="demoReply"></span>
</p>

