$(function(){
    
        $('#fileImport').filebox({    
    	validType : ['fileSize[1024,"kb"]' ],  
    	accept : [ 'image/jpg', 'image/bmp', 'image/jpeg', 'image/gif', 'image/png' ],
    	buttonText: '选择文件', 
//        buttonAlign: 'left' 
        prompt:'请选择一个图片类型的文件...',
        required:true,
        onChange : function(e) {
        	document.getElementById('uploadInfo').innerHTML = "<span style='color:Red'></span>";
        	}
    });
    
    //导入文件
    
    fileupload={
    		 importFileClick :function (){
    			 var rows = $('#shebei').datagrid('getSelected');
    			 if(rows){
    				 if($('#importFileForm').form('validate')){
        				 //获取上传文件控件内容
         		        var file = $("#fileImport").filebox('getValue');
         		        //判断控件中是否存在文件内容，如果不存在，弹出提示信息，阻止进一步操作
         		        if (file == null || file == "") {  
         		        	$.messager.alert("提示","请选择图片文件");  
         		        	return; 
         		        }
         		        //获取文件名称
         		        var fileName = file;
//         		        var fileName = file.name;
         		        //获取文件类型名称
         		        var file_typename = fileName.substring(fileName.lastIndexOf('.'), fileName.length);
         		        //这里限定上传文件文件类型必须为.xlsx，如果文件类型不符，提示错误信息
         		        if (file_typename == '.bmp'||file_typename == '.jpg'||file_typename == '.jpeg'||file_typename == '.png')
         		        {
         		            //获取form数据
         		            var formData = new FormData($("#importFileForm")[0]);
         		            //调用apicontroller后台action方法，将form数据传递给后台处理。contentType必须设置为false,否则chrome和firefox不兼容
         		            $.ajax({
         		                url: "FileUpload.do?sbid="+rows.id,
         		                type: 'POST',
         		                data: formData,
         		                async: false,
         		                cache: false,
         		                contentType: false,
         		                processData: false,
         		                success: function (returnInfo) {
         		                    //上传成功后将控件内容清空，并显示上传成功信息
         		                    document.getElementById('fileImport').value = null;
         		                    document.getElementById('uploadInfo').innerHTML = "<span style='color:Red'>" + returnInfo + "</span>";
         		                    $('#images').load('ShebeiImage.do',{
										method:'getImage',
										sbid:row.id,
									});
         		                    // $.getScript("js/viewer.js",function(){
						 				 // $('#images').viewer();
						 			// });
         		                },
         		                error: function (returnInfo) {
         		                    //上传失败时显示上传失败信息
         		                    document.getElementById('uploadInfo').innerHTML = "<span style='color:Red'>" + returnInfo + "</span>";
         		                }
         		            });
         		        }
         		        else {
         		        	$.messager.alert("提示","文件类型错误，只能上传图片文件。");
         		            //将错误信息显示在前端label文本中
//         		            document.getElementById('fileName').innerHTML = "<span style='color:Red'>错误提示:上传文件应该是图片文件，后缀而不应该是" + file_typename + ",请重新选择文件</span>"
         		        }
        			 }else{
        				 $.messager.alert("提示","请选择图片文件，且大小不能超过5M");  return;
        			 }
    			 }else{
    				 $.messager.alert('提示','请先选择要添加图片的设备！','info'); 
    			 }
    			 
    		       
    		    }
    };
    
   
});




$.extend($.fn.validatebox.defaults.rules, {  
    // filebox验证文件大小的规则函数  
    // 如：validType : ['fileSize[1,"MB"]']  
    fileSize : {  
        validator : function(value, array) {  
            var size = array[0];  
            var unit = array[1];  
            if (!size || isNaN(size) || size == 0) {  
                $.error('验证文件大小的值不能为 "' + size + '"');  
            } else if (!unit) {  
                $.error('请指定验证文件大小的单位');  
            }  
            var index = -1;  
            var unitArr = new Array("bytes", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb");  
            for (var i = 0; i < unitArr.length; i++) {  
                if (unitArr[i] == unit.toLowerCase()) {  
                    index = i;  
                    break;  
                }  
            }  
            if (index == -1) {  
                $.error('请指定正确的验证文件大小的单位：["bytes", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"]');  
            }  
            // 转换为bytes公式  
            var formula = 1;  
            while (index > 0) {  
                formula = formula * 1024;  
                index--;  
            }  
            // this为页面上能看到文件名称的文本框，而非真实的file  
            // $(this).next()是file元素  
            return $(this).next().get(0).files[0].size < parseFloat(size) * formula;  
        },  
        message : '文件大小必须小于 {0}{1}'  
    }  
});  