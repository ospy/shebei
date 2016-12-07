<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="css/admin.css">
<table id="manager"></table>
<div id="tb" style="padding: 5px">
	<div style="margin-bottom: 5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="manager_tool.add();">添加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
	<div style="padding: 0 0 0 7px;color: #333">
		查询账户：<input type="text" name="user" class="textbox" style="width: 110px">
		创建时间从：<input type="text" name="date_from" class="easyui-datebox" style="width: 110px">
		到：<input type="text" name="date_to" class="easyui-datebox"  style="width: 110px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();">查询</a>
	</div>
</div>

<form id="manager_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
<p>账号：<input type="text" name="manager" class="textbox" style="width:200px"></p>
<p>密码：<input type="text" name="password" class="textbox" style="width:200px"></p>
<p>Email：<input type="text" name="email" class="textbox" style="width:200px"></p>
</form>

<script type="text/javascript" src="js/manager.js"></script>
