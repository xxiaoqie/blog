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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox">
                        <div class="ibox-content">
<!-- ---------------------------  标题部分-------------------------------- -->
                            <div class="text-center article-title">
                                <h1>
                                    ${ post.title }
                                </h1>
                                <span class="text-muted"><i class="fa fa-clock-o"></i> ${ post.createAt }</span>
                            </div>
<!-- ---------------------------  内容部分-------------------------------- -->
                            ${ post.content }
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                </div>
                                <div class="col-md-6">
                                    <div class="small text-right">
                                        <h5>Stats:</h5>
                                        <div> <i class="fa fa-comments-o"> </i> ${ post.replyCount } comments </div>
                                        <i class="fa fa-eye"> </i> ${ post.viewCount } views
                                    </div>
                                </div>
                            </div>
<!-- ---------------------------  评论部分-------------------------------- -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <h2>评论:</h2>
                                    <c:choose>
                                    	<c:when test="${not empty username }">
<%--                                     		<form action="<%=base%>user/Reply" method="post"> --%>
<!--                                     			<input name="action" value="add" type="hidden"> -->
<%--                                     			<input name="postId" value="${ post.id }"> --%>
	                                    		<div class="ibox ">
							                        <div class="ibox-content">
							                            <textarea name="content" placeholder="发个友善的评论见证当下" class="form-control border-left m-t" style="height: 200px; resize: none" ></textarea>
							                            <button onclick="addReply(${post.id}); showPost(${post.id })" class="pull-right btn btn-w-m btn-primary">发送</button>
							                        </div>
							                    </div>
<!-- 							                </form> -->
                                    	</c:when>
                                    	<c:otherwise>
                                    		<div class="social-feed-box">
	                                    		<div class="social-body">
		                                            <p>只有登入后才能评论哦~</p>
													<div class="text-center">
														<div class="btn-group">
															<a href="<%= base %>Login" ><button type="button" class="btn btn-primary btn-lg "><i class="fa fa-sign-out"></i>登入</button></a>
															<a href="<%= base %>Register"><button type="button" class="btn  btn-default btn-lg "><i class="fa fa-sign-out"></i>注册</button></a>
														</div>
													</div>
			                                    </div>
		                                   	</div>
                                    	</c:otherwise>
                                    </c:choose>
                                	<c:if test="${empty replies }">
                                		<div class="social-feed-box">
	                                        <div class="social-body">
	                                            <p>还没有人评论哦~</p>
	                                        </div>
	                                    </div>
                                	</c:if>
                                    <c:forEach items="${replies}" var="reply" varStatus="status">
                                    	<div class="social-feed-box">
	                                        <div class="social-avatar">
	                                            <div class="media-body">
	                                                <a>${ reply.username }</a>
	                                                <small class="text-muted">${ reply.createAt }</small>
	                                        		<small class="pull-right">#${ status.index+1 }</small>
	                                            </div>
	                                        </div>
	                                        <div class="social-body">
	                                            <p>
													${ reply.content }
	                                            </p>
	                                        </div>
	                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
            	function addReply(postId) {
            		var content = $('textarea[name="content"]').val();
            		$.ajax({
            			url: <%=base%>+"user/Reply",
            			type:'POST',
            			data: 'action=add&content='+content+'&postId='+postId,
            			dataType: 'text',
            			success:function(data) {
							if(data == "0") {
<%-- 	            				window.location.href = <%=base%>+'404.jsp'; --%>
// 								var obj = $('.article');
// 								$.ajax({
<%-- 									url: <%=base%>+"user/Home", --%>
// 									type:'POST',
// 									data: 'id='+postId+'&action=showPost',
// 									dataType: 'text',
// 									success:function(data) {
// 										var obj = $('.article');
// 										obj.html(data);
// 										obj.css('animation','fadeInRight 0.3s');
// 										setTimeout(function(){
// 											obj.css('animation','');
// 										}, 300);
// 									}
// 								})
							} else {
								alert('error');
							}
            			},
            			error:function(data) {
            				window.location.href = <%=base%>+'404.jsp';
            			}
            		})
            	}
            </script>
</body>
</html>