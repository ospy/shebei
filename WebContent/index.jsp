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
			<div title="起始页" iconCls="icon-home" style="padding: 0 1px;display: block;">
				
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

			<form id="shebei_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				<table width="800" height="326" >
				    <tbody>
				      <tr>
				        <td width="60">设备类型</td>
				        <td width="200"><select name="sbleixing" id="sbleixing">
				          <option value="专用设备">专用设备</option>
				          <option value="电子设备">电子设备</option>
				        </select></td>
				        <td width="60">医保大类</td>
				        <td width="200"><select name="groupdl" id="groupdl">
				          <option value="故障维修">故障维修</option>
				          <option value="定期维修">定期维修</option>
				          <option value="保养">保养</option>
				        </select></td>
                        <td width="60">医保小类</td>
                        <td width="200"><select name="groupxl" id="groupxl">
                          <option value="故障维修">故障维修</option>
                          <option value="定期维修">定期维修</option>
                          <option value="保养">保养</option>
                        </select></td>
				      </tr>
				      <tr>
				        <td>设备编号</td>
				        <td id="wxks"><input class="easyui-textbox" type="text" name="sbcode" id="sbcode"></td>
				        <td>设备名称</td>
				        <td><input class="easyui-textbox" type="text" name="sbname" id="sbname"></td>
                        <td>出厂编号</td>
                        <td><input class="easyui-textbox" type="text" name="ccbianhao" id="ccbianhao"></td>
				      </tr>
				      <tr>
				        <td>设备品牌</td>
				        <td><input class="easyui-textbox" type="text" name="pinpai" id="pinpai"></td>
                        <td>设备型号</td>
                        <td><input class="easyui-textbox" type="text" name="xhtype" id="xhtype"></td>
                        <td>计量设备</td>
                        <td><input type="checkbox" name="bjiliang" id="bjiliang">
                        </td>
				      </tr>
				      <tr>
				        <td>出厂日期</td>
				        <td><input type="text" name="chuchangdate" id="chuchangdate" class="easyui-datebox"></td>
				        <td>购买日期</td>
				        <td><input name="buydate" id="buydate" class="easyui-datebox" ></td>
                        <td>启用时间</td>
                        <td><input name="begindate" id="begindate" class="easyui-datebox" ></td>
				      </tr>
				      <tr>
				        <td>生产厂家</td>
				        <td><input name="sscj" id="sscj" class="easyui-textbox" ></td>
                        <td>产地</td>
                        <td><input name="chandi" id="chandi" class="easyui-textbox" ></td>
                        <td>使用年限</td>
                        <td><input name="useyears" id="useyears" class="easyui-textbox" ></td>
				      </tr>
				      <tr>
				        <td>数量</td>
				        <td><input type="text" name="shuliang" id="shuliang" class="easyui-textbox"></td>
				        <td>单位</td>
				        <td><input name="danwei" id="danwei" class="easyui-textbox" ></td>
                        <td>单价</td>
                        <td><input name="danjia" id="danjia" class="easyui-textbox" ></td>
				      </tr>
				      <tr>
				        <td>使用部门</td>
				        <td><input name="keshi" id="keshi" class="easyui-textbox" ></td>
                        <td>使用状态</td>
                        <td><input name="syzhuangtai" id="syzhuangtai" class="easyui-textbox" ></td>
                        <td>存放地点</td>
                        <td><input name="didian" id="didian" class="easyui-textbox" ></td>
				      </tr>
				      <tr>
				        <td>管理分类</td>
				        <td><input type="text" name="glfenlei" id="glfenlei" class="easyui-textbox"></td>
				        <td>分类编码</td>
				        <td><input  name="glfenleibm" id="glfenleibm" class="easyui-textbox" ></td>
                        <td>分类名称</td>
                        <td><input name="glfenleimc" id="glfenleimc" class="easyui-textbox" ></td>
				      </tr>
                      <tr>
				        <td>经销商</td>
				        <td><input type="text" name="jingxiaoshang" id="jingxiaoshang" class="easyui-textbox"></td>
				        <td>设备等级</td>
				        <td><input  name="sbdengji" id="sbdengji" class="easyui-textbox" ></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
				      </tr>
				      <tr>
				        <td height="32">技术规格</td>
				        <td colspan="5"><input name="jishuguige" id="jishuguige" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
                      <tr>
				        <td height="32">详细配置</td>
				        <td colspan="5"><input name="peizhi" id="peizhi" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
                      <tr>
				        <td height="32">备        注</td>
				        <td colspan="5"><input name="beizhu" id="beizhu" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
				    </tbody>
				  </table>
			</form>

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
				        <td width="200"><select class="easyui-combobox" name="wxzhuangtai" style="width:150px;">
				          <option value="在修">在修</option>
				          <option value="已结束">已结束</option>
				        </select></td>
				        <td width="95">维修保养类型</td>
				        <td width="200"><select class="easyui-combobox" name="wxleixing" style="width:150px;">
				          <option value="故障维修">故障维修</option>
				          <option value="定期维修">定期维修</option>
				          <option value="保养">保养</option>
				        </select></td>
				      </tr>
				      <tr>
				        <td>维修科室</td>
				        <td><input id="wxkeshi" name="wxkeshi"></td>
				        <td>维修金额</td>
				        <td><input class="easyui-numberbox" type="text" name="wxjine" id="wxjine" data-options="min:0,precision:2"></td>
				      </tr>
				      <tr>
				        <td>维修保养原因</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxyuanyin" id="wxyuanyin" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>报  修  人</td>
				        <td><input type="text" name="bxren" id="bxren" class="easyui-validatebox textbox"></td>
				        <td>检查日期</td>
				        <td><input name="bxdate" id="bxdate" class="easyui-datetimebox" editable="false" required ="required"></td>
				      </tr>
				      <tr>
				        <td>维修保养内容</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxneirong" id="wxneirong" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>维  修  人</td>
				        <td><input type="text" name="wxren" id="wxren" class="easyui-textbox"></td>
				        <td>维修时间</td>
				        <td><input name="wxdate" id="wxdate" class="easyui-datetimebox" editable="false"></td>
				      </tr>
				      <tr>
				        <td>验收记录</td>
				        <td colspan="3"><input class="easyui-textbox" name="yanshoujilu" id="yanshoujilu" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>验收人员</td>
				        <td><input type="text" name="ysren" id="ysren" class="easyui-textbox"></td>
				        <td>验收日期</td>
				        <td><input  name="ysdate" id="ysdate" class="easyui-datebox" editable="false"></td>
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
				<form id="weixiu_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				<input type="hidden" name="weixiuid" class="textbox" style="width:200px">
				  <table width="590" height="350" >
				    <tbody>
				      <tr>
				        <td width="95">状    态</td>
				        <td width="200"><select class="easyui-combobox" name="wxzhuangtai_edit" style="width:150px;">
				          <option value="在修">在修</option>
				          <option value="已结束">已结束</option>
				        </select></td>
				        <td width="95">维修保养类型</td>
				        <td width="200"><select class="easyui-combobox" name="wxleixing_edit" style="width:150px;">
				          <option value="故障维修">故障维修</option>
				          <option value="定期维修">定期维修</option>
				          <option value="保养">保养</option>
				        </select></td>
				      </tr>
				      <tr>
				        <td>维修科室</td>
				        <td><input id="wxkeshi_edit" name="wxkeshi_edit"></td>
				        <td>维修金额</td>
				        <td><input class="easyui-textbox" type="text" name="wxjine_edit" id="wxjine_edit"></td>
				      </tr>
				      <tr>
				        <td>维修保养原因</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxyuanyin_edit" id="wxyuanyin_edit" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>报  修  人</td>
				        <td><input type="text" name="bxren_edit" id="bxren_edit" class="easyui-textbox"></td>
				        <td>检查日期</td>
				        <td><input name="bxdate_edit" id="bxdate_edit" class="easyui-datetimebox" editable="true" required ="required"></td>
				      </tr>
				      <tr>
				        <td>维修保养内容</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxneirong_edit" id="wxneirong_edit" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>维  修  人</td>
				        <td><input type="text" name="wxren_edit" id="wxren_edit" class="easyui-textbox"></td>
				        <td>维修时间</td>
				        <td><input name="wxdate_edit" id="wxdate_edit" class="easyui-datetimebox" ></td>
				      </tr>
				      <tr>
				        <td>验收记录</td>
				        <td colspan="3"><input class="easyui-textbox" name="yanshoujilu_edit" id="yanshoujilu_edit" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>验收人员</td>
				        <td><input type="text" name="ysren_edit" id="ysren_edit" class="easyui-textbox"></td>
				        <td>验收日期</td>
				        <td><input  name="ysdate_edit" id="ysdate_edit" class="easyui-datebox" ></td>
				      </tr>
				      <tr>
				        <td>备        注</td>
				        <td colspan="3"><input name="beizhu_edit" id="beizhu_edit" class="easyui-textbox" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				    </tbody>
				  </table>
				</form>
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
<style scoped="scoped">
		.textbox{
			height:20px;
			margin:0;
			padding:0 2px;
			box-sizing:content-box;
		}
	</style>
</body>
</html>