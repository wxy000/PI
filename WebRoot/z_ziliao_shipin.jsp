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
		<i class="layui-icon" style="font-size:20px;">&#xe6ed;</i>&nbsp;视频
		<div style="float:right;">
			<button type="button" class="layui-btn" id="test1" name="file">
				<i class="layui-icon">&#xe67c;</i>上传视频
			</button>
		</div>
	</div>
	<hr>
	<table class="layui-table" lay-data="{height: 'full-130',page:true}" lay-filter="demo">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
				<th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
				<th lay-data="{field:'filename', width:120, fixed: true}">视频名称</th>
    			<th lay-data="{field:'time', width:150, sort: true}">时长</th>
    			<th lay-data="{field:'path', width:250}">位置</th>
				<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>
			</tr>
		</thead>
		<c:forEach items="${filesList }" var="mem">
			<tr>
				<td></td>
				<td>${mem.fileid }</td>
				<td>${mem.filename }</td>
				<td>${mem.time}</td>
				<td>${mem.path }</td>
			</tr>
		</c:forEach>
	</table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" data-method="setTop">播放</a>
		<a class="layui-btn layui-btn-xs" lay-event="download">下载</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
</div>

</body>

<script>
layui.use(['table','upload','layer'], function(){
	var upload = layui.upload;
	var table = layui.table;
	var $ = layui.jquery
	var layer = layui.layer;

	//触发事件
	function open(t,path){
		var index = layer.open({
			type: 1
			,title: t
			,area: ['390px', '260px']
			,shade: 0
			,maxmin: true
			,content: '<video autoplay src="'+path+'" controls style="width:100%;height:calc(100% - 5px)"></video>'
        	,zIndex: layer.zIndex //重点1
			,success: function(layero){
				layer.setTop(layero); //重点2
			}
		});
		layer.full(index);
	};

	//监听工具条
	table.on('tool(demo)', function(obj){
		var data = obj.data;
		if(obj.event === 'detail'){
			var path = data.path.substring(1);
			layer.closeAll();
			open(data.filename,path);
		} else if(obj.event === 'del'){
			layer.confirm('真的删除行么', function(index){
				obj.del();
				layer.close(index);
				window.location = "";
				//filesAction_delete?fileid="+data.id+"&type=3
			});
		} else if(obj.event === 'download'){
			window.location = "filesDownload?fileid="+data.id;
		}
	});
	//执行实例
	upload.render({
		elem: '#test1' //绑定元素
		,multiple: true
		,method: 'post'
		,accept: 'video'
		,exts: 'mp4'
		,url: '' //上传接口
		//filesAction_upload?type=3
		,before: function(obj){
			ii = layer.load(1); //上传loading
		}
		,allDone: function(obj){ //当文件全部被提交后，才触发
			console.log(obj.total); //得到总文件数
			console.log(obj.successful); //请求成功的文件数
			console.log(obj.aborted); //请求失败的文件数
			layer.close(ii);
			window.location = "filesAction_shipin?type=3";
		}
		,done: function(res){
    		//上传完毕回调
    		console.log(res);
		}
		,error: function(){
			//请求异常回调
			console.log("aaa");
		}
	});

});
</script>
</html>
