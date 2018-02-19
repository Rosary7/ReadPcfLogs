<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> PCF LOGS</title>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var showLog = function(param) {
		//logId.innerHTML = param.innerHTML;
		//alert(param.innerHTML);

		$.get("http://localhost:8081/logs?appName=" + param.innerHTML,
				function(data, status) {
					//alert("Data: " + data + "\nStatus: " + status);
					logId.innerHTML = data;
					//alert(data);
					//$(#logId).text(data);

				});

	};

</script>

</head>
<body>
	<h2 align="center">PCF LOGS</h2>

 
<div style="float: left; width: 25%; solid: grey">
     	<table>
		<thead>
			<tr>
				<td align="center">PCF APPS </td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entry" items="${appDetailsMap}">
				<tr>
					<td><a href="#" onclick="showLog(this);">
							${entry.value['applicationName']} </a>
					&nbsp;
					 <c:set var = "statusVarUpper" value = "${entry.value['status']}"/>
					<c:set var = "statusVarLower" value = "${fn:toLowerCase(statusVarUpper)}" />
					<i>${statusVarLower}</i>
					</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
  </div>
  <div style="float: right; width: 75%; solid: grey;">
     <textarea id="logId" rows="30" cols="100"></textarea>
  </div>
 

</body>
</html>

