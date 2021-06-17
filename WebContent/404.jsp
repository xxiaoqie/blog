<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String base = request.getContextPath()+"/"; %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>404页面</title>
		<meta name="renderer" content="webkit" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
	    <link href="<%= base %>css/bootstrap.min.css" rel="stylesheet">
	    <link href="<%= base %>css/style.css" rel="stylesheet">
		<style type="text/css">
			.bg{display:block;max-width:100%;margin:0px auto;margin:40px auto;}
		</style>
	</head>
	<body style="background-color: #f3f3f4;">
		<img class="bg" src="<%= base %>img/404.png" style="height: auto; width: 70%">
		<div class="text-center">
			<div class="btn-group">
				<a href="<%= base %>user/Home" ><button type="button" class="btn btn-primary btn-lg ">返回首页</button></a>
				<a href="http://wpa.qq.com/msgrd?v=3&uin=310776307&site=qq&menu=yes" target="_blank"><button type="button" class="btn  btn-default btn-lg ">咨询站长</button></a>
			</div>
		</div>
	</body>
</html>