svn://104.237.152.94/trunk/project/huanglu/easycart
yaoliang 123456

设置tomcat/conf/web.xml不显示Jsession
<session-config>
    <session-timeout>30</session-timeout>
	<tracking-mode>COOKIE</tracking-mode>
</session-config>


AJAX调试方法
/**
*	添加到购物车
**/
function addToCart(productId){
    $.ajax({
        url:[[@{/}]]+ "cart/ajax/addToProduct",
        method:"post",
        data:{
            'host':host,
            'userName':userName,
            'password':password,
            'to':to,
            'subject':subject,
            'text':text,
        },
        
        error: function(XMLHttpRequest, textStatus, errorThrown) {  
        	//#3这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus); // paser error;
        },
    
    }).done(function(ret){
       /*  $.each(ret,function(i,n){
			alert(n.productNum);
    	}); */
    	$("#productInCartNum").html("("+ret.length+")");
    })
	
}

//
<script th:inline="javascript">
       	/*<![CDATA[*/
           	
		/*]]>*/
</script>
