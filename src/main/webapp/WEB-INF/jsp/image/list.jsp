<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
<meta charset="UTF-8">
<title>图片列表</title>
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
				<h3 class="box-title">图片列表</h3>
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
						<th>图片ID</th>
						<th>图片名称</th>
						<th>缩略图</th>
						<th style="width:15%">图片类型</th>
						<th style="width:200px">操作</th>
					</tr>
					<c:forEach items="${page.list }" var="c">
						<tr>
							<td>${c.img_id }</td>
							<td>${c.img_name }</td>
							<td><img width="40" height="40" src="${c.img_url }"></td>
							<td>${c.img_type }</td>
							<td>
								<div class="btn-group" style="margin-left: 9px">
									<button type="button" class="btn btn-info look"
										style="margin-right: 3px;" data-toggle="modal" data-target="#show">
										<input type="hidden" value="${c.img_id }">查看
									</button>
									<button type="button" class="btn btn-warning look"
										style="margin-right: 3px" data-toggle="modal" data-target="#update">
										<input type="hidden" value="${c.img_id }">修改
									</button>
									<button type="button" class="btn btn-danger"
										onclick="del(${c.img_id })">删除
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
						<a
						style="
                       	<c:if test="${page.isFirstPage }">
                       		pointer-events: none;border:1px solid #e6e6e6;background-color:#FBFBFB;color:#C9C9C9;
                       		cursor:not-allowed;opacity:1
                       	</c:if>"
						href="${path}/image/list/${page.pageNum-1 }">&laquo;</a>
					</li>
					<li>
						<c:forEach begin="1" step="1" end="${page.pages }" var="c">
							<c:choose>
								<c:when test="${c eq page.pageNum }">
									<a style="color: red; pointer-events: none"
									href="${path}/image/list/${c }">${c }</a>
								</c:when>
								<c:otherwise>
									<a href="${path}/image/list/${c }">${c }</a>
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
						href="${path}/image/list/${page.pageNum+1 }">&raquo;</a>
					</li>
					<li><span style="margin-left: 10px;">共 ${page.total } 条</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 添加图片 -->
<div class="modal fade" id="add">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">新增图片信息</h4>
			</div>
			<div class="modal-body">
				<form id="doadd" enctype="multipart/form-data" class="form-horizontal">
					<div class="form-group">
						<label for="item_id" class="col-sm-2 control-label">商品ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="item_id" placeholder="请输入商品ID">
						</div>
					</div>
					<div class="form-group">
						<label for="img_name" class="col-sm-2 control-label">图片名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="img_name" placeholder="请输入图片名称">
						</div>
					</div>
					<div class="form-group">
						<label for="img_type" class="col-sm-2 control-label">图片类型</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="img_type" placeholder="请设置图片类型">
						</div>
					</div>
					<div class="form-group">
						<label for="img_url" class="col-sm-2 control-label">选择图片</label>
						<div class="col-sm-10">
							<!-- 必须加name属性，不然会报错 -->
							<input style="margin-top: 6px;" type="file" name="myfile">
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
<!-- 查看图片 -->
<div class="modal fade" id="show">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">查看图片信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">图片ID</label>
						<div class="col-sm-10">
							<div class="form-control" id="showImgId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品ID</label>
						<div class="col-sm-10">
							<div class="form-control" id="showItemId"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图片名称</label>
						<div class="col-sm-10">
							<div class="form-control" id="showImgName"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图片地址</label>
						<div class="col-sm-10">
							<div class="form-control" id="showImgUrl"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图片类型</label>
						<div class="col-sm-10">
							<div class="form-control" id="showImgType"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">缩略图</label>
						<div class="col-sm-10" id="showLitimg"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10" id="Large"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 修改图片 -->
<div class="modal fade" id="update">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">更改图片信息</h4>
			</div>
			<div class="modal-body">
				<form id="doupdate" enctype="multipart/form-data" class="form-horizontal">
					<div class="form-group">
						<label for="item_id" class="col-sm-2 control-label">商品ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="item_id" id="updateItemId">
						</div>
					</div>
					<div class="form-group">
						<label for="img_name" class="col-sm-2 control-label">图片名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="img_name" id="updateImgName">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图片地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" readonly="readonly" id="updateImgUrl">
						</div>
					</div>
					<div class="form-group">
						<label for="img_type" class="col-sm-2 control-label">图片类型</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="img_type" id="updateImgType">
						</div>
					</div>
					<div class="form-group">
						<label for="img_url" class="col-sm-2 control-label">更换图片</label>
						<div class="col-sm-10">
							<!-- 必须加name属性，不然会报错 -->
							<input style="margin-top: 6px;" type="file" name="myfile">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" id="updateImgId" name="img_id">
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
			url: "${path}/image/show/" + id,
			success: function(data){
				$("#showImgId").html(data.img_id);
				$("#showItemId").html(data.item_id);
				$("#showImgName").html(data.img_name);
				$("#showImgUrl").html(data.img_url);
				$("#showImgType").html(data.img_type);
				var litimg = '<img style="width: 150px;height: 150px" alt="'+data.img_name+'" src="'+data.img_url+'">';
				$("#showLitimg").html(litimg);
				var Large = '<a href="'+data.img_url+'">查看大图</a>';
				$("#Large").html(Large);
				
				$("#updateImgId").val(data.img_id);
				$("#updateItemId").val(data.item_id);
				$("#updateImgName").val(data.img_name);
				$("#updateImgUrl").val(data.img_url);
				$("#updateImgType").val(data.img_type);
			},
			error: function(err){}
		})
	});
	$("#updateBTN").on("click", function() {
		var formData = new FormData($('#doupdate')[0]);
		$.ajax({
			type: "post",
			url: "${path}/image/doupdate",
			data: formData, // 序列化form表单里面的数据传到后台
			processData: false, // 不指定编码方式（默认指定编码 urlencode）
			contentType: false, // 不处理数据（默认处理数据：name=lxx &age=18）
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
		var formData = new FormData($('#doadd')[0]);
		$.ajax({
			type: "post",
			url: "${path}/image/doadd",
			data: formData, // 序列化form表单里面的数据传到后台
			processData: false, // 不指定编码方式（默认指定编码 urlencode）
			contentType: false, // 不处理数据（默认处理数据：name=lxx &age=18）
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
			url: "${path}/image/del/"+id,
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