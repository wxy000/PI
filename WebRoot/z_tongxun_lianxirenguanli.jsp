<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div style="padding:20px;background:#fff;">
		<div style="font-size:20px;font-weight:bold;margin-bottom:20px;">
			<i class="layui-icon">&#xe613;</i>&nbsp;联系人
		</div>
		<hr>
		<form class="layui-form layui-form-pane" action="friendsAction_selectList" method="post">
			<div class="layui-form-item" style="margin-top:20px;">
				<div class="layui-inline">
					<label class="layui-form-label">姓名：</label>
					<div class="layui-input-block">
						<input type="text" name="friendName" value="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">手机号：</label>
					<div class="layui-input-inline">
						<input type="text" name="friendPhone" value="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<input type="submit" value="查询" class="layui-btn" style="margin-top:-4px;">
				<input type="button" value="添加联系人" class="layui-btn xinxi" data-method="xinxi" style="margin-top:-4px;">
			</div>
		</form>
		<hr>			
		<table class="layui-table" lay-data="{height: 'full-210',page:true}" lay-filter="demo">
			<thead>
				<tr>
					<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
					<th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
					<th lay-data="{field:'friendName', width:120, fixed: true}">联系人姓名</th>
					<th lay-data="{field:'friendPhone', width:120, sort: true}">手机号码</th>
					<th lay-data="{field:'friendCompany', width:200}">供职公司</th>
      				<th lay-data="{field:'friendQq', width:150, sort: true}">QQ</th>
					<th lay-data="{field:'friendEmail', width:200}">Email</th>
					<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
				</tr>
			</thead>
			<c:forEach items="${friendsList }" var="mem">
				<tr>
					<td></td>
					<td>${mem.friendId }</td>
					<td>${mem.friendName }</td>
					<td>${mem.friendPhone }</td>
					<td>${mem.friendCompany }</td>
					<td>${mem.friendQq }</td>
					<td>${mem.friendEmail }</td>
				</tr>
			</c:forEach>
		</table>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		
			
	</div>
</body>
<div id="xinxi1" hidden style="padding: 30px; line-height: 22px; background-color: #393D49; font-weight: 300;">
	<form class="layui-form layui-form-pane" action="friendsAction_souFriend" method="post">
		<input type="text" name="friendId" id="fi" hidden>
		<input type="text" name="userId" value="${userInfo.userId }" hidden>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" name="friendName" id="fn" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号</label>
			<div class="layui-input-block">
				<input type="text" name="friendPhone" id="fp" required  lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">供职公司</label>
			<div class="layui-input-block">
				<input type="text" name="friendCompany" id="fc" placeholder="请输入公司名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">QQ</label>
			<div class="layui-input-block">
				<input type="text" name="friendQq" id="fq" placeholder="请输入QQ号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">Email</label>
			<div class="layui-input-block">
				<input type="text" name="friendEmail" id="fe" lay-verify="email" placeholder="请输入Email" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div style="text-align:center;">
			<input type="submit" value="提交" class="layui-btn">
			<input type="reset" value="取消" class="layui-btn guanbi">
		</div>
	</form>
</div>

<script>
layui.use(['table','layer'], function(){
	var $ = layui.jquery;
	var table = layui.table;
	var layer = layui.layer;
	//监听表格复选框选择
	table.on('checkbox(demo)', function(obj){
		console.log(obj);
	});
	//监听工具条
	table.on('tool(demo)', function(obj){
		var data = obj.data;
		if(obj.event === 'del'){
			layer.confirm('真的删除行么', function(index){
				obj.del();
				layer.close(index);
				window.location = "friendsAction_deleteFriend?friendId="+data.id+"";
			});
		} else if(obj.event === 'edit'){
			$("#fi").val(data.id);
			$("#fn").val(data.friendName);
			$("#fp").val(data.friendPhone);
			$("#fc").val(data.friendCompany);
			$("#fq").val(data.friendQq);
			$("#fe").val(data.friendEmail);
			bianjixinxi.xinxi();
		}
	});
	
	//编辑框弹出层
 	var bianjixinxi = {
		xinxi: function(){
			x = layer.open({
				type: 1
				,title: '编辑信息' //不显示标题栏
				,closeBtn: false
				,shadeClose: true
				,area: '400px;'
				,shade: 0.5
				,id: 'pro11' //设定一个id，防止重复弹出
				//,btn: ['火速围观', '哦，知道了']
				,btnAlign: 'c'
				,moveType: 1 //拖拽模式，0或者1
				,content: $('#xinxi1')
			});
		}
	};
	$('.guanbi').on('click', function(){
		layer.close(x);
	});
 	//弹出层点击事件
 	$('.xinxi').on('click', function(){
		var othis = $(this),
		method = othis.data('method');
		bianjixinxi[method] ? bianjixinxi[method].call(this, othis) : '';
	});
});
</script>

</html>