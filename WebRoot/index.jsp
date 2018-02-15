<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人信息管理</title>
	<link rel="Shortcut Icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="layui-v2.2.5/layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="system/css/index.css">
	<script type="text/javascript" src="system/js/jquery.min.js"></script>
	<script type="text/javascript" src="layui-v2.2.5/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">个人信息管理</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">
			<li class="layui-nav-item"><a href="javascript:;" class="dianji" data-url="s_kongzhitai.jsp" data-id="11" data-title="<i class='layui-icon'>&#xe614;</i>&nbsp;&nbsp;控制台"><i class="layui-icon">&#xe614;</i>&nbsp;&nbsp;控制台</a></li>
			<li class="layui-nav-item"><a href="javascript:;" class="tanchu" data-method="notice"><i class="layui-icon">&#xe645;</i>&nbsp;&nbsp;系统公告<span class="layui-badge-dot"></span></a></li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;"><img src="${pageContext.request.contextPath }${userInfo.photopath }" onerror="this.src='system/images/header/default.jpg';this.onerror=null" class="layui-nav-img">${userInfo.userName }</a>
				<dl class="layui-nav-child">
					<dd><a href="javascript:;" class="dianji" data-url="s_user_jibenziliao.jsp" data-id="12" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe620;</i>&nbsp;&nbsp;基本资料"><i class="layui-icon" style="font-size: 18px;">&#xe620;</i>&nbsp;&nbsp;基本资料</a></dd>
					<dd><a href="javascript:;" class="dianji" data-url="s_user_xiugaimima.jsp" data-id="13" data-title="<i class='layui-icon' style='font-size: 16px;'>&#xe6b2;</i>&nbsp;&nbsp;修改密码"><i class="layui-icon" style="font-size: 16px;">&#xe6b2;</i>&nbsp;&nbsp;修改密码</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="javascript:;" onClick="logout()">登出</a></li>
		</ul>
	</div>
  
	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<!-- 管理员信息      -->
        	<div class="user-info">
        		<div class="photo">
        			<img src="${pageContext.request.contextPath }${userInfo.photopath }" onerror="this.src='system/images/header/default.jpg';this.onerror=null" alt="">
        		</div>
        		<p>${userInfo.userName }您好！欢迎登录</p>
        	</div>
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree">
				<li class="layui-nav-item layui-this"><a href="javascript:;" class="dianji" data-url="mainAction" data-id="0" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe68e;</i>&nbsp;&nbsp;首页"><i class="layui-icon" style="font-size: 18px;">&#xe68e;</i>&nbsp;&nbsp;首页</a></li>
				<li class="layui-nav-item">
					<a href="javascript:;" class="dianji" data-url="calendarAction_list" data-id="21" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe637;</i>&nbsp;&nbsp;日程管理">
						<i class="layui-icon" style="font-size: 18px;">&#xe637;</i>&nbsp;&nbsp;日程管理
						<span class="layui-badge" id="richengshu" style="display:none"></span>
					</a>
				</li>
				<li class="layui-nav-item"><a href="javascript:;" class="dianji" data-url="z_liuyanban.jsp" data-id="22" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe63c;</i>&nbsp;&nbsp;留言板"><i class="layui-icon" style="font-size: 18px;">&#xe63c;</i>&nbsp;&nbsp;留言板</a></li>
				<li class="layui-nav-item">
					<a href="javascript:;"><i class="layui-icon" style="font-size: 17px;">&#xe7a0;</i>&nbsp;&nbsp;资料管理</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;" class="dianji" data-url="filesAction_shuji?type=1" data-id="23" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe705;</i>&nbsp;&nbsp;书籍"><i class="layui-icon" style="font-size: 18px;">&#xe705;</i>&nbsp;&nbsp;书籍</a></dd>
						<dd><a href="javascript:;" class="dianji" data-url="filesAction_yinyue?type=2" data-id="24" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe6fc;</i>&nbsp;&nbsp;音乐"><i class="layui-icon" style="font-size: 18px;">&#xe6fc;</i>&nbsp;&nbsp;音乐</a></dd>
						<dd><a href="javascript:;" class="dianji" data-url="filesAction_shipin?type=3" data-id="25" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe6ed;</i>&nbsp;&nbsp;视频"><i class="layui-icon" style="font-size: 18px;">&#xe6ed;</i>&nbsp;&nbsp;视频</a></dd>
						<dd><a href="javascript:;" class="dianji" data-url="filesAction_zhaopian?type=4" data-id="26" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe64a;</i>&nbsp;&nbsp;照片"><i class="layui-icon" style="font-size: 18px;">&#xe64a;</i>&nbsp;&nbsp;照片</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item">
					<a href="javascript:;"><i class="layui-icon" style="font-size: 17px;">&#xe611;</i>&nbsp;&nbsp;通讯系统</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;" class="dianji" data-url="friendsAction_list" data-id="28" data-title="<i class='layui-icon' style='font-size: 16px;'>&#xe613;</i>&nbsp;联系人管理"><i class="layui-icon" style="font-size: 16px;">&#xe613;</i>&nbsp;联系人管理</a></dd>
						<dd><a href="javascript:;" class="dianji" data-url="z_tongxun_youjianguanli.jsp" data-id="29" data-title="<i class='layui-icon' style='font-size: 18px;'>&#xe609;</i>&nbsp;&nbsp;邮件管理"><i class="layui-icon" style="font-size: 18px;">&#xe609;</i>&nbsp;&nbsp;邮件管理<span class="layui-badge">99+</span></a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
  
	<div class="layui-body">
		<!-- 内容主体区域 -->
		
		<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press" title="折叠（假的，不想做）"><i class="layui-icon">&#xe603;</i></div>
  			<ul class="layui-tab-title">
  				<li class="layui-this" id="admin-home" lay-id="0" fresh=1>
    				<i class="layui-icon xianshi" style="font-size: 18px;">&#xe68e;</i>&nbsp;<em>首页</em>
    			</li>
  			</ul>
  			
  			<div class="title-right">
                <div class="refresh key-press"><i class="layui-icon" style="font-size: 18px;">&#x1002;</i><cite>刷新</cite></div>
                <div class="often key-press">
                   	<ul class="layui-nav">
                       	<li class="layui-nav-item">
                           	<a class="top"><i class="layui-icon" style="font-size: 18px;">&#xe60e;</i><cite>常用操作</cite></a>
                           	<dl class="layui-nav-child">
                               	<dd>
                               		<a class="changyong" data-eName="closeCurrent"><i class="layui-icon" style="font-size: 18px;">&#x1007;</i>关闭当前选项卡</a>
                               	</dd>
                               	<dd>
                                   	<a class="changyong" data-eName="closeOther"><i class="layui-icon" style="font-size: 18px;">&#x1006;</i>关闭其他选项卡</a>
                               	</dd>
                               	<dd>
                                   	<a class="changyong" data-eName="closeAll"><i class="layui-icon" style="font-size: 18px;">&#xe68e;</i>关闭全部选项卡</a>
                               	</dd>
                               	<dd>
                                   	<a class="changyong" data-eName="refreshAdmin"><i class="layui-icon" style="font-size: 18px;">&#x1002;</i>刷新最外层框架</a>
                               	</dd>
                            </dl>
                        </li>
                    </ul>
                </div>                    
            </div>
  			<div style="border-bottom:1px #1AA094 solid;height:40px;background:#fafafa"></div>
  			<div class="layui-tab-content">
    			<div class="layui-tab-item layui-show">
    				<iframe data-frameid="0" frameborder="0" name="content" src="mainAction"></iframe>
    			</div>
  			</div>
		</div>
		
		
	</div>		
		
  
	<div class="layui-footer" style="background:#ccc;">
		<!-- 底部固定区域 -->
		© wxy - 版权所有<div id="time" style="float:right;"></div>
	</div>
