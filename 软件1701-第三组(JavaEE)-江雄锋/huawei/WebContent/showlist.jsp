<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wh.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品页</title>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/showlist.css" />
<script type="text/javascript" src="js/jquery-1.11.1/jquery.min.js"></script>
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
	<div class="middle-nav">
		<img src="img/SXppnESYv4K11DBxDFc2.png" width="210" height="40"
			class="logo">
		<ul class="fl">
			<li><a href="#" class="normal-black">手机</a></li>
			<li><a href="#" class="normal-black">笔记本&平板</a></li>
			<li><a href="#" class="normal-black">智能穿戴</a></li>
			<li><a href="#" class="normal-black">智能家居</a></li>
			<li><a href="#" class="normal-black">热销配件</a></li>
			<li><a href="#" class="normal-black">增值服务&其他</a></li>
		</ul>
		<div class="search">
			<input class="search-text">
			<div class="search-button">
				<a href="#"><img src="img/未标题-1.png" width="30" height="30"></a>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div class="assortment">
			<p class="black">分类：</p>
			<a class="red" href="findshopAll">全部</a> <a href="findshopHuawei_Mate">HUAWEI Mate系列</a> <a href="findshopRongYao">荣耀</a>
			<a href="findshopHuawei_P">HUAWEI P系列</a> <a href="findshopRongyao_Changwan">荣耀畅玩系列</a> <a href="findshopHuawei_nova">HUAWEI
				nova系列</a> <a href="findshopHuawei_Changxiang">华为畅享系列</a> <a href="findshopHuawei_maimang">HUAWEI 麦芒系列</a> <a href="findshopYidong_4G">移动4G+专区</a>
		</div>
		<div class="goods">
			<c:forEach items="${c}" var="c">
				<div class="shop">
					<a href="#"><img src="${c.img }"></a>
					<div class="describe">
						<p class="name">
							<a href="#">${c.name }</a>
						</p>
						<p class="price">￥ ${c.price }</p>
					</div>
					<a class="join-shoppingcart" href="addToCart?id=${c.id}">加入购物车</a>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>