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

    <title>博客管理后台</title>

    <link href="<%= base %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= base %>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%= base %>css/animate.css" rel="stylesheet">
    <link href="<%= base %>css/style.css" rel="stylesheet">
	<link href="<%= base %>css/plugins/toastr/toastr.min.css" rel="stylesheet">
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
                    <a href="<%=base%>/Logout">
                        <i class="fa fa-sign-out"></i> 登出
                    </a>
                </li>
            </ul>

        </nav>
        </div>
            <div class="wrapper wrapper-content">
        <div class="row">
			<div class="col-lg-12">
           		<div class="wrapper wrapper-content animated fadeInRight">
                    <div class="ibox-content m-b-sm border-bottom">
                        <div class="text-center p-lg">
							<div class="form-group">
                                <div class="col-sm-10">
                                    <div class="row">
<%--                                     	<form action="<%= base %>admin/Category" method="post"> --%>
<!--                                     		<input name="action" value="add" type="hidden"> -->
	                                        <div class="col-md-4"><input name="title" type="text" placeholder="分类名称" class="form-control"></div>
	                                        <div class="col-md-3"><button class="btn btn-primary btn-sm" onclick="addCategory()"><i class="fa fa-plus"></i> <span class="bold">增加分类</span></button></div>
<%-- 											<div class="col-md-3" style="color:red">${ error }</div> --%>
<!--                                     	</form> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<c:forEach items="${categories}" var="category">
						<div class="faq-item" id="${category.id }">
                            <div class="row">
                                <div class="col-md-8">
                                    <a href="<%=base%>admin/Post?action=filter&categoryId=${category.id }" class="faq-question"> ${ category.title} </a>
                                    <small><i class="fa fa-clock-o"></i> ${ category.createAt }</small>
                                </div>
                                <div class="col-md-2">
<%--                                 	<form action="<%=base%>admin/Category" method="post"> --%>
<%--                                 		<input name="id" value="${ category.id }" type="hidden"> --%>
<!--                                 		<input name="action" value="delete" type="hidden"> -->
                                		<button class="btn btn-w-m btn-warning" onclick="deleteCategory(${category.id})">删除</button>
<!--                                 	</form> -->
                                </div>
                                <div class="col-md-2">
									<a href="<%=base%>admin/CategoryEdit?action=edit&id=${ category.id }"><button type="button" class="btn btn-w-m btn-info">编辑</button></a>
                                </div>
                            </div>
                        </div>
					</c:forEach>
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
    <script src="<%= base %>js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%= base %>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="<%= base %>js/plugins/flot/jquery.flot.js"></script>
    <script src="<%= base %>js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="<%= base %>js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="<%= base %>js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="<%= base %>js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="<%= base %>js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="<%= base %>js/plugins/flot/jquery.flot.time.js"></script>

    <!-- Peity -->
    <script src="<%= base %>js/plugins/peity/jquery.peity.min.js"></script>
    <script src="<%= base %>js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%= base %>js/inspinia.js"></script>
    <script src="<%= base %>js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="<%= base %>js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="<%= base %>js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="<%= base %>js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="<%= base %>js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="<%= base %>js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="<%= base %>js/demo/sparkline-demo.js"></script>
	<script src="<%= base %>js/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript">

    $(function () {
    	toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "progressBar": true,
				  "preventDuplicates": false,
				  "positionClass": "toast-top-center",
				  "onclick": null,
				  "showDuration": "400",
				  "hideDuration": "1000",
				  "timeOut": "3000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				};
    });
    function addCategory(){
		var title = $('input[name="title"]').val();
		$.ajax({
			url: <%=base%>+"admin/Category",
			type:'POST',
			data: 'action=add&title='+title,
			dataType: 'text',
			success:function(data) {
				if(data.length < 2) {
					toastr.success("分类增加成功");
					setTimeout(function(){
						window.location.reload();
					},300);
				} else {
					toastr.error(data);
				}
			}, 
			error:function(data) {
				window.location.href = <%=base%>+'404.jsp';
			}
		})
	};
	function deleteCategory(categoryId) {
		$.ajax({
			url: <%=base%>+"admin/Category",
			type:'POST',
			data: 'action=delete&id='+categoryId,
			dataType: 'text',
			success:function(data) {
				if(data.length < 2) {
					toastr.success("删除成功");
					$('#'+categoryId).remove();
				} else {
					toastr.error(data);
				}
			}
		})
	}
	</script>
    
</body>
</html>
