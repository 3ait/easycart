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


当前线上版本 2016-08-29
Working Copy Root Path: /opt/workspace/easycart
URL: svn://104.237.152.94/trunk/project/huanglu/easycart
Relative URL: ^/trunk/project/huanglu/easycart
Repository Root: svn://104.237.152.94
Repository UUID: 0d46c4f3-84ce-4955-9e19-89c052da1255
Revision: 1280
Node Kind: directory
Schedule: normal
Last Changed Author: leo
Last Changed Rev: 1268
Last Changed Date: 2016-08-29 12:50:11 +1200 (Mon, 29 Aug 2016)

