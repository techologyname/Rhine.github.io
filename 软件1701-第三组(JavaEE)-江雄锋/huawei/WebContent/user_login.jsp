<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/user_login.css" />
<title>用户登陆</title>
<style>
body {
	height: 100%;
	width: 100%;
	overflow: hidden;
	background-image: url(img/5c8782ecaa059.jpg);
	background-repeat: no-repeat;
}
</style>
</head>

<body>
	<div class="wrap" id="wrap">
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">用户登录</p>
				<span class="msg">${msg}</span>
			</div>
			<!-- 输入框 -->
			<form action="doLogin">
				<div class="lgD">
					<input type="text" placeholder="输入用户名" name="uname" />
				</div>
				<div class="lgD">
					<input type="password" placeholder="输入用户密码" name="password" />
				</div>
				<div class="logC">
					<a href="#"><button>登 录</button></a>
				</div>
			</form>
		</div>
	</div>
</body>

</html>