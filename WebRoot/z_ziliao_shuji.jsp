<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息管理</title>

	<link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<style>
.imgnews-item{position: relative;margin:20px;width:100px;line-height:150px;display:inline;overflow: hidden;}  
.imgnews-item span {  
    background-color: #000;  
    opacity: 0.4;  
    filter: alpha(opacity=40);  
    position: absolute;  
    left: 0;  
    top: 60px;  
    width: 100%;  
    height: 26px;  
    line-height: 26px;  
    overflow: hidden;  
    font-size: 14px;  
    text-align: center;  
}  
.imgnews-item em {  
    position: absolute;  
    left: 0;  
    top: 60px;  
    width: 100%;  
    height: 26px;  
    line-height: 26px;  
    overflow: hidden;  
    font-size: 14px;  
    text-align: center;  
    color:#FFF;font-style: normal;  
} 
</style>
<body style="margin:10px;">

<div style="padding:20px;background:#fff;">
	<div style="font-size:20px;font-weight:bold;margin-bottom:20px;">
		<i class="layui-icon" style="font-size:20px;">&#xe705;</i>&nbsp;文档
		<div style="float:right;">
			<button type="button" class="layui-btn" id="test1" name="file">
				<i class="layui-icon">&#xe67c;</i>上传文档
			</button>
		</div>
	</div>
	<hr>
	<div style="margin:0px 20px 20px 20px;">
		<ul>
		<c:forEach items="${filesList }" var="mem">
			<li class="imgnews-item">
				<a class="dianjidoc" path="${mem.path }" docname="${mem.filename }">
					<c:choose>
						<c:when test="${fn:substringAfter(mem.path,'.') == 'doc' || fn:substringAfter(mem.path,'.') == 'docx' }">
							<img class="img" fid="${mem.fileid }" src="system/images/word.png" style="width:100px;"/>
						</c:when>
						<c:when test="${fn:substringAfter(mem.path,'.') == 'xls' || fn:substringAfter(mem.path,'.') == 'xlsx' }">
							<img class="img" fid="${mem.fileid }" src="system/images/excal.png" style="width:100px;"/>
						</c:when>
						<c:when test="${fn:substringAfter(mem.path,'.') == 'ppt' || fn:substringAfter(mem.path,'.') == 'pptx' }">
							<img class="img" fid="${mem.fileid }" src="system/images/ppt.png" style="width:100px;"/>
						</c:when>
						<c:when test="${fn:substringAfter(mem.path,'.') == 'pdf' }">
							<img class="img" fid="${mem.fileid }" src="system/images/pdf.png" style="width:100px;"/>
						</c:when>
					</c:choose>
					<span></span>
					<em>${mem.filename }</em>
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
</div>

</body>
<script>
layui.use(['upload','layer'], function(){
	var upload = layui.upload;
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
			,content: '<object data="'+path+'" type="application/pdf" width="100%" height="100%" ></object>'
        	,zIndex: layer.zIndex //重点1
			,success: function(layero){
				layer.setTop(layero); //重点2
			}
		});
		layer.full(index);
	};
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
			window.location="filesAction_delete?fileid="+fid+"&type=1";
		});
	}
	//点击展开文件
	$(".dianjidoc").dblclick(function(){
		var docname = $(this).attr("docname");
	    var path = $(this).attr("path");
	    //var path1 = path.substring(1,path.lastIndexOf("."))+".pdf";
	    var path1 = path.substring(1);
	    var ext = path.substring(path.lastIndexOf("."));
	    if(ext == ".pdf"){
	    	open(docname,path1);
	    }else{
	    	alert("抱歉，该文档无法预览，请您移步下载！");
	    }
	});
	
	//阻止浏览器默认右键点击事件
	$(".img").bind("contextmenu", function(){
	    return false;
	});
	//自定义右键
	$(".img").mousedown(function(e) {
	    //console.log(e.which);
	    var fid = $(this).attr("fid");
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
	    }
	});
	
	//执行实例
	upload.render({
		elem: '#test1' //绑定元素
		,multiple: true
		,method: 'post'
		,accept: 'file'
		,exts: 'doc|docx|xls|xlsx|ppt|pptx|pdf'
		,url: 'filesAction_upload?type=1' //上传接口
		,before: function(obj){
			ii = layer.load(1); //上传loading
		}
		,allDone: function(obj){ //当文件全部被提交后，才触发
			console.log(obj.total); //得到总文件数
			console.log(obj.successful); //请求成功的文件数
			console.log(obj.aborted); //请求失败的文件数
			layer.close(ii);
			window.location = "filesAction_shuji?type=1";
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