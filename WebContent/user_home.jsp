<%@page import="tzc.blog.dao.PostDao"%>
<%@ page import="java.util.*, tzc.blog.bean.*" %>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String base = request.getContextPath()+"/"; %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>博客首页</title>

    <link href="<%= base %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= base %>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%= base %>css/animate.css" rel="stylesheet">
    <link href="<%= base %>css/plugins/codemirror/codemirror.css" rel="stylesheet">
    <link href="<%= base %>css/plugins/codemirror/ambiance.css" rel="stylesheet">
    <link href="<%= base %>css/style.css" rel="stylesheet">

</head>

<body class="fixed-sidebar no-skin-config  pace-done">

    <div id="wrapper">
<!-- ------------------------------ 左导航栏 ------------------------------- -->

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> 
                    	<span>
                            <img width="48px" height="48px" alt="image" class="img-circle" src="https://files.cnblogs.com/files/Kingpenguin/Cat.ico" />
                    	</span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="full_height.html#">
                            <span class="clear"> 
                            	<span class="block m-t-xs"> 
                            		<strong class="font-bold">xxiaoqie</strong>
                             	</span>  
                             </span> 
                        </a>
                        
                    </div>
                </li>
                <% int totArtical = 0; %>
               	<c:forEach items="${categories}" var="category">
	                <li class="">
	                	<% 
	                		Category category = (Category)pageContext.getAttribute("category");
	                		PostDao postDao = new PostDao();
	                		List<Post> posts = postDao.getByCategoryId(category.getId());
	                		pageContext.setAttribute("posts", posts);
	                		totArtical += posts.size();
	                	%>
	                    <a><i class="fa fa-th-large"></i> <span class="nav-label">${ category.title } (<%= posts.size() %>)</span> <span class="fa arrow"></span></a>
	                    <c:forEach items="${ posts }" var="post">
		                    <ul class="nav nav-second-level collapse" style="height: 0px;">
		                        <li><a href="#" onclick="showPost(${post.id})">${ post.title }</a></li>
		                    </ul>
	                    </c:forEach>
	                </li>
               	</c:forEach>
            </ul>
        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
<!-- ------------------------------ 上导航栏 ------------------------------- -->
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <c:if test="${empty username }">
                	<li><a href="<%=base%>Login"><i class="fa fa-sign-out"></i>登入</a></li>
                </c:if>
                <c:if test="${not empty username }">
	                <li><span class="m-r-sm text-muted welcome-message"><strong>${ username },</strong> 欢迎访问博客</span></li>
                	<li><a href="<%=base%>Logout"><i class="fa fa-sign-out"></i>登出</a></li>
                </c:if> 
            </ul>
        </nav>
        </div>
        
<!-- ------------------------------ 文章页面------------------------------- -->
        
        <div class="wrapper wrapper-content article">
            <div class="text-center article-title">
            	<h1>欢迎来到我的博客</h1>
        	</div>
        	<p>文章总数：<code class="site_uv"><%= totArtical %></code></p>
        	<p>用户总数：<code class="site_uv">${ count }</code></p>
        </div>
        
        
        
		</div>
    </div>
	<script>
	function showPost(id) {
		var obj = $('.article');
		$.ajax({
			url: <%=base%>+"user/Home",
			type:'POST',
			data: 'id='+id+'&action=showPost',
			dataType: 'text',
			success:function(data) {
				obj.html(data);
				obj.css('animation','fadeInRight 0.3s');
				setTimeout(function(){
					obj.css('animation','');
				}, 300);
			}
		})
	}

	</script>


    <!-- Mainly scripts -->
    <script src="<%= base %>js/jquery-2.1.1.js"></script>
    <script src="<%= base %>js/bootstrap.min.js"></script>
    <script src="<%= base %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%= base %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%= base %>js/inspinia.js"></script>
    <script src="<%= base %>js/plugins/pace/pace.min.js"></script>


</body>

</html>
