<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息管理</title>

	<link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href='fullcalendar-3.8.2/fullcalendar.css' />
	<link rel="stylesheet" type="text/css" href='fullcalendar-3.8.2/fullcalendar.print.min.css' media='print' />
	<script type="text/javascript" src='fullcalendar-3.8.2/lib/moment.min.js'></script>
	<script type="text/javascript" src='fullcalendar-3.8.2/lib/jquery.min.js'></script>
	<script type="text/javascript" src='fullcalendar-3.8.2/lunar.js'></script>
	<script type="text/javascript" src='fullcalendar-3.8.2/fullcalendar.js'></script>
	<script type="text/javascript" src='fullcalendar-3.8.2/locale-all.js'></script>
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<!-- 当前时间 -->
<jsp:useBean id="nowDate" class="java.util.Date"/>
<body style="margin:10px;">

<div style="padding:20px;background:#fff;">
	<div style="font-size:20px;font-weight:bold;margin-bottom:20px;">
		<i class="layui-icon" style="font-size:20px;">&#xe637;</i>&nbsp;日程管理
		<div style="float:right;">
			<button type="button" class="layui-btn xinxi" data-method="xinxi">
				<i class="layui-icon">&#xe654;</i>新增日程
			</button>
		</div>
	</div>
	<hr>
	
	<div id='calendar'></div>
	
</div>

</body>
<div id="xinxi1" hidden style="padding: 30px; line-height: 22px; background-color: #ccc; font-weight: 300;">
	<form class="layui-form layui-form-pane" action="calendarAction_souCalendar" method="post">
		<input type="text" name="calendarid" id="ci" hidden>
		<input type="text" name="userId" value="${userInfo.userId }" id="uid" hidden>
		<div class="layui-form-item">
			<label class="layui-form-label">开始时间</label>
			<div class="layui-input-block">
				<input type="text" name="start_time" class="layui-input" id="start_time" placeholder="开始时间(修改时间)" required  lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">结束时间</label>
			<div class="layui-input-block">
				<input type="text" name="end_time" class="layui-input" id="end_time" placeholder="结束时间(修改时间)" required  lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="calendartitle" id="ct" placeholder="请输入标题" required  lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<textarea name="calendarcontent" id="cc" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
		<div style="text-align:center;">
			<input type="submit" value="提交" class="layui-btn dengdai">
			<input type="button" value="删除" class="layui-btn guanbi" id="yinc">
			<input type="reset" value="取消" class="layui-btn guanbi">
		</div>
	</form>
</div>
<div id="richengliebiao" style="padding: 30px; line-height: 22px; background-color: #ccc; color: #000; font-weight: 300;" hidden>
	<c:forEach items="${calendarList }" var="c">
		<fmt:parseDate var="someDate" value="${c.start_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
		<c:set var="interval" value="${someDate.time - nowDate.time}"/>
		<c:if test="${interval >= 0 && interval <= 1000*60*60*24*2 }">
			<div class="divx">
				<span class="layui-badge-dot"></span>
				<b>&nbsp;&nbsp;${c.start_time }</b>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${c.calendartitle }</p>
			</div>
		</c:if>
	</c:forEach>
