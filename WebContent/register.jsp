<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String base = request.getContextPath()+"/"; %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>博客用户注册</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">A+</h1>
            </div>
            <h3>Register to IN+</h3>
            <p>Create account to see it in action.</p>
<!--             <form class="m-t" role="form" action="Register"> -->
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名" required="" name="username" id="username">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="手机号" required="" name="mobile" id="mobile">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" required="" name="password" id="password">
                </div>
                <button  class="btn btn-primary block full-width m-b" onclick="register()">注册</button>
<!--             </form> -->
            <p class="m-t"> <small>TZC &copy; 2020</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
    function register(){
    	var username = $('#username').val();
        var mobile = $('#mobile').val();
        var password = $('#password').val();
        $.ajax({
    		url: <%=base%>+"Register",
    		type:'POST',
    		data: 'username='+username+'&mobile='+mobile+'&password='+password,
    		dataType: 'text',
    		success:function(data) {
    			console.log(data.length)
    			if(data.length > 2) {
    				alert(data);
    			} else {
    				alert('注册成功');
    				window.location.replace(<%=base%>+'Login');
    			}
    		}
    	})
    }
    </script>
</body>

</html>
