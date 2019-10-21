<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>确认订单</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index2.css" rel="stylesheet">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/account.css" />
<link href="<%=cssUrl%>cart.css" rel="stylesheet">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
		<div class="logo">
			<img src="img/SXppnESYv4K11DBxDFc2.png" width="210" height="45"><span>确认订单</span>
		</div>
	</div>

	<div class="kuang">
		<h3>收货地址</h3>
		<a class="add" data-toggle="modal" data-target="#myModal">添加</a> 
		<a class="update" href="doUpdate_address?id=${a.id}&user_id=${u.id}" data-toggle="modal" data-target="#myModal2">修改</a>
		<a class="delete" href="deleteAddress?id=${a.id}&user_id=${u.id}">删除</a>
		<div class="address-info">
			<input type="hidden" name="user_id" value="${u.id}"> <label>收货人姓名:</label><span
				name="receive_name">${a.receive_name}</span><br> <label>手机号:</label><span
				name="tel">${a.tel}</span><br> <label>省-市-区:</label><span
				name="three_address">${a.three_address}</span><br> <label>具体地址:</label><span
				name="other_address">${a.other_address}</span>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" style="text-align: center;">添加地址</h4>
					</div>
					<form action="addAddress" method="post">
						<div class="modal-body">
							<input type="hidden" name="user_id" value="${u.id}">
							&nbsp; &nbsp;&nbsp;收货人:&nbsp;<input type="text"
								style="width: 300px; height: 30px;" placeholder="请输入收货人姓名"
								name="receive_name"><br> <br> 手机号码:&nbsp;<input
								type="text" placeholder="请输入11位手机号码" style="height: 30px;"
								name="tel"">&nbsp;<br> <br> 收货地址:&nbsp;<input
								type="text" placeholder="请输入省-市-区"
								style="height: 30px; width: 435px;" name="three_address"><br>
							<br>
							<p style="margin-left: 55px;">
								<textarea name="other_address" id="info" class="length"
									placeholder="请在此处输入剩余具体地址" style="width: 440px; height: 80px;"></textarea>
							</p>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="submit" class="btn btn-danger">保存并使用</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" style="text-align: center;">添加地址</h4>
					</div>
					<form action="doUpdate_address?user_id=${u.id }" method="post">
						<div class="modal-body">
							<input type="hidden" name="id" value="${a.id}">
							&nbsp; &nbsp;&nbsp;收货人:&nbsp;<input type="text"
								style="width: 300px; height: 30px;" placeholder="请输入收货人姓名"
								name="receive_name" value="${a.receive_name}"><br> <br> 手机号码:&nbsp;<input
								type="text" placeholder="请输入11位手机号码" style="height: 30px;"
								name="tel" value="${a.tel }">&nbsp;<br> <br> 收货地址:&nbsp;<input
								type="text" placeholder="请输入省-市-区"
								style="height: 30px; width: 435px;" name="three_address" value="${a.three_address }"><br>
							<br>
							<p style="margin-left: 55px;">
								<textarea name="other_address" id="info" class="length"
									placeholder="请在此处输入剩余具体地址" style="width: 440px; height: 80px;">${a.other_address}</textarea>
							</p>

						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="submit" class="btn btn-danger">保存并使用</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<c:choose>

		<c:when test="${ !empty sessionScope.ShoppingCart.commoditys }">
			<br>
			<br>
			<div class="container">
				<div class="container">
					<table class="table table-striped">
						<tr>
							<td class="col-md-6">商品名</td>
							<td class="col-md-2 text-center">数量</td>
							<td class="col-md-2 text-center">价格</td>
						</tr>
						<c:forEach items="${sessionScope.ShoppingCart.items }" var="item">

							<tr>
								<td class="col-md-6 "><img alt="${item.commodity.id }"
									src="${item.commodity.img }"
									style="width: 180px; height: 180px;">
									${item.commodity.type } &nbsp; ${item.commodity.name }</td>
								<td class="col-md-2 cartItem text-center"
									style="height: 100px; line-height: 200px;"><input
									class="cartItemNum" step="${item.quantity }" type="text"
									disabled="disabled" size="1" name="${item.commodity.id }"
									value="${item.quantity }" style="width: 50px; height: 30px;" /></td>
								<td class="col-md-2 text-center">
									<div class="price">
										￥ <b>${item.commodity.price }</b>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<input type="hidden" name="user_id" value="${u.id}"> <input
						type="hidden" name="address_id" value="${adress.id}"> <input
						type="hidden" name="status" value="0"> <input
						type="hidden" name="order_time" value="1"> <input
						type="hidden" name="price_amount"
						value=" ${sessionScope.ShoppingCart.totalMoney }">

					<div id="totalMoney" style="font-weight: bold;">
						<span>总金额：￥ ${sessionScope.ShoppingCart.totalMoney }</span>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-xs-6 col-md-8"></div>
						<div class="col-xs-12 col-md-4 text-right"
							style="padding-left: 30px;">
							<a href="submitOrder" class="btn btn-default"
								onclick="javascript:alert('付款成功'); ">提交订单</a>
						</div>
					</div>
				</div>
			</div>

		</c:when>
	</c:choose>
</body>
</html>