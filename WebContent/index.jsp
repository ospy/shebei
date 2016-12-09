<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/admin.css">

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false" style="height: 60px;  padding: 1px" class="north_el"></div>
	
	<div data-options="region:'west',split:true,title:'导航',iconCls:'icon-icon146'" style="width: 150px; padding: 1px;">
		<ul id="nav"></ul>
	</div>

	<div data-options="region:'south',border:true" style="height: 20px; padding: 2px; text-align: center;">&copy;Zhaomj 2016-2020</div>

	<div data-options="region:'center'">
		<div id="tabs">
			<div title="起始页" iconCls="icon-home" style="padding: 0 10px;display: block;">
				
				<div class="easyui-layout" data-options="fit:true">	
<!-- 上部 -->
	<div data-options="region:'center',border:false " >
		<table id="shebei"></table>
		<div id="shebei_tb" style="padding: 5px">
			<div style="margin-bottom: 5px">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="shebei_tool.add();">添加</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"	onclick="shebei_tool.edit();">修改</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="shebei_tool.remove();">删除</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="shebei_tool.reload();">刷新</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="shebei_tool.redo();">取消选择</a>
			</div>
			<div style="padding: 0 0 0 7px;color: #333">
			查询账户：<input type="text" name="user" class="textbox" style="width: 110px">
			创建时间从：<input type="text" name="date_from" class="easyui-datebox" style="width: 110px">
			到：<input type="text" name="date_to" class="easyui-datebox"  style="width: 110px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();">查询</a>
			</div>
		</div>
		
		<!-- 设备添加-->	
		<div id="shebei_add">
		<input class="easyui-datebox">
		<form  style="margin: 0; padding: 5px 0 0 25px; color: #333;">
		<p>科室名称：<input type="text" name="shebeiname" class="textbox" style="width:200px"></p>
		<p>科室负责人：<input type="text" name="date_too" class="easyui-datebox"  style="width: 110px"></p>
		<p>科室楼层：<input type="text" name="shebeiposition" class="textbox" style="width:200px"></p>
		</form>
		</div>
		<!-- 设备添加  end-->
		
		<!-- 设备编辑-->	
		<form id="shebei_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
		<input type="hidden" name="shebeiid" class="textbox" style="width:200px">
		<p>科室名称：<input type="text" name="shebeiname_edit" class="textbox" style="width:200px"></p>
		<p>科室负责人：<input type="text" name="shebeimanager_edit" class="textbox" style="width:200px"></p>
		<p>科室楼层：<input type="text" name="shebeiposition_edit" class="textbox" style="width:200px"></p>
		</form>
		<!-- 设备编辑  end-->	
	</div>
<!-- 上部  end-->	
<!-- 下部-->	
	<div id="p" data-options="region:'south',border:false" title="更多信息" style="height: 250px;">
		<div class="easyui-tabs" data-options="tabWidth:112,fit:true,border:false">
			<div title="维修管理" style="padding: 1px">
				<table id="weixiu"></table>
				<div id="weixiu_tb">
					<div style="margin-bottom: 2px">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add2" plain="true" onclick="weixiu_tool.add();">添加</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-edit1" plain="true"	onclick="weixiu_tool.edit();">修改</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-del" plain="true" onclick="weixiu_tool.remove();">删除</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-undo1" plain="true" onclick="weixiu_tool.redo();">取消选择</a>
					</div>
				
				<!-- 维修添加-->	
				<form id="weixiu_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				  <table width="590" height="350" >
				    <tbody>
				      <tr>
				        <td width="95">状    态</td>
				        <td width="200"><select name="select" id="select">
				          <option value="在修">在修</option>
				          <option value="已结束">已结束</option>
				        </select></td>
				        <td width="95">维修保养类型</td>
				        <td width="200"><select>
				          <option value="故障维修">故障维修</option>
				          <option value="定期维修">定期维修</option>
				          <option value="保养">保养</option>
				        </select></td>
				      </tr>
				      <tr>
				        <td>维修科室</td>
				        <td id="wxks"></td>
				        <td>维修金额</td>
				        <td><input class="easyui-textbox" type="text" name="wxjine" id="wxjine"></td>
				      </tr>
				      <tr>
				        <td>维修保养原因</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxyuanyin" id="wxyuanyin" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>检  查  人</td>
				        <td><input type="text" name="jiancharen" id="jiancharen" class="easyui-textbox"></td>
				        <td>检查日期</td>
				        <td><input name="jianchadate" id="jianchadate" class="easyui-datetimebox" ></td>
				      </tr>
				      <tr>
				        <td>维修保养内容</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxneirong" id="wxneirong" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>维  修  人</td>
				        <td><input type="text" name="weixiuren" id="weixiuren" class="easyui-textbox"></td>
				        <td>维修时间</td>
				        <td><input name="weixiudate" id="weixiudate" class="easyui-datetimebox" ></td>
				      </tr>
				      <tr>
				        <td>验收记录</td>
				        <td colspan="3"><input class="easyui-textbox" name="jiancharen6" id="jiancharen6" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>验收人员</td>
				        <td><input type="text" name="yanshouren" id="yanshouren" class="easyui-textbox"></td>
				        <td>验收日期</td>
				        <td><input  name="yanshoudate" id="yanshoudate" class="easyui-datebox" ></td>
				      </tr>
				      <tr>
				        <td>备        注</td>
				        <td colspan="3"><input name="beizhu" id="beizhu" class="easyui-textbox" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				    </tbody>
				  </table>
				</form>
				<!-- 维修添加  end-->	
				
				<!-- 维修编辑-->	
				
				<!-- 维修编辑  end-->	
				</div>
			</div>
			<div title="文档管理" style="padding: 10px">
				<p>Maps Content.</p>
			</div>
			<div title="借出还入" style="padding: 10px">
				<p>Journal Content.</p>
			</div>
			<div title="验收管理" style="padding: 10px">
				<p>History Content.</p>
			</div>
			<div title="附属设备" style="padding: 10px">
				<p>References Content.</p>
			</div>
			<div title="转移管理" style="padding: 10px">
				<p>Contact Content.</p>
			</div>
			<div title="图片信息" style="padding: 10px">
				<p>Contact Content.</p>
			</div>
		</div>
	</div>
</div>
<!-- 下部  end-->	
</div>


				
								
			</div>
		</div>
	</div>

<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="test.js"></script>
<script type="text/javascript" src="js/shebei.js"></script>
<script type="text/javascript" src="js/weixiu.js"></script>
</body>
</html>