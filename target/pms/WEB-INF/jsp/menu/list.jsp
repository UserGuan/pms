<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
<meta charset="UTF-8">
<title>权限列表</title>
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
				<h3 class="box-title">权限列表</h3>
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
						<th>权限ID</th>
						<th>权限名称</th>
						<th>父级ID</th>
						<th>权限图标</th>
						<th>权限地址</th>
						<th>权限状态</th>
						<th style="width: 200px">操作</th>
					</tr>
					<c:forEach items="${page.list }" var="menu">
						<tr>
							<td>${menu.menu_id }</td>
							<td>${menu.menu_name }</td>
							<td>${menu.parent_id }</td>
							<td>${menu.menu_icon }</td>
							<td>${menu.menu_url }</td>
							<td>
								<c:if test="${menu.menu_flag eq 1}">可用</c:if>
								<c:if test="${menu.menu_flag eq 0}">不可用</c:if>
							</td>
							<td>
								<div class="btn-group" style="margin-left: 9px">
									<button type="button" class="btn btn-info look"
										style="margin-right: 3px;" data-toggle="modal" data-target="#show">
										<input type="hidden" value="${menu.menu_id }">查看
									</button>
									<button type="button" class="btn btn-warning look"
										style="margin-right: 3px" data-toggle="modal" data-target="#update">
										<input type="hidden" value="${menu.menu_id }">修改
									</button>
									<button type="button" class="btn btn-danger"
										onclick="del(${menu.menu_id })">删除
									</button>
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
						href="${path}/menu/list/${page.pageNum-1 }">&laquo;</a>
					</li>
					<li>
						<c:forEach begin="1" step="1" end="${page.pages }" var="c">
							<c:choose>
								<c:when test="${c eq page.pageNum }">
									<a style="color: red; pointer-events: none"
										href="${path}/menu/list/${c }">${c }</a>
								</c:when>
								<c:otherwise>
									<a href="${path}/menu/list/${c }">${c }</a>
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
						href="${path}/menu/list/${page.pageNum+1 }">&raquo;</a>
					</li>
					<li><span style="margin-left: 10px;">共 ${page.total } 条</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 添加权限 -->
<div class="modal fade" id="add">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">新增权限信息</h4>
			</div>
			<div class="modal-body">
				<form id="doadd" class="form-horizontal">
					<div class="form-group">
						<label for="menu_name" class="col-sm-2 control-label">权限名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menu_name" id="menu_name" placeholder="请输入权限名称">
						</div>
					</div>
					<div class="form-group">
						<label for="parent_id" class="col-sm-2 control-label">父级ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="parent_id" id="parent_id" placeholder="请输入父级ID">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_icon" class="col-sm-2 control-label">权限图标</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menu_icon" id="menu_icon" placeholder="请输入权限图标">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_url" class="col-sm-2 control-label">权限地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menu_url" id="menu_url" placeholder="请输入权限地址">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_flag" class="col-sm-2 control-label">权限状态</label>
						<div class="col-sm-10">
							<span style="color: red;">1为可用,0为不可用</span>
							<input type="text" class="form-control" name="menu_flag" id="menu_flag" placeholder="请输入权限状态">
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
<!-- 查看权限 -->
<div class="modal fade" id="show">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">查看权限信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">权限ID</label>
						<div class="col-sm-9">
							<div class="form-control" id="showId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">权限名称</label>
						<div class="col-sm-9">
							<div class="form-control"  id="showName"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">父级ID</label>
						<div class="col-sm-9">
							<div class="form-control" id="showPid"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">权限图标</label>
						<div class="col-sm-9">
							<div class="form-control" id="showIcon"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">权限地址</label>
						<div class="col-sm-9">
							<div class="form-control" id="showUrl"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">权限状态</label>
						<div class="col-sm-9">
							<span style="color: red;">1为可用,0为不可用</span>
							<div class="form-control" id="showFlag"></div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">子级ID</label>
						<div class="col-sm-9">
							<div class="form-control" id="showSubId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">子级权限名称</label>
						<div class="col-sm-9">
							<div class="form-control"  id="showSubName"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">子级权限图标</label>
						<div class="col-sm-9">
							<div class="form-control" id="showSubIcon"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">子级权限地址</label>
						<div class="col-sm-9">
							<div class="form-control" id="showSubUrl"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">子级权限状态</label>
						<div class="col-sm-9">
							<span style="color: red;">1为可用,0为不可用</span>
							<div class="form-control" id="showSubFlag"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 修改权限 -->
<div class="modal fade" id="update">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">更改权限信息</h4>
			</div>
			<div class="modal-body">
				<form id="doupdate" class="form-horizontal">
					<div class="form-group">
						<label for="menu_name" class="col-sm-2 control-label">权限名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menu_name" id="updateName">
						</div>
					</div>
					<div class="form-group">
						<label for="parent_id" class="col-sm-2 control-label">父级ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="parent_id" id="updatePid">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_icon" class="col-sm-2 control-label">权限图标</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menu_icon" id="updateIcon">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_url" class="col-sm-2 control-label">权限地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="menu_url" id="updateUrl">
						</div>
					</div>
					<div class="form-group">
						<label for="menu_flag" class="col-sm-2 control-label">权限状态</label>
						<div class="col-sm-10">
							<span style="color: red;">1为可用,0为不可用</span>
							<input type="text" class="form-control" name="menu_flag" id="updateFlag">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" id="updateId" name="menu_id">
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
			url: "${path}/menu/show/" + id,
			success: function(data){
				$("#showId").html(data.menu_id);
				$("#showName").html(data.menu_name);
				$("#showPid").html(data.parent_id);
				$("#showIcon").html(data.menu_icon);
				$("#showUrl").html(data.menu_url);
				$("#showFlag").html(data.menu_flag);
				var subid = "";
				var subname = "";
				var subpid = "";
				var subicon = "";
				var suburl = "";
				var subflag = "";
				for(var i = 0; i < data.submenu.length; i++){
					subid += " [" + data.submenu[i].menu_id + "] ";
					subname += " [" + data.submenu[i].menu_name + "] ";
					subicon += " [" + data.submenu[i].menu_icon + "] ";
					suburl += " [" + data.submenu[i].menu_url + "] ";
					subflag += " [" + data.submenu[i].menu_flag + "] ";
				}
				if(data.submenu != 0){
					$("#showSubId").html(subid);
					$("#showSubName").html(subname);
					$("#showSubIcon").html(subicon);
					$("#showSubUrl").html(suburl);
					$("#showSubFlag").html(subflag);
				}else{
					$("#showSubId").html("无");
					$("#showSubName").html("无");
					$("#showSubIcon").html("无");
					$("#showSubUrl").html("无");
					$("#showSubFlag").html("无");
				}
				
				$("#updateId").val(data.menu_id);
				$("#updateName").val(data.menu_name);
				$("#updatePid").val(data.parent_id);
				$("#updateIcon").val(data.menu_icon);
				$("#updateUrl").val(data.menu_url);
				$("#updateFlag").val(data.menu_flag);
			},
			error: function(err){}
		})
	});
	$("#updateBTN").on("click", function() {
		$.ajax({
			type: "post",
			url: "${path}/menu/doupdate",
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
			url: "${path}/menu/doadd",
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
			url: "${path}/menu/del/"+id,
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