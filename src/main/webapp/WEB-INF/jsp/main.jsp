<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
<meta charset="UTF-8">
<title>权限管理系统</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="${path}/static/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/static/css/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/static/css/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${path}/static/css/plugins/css/AdminLTE.css">
<link rel="stylesheet" href="${path}/static/css/plugins/css/skins/skin-blue.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.3/css/layui.css" />
<script src="${path}/static/js/jquery.js"></script>
<script src="${path}/static/css/bootstrap/js/bootstrap.js"></script>
<script src="${path}/static/css/plugins/js/adminlte.js"></script>
<script src="https://www.layuicdn.com/layer-v3.1.0/layer.js"></script>
<style type="text/css">
.site__title {
	color: #f35626;
	font-family: 微软雅黑;
	background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	-webkit-animation: hue 10s infinite linear;
}
@-webkit-keyframes hue {
	from {
		-webkit-filter: hue-rotate(0deg);
		-moz-filter: hue-rotate(0deg);
	}
	to {
		-webkit-filter: hue-rotate(-360deg);
		-moz-filter: hue-rotate(-360deg);
	}
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<header class="main-header">
		<a href="#" class="logo">
			<span class="logo-lg"><b>权限</b> 管理系统</span>
		</a>
		<nav class="navbar navbar-static-top" role="navigation">
			<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li class="dropdown messages-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-envelope-o"></i>
							<span class="label label-success">4</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">You have 4 messages</li>
							<li>
								<ul class="menu">
									<li>
										<a href="#">
											<div class="pull-left">
												<img src="${path}/static/img/user2-160x160.jpg"
													class="img-circle" alt="User Image">
											</div>
											<h4>
												Support Team
												<small><i class="fa fa-clock-o"></i> 5 mins</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="footer"><a href="#">See All Messages</a></li>
						</ul>
					</li>
					<li class="dropdown notifications-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell-o"></i>
							<span class="label label-warning">10</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">You have 10 notifications</li>
							<li>
								<ul class="menu">
									<li>
										<a href="#">
											<i class="fa fa-users text-aqua"></i>
											5 new members joined today
										</a>
									</li>
								</ul>
							</li>
							<li class="footer"><a href="#">View all</a></li>
						</ul>
					</li>
					<li class="dropdown tasks-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-flag-o"></i>
							<span class="label label-danger">9</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">You have 9 tasks</li>
							<li>
								<ul class="menu">
									<li>
										<a href="#">
											<h3>
												Design some buttons
												<small class="pull-right">20%</small>
											</h3>
											<div class="progress xs">
												<div class="progress-bar progress-bar-aqua"
													style="width: 20%" role="progressbar" aria-valuenow="20"
													aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">20% Complete</span>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</li>
							<li class="footer"><a href="#">View all tasks</a></li>
						</ul>
					</li>
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="${path}/static/img/user2-160x160.jpg"
							class="user-image" alt="User Image">
							<span class="site__title hidden-xs">${sessionScope.user.username }</span>
						</a>
						<ul class="dropdown-menu">
							<li class="user-header">
								<img src="${path}/static/img/user2-160x160.jpg"
								class="img-circle" alt="User Image">
								<p>
									${sessionScope.user.username } &nbsp;[&nbsp;
									<c:forEach items="${roles }" var="c">${c.role_description }&nbsp;</c:forEach>&nbsp;]
									<small>2012年从事本工作</small>
								</p>
							</li>
							<li class="user-body">
								<div class="row">
									<div class="col-xs-4 text-center">
										<a href="#">关注</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">粉丝</a>
									</div>
								</div>
							</li>
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">个人资料</a>
								</div>
								<div class="pull-right">
									<a href="javascript:void(0);" onclick="loginOut()"
										onmouseover="layer.tips('退出登录！', $(this), {tips: [2, '#78BA32']});"
										class="btn btn-default btn-flat">退出系统</a>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<aside class="main-sidebar">
		<section class="sidebar">
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">导航菜单</li>
				<c:forEach items="${menu }" var="c" varStatus="status">
					<li class="${statu.index eq 0 ? 'active' : '' } treeview">
						<a href="${c.menu_url }">
							<i class="fa ${c.menu_icon }"></i>
							<span>${c.menu_name }</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<c:forEach items="${c.submenu }" var="submenu" varStatus="status1">
								<li class="${statu1.index eq 0 ? 'active' : '' }">
									<a href="${path}/${submenu.menu_url }" target="target">
										<i class="fa ${submenu.menu_icon }"></i>${submenu.menu_name }
									</a>
								</li>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
		</section>
	</aside>
	<div class="content-wrapper">
		<section class="content">
			<ol class="breadcrumb" id="nav_title" style="position: static; float: none;">
				<li class="active">
					<i class="fa fa-home" style="font-size: 20px; position: relative; top: 2px; left: -3px;"></i>
					&nbsp; 
					<c:forEach items="${menu }" var="c">
						${c.menu_name }
				</li>
				<li class="active">
					<%-- <c:forEach items="${c.submenu }" var="submenu">
						${submenu.menu_name }
					</c:forEach> --%>
					</c:forEach>
				</li>
			</ol>
			<iframe scrolling="yes" name="target" frameborder="0"
				style="width: 100%; min-height: 600px; overflow: visible; background: #fff;"
				src="${path}/user/list/1"></iframe>
		</section>
	</div>
	<footer class="main-footer">
		<div class="pull-right hidden-xs">版本V1.0</div>
		<strong>版权 &copy; 2019 <a href="#">官君宝</a>.</strong> 版权归属.
	</footer>
	<aside class="control-sidebar control-sidebar-dark">
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active">
				<a href="#control-sidebar-home-tab" data-toggle="tab">
					<i class="fa fa-home"></i>
				</a>
			</li>
			<li>
				<a href="#control-sidebar-settings-tab" data-toggle="tab">
					<i class="fa fa-gears"></i>
				</a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="javascript:;">
							<i class="menu-icon fa fa-birthday-cake bg-red"></i>
							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
								<p>Will be 23 on April 24th</p>
							</div>
						</a>
					</li>
				</ul>
				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="javascript:;">
							<h4 class="control-sidebar-subheading">
								Custom Template Design
								<span class="pull-right-container">
									<span class="label label-danger pull-right">70%</span>
								</span>
							</h4>
							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>
					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input type="checkbox" class="pull-right" checked>
						</label>
						<p>Some information about this general settings option</p>
					</div>
				</form>
			</div>
		</div>
	</aside>
	<div class="control-sidebar-bg"></div>
</div>
<script type="text/javascript">
function loginOut(){
	layer.confirm('您确定要退出吗？', {
		btn: ['确定','取消'] //按钮
	}, function(){
		window.location.href='${path}/user/loginOut';
	}, function(){});
}
</script>
</body>
</html>