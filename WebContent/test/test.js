/**
 * 
 */

$(function(){
	//新增
	<script type="text/javascript"><!--
	var editxt={};//存储修改的时候的div
	var xt={};//存储系统公告的的 id  >  div1,div2...
	var i=1;
	var hasUpload=false;
	var hasMorenContent=true;//默认的编辑框
	var hasXtContent=false;//默认的编辑框
	var thisWebSiteMessageId=-1;
	var arr={};
	arr[1]="媒体报道";
	arr[2]="网站公告";
	arr[3]="成功案例";
	arr[4]="站内信息";
	//普通的文本框，没有带上传功能
	var morenContent="<div id='systemNoticeMoren' style='overflow: hidden;'> <textarea id='morenContent' style='width: 582px; height: 116px; border: 1px solid #ccc;' ></textarea> </div>";
	var okImg="<img alt='' src='/images/oo.gif'/>"; 
	var errorImg="<img alt='' src='/images/xx.gif'/>"; 
$(function(){
	var method=$('#method');
	var type=$('#type');
	 method.combobox({
		 onSelect:function(ele){
		 resetWebId();
			  if(ele.value==1){
				  if(!hasMorenContent){
					  $('#addUploadId').append(morenContent);
					  hasMorenContent=true;
				  }
				if(hasXtContent){
					$('#systemNoticeXt').remove();
					hasXtContent=false;
				} 
				$.each(xt,function(index,ele){
					$('#systemNoticeXt'+index).remove();
				});
				//恢复参数配置
				resetCash();
				//移除添加消息的按钮 
				$('#systemNoticeUpload').remove();
				  type.combobox('clear');
				  type_1(type);
			  }
			  else if(ele.value==2){
				  type.combobox('clear');
					  type_2(type);
				  //移除默认的编辑框
				  $('#systemNoticeMoren').remove();
				  hasMorenContent=false;
				  //绑定系统公告编辑框
				  if(!hasXtContent){
				  //	var xtContent="<div id='systemNoticeXt' style='overflow: hidden;'> <textarea id='xtContent' style='width: 582px; height: 116px; border: 1px solid #ccc;' ></textarea> "
					//+"<img alt='' src='/images/xx.gif'><input id='file' name='file' type='file' value='选择文件'/> </div>";
					  hasXtContent=true;
				  }
			  }
		 }
	 });
});
function type_1(type){
	type.combobox({
						  valueField: 'id',
						textField: 'value',
						data: [{
							id: '4',
							value: '站内信息',
							selected:true
						}],
						onSelect:function(rec){
							resetWebId();
						}
					  });
}
function type_2(type){
	type.combobox({
						  valueField: 'id',
						textField: 'value',
						data: [{
							id: '1',
							value: '媒体报道',
							selected:true 
						},{
							id: '2',
							value: '网站公告'
						},{
							id: '3',
							value: '成功案例' 
						}],
						onSelect:function(rec){
						 resetWebId();
						  var noticeId=rec.id;
						  if(noticeId==1||noticeId==3||noticeId==2){
							  if(!hasUpload)
							  { hasUpload=true;
								$('#upId').append('<a id="systemNoticeUpload" href="#" onclick="addDiv();">添加消息</a>');
							  }
								  $.each(xt,function(index,ele){
									$('#systemNoticeXt'+index).remove();
								});
								//恢复参数配置
								xt={};//存储系统公告的的 id  >  div1,div2...
								i=1;
								  hasXtContent=false;
						  }else{
							  if(hasUpload)
							  { hasUpload=false;
								$('#systemNoticeUpload').remove();
							  }
						  }	
					  }
				  });
}
function openNotice(){
	 resetCash();	
	 $('#noticeForm').form('reset');
	 $('#addNotice').dialog('open');
	 $('#webId').val('');
	 type_1($('#type'));
}
function addNotice(){
		var time;
		var selectId=$('#method').combobox('getValue');
		var noticType=$('#type').combobox('getValue');
		var paramsId=$("#webId").val();
		if(selectId==1){
			//站内信息
				if(paramsId==null||paramsId==''){
				$('#noticeForm').form('submit', {	
						url:'admin/notice/notice!add.ds',   
						onSubmit: function(param){	
					   param["websiteMessage.MContent"]=$('#morenContent').val();
					   param["comId"]=1;//表示选中第一个 2：系统公告 ，1：站内信息
						
					}  ,
						success:function(data){	
					  var json=$.parseJSON(data);
						  $.messager.alert('温馨提示',json.message,'info');
						  if(json.success){
								$('#sysdatabase').datagrid('reload');
							   }
						}	
				}); 
			}else{
				var data={
						'webId':paramsId,
						'websiteMessage.title':$("input[name='websiteMessage.title']").val(),
						'websiteMessage.MContent':$("#morenContent").val(),
						"comId":1
				}
					$.post('/admin/notice/notice!add.ds',data,function(data){
						 $.messager.alert('温馨提示',data.message,'info');
						  if(data.success){
									$('#sysdatabase').datagrid('reload');
							   }
					},"json");
			}
		}
		else if(selectId==2){
			//添加消息 comId=2
			if(xt){
				$.each(xt,function(index,ele){
				 var isSubmit=true;
					 //检查文件
					 var f=document.getElementById('file'+index).files;
						if(f.length>0){ 
							var filename=$('#file'+index).val();
							var suffix=filename.substring(filename.lastIndexOf("."),filename.length);
							//.jpg,.png,.peng,.gif,.mp4,avi
							if(suffix!=".png"&&suffix!=".jpeg"&&suffix!=".jpg"&&suffix!=".gif"&&suffix!=".avi"&&suffix!=".mp4"){	   
								   alert("文件格式不对，请选择格式【.jpg,.png,.peng,.gif,.mp4,avi】的文件");		 
								   isSubmit=false;
							   }
							if(suffix==".png"||suffix==".jpeg"||suffix==".jpg"||suffix==".bmp"||suffix==".gif"){
								var filesize=f.size/1024;//KB
								if(parseInt(filesize)>1024){
									alert('图片不能大于1M');
									 isSubmit=false;
								}
							}
							if(suffix==".avi"||suffix==".mp4"){
								var filesize=f.seize/1024/1024;//M
								if(filesize>20){
									alert('视频不能大于20M');
									 isSubmit=false;
								}
							}
						}
					 //提交文件
					 if(isSubmit){ 
						var getFile=$('#file'+index);
						$('#noticeForm').form('submit',{
							url:'admin/notice/notice!add.ds',
							onSubmit:function(pa){
								pa["comId"]=2;//表示选中第一个 2：系统公告 ，1：站内信息
								pa["websiteMessage.MContent"]=$('#xtContent'+index).val();
								 //获取是否选择文件
								var f = document.getElementById("file"+index).files.length; 
								if(f>0)
								{
										pa["file"]=getFile.attr('name','file');//更改文件的nam属性
										pa["fileName"]=$('#file'+index).val();
								}
								pa["noticType"]=noticType;
								pa["uploadCount"]=index;//索引值
							},
							success:function(data){
							data=$.parseJSON(data);
								if(data.success){
								  $('#systemNoticeXt'+index).append(okImg);
								}
								else{
									  $('#systemNoticeXt'+index).append(errorImg);
									 if(data.code==-1)
									  $('#systemNoticeXt'+index).append("<font color='red'>"+data.message+"</font>");
								  }
							}
						});
					}
					//还原文件的名字
					$('#file'+index).attr('name','file'+index);//更改文件的nam属性
					//设置时间，避免得到重复值
					time=setInterval(function(){},1000);
				});
			}<%--else if(editxt){
				$.each(editxt,function(index,ele){
					var eisSubmit=true;
					 //检查文件
					 var ef=document.getElementById('file'+index).files;
						if(ef.length>0){ 
							var efilename=$('#file'+index).val();
							var esuffix=efilename.substring(efilename.lastIndexOf("."),efilename.length);
							//.jpg,.png,.peng,.gif,.mp4,avi
							if(esuffix!=".png"&&esuffix!=".jpeg"&&esuffix!=".jpg"&&esuffix!=".gif"&&esuffix!=".avi"&&esuffix!=".mp4"){	   
								   alert("文件格式不对，请选择格式【.jpg,.png,.peng,.gif,.mp4,avi】的文件");		 
								   eisSubmit=false;
							   }
							if(esuffix==".png"||esuffix==".jpeg"||esuffix==".jpg"||esuffix==".bmp"||esuffix==".gif"){
								var efilesize=ef.size/1024;//KB
								if(parseInt(efilesize)>1024){
									alert('图片不能大于1M');
									 eisSubmit=false;
								}
							}
							if(esuffix==".avi"||esuffix==".mp4"){
								var efilesize=ef.seize/1024/1024;//M
								if(efilesize>20){
									alert('视频不能大于20M');
									 eisSubmit=false;
								}
							}
						}
					 //提交文件
					 if(eisSubmit){ 
						var egetFile=$('#file'+index);
						$('#noticeForm').form('submit',{
							url:'<%=basePath%>admin/notice/notice!add.ds',
							onSubmit:function(pa){
								pa["comId"]=2;//表示选中第一个 2：系统公告 ，1：站内信息
								pa["websiteMessage.MContent"]=$('#xtContent'+index).val();
								pa["webId"]=$('#webId').val();
								 //获取是否选择文件
								var af = document.getElementById("file"+index).files.length; 
								if(af>0)
								{
										pa["file"]=egetFile.attr('name','file');//更改文件的nam属性
										pa["fileName"]=$('#file'+index).val();
								}
								pa["noticType"]=noticType;
								pa["uploadCount"]=index;//索引值
							},
							success:function(data){
							data=$.parseJSON(data);
								if(data.success){
								  $('#systemNoticeXt'+index).append(okImg);
								}
								else{
									  $('#systemNoticeXt'+index).append(errorImg);
									 if(data.code==-1)
									  $('#systemNoticeXt'+index).append("<font color='red'>"+data.message+"</font>");
								  }
							}
						});
					}
					//还原文件的名字
					$('#file'+index).attr('name','file'+index);//更改文件的nam属性
					//设置时间，避免得到重复值
					time=setInterval(function(){},1000);
				});
			}--%>
			//刷新表格
			 $('#sysdatabase').datagrid('reload');
		}
		clearInterval(time); 
}
//添加系统公告的div
function addDiv(){
var xtContent="<div id='systemNoticeXt"+i+"' style='overflow: hidden;'> <textarea id='xtContent"+i+"' style='width: 582px; height: 116px; border: 1px solid #ccc;' ></textarea> "
+"<a href='#' onclick='removeDiv("+i+");'><img alt='' src='/images/remove1.gif'></a><input id='file"+i+"' name='file"+i+"' type='file' value='选择图片'/>  </div>";
	$('#addUploadId').append(xtContent);
	var arrDiv={};
	arrDiv["systemNoticeXt"+i]="systemNoticeXt"+i;
	arrDiv["xtContent"+i]="xtContent"+i;
	arrDiv["file"+i]="file"+i;
	xt[i]=arrDiv;
	i++;
}
function removeDiv(divID){
	$('#systemNoticeXt'+divID).remove();
	delete xt[divID];
}
function editNotice(){
	var j=$("#sysdatabase").datagrid("getSelected");
	if(!j){
		$.messager.alert("温馨提示","请选择一行数据","info");
		return ;
	}
	var publishType=j.publishType;
	if(publishType==1){
		$('#noticeForm').form('load',{
			"websiteMessage.title":j.title,
			"websiteMessage.mtype":arr[j.mtype],
			"websiteMessage.publishType":j.publishType,
			"websiteMessage.MContent":j.MContent,
			"webId":j.id
		});
		$('#morenContent').val(j.MContent);
		$('#addNotice').dialog('open');
	}
	 else if(publishType==2){
			 $.messager.alert('温馨提示','系统公告不能修改','info');
	 }
}
function deleteNotice(){
	 var data=$('#sysdatabase').datagrid('getSelected');
	 if(!data){
		 $.messager.alert('温馨提示','请选择数据','info');
		 return;
	 }
	 $.messager.confirm('确认对话框','是否删除？',function(r){
		 if(r){
			 $.post('admin/notice/notice!delete.ds',{"id":data.id},function(d){
				 $.messager.alert('温馨提示',d.message,'info');
				 if(d.success)
				 $('#sysdatabase').datagrid('reload');
			 });
		 }
	 });
}
function closeDialog(){
	$('#addNotice').dialog('close');
	resetCash();
}
//恢复参数
function  resetCash(){
	//初始化参数
	$.each(xt,function(index,ele){
		$('#systemNoticeXt'+index).remove();
	});
	$('#systemNoticeUpload').remove();
	xt={};//存储系统公告的的 id  >  div1,div2...
	i=1;
	hasUpload=false;
	hasMorenContent=true;//默认的编辑框
	hasXtContent=false;//默认的编辑框
	resetWebId();
}
function resetWebId(){
	$.post('admin/notice/notice!resetWebId.ds');
}
</script>
});