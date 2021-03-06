<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %> 

<html>

<head>
	<script src="${contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
	<link href="${contextPath}/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<script src="${contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
	<link href="${contextPath}/css/back/style.css" rel="stylesheet">
	
<script>
function checkEmpty(id, name){
	var value = $("#"+id).val();
	if(value.length==0){
		alert(name+ "不能为空");
		$("#"+id)[0].focus();
		return false;
	}
	return true;
}
function checkNumber(id, name){
	var value = $("#"+id).val();
	if(value.length==0){
		alert(name+ "不能为空");
		$("#"+id)[0].focus();
		return false;
	}
	if(isNaN(value)){
		alert(name+ "必须是数字");
		$("#"+id)[0].focus();
		return false;
	}
	
	return true;
}
function checkInt(id, name){
	var value = $("#"+id).val();
	if(value.length==0){
		alert(name+ "不能为空");
		$("#"+id)[0].focus();
		return false;
	}
	if(parseInt(value)!=value){
		alert(name+ "必须是整数");
		$("#"+id)[0].focus();
		return false;
	}
	return true;
}

$(function(){
	$("a").click(function(){
		var deleteLink = $(this).attr("deleteLink");
		if("true"==deleteLink){
			var name = $(this).attr("del_name");
			var url = $(this).attr("url");
			var id = $(this).attr("data");
			if(confirm("确定要删除【" + name + "】吗")){
				$.ajax({
					url:"${contextPath}/" + url + "/" + id,
					type:"DELETE",
					success:function () {
						location.reload();
					}
				});
			}
		}
	});
})
</script>	
</head>
<body>

