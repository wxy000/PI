<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="system/css/main.css" media="all">
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<body style="margin:10px;">

<div style="padding:20px;background:#fff;">
	<div style="height:200px;">
		<div class="yuanjiao">
			<div style="font-size:18px;">日程管理</div><br>
			<div style="font-weight:bold;color:blue;">${calendarSum }</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">留言板</div><br>
			<div style="font-weight:bold;color:blue;">12</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">联系人管理</div><br>
			<div style="font-weight:bold;color:blue;">${friendsSum }</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">邮件管理</div><br>
			<div style="font-weight:bold;color:blue;">12</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">书籍</div><br>
			<div style="font-weight:bold;color:blue;">${filesSum1 }</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">音乐</div><br>
			<div style="font-weight:bold;color:blue;">${filesSum2 }</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">视频</div><br>
			<div style="font-weight:bold;color:blue;">${filesSum3 }</div>
		</div>
		<div class="yuanjiao">
			<div style="font-size:18px;">图片</div><br>
			<div style="font-weight:bold;color:blue;">${filesSum4 }</div>
		</div>
	</div>
	<hr>
	<ul class="layui-timeline">
		<li class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis">&#xe756;</i>
			<div class="layui-timeline-content layui-text">
				<h3 class="layui-timeline-title">2月14日</h3>
				<p>
					终于，在除夕之前，我完成了课程设计。同时，我也学到了很多。
					<br>不枉这十几天的废寝忘食。
					<br>虽然它只是课设作业，虽然它最初的作用只是为了拿到学分，但在这其中汲取的营养，是无法用学分来衡量的&nbsp;<i class="layui-icon">&#xe650;</i>
				</p>
			</div>
		</li>
		<li class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
			<div class="layui-timeline-content layui-text">
				<h3 class="layui-timeline-title">1月26日</h3>
				<p>
					纠结了一天之后，终于确定了主题，那就做个“个人管理”吧
					<br>于是，大致将需要做的功能列了出来<img src="system/images/main/liebiao.png">
					<br>接下来，输出知识的时候到了&nbsp;<i class="layui-icon">&#xe6c6;</i>
				</p>
			</div>
		</li>
		<li class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
			<div class="layui-timeline-content layui-text">
				<h3 class="layui-timeline-title">1月25日</h3>
				<p>
					经过十来天的学习，已经基本掌握了书中所讲内容
					<br>接下来就是选择课设主题了
				</p>
			</div>
		</li>
		<li class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
			<div class="layui-timeline-content layui-text">
				<h3 class="layui-timeline-title">1月15日</h3>
				<p>
					我买的<em>《SSH框架整合实践教程》</em>回来了
					<br>我计划先把知识学到了，再做课设不迟
				</p>
			</div>
		</li>
		<li class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
			<div class="layui-timeline-content layui-text">
				<h3 class="layui-timeline-title">1月13日</h3>
				<p>
					回到家的第二天
					<br>翻出老师布置的作业
					<br>确定了用ssh框架
					<br>于是我又在想，选什么主题好呢？
				</p>
			</div>
		</li>
		<li class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
			<div class="layui-timeline-content layui-text">
				<div class="layui-timeline-title">过去</div>
			</div>
		</li>
	</ul>
</div>

</body>
</html>