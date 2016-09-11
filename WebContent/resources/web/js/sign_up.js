/*<![CDATA[*/


$(function() {
	//	注册验证框
	document.getElementById("rpiSend").onclick = function() {
		if(sendCode("register_")){
			time(this,wait1);
		}
	};
	document.getElementById("find_rpiSend").onclick = function() {
		if(sendCode("retrieve_")){
			time(this,wait2);
		}
	};
	var wait1 = 60;
	var wait2 = 60;
	function time (btn,wait) {
		if (wait == 0) {
			btn.removeAttribute("disabled");
			btn.value = "获取验证码";
			wait = 60;
		} else{
			btn.setAttribute("disabled",true);
			btn.value = "重新发送("+ wait +") ";
			wait--;
			setTimeout(function  () {
				time(btn,wait)
			},1000)
		}
	}

	//注册&登陆切换
	$("#rpway1").click(function() {
		$("#rpw1").css("display", "block");
		$("#rpway1").css("color", "#C05100").css("border-bottom-color", "#C05100");
		$("#rpw2").css("display", "none");
		$("#rpway2").css("color", "#626262").css("border-bottom-color", "#E6E6E6");
	});
	$("#rpway2").click(function() {
		$("#rpw2").css("display", "block");
		$("#rpway2").css("color", "#C05100").css("border-bottom-color", "#C05100");
		$("#rpw1").css("display", "none");
		$("#rpway1").css("color", "#626262").css("border-bottom-color", "#E6E6E6");
	});
	
//	找回密码
	$("#forgotP").click(function  () {
		$("#rpw1").css("display", "none"); 
		$("#rpw2").css("display", "none");
//		$(".knowP").css("display", "none");
		$("#rpw3").css("display", "block");
		$(".LoginLabel").css("display", "none");
		$(".findPLabel").css("display", "block");
	})
	$("#backLogin").click(function  () {
		$("#rpw1").css("display", "block"); 
//		$("#rpw2").css("display", "none");
		$("#rpw3").css("display", "none");
		$(".LoginLabel").css("display", "block");
		$(".findPLabel").css("display", "none");
	})
	
	//输入框
	/*
	 * */
	$(".rpiLabel").click(function() {
		$(this).children(".rpiInput").css("height", "30px");
		$(this).children(".rpiInput")[0].focus();
	});
	//输入框
	$(".countrySelect").change(function() {
		$(this).parent().next(".rpiInput").css("height", "30px");
		$(this).parent().next(".rpiInput").focus();
	});

	
	$("#loginBtn").click(function(){
		$("#loginForm").submit();
	});
	
});


/*]]>*/