</div>
</body>

<script>

//JavaScript代码区域
layui.use(['element','layer'], function(){
	var $ = layui.jquery;
	var element = layui.element;
	var layer = layui.layer;
	//时间
	setInterval(function(){
		var now=(new Date()).toLocaleString();
		$("#time").html(now);
	});
	
    var active = {
    	tabAdd: function (url, id, title) {
        	//新增一个Tab项
            element.tabAdd('demo', {
           		title: title
                , content: '<iframe data-frameid="'+id+'" frameborder="0" name="content" width="100%" src="' + url + '"></iframe>'
                , id: id //实际使用一般是规定好的id，这里以时间戳模拟下
            });
            FrameWH();
        }
        , tabChange: function (id) {
        	//切换到指定Tab项
            element.tabChange('demo', id); //切换到：用户管理
            $("iframe[data-frameid='"+id+"']").attr("src",$("iframe[data-frameid='"+id+"']").attr("src"));//切换后刷新框架
        }
        , tabDelete: function (id) {
        	if(id != "0"){
        		element.tabDelete("demo", id);//删除
        	}
        }
        , tabDeleteAll: function (ids) {//删除所有
        	$.each(ids, function (i,item) {
            	element.tabDelete("demo", item);
            });
        }
    };
    //左侧及上部点击新增tab
    $("a.dianji").click(function () {
    	var dataid = $(this);
        if ($(".layui-tab-title li[lay-id]").length <= 0) {
        	active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
        } else {
            var isData = false;
            $.each($(".layui-tab-title li[lay-id]"), function () {
            	if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                	isData = true;
                }
            });
            if (isData == false) {
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            }
        }
        active.tabChange(dataid.attr("data-id"));
    });
    //监听tab选项卡
    element.on('tab(demo)', function(data){
    	layidy = $(this).attr("lay-id");
    });
    //刷新当前tab
    $(".refresh").click(function(){
    	active.tabChange(layidy);
    });
    //常用操作
    $("a.changyong").click(function(){
    	var changyong = $(this);
    	var caozuo = changyong.attr("data-eName");
    	//console.log(caozuo);
    	if(caozuo == "closeCurrent"){
        	active.tabDelete(layidy);
        }else if(caozuo == "closeOther"){
        	var tabtitle = $(".layui-tab-title li[lay-id]");
            var ids = new Array();
            $.each(tabtitle, function (i) {
            	if($(this).attr("lay-id") != "0" && $(this).attr("lay-id") != layidy){
            		ids[i] = $(this).attr("lay-id");
            	}
                //console.log(ids[i]);
            });
			active.tabDeleteAll(ids);
        }else if(caozuo == "closeAll"){
        	var tabtitle = $(".layui-tab-title li[lay-id]");
            var ids = new Array();
            $.each(tabtitle, function (i) {
            	if($(this).attr("lay-id") != "0"){
            		ids[i] = $(this).attr("lay-id");
            	}
                //console.log(ids[i]);
            });
			active.tabDeleteAll(ids);
        }else if(caozuo == "refreshAdmin"){
        	location.reload();
        }
    });

    function FrameWH(){
    	// iframe窗口自适应
        var $content = $('.layui-tab-content');
        $content.height($(this).height() - 146);
        $content.find('iframe').each(function () {
            $(this).height($content.height());
        });
    }
    
 	// 窗口自适应    
    $(window).on('resize', function () {
    	FrameWH();
    }).resize();
 	
 	//系统公告弹出层
 	var tanchu = {
		notice: function(){
			//示范一个公告层
			layer.open({
				type: 1
				,title: false //不显示标题栏
				,closeBtn: false
				,area: '300px;'
				,shade: 0.8
				,id: 'LAY_layuipro' //设定一个id，防止重复弹出
				,btn: ['火速围观', '哦，知道了']
				,btnAlign: 'c'
				,moveType: 1 //拖拽模式，0或者1
				,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>你不知道（调皮）<br><br>本站源码已上传至GitHub：。。。<br><br>这个项目是《Java Web开发》的课程设计，由于所使用的后端框架SSH以及前端UI框架LayUI是现学现卖的，所以多有不足，后期可能会继续完善。</div>'
				,success: function(layero){
					var btn = layero.find('.layui-layer-btn');
			    	btn.find('.layui-layer-btn0').attr({
			    		href: 'http://www.layui.com/'
			    		,target: '_blank'
			    	});
				}
			});
		}
	};
 	//进入网站自动弹出
 	tanchu.notice();
	//弹出层点击事件
 	$('a.tanchu').on('click', function(){
		var othis = $(this),
		method = othis.data('method');
		tanchu[method] ? tanchu[method].call(this, othis) : '';
	});
	//先隐藏(日程管理的徽章)
	$("#richengshu").hide();
});

function logout(){
	layui.use('layer', function(){
		layer.confirm('亲爱的${userInfo.userName}，你确定要退出?', {icon: 5, title:'提示'}, function(index){
			//do something
			window.location="userAction_logout";
			layer.close(index);
		});
	});
}
//条件符合就显示出来(日程管理的徽章)
function rcs(j){
	if(!(j == '0' || j == '' || j == null)){
		$("#richengshu").show();
	}
}

</script>
</html>