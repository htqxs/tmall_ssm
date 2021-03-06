<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>编辑分类</title>

<script>
    $(function(){
        $("#update_btn").click(function () {
            if(checkEmpty("name","分类名称")){
                $.ajax({
                    url:"${contextPath}/admin_category_update",
                    data:new FormData($("#editForm")[0]),
                    type:"POST",
                    cache : false,
                    processData : false,// 不处理数据
                    contentType : false, // 不设置内容类型
                    success:function (resultInfo) {
                        if(resultInfo.flag) {
                            location.href = "${contextPath}/admin_category_list"
                        }else{
                            alert(resultInfo.msg);
                        }
                    }
                });
            }
            return false;
        });
    });

</script>

<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="${contextPath}/admin_category_list">所有分类</a></li>
        <li class="active">编辑分类</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑分类</div>
        <div class="panel-body">
            <form id="editForm" action="#"  enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input  id="name" name="name" value="${c.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分类圖片</td>
                        <td>
                            <input id="categoryPic" accept="image/*" type="file" name="image" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${c.id}">
                            <button type="button" class="btn btn-success" id="update_btn">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