</div>
<script>
layui.use(['layer','laydate'], function(){
	var $ = layui.jquery;
	var layer = layui.layer;
	var laydate = layui.laydate;
    var nowTime = "2099-12-31 23:59:59";
    var max = null;
    //日期选择
    var start = laydate.render({
        elem: '#start_time',
        calendar: true,
        type: 'datetime',
        max: nowTime,
        theme: 'molv',
        btns: ['clear', 'confirm'],
        done: function(value, date){
            endMax = end.config.max;
            end.config.min = date;
            end.config.min.month = date.month -1;
        }
    });
    var end = laydate.render({
        elem: '#end_time',
        calendar: true,
        type: 'datetime',
        max: nowTime,
        theme: 'molv',
        done: function(value, date){
            if($.trim(value) == ''){
                var curDate = new Date();
                date = {'date': curDate.getDate(), 'month': curDate.getMonth()+1, 'year': curDate.getFullYear()};
            }
            start.config.max = date;
            start.config.max.month = date.month -1;
        }
    });
	
	//编辑框弹出层
 	var richengliebiao = {
		list: function(){
			layer.open({
				type: 1
				,title: '接下来要完成的事务&nbsp;&nbsp;<span class="layui-badge">要记得哦</span>' //不显示标题栏
				,closeBtn: false
				,shadeClose: false
				,area: '300px;'
				,shade: 0
				,id: 'pro111' //设定一个id，防止重复弹出
				,btn: ['确定']
				,btnAlign: 'c'
				,moveType: 1 //拖拽模式，0或者1
				,content: $('#richengliebiao')
			});
		}
	};
	//自动弹出(如果有最近两天的事务，则弹出提示)
	var div = document.getElementsByTagName('div');
	for(var i = 0; i < div.length; i++){
		if(div[i].className=='divx'){
			richengliebiao.list();
			break;
		}
	}
	//获取最近两天事务总数
	var j = 0;
	for(var i = 0; i < div.length; i++){
		if(div[i].className=='divx'){
			j++;
		}
	}
	//赋值给父页面
	$('#richengshu', window.parent.document).html(j);
	window.parent.rcs(j);
    
	//编辑框弹出层
 	var bianjixinxi = {
		xinxi: function(){
			x = layer.open({
				type: 1
				,title: '编辑日程信息' //不显示标题栏
				,closeBtn: false
				,shadeClose: true
				,area: '400px;'
				,shade: 0.3
				,id: 'pro11' //设定一个id，防止重复弹出
				//,btn: ['火速围观', '哦，知道了']
				//,btnAlign: 'c'
				,moveType: 1 //拖拽模式，0或者1
				,content: $('#xinxi1')
			});
		}
	};
	
	$('.guanbi').on('click', function(){
		layer.close(x);
	});
	$(".dengdai").on('click',function(){
		if($("#start_time").val() != "" && $("#end_time").val() != "" && $("#ct").val() != ""){
			layer.load(1);
		}
	});
 	//弹出层点击事件
 	$('button.xinxi').on('click', function(){
 		$("#ci").val("");
 		$("#start_time").val("");
 		$("#end_time").val("");
 		$("#ct").val("");
 		$("#cc").val("");
 		$("#yinc").hide();
		var othis = $(this),
		method = othis.data('method');
		bianjixinxi[method] ? bianjixinxi[method].call(this, othis) : '';
	});
 	
 	//中文
	var initialLocaleCode = 'zh-cn';
	var params = [];
	<c:forEach items="${calendarList}" var="c">  
		params.push({"id":"${c.calendarid}","title":"${c.calendartitle}","start":"${c.start_time}","end":"${c.end_time}","content":"${c.calendarcontent}"});
	</c:forEach>

    $('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay,listMonth'
		},
		//defaultDate: '2018-02-12',
		locale: initialLocaleCode,
		//buttonIcons: false, // show the prev/next text
		//weekNumbers: true,
		navLinks: true, // can click day/week names to navigate views
		selectable: false,
		selectHelper: true,
		eventClick: function (event) {
			$("#ci").val(event.id);
			$("#uid").val("${userInfo.userId}");
			$("#start_time").val($.fullCalendar.formatDate(event.start, "YYYY-MM-DD HH:mm:ss"));
	 		$("#end_time").val($.fullCalendar.formatDate(event.end, "YYYY-MM-DD HH:mm:ss"));
	 		$("#ct").val(event.title);
	 		$("#cc").val(event.content);
	 		$("#yinc").show();
	 		$("#yinc").on('click',function(){
	 			$('#calendar').fullCalendar('removeEvents', event.id);
	 			window.location = "calendarAction_delete?calendarid="+event.id;
	 		});
			bianjixinxi.xinxi();
		},
		editable: false,
		eventLimit: true, // allow "more" link when too many events
		events: params
	});
});
</script>
</html>