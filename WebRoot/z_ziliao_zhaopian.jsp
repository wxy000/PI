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
		<i class="layui-icon" style="font-size:22px;">&#xe60d;</i>&nbsp;图片
		<div style="float:right;">
			<button type="button" class="layui-btn" id="test1" name="file">
				<i class="layui-icon">&#xe67c;</i>上传图片
			</button>
		</div>
	</div>
	<hr>
	<center>
	<div class="layui-carousel" id="test10">
		<div carousel-item="">
		<c:forEach items="${filesList }" var="mem">
			<div><img src="${pageContext.request.contextPath }${mem.path }" style="width:100%;height:100%;"></div>
		</c:forEach>
		</div>
	</div>
	</center>
	<hr>
	<div class="site-demo-flow" id="LAY_demo3" style="margin-top:20px;">
	<c:forEach items="${filesList }" var="mem">
		<img class="img" t="${mem.filename }" fid="${mem.fileid }" lay-src="${pageContext.request.contextPath }${mem.path }" style="width:24%;margin-top:5px;" title="单击查看大图">
	</c:forEach>
	</div>
</div>
</body>

<script>
layui.use(['flow','carousel','upload','layer'], function(){
	var flow = layui.flow;
	var carousel = layui.carousel;
	var upload = layui.upload;
	var $ = layui.jquery
	var layer = layui.layer;

	//图片轮播
	carousel.render({
		elem: '#test10'
		,width: '600px'
		,height: '240px'
		,interval: 5000
	});
	//按屏加载图片
	flow.lazyimg({
		elem: '#LAY_demo3 img'
	});

	//执行实例
	upload.render({
		elem: '#test1' //绑定元素
		,multiple: true
		,method: 'post'
		,accept: 'images'
		,url: '' //上传接口
		//filesAction_upload?type=4
		,before: function(obj){
			ii = layer.load(1); //上传loading
		}
		,allDone: function(obj){ //当文件全部被提交后，才触发
			console.log(obj.total); //得到总文件数
			console.log(obj.successful); //请求成功的文件数
			console.log(obj.aborted); //请求失败的文件数
			layer.close(ii);
			window.location = "filesAction_zhaopian?type=4";
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

	//右键事件
	function youjian(x,y,fid){
		layer.open({
			type: 1
			,title: false //不显示标题栏
			,closeBtn: false
			,area: '100px;'
			,shade: 0
			,offset: [y, x]
			//,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			//,btn: ['火速围观', '哦，知道了']
			//,btnAlign: 'c'
			,moveType: 1 //拖拽模式，0或者1
			,content: '<div style="padding: 0px;"><button id="xiazai" class="guan layui-btn layui-btn-fluid"><i class="layui-icon">&#xe601;</i>&nbsp;下载</button><br><button id="shanchu" class="guan layui-btn layui-btn-fluid layui-btn-danger"><i class="layui-icon">&#xe640;</i>&nbsp;删除</button></div>'
		});
		$('.guan').on('click',function(){
			layer.closeAll();
		});
		$('#xiazai').on('click',function(){
			window.location="filesDownload?fileid="+fid;
		});
		$('#shanchu').on('click',function(){
			window.location="";
			//filesAction_delete?fileid="+fid+"&type=4
		});
	}

	//查看大图
	function open(t,path){
		var index = layer.open({
			type: 1
			,title: t
			,area: ['390px', '260px']
			,shade: 0
			,maxmin: true
			,content: '<img src="'+path+'" style="width:100%;height:100%"/>'
        	,zIndex: layer.zIndex //重点1
			,success: function(layero){
				layer.setTop(layero); //重点2
			}
		});
		layer.full(index);
	};

	//阻止浏览器默认右键点击事件
	$(".img").bind("contextmenu", function(){
	    return false;
	});
	//自定义右键
	$(".img").mousedown(function(e) {
	    //console.log(e.which);
	    var fid = $(this).attr("fid");
	    var tt = $(this).attr("t");
	    var sss = $(this).attr("src");
	    //右键为3
	    if (3 == e.which) {
	    	//var e = event || window.event;
	        //var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
	        //var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
	        //var x = e.pageX || e.clientX + scrollX;
	        //var y = e.pageY || e.clientY + scrollY;
	        //alert('x: ' + x + '\ny: ' + y);
	        layer.closeAll();
	        youjian(e.clientX, e.clientY, fid);
	    } else if (1 == e.which) {
	        //左键为1
	    	layer.closeAll();
	        open(tt,sss);
	    }
	});

});
</script>
</html>
