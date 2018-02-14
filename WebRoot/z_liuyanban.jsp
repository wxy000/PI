<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息管理</title>

	<link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<script type="text/javascript" src="system/js/jquery.min.js"></script>
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<body style="margin:10px;">
<div style="padding:20px;background:#fff;">
	<div style="font-size:20px;font-weight:bold;margin-bottom:20px;">
		<i class="layui-icon" style="font-size:20px;">&#xe63c;</i>&nbsp;<span id="lyb">留言板</span>
	</div>
	<hr>
	<div>
		<textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
		<br>
		<button class="layui-btn">发表</button>
    </div>
    <hr>
    <div class="ly" style="border:1px #ccc solid;padding:20px;">
    	<img src="${pageContext.request.contextPath }${userInfo.photopath }" onerror="this.src='system/images/header/default.jpg';this.onerror=null" class="layui-nav-img">
    	<span style="color:red;">${userInfo.userName }</span>
    	<p style="padding-top:10px;padding-left:50px;">留言测试。留言测试。留言测试。留言测试。留言测试。</p>
    </div>
    <div class="ly" style="border:1px #ccc solid;padding:20px;">
    	<img src="${pageContext.request.contextPath }${userInfo.photopath }" onerror="this.src='system/images/header/default.jpg';this.onerror=null" class="layui-nav-img">
    	<span style="color:red;">${userInfo.userName }</span>
    	<p style="padding-top:10px;padding-left:50px;">留言测试。留言测试。留言测试。留言测试。留言测试。</p>
    </div>
    <div class="ly" style="border:1px #ccc solid;padding:20px;">
    	<img src="${pageContext.request.contextPath }${userInfo.photopath }" onerror="this.src='system/images/header/default.jpg';this.onerror=null" class="layui-nav-img">
    	<span style="color:red;">${userInfo.userName }</span>
    	<p style="padding-top:10px;padding-left:50px;">留言测试。留言测试。留言测试。留言测试。留言测试。</p>
    </div>
</div>
</body>
<script>
$(function(){
	var div = document.getElementsByTagName('div');
	var j = 0;
	for(var i = 0; i < div.length; i++){
		if(div[i].className=='ly'){
			j++;
		}
	}
	$("#lyb").html("留言板("+j+")");
});
</script>
</html>