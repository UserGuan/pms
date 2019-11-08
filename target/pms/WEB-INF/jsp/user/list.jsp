<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="${path}/static/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/static/css/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/static/css/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${path}/static/css/plugins/css/AdminLTE.css">
<link rel="stylesheet" href="${path}/static/css/plugins/css/skins/skin-blue.min.css">
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">用户列表</h3>
				<div class="box-tools">
					<button type="button" class="btn btn-block btn-success btn-flat"
						data-toggle="modal" data-target="#add">
						<i class="fa fa-plus"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered">
					<tr>
						<th>用户ID</th>
						<th>用户名</th>
						<th>手机号码</th>
						<th>昵称</th>
						<th>邮箱</th>
						<th>角色列表</th>
						<th style="width: 200px">操作</th>
					</tr>
					<c:forEach items="${page.list }" var="u">
						<tr>
							<td>${u.id }</td>
							<td>${u.username }</td>
							<td>${u.phone }</td>
							<td>${u.nickname }</td>
							<td>${u.email }</td>
							<td>${u.descList }</td>
							<td>
								<div class="btn-group" style="margin-left: 9px">
									<button type="button" class="btn btn-info look"
										style="margin-right: 3px;" data-toggle="modal" data-target="#show">
										<input type="hidden" value="${u.id }">查看
									</button>
									<button type="button" class="btn btn-warning update"
										style="margin-right: 3px" data-toggle="modal" data-target="#update">
										<input type="hidden" value="${u.id }">修改
									</button>
									<button type="button" class="btn btn-danger" onclick="del(${u.id })">删除</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="box-footer clearfix">
				<ul class="pagination pagination-sm no-margin pull-right">
					<li>
						<a
						style="
                       	<c:if test="${page.isFirstPage }">
                       		pointer-events: none;border:1px solid #e6e6e6;background-color:#FBFBFB;color:#C9C9C9;
                       		cursor:not-allowed;opacity:1
                       	</c:if>"
						href="${path}/user/list/${page.pageNum-1 }">&laquo;</a>
					</li>
					<li>
						<c:forEach begin="1" step="1" end="${page.pages }" var="c">
							<c:choose>
								<c:when test="${c eq page.pageNum }">
									<a style="color: red; pointer-events: none"
									href="${path}/user/list/${c }">${c }</a>
								</c:when>
								<c:otherwise>
									<a href="${path}/user/list/${c }">${c }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</li>
					<li>
						<a style="padding-left: 15px;
                       	<c:if test="${page.isLastPage }">
                       		pointer-events: none;border:1px solid #e6e6e6;background-color:#FBFBFB;
                       		color:#C9C9C9;cursor:not-allowed;opacity:1
                       	</c:if>; text-decoration: none;"
						href="${path}/user/list/${page.pageNum+1 }">&raquo;</a>
					</li>
					<li><span style="margin-left: 10px;">共 ${page.total } 条</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 查看用户 -->
<div class="modal fade" id="show">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">查看用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户ID</label>
						<div class="col-sm-10">
							<div class="form-control" id="showId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<div class="form-control" id="showUsername"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<div class="form-control" id="showPassword"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<div class="form-control" id="showPhone"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-10">
							<div class="form-control" id="showNickname"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<div class="form-control" id="showEmail"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色列表</label>
						<div class="col-sm-10">
							<div class="form-control" id="showRoleName"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-10">
							<div class="form-control" id="showDescList"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 添加用户 -->
<div class="modal fade" id="add">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">新增用户信息</h4>
			</div>
			<div class="modal-body">
				<form id="doadd" class="form-horizontal">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" name="username" class="form-control" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" name="password" class="form-control" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" name="phone" class="form-control" placeholder="请输入手机号">
						</div>
					</div>
					<div class="form-group">
						<label for="nickname" class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-10">
							<input type="text" name="nickname" class="form-control" placeholder="请输入昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="text" name="email" class="form-control" placeholder="请输入邮箱">
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1" class="col-sm-2 control-label">角色列表</label>
						<div class="col-sm-10">
							<c:forEach items="${role}" var="c">
								<li style="list-style-type:none;">
									<input type="checkbox" ${c.role_id eq 3 ? "checked='\"checked\"'" : '' } 
									name="roleid" value="${c.role_id}"/> ${c.role_description}
								</li>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" id="addBTN" class="btn btn-default">立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 修改用户 -->
