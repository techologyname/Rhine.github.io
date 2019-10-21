<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/js/";
	String cssUrl=request.getContextPath()+"/css/";
	String imgUrl=request.getContextPath()+"/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/emptycart.css" />
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
	
	<div class="header-top">
		<div class="header-nav">
			<ul class="fl">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="#">华为官网</a></li>
				<li><a href="#">荣耀官网</a></li>
				<li><a href="admin_login.jsp">后台管理</a></li>
			</ul>
			<ul class="fr">
				<c:choose>
					<c:when test="${empty sessionScope.u}">
						<li><a href="user_login.jsp">请登陆 </a></li>
						<li><a href="register.jsp">注册</a></li>
					</c:when>
					<c:otherwise>
						<li style="cursor: pointer;"><a href="#">${u.uname} </a></li>
						<li><a href="Quit">退出</a></li>
					</c:otherwise>
				</c:choose>
				<li>
					<div>
						<a href="#"><span>我的订单</span> </a>
					</div>
				</li>
				<li class="user"><a href="#">客户服务<span
						class="arrow-down red"></span></a> <script>
							$(function() {
								$(".down").hide();
								$(".user").mouseover(function() {
									$(".down").show();
								}), $(".user").mouseout(function() {
									$(".down").hide();
								})
							})
						</script>
					<ul class="down">
						<li><a href="#">服务中心</a></li>
						<li><a href="#">联系客服</a></li>
					</ul></li>
				<li><a href="cart.jsp">购物车</a></li>
			</ul>
		</div>
		</div>
	<div class="container">
		<div class="jumbotron" style="margin-top:30px;">
  			
  			<p>购物车空空如也~</p>
  			<p><a class="btn btn-primary btn-lg" href="findshopAll" role="button">返回</a></p>
		</div>
	</div>		
	
			
	

	<%@ include file="/commons/footer.jsp"%>
</body>
</html>