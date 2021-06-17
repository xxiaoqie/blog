<%@ page import="java.util.*, tzc.blog.bean.*" %>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String base = request.getContextPath()+"/"; %>

<!DOCTYPE html>
<html style="overflow: auto;">

<head>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>博客管理后台</title>

    <link href="<%= base %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= base %>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%= base %>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%= base %>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="<%= base %>css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="<%= base %>css/animate.css" rel="stylesheet">
    <link href="<%= base %>css/style.css" rel="stylesheet">
	<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
</head>

<body style="overflow: auto;">
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
                    <a href="<%=base%>/Logout">
                        <i class="fa fa-sign-out"></i> 登出
                    </a>
                </li>
            </ul>

        </nav>
        </div>
        <div class="wrapper wrapper-content animated fadeIn ecommerce">
            <div class="row">
                <div class="col-lg-12">
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="tabs_panels.html#collapseOne">新增文章</a>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                            	<form action="<%= base %>admin/Post" method="post" >
                                            		<fieldset class="form-horizontal">
                                            			<input name="action" value="add" type="hidden">
                                            			<input name="content" type="hidden" id="content">
			                                            <div class="form-group"><label class="col-sm-2 control-label">题目:</label>
			                                                <div class="col-sm-10"><input name="title" type="text" class="form-control" placeholder=""></div>
			                                            </div>			                                            
							                            <div class="form-group"><label class="col-sm-2 control-label">内容:</label>
							                                <div class="col-sm-10">
							                                    <div class="summernote">
							
							                                    </div>
							                                </div>
							                            </div>
			                                            <div class="form-group"><label class="col-sm-2 control-label">类别:</label>
			                                             <c:forEach items="${categories}" var="category">
<!-- 			                                             	<div class="radio"> -->
						                                        <label>
						                                            <input type="radio" name="categoryName" value="${ category.title }" checked=""> ${category.title}
						                                        </label>
<!-- 						                                    </div> --> 
			                                             </c:forEach>   
<!-- 			                                                <div class="col-sm-10"><input name="categoryName" type="text" class="form-control" placeholder=""></div> -->
			                                            </div>
			                                            <div class="form-group">
			                                                <div class="col-sm-2">
			                                                	<button onclick="javascript:chuanzhi()" class="btn btn-primary btn-sm" >
			                                                		<i class="fa fa-plus"></i> <span class="bold">发布</span>
			                                                	</button>
			                                                </div>
			                                                <div class="col-md-3" style="color:red">${ error }</div>
			                                            </div>
	                                        		</fieldset>
                                            	</form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="tabs_panels.html#collapseTwo">文章列表</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <c:forEach items="${posts}" var="post">
													<div class="faq-item">
							                            <div class="row">
							                                <div class="col-md-6">
							                                    <a target="_blank" href="<%=base%>admin/Reply?id=${post.id}" class="faq-question"> ${ post.title} </a>
							                                    <small style="display: block;"><i class="fa fa-clock-o"></i> ${ post.createAt }</small> 
							                                    <small style="display: block;"><i class="fa fa-pencil"></i> ${ post.categoryTitle }</small>
							                                </div>
							                                <div class="col-md-2" style="margin-top: 10px;">
<%-- 							                                	<form action="<%=base%>admin/Post" method="post"> --%>
<%-- 							                                		<input name="id" value="${ post.id }" type="hidden"> --%>
<!-- 							                                		<input name="action" value="delete" type="hidden"> -->
							                                		<button onclick="deletePost(${post.id},this)" type="submit" class="btn btn-w-m btn-warning">删除</button>
<!-- 							                                	</form> -->
							                                </div>
							                                <div class="col-md-2" style="margin-top: 10px">
																<a href="<%=base%>admin/PostEdit?id=${post.id}"><button type="button" class="btn btn-w-m btn-info">编辑</button></a>
							                                </div>
							                                <div class="col-md-2" style="margin-top:20px">
							                                	<div class="small text-right">
							                                        <div> <i class="fa fa-comments-o"> </i> ${ post.replyCount } comments </div>
							                                        <i class="fa fa-eye"> </i> ${ post.viewCount } views
							                                    </div>
							                                </div>
							                            </div>
							                        </div>
												</c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
                <small><i class="fa fa-clock-o"></i> <%= new java.util.Date() %></small>
            </div>
            <div>
                <strong>Copyright</strong> TZC &copy; 2020
            </div>
        </div>
        </div>
        
    </div>

    
    
    <!-- Mainly scripts -->
<script src="<%= base %>js/jquery-2.1.1.js"></script>
<script src="<%= base %>js/bootstrap.min.js"></script>
<script src="<%= base %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%= base %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<%= base %>js/inspinia.js"></script>
<script src="<%= base %>js/plugins/pace/pace.min.js"></script>

<!-- SUMMERNOTE -->
<script src="<%= base %>js/plugins/summernote/summernote.min.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

<!-- Data picker -->

<script>
	function deletePost(id,obj) {
		var xmlHttp = new XMLHttpRequest();
		var url = <%=base%>+"admin/Post?id="+id+"&action=delete";
		xmlHttp.open("POST",url,true);
		xmlHttp.onreadystatechange = function() {
			if(xmlHttp.readyState == 4) {
				obj.parentNode.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode.parentNode);
				
			} else {
				obj.innerHTML = '删除中...';
			}
		}
		xmlHttp.send();
	}
	function chuanzhi(){
		 document.getElementById('content').value = $('.note-editable').html();
		 console.log(document.getElementById('content').value);
	}
    $(document).ready(function(){

        $('.summernote').summernote();
		

    });
</script>
</body>
</html>
