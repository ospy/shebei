<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false" style="height: 60px; background: #B3DFDA; padding: 10px"></div>
	
	<div data-options="region:'west',split:true,title:'导航',iconCls:'icon-icon146'" style="width: 150px; padding: 1px;">
		<ul id="nav"></ul>
	</div>

	<div data-options="region:'south',border:true" style="height: 30px; padding: 2px; text-align: center;">&copy;Zhaomj 2016-2020</div>

	<div data-options="region:'center'">
		<div id="tabs">
			<div title="起始页" iconCls="icon-home" style="padding: 0 10px;display: block;">
			欢迎使用
			</div>
		</div>
	</div>


</body>
</html>