<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/admin.css">
<table id="manager"></table>
<div id="tb" style="padding: 5px">
	<div style="margin-bottom: 5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="manager_tool.add();">添加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="manager_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<form id="manager_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
<p>科室名称：<input type="text" name="keshiname" class="textbox" style="width:200px"></p>
<p>科室负责人：<input type="text" name="keshimanager" class="textbox" style="width:200px"></p>
<p>科室楼层：<input type="text" name="keshiposition" class="textbox" style="width:200px"></p>
</form>

<script type="text/javascript" src="./js/keshi.js"></script>
    