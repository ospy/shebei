/**
 * 
 */
$(function(){
	$('.images').viewer(); 
	$('#nav').tree({
		url:'nav.do',
		lines:true,
		onLoadSuccess:function(node,data){
			if(data){
				$(data).each(function(index,value){
					if(this.state=='closed'){
						$('#nav').tree('expandAll');
					}
				});
			}
		},
		onClick:function(node){
			if(node.url){
				if($('#tabs').tabs('exists',node.text)){
					$('#tabs').tabs('select',node.text);
				}else{
					$('#tabs').tabs('add',{
						title:node.text,
						iconCls:node.iconCls,
						closable:true,
						href:node.url+'.jsp',
					});
				}
			}
		}
	});
	
	$('#tabs').tabs({
		fit:true,
		border:false,
	});
});