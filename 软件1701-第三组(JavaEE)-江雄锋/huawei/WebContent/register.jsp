<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wh.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/base.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/register.css" />
<title>注册</title>
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
	<div class="header">
		<img src="img/SXppnESYv4K11DBxDFc2.png" width="210" height="35">
	</div>
	<div id="container">
		<form action="doRegister">
			<div class="biaodan"
				style="padding-left: 230px; padding-right: 230px;">
				<br />
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">用户名</button>
					</span> <input type="text" class="form-control" placeholder="请输入用户名"
						name="uname">
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-default dropdown-toggle"
							style="padding: 6px;">
							+86(中国)<span class="caret"></span>
						</button>
					</div>
					<input type="text" class="form-control" aria-label="..."
						placeholder="请输入手机号" name="tel">
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">密码</button>
					</span> <input type="text" class="form-control" placeholder="不小于六位"
						name="password">
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">性别</button>
					</span> <select class="form-control" name="sex">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>

				</div>
				<br />

				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">电子邮箱</button>
					</span> <input type="text" class="form-control" name="email">
				</div>
				<br />

				<button type="submit" class="btn btn-danger"
					style="padding-left: 15px; padding-right: 8px; border-radius: 18px; margin-left: 160px; padding-left: 50px; padding-right: 50px;">
					注册</button>

			</div>
		</form>
	</div>

	<div class="footer">

		华为帐号用户协议 | 关于华为帐号与隐私的声明 | 常见问题<br /> <br /> Copyright © 2011-2019
		华为软件技术有限公司 版权所有 保留一切权利 苏B2-20070200号 | 苏ICP备09062682号-9
	</div>
</body>

</html>