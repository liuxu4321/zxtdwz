<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${context }/styles/dwz/js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  	$("#todoForm").submit();
	});
</script>
</head>


<form id="todoForm" action="${context }/authority/member/login" method="post">
</form>
</html>