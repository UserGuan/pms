<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
<meta charset="UTF-8">
<title>角色列表</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
<link rel="stylesheet" type="text/css" href="${path}/static/css/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${path}/static/css/font-awesome/css/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="${path}/static/css/plugins/css/AdminLTE.css"/>
<script src="${path}/static/js/jquery.js"></script>
<script src="${path}/static/css/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">角色列表</h3>
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
						<th>角色ID</th>
						<th>角色名称</th>
						<th>角色描述</th>
						<th style="width: 45%">权限列表</th>
						<th style="width: 200px">操作</th>
					</tr>
					<c:forEach items="${page.list }" var="role">
						<tr>
							<td>${role.role_id }</td>
							<td>${role.role_name }</td>
							<td>${role.role_description }</td>
							<td>${role.menuNameList }</td>
							<td>
								<div class="btn-group" style="margin-left: 9px">
									<button type="button" class="btn btn-info look"
										style="margin-right: 3px;" data-toggle="modal" data-target="#show">
										<input type="hidden" value="${role.role_id }">查看
									</button>
									<button type="button" class="btn btn-warning update"
										style="margin-right: 3px" data-toggle="modal" data-target="#update">
										<input type="hidden" value="${role.role_id }">修改
									</button>
									<button type="button" class="btn btn-danger" onclick="del(${role.role_id })">删除</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="box-footer clearfix">
				<ul class="pagination pagination-sm no-margin pull-right">
					<li>
					<a style="
                       	<c:if test="${page.isFirstPage }">
                       		pointer-events: none;border:1px solid #e6e6e6;background-color:#FBFBFB;color:#C9C9C9;
                       		cursor:not-allowed;opacity:1
                       	</c:if>"
						href="${path}/role/list/${page.pageNum-1 }">&laquo;</a>
					</li>
					<li>
						<c:forEach begin="1" step="1" end="${page.pages }" var="c">
							<c:choose>
								<c:when test="${c eq page.pageNum }">
									<a style="color: red; pointer-events: none"
									href="${path}/role/list/${c }">${c }</a>
								</c:when>
								<c:otherwise>
									<a href="${path}/role/list/${c }">${c }</a>
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
						href="${path}/role/list/${page.pageNum+1 }">&raquo;</a>
					</li>
					<li><span style="margin-left: 10px;">共 ${page.total } 条</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 添加角色 -->
<div class="modal fade" id="add">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">新增角色信息</h4>
			</div>
			<div class="modal-body">
				<form id="doadd" class="form-horizontal">
					<div class="form-group">
						<label for="role_name" class="col-sm-2 control-label">角色名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="role_name" id="role_name" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="role_description" class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="role_description" id="role_description" placeholder="请设置角色">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_name" class="col-sm-2 control-label">权限列表</label>
						<div class="col-sm-10">
							<c:forEach items="${menus }" var="menu">
								<li style="list-style-type:none;">
									<input type="checkbox" value="${menu.menu_id }" 
										<c:if test="${menu.menu_id eq 1}">checked='checked'</c:if>
										<c:if test="${menu.menu_id eq 2}">checked='checked'</c:if>
										name="menuid"> ${menu.menu_name }
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
<!-- 查看角色 -->
<div class="modal fade" id="show">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">查看角色信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">角色ID</label>
						<div class="col-sm-10">
							<div class="form-control" id="showId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名称</label>
						<div class="col-sm-10">
							<div class="form-control" id="showName"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-10">
							<div class="form-control" id="showDescription"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">权限列表</label>
						<div class="col-sm-10">
							<div class="form-control" id="showMenuName"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">权限ID</label>
						<div class="col-sm-10">
							<div class="form-control" id="showMenuId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">父级ID</label>
						<div class="col-sm-10">
							<div class="form-control" id="showMenuParentId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">权限状态</label>
						<div class="col-sm-10">
							<span style="color: red;">1为可用,0为不可用</span>
							<div class="form-control" id="showMenuFlag"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 修改角色 -->
<div class="modal fade" id="update">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">更改角色信息</h4>
			</div>
			<div class="modal-body">
				<form id="doupdate" class="form-horizontal">
					<div class="form-group">
						<label for="role_name" class="col-sm-2 control-label">角色名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="role_name" id="updateName">
						</div>
					</div>
					<div class="form-group">
						<label for="role_description" class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="role_description" id="updateDescription">
						</div>
					</div>
					<div class="form-group">
						<label for="menuid" class="col-sm-2 control-label">权限列表</label>
						<div class="col-sm-10" id="updateMenuList"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" id="updateId" name="role_id">
							<button type="button" id="updateBTN" class="btn btn-default">立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$(".look").on("click", function() {
		var id = $(this).find("input").val();
		$.ajax({
			type: "post",
			url: "${path}/role/show/" + id,
			success: function(data){
				$("#showId").html(data.role_id);
				$("#showName").html(data.role_name);
				$("#showDescription").html(data.role_description);
				$("#showMenuName").html(data.menuNameList);
				$("#showMenuId").html(data.menuId);
				$("#showMenuParentId").html(data.parentId);
				$("#showMenuFlag").html(data.menuFlag);
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
				url: "${path}/role/load/"+id,
				dataType: "json", // 指定后台传来的数据是json格式
				success: function(data){
					$("#updateId").val(data.role.role_id);
					$("#updateName").val(data.role.role_name);
					$("#updateDescription").val(data.role.role_description);
					var inload = "";
					var notinload = "";
					data.menu.forEach(function(item, i) {
						notinload += '<span class="checkbox"><label><input type="checkbox" name="menuid" value="'+item.menu_id+'">'+item.menu_name+'</label></span>';
					})
					data.role.menus.forEach(function(item, i) {
						inload += '<span class="checkbox"><label><input type="checkbox" name="menuid" value="'+item.menu_id+'" checked>'+item.menu_name+'</label></span>';
					})
					$("#updateMenuList").html(inload + notinload);
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
			url: "${path}/role/doupdate",
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
			url: "${path}/role/doadd",
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
			url: "${path}/role/del/"+id,
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