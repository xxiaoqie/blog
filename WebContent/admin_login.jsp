<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>我的博客</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
<!-- 	<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">	 -->
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">A+</h1>

            </div>
            <h3>欢迎来到我的博客管理后台！</h3>
            <p style="color:red">
<%-- 	            <c:if test="${not empty error }"> --%>
	            	${ error }
<%-- 	            </c:if> --%>
            </p>
            <form class="m-t" role="form" action="Login" method="post">
                <div class="form-group">
                    <input name="username" type="text" class="form-control" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="Password" required="">
                </div>
                <div class="form-group">
	                <input type="radio" checked value="user" name="type"> 用户
	                <input type="radio" value="admin" name="type"> 管理员
	            </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>
				<a class="btn btn-sm btn-white btn-block" href="Register">Register</a>
            </form>
            <p class="m-t"> <small>TZC &copy; 2020</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript"></script>
	
</body>

</html>