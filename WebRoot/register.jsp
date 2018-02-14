<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<style>
		html,body {width: 100%; height: 100%; margin: 0; padding: 0; overflow: hidden;}
		.container{width: 100%; height: 100%; margin: 0; padding: 0;}
		.code{background-image:url(code.jpg);font-family:Arial;font-style:italic;color:blue;border:0;padding:2px 3px;letter-spacing:3px;font-weight:bolder;font-size:16px;}  
	</style>
	<meta charset="UTF-8">
	<title>个人信息管理</title>

	<link rel="Shortcut Icon" href="favicon.ico" />
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="system/css/login.css" media="all">
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
	<script type="text/javascript" src="system/js/jquery.min.js"></script>
	<script type="text/javascript" src="system/js/snow.js"></script>
</head>
<body onload="createCode()">
<div class="container" id="jsi-snow-container"></div>
<div class="layui-layout layui-layout-login">
	<form class="layui-form" action="userAction_register" method="post" onSubmit="return code1()">
		<h1>
			 <strong>个人信息管理-注册</strong>
			 <em>Management System</em>
		</h1>
		<div class="layui-user-icon larry-login">
			<input type="text" id="userName" name="userName" required lay-verify="required" placeholder="用户名" class="login_txtbx"/>
		</div>
		<div class="layui-pwd-icon larry-login">
			<input type="password" id="password" name="password" required lay-verify="required" placeholder="密码" class="login_txtbx"/>
		</div>
		<div class="layui-email-icon larry-login">
			<input type="text" id="email" name="email" required lay-verify="required|email" placeholder="邮箱" class="login_txtbx"/>
		</div>
		<div style="width:97px;padding-left:25px;padding-top:12px;float: right;">
    		<a onClick="createCode()"><span id="register_code" title="看不清，换一张"></span></a>
    	</div>
	    <div class="layui-val-icon larry-login">
    		<input type="text" id="code" name="code" placeholder="验证码" maxlength="6" class="login_txtbx">
	    </div>
	    <div class="layui-submit larry-login">
	    	<input type="submit" value="注册" class="submit_btn"/>
	    </div>
	    <div class="layui-login-text" style="margin-top: 15px;">
			<a>忘记密码？</a>
			<a href="login.jsp" style="float: right;">已有账号？</a>
	    </div>
	    <div class="layui-login-text">
	    	<p>© 2017-2018 wxy 版权所有</p>
	        <p>浙ICP <a href="http://www.zstu.edu.cn" target="_blank" title="">浙江理工大学</a></p>
	    </div>
	</form>
</div>
<script>
/****************生成验证码*******************/
var code;
function createCode(){
    code="";
    var codeLength=5; //验证码的长度
    var checkCode=document.getElementById("register_code");
    var codeChars=new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
    for(var i=0;i<codeLength;i++){
        var charNum=Math.floor(Math.random()*52);
        code+=codeChars[charNum];
    }
    if(checkCode){
        checkCode.className="code";
        checkCode.innerHTML=code;
    }
}
//验证
function code1(){
	var inputName=document.getElementById("userName").value;
	var inputPwd=document.getElementById("password").value;
	var inputEmail=document.getElementById("email").value;
	var inputCode=document.getElementById("code").value;
    if(inputCode.length<=0){
    	layui.use('layer', function(){
    		var layer = layui.layer;
        	layer.msg("请输入验证码！");
    	});
    	return false;
    }else if(inputCode.toUpperCase()!=code.toUpperCase()){
        createCode();
        layui.use('layer', function(){
    		var layer = layui.layer;
        	layer.msg("验证码输入有误！");
    	});
        return false;
    }else{
    	return true;
    }
}

$(function(){
	if("${regisfaild}" != null && "${regisfaild}" != ""){
		layui.use('layer', function(){
			var layer = layui.layer;
			layer.msg("${regisfaild}");
		});
	}
	if("${regissuccess}" != null && "${regissuccess}" != ""){
		layui.use('layer', function(){
			layer.confirm('${regissuccess}<br>现在跳回登录?', {icon: 3, title:'提示'}, function(index){
				//do something
				window.location="login.jsp";
				layer.close(index);
			});
		});
	}
});

</script>
</body>
</html>