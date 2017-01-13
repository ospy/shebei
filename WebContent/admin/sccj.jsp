<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table id="sccj"></table>
<div id="tb" style="padding: 5px">
	<div style="margin-bottom: 5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="sccj_tool.add();">添加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="sccj_tool.edit()();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="sccj_tool.remove();">删除</a>
	</div>
	<div style="padding: 0 0 0 7px;color: #333">
		查询账户：<input type="text" name="user" class="textbox" style="width: 110px">
		创建时间从：<input type="text" name="date_from" class="easyui-datebox" style="width: 110px">
		到：<input type="text" name="date_to" class="easyui-datebox"  style="width: 110px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();">查询</a>
	</div>
</div>

<form id="sccj_add" style="margin: 0; padding: 5px 0 0 1px; color: #333;">
<table width="625" height="216" border="0">
  <tbody>
    <tr>
      <td width="73">编号</td>
      <td width="247"><input type="text" name="cbm" class="textbox" style="width:200px" id="cbm"></td>
      <td width="74">名称</td>
      <td width="203"><input type="text" name="cjname" class="textbox" style="width:200px" id="cjname"></td>
    </tr>
    <tr>
      <td>拼音码</td>
      <td><input type="text" name="cpym" class="textbox" style="width:200px" id="cpym"></td>
      <td>国别</td>
      <td><input type="text" name="cgb" class="textbox" style="width:200px" id="cgb"></td>
    </tr>
    <tr>
      <td>单位地址</td>
      <td><input type="text" name="cdwdz" class="textbox" style="width:200px" id="cdwdz"></td>
      <td>邮政编码</td>
      <td><input type="text" name="cdwyb" class="textbox" style="width:200px" id="cdwyb"></td>
    </tr>
    <tr>
      <td>联系人</td>
      <td><input type="text" name="clxr" class="textbox" style="width:200px" id="clxr"></td>
      <td>电话</td>
      <td><input type="text" name="cdh" class="textbox" style="width:200px" id="cdh"></td>
    </tr>
     <tr>
      <td>QQ</td>
      <td><input type="text" name="cqq" class="textbox" style="width:200px" id="cqq"></td>
      <td>邮箱</td>
      <td><input type="text" name="cemail" class="textbox" style="width:200px" id="cemail"></td>
    </tr>
     <tr>
      <td>传真</td>
      <td><input type="text" name="ccz" class="textbox" style="width:200px" id="ccz"></td>
      <td>上级厂家</td>
      <td><input type="text" name="csjcj" class="textbox" style="width:200px" id="csjcj"></td>
    </tr>
     <tr>
      <td>资料柜号</td>
      <td><input type="text" name="czlg" class="textbox" style="width:200px" id="czlg"></td>
      <td>档案号</td>
      <td><input type="text" name="cdah" class="textbox" style="width:200px" id="cdah"></td>
    </tr>
  </tbody>
</table>
</form>

<script type="text/javascript" src="js/sccj.js"></script>
