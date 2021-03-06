<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function() {
    	$("#pro_add_btn").click(function () {
			if(checkEmpty("name", "属性名称")){
				$.ajax({
					url:"${contextPath}/admin_property",
					type:"POST",
					data:$("#addForm").serialize(),
					success:function (resultInfo) {
						location.href = "${contextPath}/admin_property_list?cid=" + resultInfo.data.cid + "&pn=${pageInfo.pages + 1}";
					}
				});
			}
		});
    });
</script>

<title>属性管理</title>


<div class="workingArea">

	<ol class="breadcrumb">
		<li><a href="${contextPath}/admin_category_list">所有分类</a></li>
		<li><a href="${contextPath}/admin_property_list?cid=${c.id}">${c.name}</a></li>
		<li class="active">属性管理</li>
	</ol>



	<div class="listDataTableDiv">
		<table
				class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
			<tr class="success">
				<th>ID</th>
				<th>属性名称</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${pageInfo.list}" var="p">

				<tr>
					<td>${p.id}</td>
					<td>${p.name}</td>
					<td><a href="${contextPath}/admin_property/${p.id}"><span
							class="glyphicon glyphicon-edit"></span></a></td>
					<td>
						<a deleteLink="true" data="${p.id}" url="admin_property" del_name="${p.name}" href="#">
							<span class=" 	glyphicon glyphicon-trash"></span>
						</a>
					</td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp"%>
	</div>

	<div class="panel panel-warning addDiv">
		<div class="panel-heading">新增属性</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="#">
				<table class="addTable">
					<tr>
						<td>属性名称</td>
						<td><input id="name" name="name" type="text"
								   class="form-control"></td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="cid" value="${c.id}">
							<button type="button" id="pro_add_btn" class="btn btn-success">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>
