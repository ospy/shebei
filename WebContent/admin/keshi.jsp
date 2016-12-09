<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/admin.css">
<table id="keshi"></table>
<div id="keshi_tb" style="padding: 5px">
	<div style="margin-bottom: 5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="keshi_tool.add();">添加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="keshi_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="keshi_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="keshi_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="keshi_tool.redo();">取消选择</a>
	</div>
</div>

<form id="keshi_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
<p>科室名称：<input type="text" name="keshiname" class="textbox" style="width:200px"></p>
<p>科室负责人：<input type="text" name="keshimanager" class="textbox" style="width:200px"></p>
<p>科室楼层：<input type="text" name="keshiposition" class="textbox" style="width:200px"></p>

<input id="rl"></input>

</form>

<form id="keshi_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
<input type="hidden" name="keshiid" class="textbox" style="width:200px">
<p>科室名称：<input type="text" name="keshiname_edit" class="textbox" style="width:200px"></p>
<p>科室负责人：<input type="text" name="keshimanager_edit" class="textbox" style="width:200px"></p>
<p>科室楼层：<input type="text" name="keshiposition_edit" class="textbox" style="width:200px"></p>
</form>


<script type="text/javascript" src="./js/keshi.js"></script>

    