<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wh.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String jsUrl = request.getContextPath() + "/js/";
	String cssUrl = request.getContextPath() + "/css/";
	String imgUrl = request.getContextPath() + "/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index2.css" rel="stylesheet">
<link rel="stylesheet" href="css/base.css" />
<link href="<%=cssUrl%>cart.css" rel="stylesheet">
<link rel="stylesheet" href="css/cart2.css" />
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>cartValidate.js"></script>
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
	<c:choose>


		<c:when test="${ !empty sessionScope.ShoppingCart.commoditys }">
			<br>
			<br>
			<div class="container">
				<div class="container">
					<div class="alert alert-success tip-success" id="commodityNumber">
						您的购物车中共有 <b>${sessionScope.ShoppingCart.commodityNumber } </b>件商品
					</div>
					<table class="table table-striped">
						<tr>
							<td class="col-md-6">商品名</td>
							<td class="col-md-2 text-center">数量</td>
							<td class="col-md-2 text-center">价格</td>
							<td class="col-md-2 text-center">操作</td>
						</tr>
						<c:forEach items="${sessionScope.ShoppingCart.items }" var="item">


							<tr>
								<td class="col-md-6 "><img alt="${item.commodity.id }" id="productImg"
									src="${item.commodity.img }"
									 style="width: 180px; height: 180px;">
									${item.commodity.type } &nbsp; ${item.commodity.name}</td>
								<td class="col-md-2 cartItem text-center"
									style="height: 100px; line-height: 200px;"><input
									class="cartItemNum" step="${item.quantity }" type="text" id ="num"
									size="1" name="${item.commodity.id }" value="${item.quantity }"  onchange ="updateCart('${item.commodity.id }',this)"
									style="width: 50px; height: 30px;" /></td>
								<td class="col-md-2 text-center">￥ <b>${item.commodity.price }</b></td>
								<td class="col-md-2 text-center"><a
									class="btn btn-danger delete"
									href="javascript:0" onclick="deleteCartItem('${item.commodity.id }',this);">删除</a></td>
							</tr>
						</c:forEach>
					</table>


					<div id="totalMoney" style="font-weight: bold;">
						总金额：￥ ${sessionScope.ShoppingCart.totalMoney }</span>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-xs-6 col-md-8"></div>
						<div class="col-xs-12 col-md-4 text-right"
							style="padding-left: 30px;">
							<a href="findshopAll" class="btn btn-default" role="button">继续购物</a>


							<a href="clear" class="btn btn-danger" role="button">清空购物车</a>

							<c:choose>
								<c:when test="${empty sessionScope.u}">
									<a href="user_login.jsp" class="btn btn-primary"
								role="button">请先登录</a>
								</c:when>
								<c:otherwise>
									<a href="toAccount?id=${u.id}" class="btn btn-primary"
								role="button">结账</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<jsp:forward page="emptycart.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>