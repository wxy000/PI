<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息管理</title>

	<link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<body style="margin:10px;">
	<div style="padding:20px 0px;background:#fff">
		<div style="padding:0px 40px 10px 40px;">基本资料</div>
		<hr>
		<div style="margin-bottom:10px;padding:20px 40px;width:600px;height:500px;background:#fff;float:left;">
			<form class="layui-form" action="userAction_update" method="post">
				<input type="hidden" name="userId" value="${userInfo.userId }">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名：</label>
					<div class="layui-input-block">
						<input type="text" name="userName" value="${userInfo.userName }" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input layui-disabled" disabled>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名：</label>
					<div class="layui-input-block">
						<input type="text" name="realName" value="${userInfo.realName }" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别：</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男" ${userInfo.sex == "男"?'checked':''}>
						<input type="radio" name="sex" value="女" title="女" ${userInfo.sex == "女"?'checked':''}>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">工作：</label>
					<div class="layui-input-block">
						<select name="work" lay-verify="required">
							<option value=""></option>
							<option value="管理员" ${userInfo.work=='管理员'?"selected='selected'":''}>管理员</option>
							<option value="测试员" ${userInfo.work=='测试员'?"selected='selected'":''}>测试员</option>
							<option value="学生" ${userInfo.work=='学生'?"selected='selected'":''}>学生</option>
							<option value="老师" ${userInfo.work=='老师'?"selected='selected'":''}>老师</option>
							<option value="校长" ${userInfo.work=='校长'?"selected='selected'":''}>校长</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号：</label>
					<div class="layui-input-block">
						<input type="tel" name="phone" value="${userInfo.phone }" lay-verify="required|phone" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱：</label>
					<div class="layui-input-block">
						<input type="text" name="email" value="${userInfo.email }" lay-verify="email" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">座右铭：</label>
					<div class="layui-input-block">
						<textarea name="notes" placeholder="请输入内容" class="layui-textarea">${userInfo.notes }</textarea>
					</div>
				</div>
				<hr>
				<input class="layui-btn" type="submit" value="修改信息" style="margin:10px 0px 0px 200px;">
			</form>
		</div>
		<div style="padding:20px 40px;width:calc(100% - 760px);height:500px;background:#fff;float:right;">
			<div class="layui-upload" style="text-align:center;">
				<span>头像在这里哦</span>
				<div class="layui-upload-list">
					<img class="layui-upload-img" src="${pageContext.request.contextPath }${userInfo.photopath }" id="demo1" style="width:200px;">
				</div>
				<button type="button" class="layui-btn layui-btn-normal" id="test8" name="file">选择文件</button>
				<button type="button" class="layui-btn" id="test9">开始上传</button>
			</div>
		</div>
	</div>
</body>
<script>
layui.use(['form','upload'], function(){
	var form = layui.form
	,upload = layui.upload;
	//选完文件后不自动上传
	upload.render({
		elem: '#test8'
		,method: 'post'
		,accept: 'images'
	    ,url: 'userHeaderupload_uploadHeader'
	    ,auto: false
	    //,multiple: true
	    ,bindAction: '#test9'
	    ,done: function(res){
			window.parent.location.href="homeAction";
		}
		,error: function(){
			window.parent.location.href="homeAction";
		}
	});
});
</script>
</html>