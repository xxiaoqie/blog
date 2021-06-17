<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String base = request.getContextPath()+"/"; %>
<!DOCTYPE html>
<html>

<head>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>博客管理后台</title>

    <link href="<%= base %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= base %>css/animate.css" rel="stylesheet">
    <link href="<%= base %>css/style.css" rel="stylesheet">

</head>

<body>
    <div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> 
                    	<span>
                            <img width="48px" height="48px" alt="image" class="img-circle" src="https://files.cnblogs.com/files/Kingpenguin/Cat.ico" />
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> 
                            	<span class="block m-t-xs"> 
                            		<strong class="font-bold">Chiechun</strong>
                            	</span> 
                            </span> 
                        </a>
                    </div>
                    <div class="logo-element">
                        A+
                    </div>
                </li>
                <li>
                    <a href="<%= base %>admin/Home"><i class="fa fa-diamond"></i> <span class="nav-label">首页</span></a>
                </li>
                
                <li>
                    <a href="<%= base %>admin/Category"><i class="fa fa-pie-chart"></i> <span class="nav-label">分类管理</span>  </a>
                </li>
                <li>
                    <a href="<%= base %>admin/Post"><i class="fa fa-flask"></i> <span class="nav-label">文章管理</span></a>
                </li>
                
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">欢迎登入博客管理后台</span>
                </li>
                <li>
                    <a href="<%=base%>Logout"><i class="fa fa-sign-out"></i> 登出</a>
                </li>
            </ul>

        </nav>
        </div>
            <div class="wrapper wrapper-content">
        <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>注册用户</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">${userCount}</h1>
                                <small>Total user</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>分类总数</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">${categoryCount}</h1>
                                <small>Total category</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>文章总数</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">${ postCount }</h1>
                                <small>Total post</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>回复总数</h5>
                            </div>
                            <div class="ibox-content">
                                <h1 class="no-margins">${ replyCount }</h1>
                                
                                <small>Total reply</small>
                            </div>
                        </div>
            </div>
        </div>
        


                
                </div>
        <div class="footer">
            <div class="pull-right">
                <%= new java.util.Date() %>
            </div>
            <div>
                <strong>Copyright</strong> TZC &copy; 2012-2020
            </div>
        </div>
        </div>
        
    </div>

    <!-- Mainly scripts -->
    <script src="<%= base %>js/jquery-2.1.1.js"></script>
    <script src="<%= base %>js/bootstrap.min.js"></script>
</body>
</html>
