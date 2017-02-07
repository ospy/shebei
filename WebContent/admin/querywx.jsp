<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table id="querywx"></table>

<div id="tb" style="padding: 5px">
	<div style="padding: 0 0 0 7px;color: #333">
		查询设备：<input type="text" name="shebei" class="textbox" style="width: 110px">
		维修时间从：<input type="text" name="datefrom" class="easyui-datebox" style="width: 110px">
		到：<input type="text" name="dateto" class="easyui-datebox"  style="width: 110px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="querywx_tool.search();">查询</a>
	</div>
</div>

<script type="text/javascript" src="js/querywx.js"></script>
