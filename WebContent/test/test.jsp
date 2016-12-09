<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">


<script type="text/javascript" src="../easyui/jquery.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>

</head>
<body>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="shebei_tool.add()">Add</a>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="shebei_tool2.add()">Add</a>
<form id="test_add">
		<input class="easyui-datebox"></input>
</form>
<form id="test_add2">
		22<input class="easyui-datebox"></input>
</form>





<div class="easyui-panel" title="Nested Panel" style="width:700px;height:200px;padding:10px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:true" style="width:100px;padding:10px">
				Left Content
			</div>
			<div data-options="region:'east'" style="width:100px;padding:10px">
				Right Content
			</div>
			<div data-options="region:'center'" style="padding:10px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="shebei_tool.add()">Add</a>
			
			<div class="easyui-tabs" style="width:700px;height:250px">
		<div title="About" style="padding:10px">
			<p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="shebei_tool.add()">Add</a>
		</div>
		<div title="My Documents" style="padding:10px">
			322
		</div>
		<div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
			This is the help content.
		</div>
	</div>
			
			</div>
		</div>
	</div>


<script type="text/javascript" src="test.js"></script>
<script type="text/javascript" src="test2.js"></script>
</body>
</html>