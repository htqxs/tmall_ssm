﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function() {
       /* $("#addForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
// 			if (!checkEmpty("subTitle", "小标题"))
// 				return false;
            if (!checkNumber("originalPrice", "原价格"))
                return false;
            if (!checkNumber("promotePrice", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });*/
        
        
        $("#pdt_add_btn").click(function () {
			if(checkEmpty("name", "产品名称")
					&& checkNumber("originalPrice", "原价格")
					&& checkEmpty("promotePrice", "优惠价格")
					&& checkEmpty("stock", "库存")){
				$.ajax({
					url:"${contextPath}/admin_product",
					type:"POST",
					data:$("#addForm").serialize(),
					success:function (resultInfo) {
						if(resultInfo.flag){
							location.href = "${contextPath}/admin_product_list?cid="
									+ resultInfo.data.cid + "&pn=" + ${pageInfo.pages + 1};
						}else{
							alert(resultInfo.msg);
						}
					}
				});
			}
		});
    });
</script>

<title>产品管理</title>


<div class="workingArea">

	<ol class="breadcrumb">
		<li><a href="${contextPath}/admin_category_list">所有分类</a></li>
		<li><a href="${contextPath}/admin_product_list?cid=${c.id}">${c.name}</a></li>
		<li class="active">产品管理</li>
	</ol>



	<div class="listDataTableDiv">
		<table
				class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
			<tr class="success">
				<th>ID</th>
				<th>图片</th>
				<th>产品名称</th>
				<th>产品小标题</th>
				<th width="53px">原价格</th>
				<th width="80px">优惠价格</th>
				<th width="80px">库存数量</th>
				<th width="80px">图片管理</th>
				<th width="80px">设置属性</th>
				<th width="42px">编辑</th>
				<th width="42px">删除</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${pageInfo.list}" var="p">
				<tr>
					<td>${p.id}</td>
					<td>
						<c:if test="${!empty p.firstProductImage}">
							<img width="40px" src="img/productSingle/${p.firstProductImage.id}.jpg">
						</c:if>
					</td>
					<td>${p.name}</td>
					<td>${p.subTitle}</td>
					<td>${p.originalPrice}</td>
					<td>${p.promotePrice}</td>
					<td>${p.stock}</td>
					<td><a href="${contextPath}/admin_productImage_list?pid=${p.id}"><span
							class="glyphicon glyphicon-picture"></span></a></td>
					<td><a href="${contextPath}/admin_propertyValue/${p.id}"><span
							class="glyphicon glyphicon-th-list"></span></a></td>

					<td><a href="${contextPath}/admin_product/${p.id}"><span
							class="glyphicon glyphicon-edit"></span></a></td>
					<td>
						<a deleteLink="true" url="admin_product" data="${p.id}" del_name="${p.name}" href="#">
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
		<div class="panel-heading">新增产品</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="#">
				<table class="addTable">
					<tr>
						<td>产品名称</td>
						<td><input id="name" name="name" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>产品小标题</td>
						<td><input id="subTitle" name="subTitle" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>原价格</td>
						<td><input id="originalPrice" value="99.98" name="originalPrice" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>优惠价格</td>
						<td><input id="promotePrice"  value="19.98" name="promotePrice" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>库存</td>
						<td><input id="stock"  value="99" name="stock" type="text"
								   class="form-control"></td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="cid" value="${c.id}">
							<button type="button" id="pdt_add_btn" class="btn btn-success">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>
