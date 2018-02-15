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
	<div style="padding:20px 0px;background:#fff">
		<div style="padding:0px 40px 10px 40px;font-size:18px;">亲爱的${userInfo.userName }，你需要完成以下步骤：</div>
		<hr>
		<div style="padding:20px 40px;">
			<form class="layui-form" action="userAction_xiugaimima" method="post" onSubmit="return yanzhen1()">
				<input type="hidden" name="userId" value="${userInfo.userId }">
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码：</label>
					<div class="layui-input-block">
						<input type="password" id="password1" name="password1" required  lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码：</label>
					<div class="layui-input-block">
						<input type="password" id="password2" name="password2" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">再次输入新密码：</label>
					<div class="layui-input-block">
						<input type="password" id="password3" name="password3" required lay-verify="required" placeholder="再次输入新密码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<hr>
				<input class="layui-btn" type="submit" value="确认修改" style="margin:10px 0px 0px 200px;">
			</form>
		</div>
	</div>
</body>
<script>
layui.use('form', function(){
	var form = layui.form;
	var layer = layui.layer;
	
	if("${mimacuowu}" != null && "${mimacuowu}" != ""){
		layer.alert('${mimacuowu}', {icon: 5});
	}
	if("${mimawujie}" != null && "${mimawujie}" != ""){
		layer.alert('${mimawujie}', {icon: 5});
	}
	
	if("${mimadui}" != null && "${mimadui}" != ""){
		layer.msg('${mimadui}<br>3秒后重新登陆', {
			icon: 1,
			time: 3000 //3秒关闭（如果不配置，默认是3秒）
		}, function(){
			window.parent.location.href="userAction_logout";
		});
	}
});

function yanzhen1(){
	var p2 = $("#password2").val();
	var p3 = $("#password3").val();
	if(p2 != p3){
		layui.use('layer', function(){
    		var layer = layui.layer;
        	layer.msg("请重新输入新密码！");
    	});
		return false;
	}else{
		return true;
	}
}
</script>
</html>