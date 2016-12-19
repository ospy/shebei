   $(function(){
	   $('.left .item').draggable({
	    	revert:true,
	    	proxy:'clone'
	    });
	    
	    $('.right td.drop').droppable({
	    	onDragEnter:function(){
	    		$(this).addClass('over');
	    	},
	    	onDragLeave:function(){
	    		$(this).removeClass('over');
	    	},
	    	onDrop:function(e,source){
	    		$(this).removeClass('over');
	    		if ($(source).hasClass('assigned')){
	    			$(this).append(source);
	    		} else {
	    			var c = $(source).clone().addClass('assigned');
	    			$(this).empty().append(c);
	    			c.draggable({
	    				revert:true
	    			});
	    		}
	    	}
	    });
   });