<div class="modal fade" id="update">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">更改用户信息</h4>
			</div>
			<div class="modal-body">
				<form id="doupdate" class="form-horizontal">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" name="username" id="updateUsername" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="text" name="password" id="updatePassword" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" name="phone" id="updatePhone" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="nickname" class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-10">
							<input type="text" name="nickname" id="updateNickname" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="text" name="email" id="updateEmail" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="roleid" class="col-sm-2 control-label">角色列表</label>
						<div class="col-sm-10" id="updateRoleList"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" name="id" id="updateId">
							<button type="button" id="updateBTN" class="btn btn-default">立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${path}/static/js/jquery.js"></script>
<script src="${path}/static/css/bootstrap/js/bootstrap.js"></script>
<script src="${path}/static/css/plugins/js/adminlte.js"></script>
<script type="text/javascript">
$(function() { // 当页面载入完毕后执行
	$(".look").on("click", function() {
	var id = $(this).find("input").val(); // 得到设置在input的id值
		$.ajax({
			type: "post",
			url: "${path}/user/show/"+id,
			dataType: "json", // 指定后台传来的数据是json格式
			success: function(data){
				$("#showId").html(data.id);
				$("#showUsername").html(data.username);
				$("#showPassword").html(data.password);
				$("#showPhone").html(data.phone);
				$("#showNickname").html(data.nickname);
				$("#showEmail").html(data.email);
				$("#showRoleName").html(data.roleName);
				$("#showDescList").html(data.descList);
			},
			error: function(err){
				alert("数据异常！");
				break;
			}
		})
	});
	$(".update").on("click", function() {
	var id = $(this).find("input").val(); // 得到设置在input的id值
		$.ajax({
			type: "post",
			url: "${path}/user/load/"+id,
			dataType: "json", // 指定后台传来的数据是json格式
			success: function(data){
				$("#updateId").val(data.user.id);
				$("#updateUsername").val(data.user.username);
				$("#updatePassword").val(data.user.password);
				$("#updatePhone").val(data.user.phone);
				$("#updateNickname").val(data.user.nickname);
				$("#updateEmail").val(data.user.email);
				var inload = "";
				var notinload = "";
				data.user.roles.forEach(function(item, i) {
					inload += '<span class="checkbox"><label><input type="checkbox" name="roleid" value="'+item.role_id+'" checked>'+item.role_description+'</label></span>';
				})
				data.role.forEach(function(item, i) {
					notinload += '<span class="checkbox"><label><input type="checkbox" name="roleid" value="'+item.role_id+'">'+item.role_description+'</label></span>';
				})
				$("#updateRoleList").html(inload + notinload);
			},
			error: function(err){
				alert("数据异常！");
				break;
			}
		})
	});
	$("#updateBTN").on("click", function() {
		$.ajax({
			type: "post",
			url: "${path}/user/doupdate",
			data: $("#doupdate").serialize(), // 得到form表单里面的数据
			dataType: "json", // 指定后台传过来的数据是json格式
			success: function(data){
				if(data == true){
					alert("修改成功！");
					location.reload();
				}else{
					alert("修改失败！");
					location.reload();
				}
			},
			error: function(err){
				alert("数据异常！");
				break;
			}
		})
	});
	$("#addBTN").on("click", function() {
		$.ajax({
			type: "post",
			url: "${path}/user/doadd",
			data: $("#doadd").serialize(), // 得到form表单里面的数据
			dataType: "json", // 指定后台传过来的数据是json格式
			success: function(data){
				if(data == true){
					alert("添加成功！");
					location.reload();
				}else{
					alert("添加失败！");
					location.reload();
				}
			},
			error: function(err){
				alert("数据异常！");
				break;
			}
		})
	});
})
function del(id) {
    if (confirm("您确定要删除吗？")) {
    	$.ajax({
			type: "post",
			url: "${path}/user/del/"+id,
			dataType: "json", // 指定后台传过来的数据是json格式
			success: function(data){
				if(data == true){
					alert("删除成功！");
					location.reload();
				}else{
					alert("删除失败！");
					location.reload();
				}
			},
			error: function(err){
				alert("数据异常！");
				break;
			}
		})
    }
}
</script>
</body>
</html>