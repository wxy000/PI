<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息管理</title>

	<link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="system/css/mplayer.css">
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<body style="margin:10px;">
	<div style="padding:20px;background:#fff;">
		<div style="font-size:20px;font-weight:bold;margin-bottom:20px;">
			<i class="layui-icon" style="font-size:20px;">&#xe6fc;</i>&nbsp;音乐
			<div style="float:right;">
				<button type="button" class="layui-btn" id="test1" name="file">
					<i class="layui-icon">&#xe67c;</i>上传音乐
				</button>
			</div>
		</div>
		<hr>
		<table class="layui-table" lay-data="{height: 'full-210',page:true}" lay-filter="demo">
			<thead>
				<tr>
					<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
					<th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
					<th lay-data="{field:'filename', width:120, fixed: true}">歌名</th>
					<th lay-data="{field:'singer', width:120, sort: true}">歌手</th>
					<th lay-data="{field:'author', width:200}">专辑</th>
      				<th lay-data="{field:'time', width:150, sort: true}">时长</th>
					<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>
				</tr>
			</thead>
			<c:forEach items="${filesList }" var="mem">
				<tr>
					<td></td>
					<td>${mem.fileid }</td>
					<td>${mem.filename }</td>
					<td>${mem.singer }</td>
					<td>${mem.author }</td>
					<td>${mem.time}</td>
				</tr>
			</c:forEach>
		</table>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="download">下载</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		<hr>
		<div style="padding:20px 10px;font-size:20px;font-weight:bold">
			<i class="layui-icon" style="font-size: 25px; color: red;">&#xe65c;</i>&nbsp;&nbsp;点击此处可以播放哦
		</div>
	</div>

<div class="mp">
	<div class="mp-box">
		<img src="system/images/mplayer_error.png" alt="music cover" class="mp-cover">
		<div class="mp-info">
			<p class="mp-name"></p>
			<p class="mp-singer"></p>
			<p><span class="mp-time-current">00:00</span>/<span class="mp-time-all">00:00</span></p>
		</div>
		<div class="mp-btn">
			<button class="mp-prev" title="上一首"></button>
			<button class="mp-pause" title="播放"></button>
			<button class="mp-next" title="下一首"></button>
			<button class="mp-mode" title="播放模式"></button>
			<div class="mp-vol">
				<button class="mp-vol-img" title="静音"></button>
				<div class="mp-vol-range" data-range_min="0" data-range_max="100" data-cur_min="80">
					<div class="mp-vol-current"></div>
					<div class="mp-vol-circle"></div>
				</div>
			</div>
		</div>
		<div class="mp-pro">
			<div class="mp-pro-current"></div>
		</div>
		<div class="mp-menu">
			<button class="mp-list-toggle"></button>
			<button class="mp-lrc-toggle"></button>
		</div>
	</div>
	<button class="mp-toggle">
		<span class="mp-toggle-img"></span>
	</button>
	<div class="mp-lrc-box">
		<ul class="mp-lrc"></ul>
	</div>
	<button class="mp-lrc-close"></button>
	<div class="mp-list-box">
		<ul class="mp-list-title"></ul>
		<table class="mp-list-table">
			<thead>
				<tr>
					<th>歌名</th>
					<th>歌手</th>
					<th>时长</th>
				</tr>
			</thead>
			<tbody class="mp-list"></tbody>
		</table>
	</div>
</div>

</body>
<script>
var path = "${pageContext.request.contextPath }";
var f1 = new Array();  
var f2 = new Array();  
var f3 = new Array();  
var f4 = new Array();  
<c:forEach items="${filesList}" var="t">  
	f1.push("${t.filename}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	f2.push("${t.singer}");
	f3.push(secondToDate(${t.time}));
	f4.push("${t.path}");
</c:forEach>

function secondToDate(result) {
    //var h = Math.floor(result / 3600) < 10 ? '0'+Math.floor(result / 3600) : Math.floor(result / 3600);
    var m = Math.floor((result / 60 % 60)) < 10 ? '0' + Math.floor((result / 60 % 60)) : Math.floor((result / 60 % 60));
    var s = Math.floor((result % 60)) < 10 ? '0' + Math.floor((result % 60)) : Math.floor((result % 60));
    return result = m + ":" + s;
}
</script>
<script src="system/js/jquery.min.js"></script>
<script src="system/js/mplayer.js"></script>
<script src="system/js/mplayer-list.js"></script>
<script src="system/js/mplayer-functions.js"></script>
<script src="system/js/jquery.nstSlider.min.js"></script>
<script src="system/js/mbofang.js"></script>
<script>
layui.use(['table','upload','layer'], function(){
	var upload = layui.upload;
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
				window.location = "filesAction_delete?fileid="+data.id+"&type=2";
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
		,accept: 'audio'
		,url: 'filesAction_upload?type=2' //上传接口
		,before: function(obj){
			ii = layer.load(1); //上传loading
		}
		,allDone: function(obj){ //当文件全部被提交后，才触发
			console.log(obj.total); //得到总文件数
			console.log(obj.successful); //请求成功的文件数
			console.log(obj.aborted); //请求失败的文件数
			layer.close(ii);
			window.location = "filesAction_yinyue?type=2";
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