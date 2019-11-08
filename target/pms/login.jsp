<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("date", new Date()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.3/css/layui.css" />
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://www.layuicdn.com/layer-v3.1.0/layer.js"></script>
</head>
<body>
<div class="layui-row layui-col-space5">
	<div class="layui-col-md4">
		<div class="grid-demo grid-demo-bg1"></div>
	</div>
	<div class="layui-col-md4">
		<div class="grid-demo">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend>用户登录</legend>
				<span style="padding-left: 30px;color: pink;">
					<fmt:formatDate value="${date }" pattern="yyyy年MM月dd日"/>
				</span>
			</fieldset>
			<form>
				<span id="msg" style="margin-left: 18%; color: red"></span>
				<div style="margin-left: -20px;">
					<div class="layui-form-item">
						<label class="layui-form-label">用户名:</label>
						<div class="layui-input-block">
							<input type="text" name="username" id="username" lay-verify="title" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
						<div class="layui-input-block">
							<input type="password" name="password" id="password" lay-verify="title" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="button" id="login"
							class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">立即登录</button>
							<button style="float: right" type="button" id="register"
							class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">没有账号？</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="layui-col-md4">
		<div class="grid-demo grid-demo-bg1"></div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#login").on("click", function() {
			var username = $("#username").val();
			var password = $("#password").val();
			if(!username) {
				$("#msg").html("用户名不能为空！");
				$("#username").focus();
				return false;
			} else {
				if(!password) {
					$("#msg").html("密码不能为空！");
					$("#password").focus();
					return false;
				} else {
					$("#msg").html("");
				}
			}
			$.ajax({
				type: "post", // post或get
				url: "${pageContext.request.contextPath}/user/dologin", // 提交路径
				data: {
					username: username,
					password: password
				},
				success: function(data) {
					console.log(data);
					if (data == true) {
						layer.msg('登录中', {
							icon: 16
							,shade: 0.01
						});
						// 延迟跳转
						window.setTimeout("window.location='${pageContext.request.contextPath}/user/main'",1000); 
					} else {
						layer.tips('用户名或密码错误！', '#login', {
							tips: [2, '#3595CC'],
							time: 2000
						});
					}
				},
				error: function(err) {
					layer.msg('数据异常！');
				}
			})
		});
		$("#register").on("click", function() {
			layer.msg('数据异常！');
		});
	})
</script>
<script>
	// 防止点击页面后退
	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function() {
		history.pushState(null, null, document.URL);
	});
</script>
</body>
</html>