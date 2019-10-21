<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/update_user.css" />
<title>更改用户</title>
</head>

<body>
	<div class="left-sidebar">
		<div class="header">后台管理页面</div>
		<div class="nav">
			<ul>
				<li class="nav-list">
					<h2>
						<i></i> 管理员管理
					</h2>
					<div class="hide">
						<h5>
							<a href="findAdmin">账户信息</a>
						</h5>
					</div>
				</li>
				<li class="nav-list">
					<h2>
						<i></i> 用户管理
					</h2>
					<div class="hide">
						<h5>
							<a href="findUser">用户信息</a>
						</h5>
						<h5>
							<a href="findAddress">收获地址</a>
						</h5>
					</div>
				</li>
				<li class="nav-list">
					<h2>
						<i></i> 商品管理
					</h2>
					<div class="hide">
						<h5>
							<a href="findshopAll_admin">商品信息</a>
						</h5>
					</div>
				</li>
				<li class="nav-list">
					<h2>
						<i></i> 订单管理
					</h2>
					<div class="hide">
						<h5>
							<a href="#">订单详情</a>
						</h5>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="right">
		<div class="right-header">
			<div class="login">
				<ul>
					<!-- 退出 -->
					<li class="quit"><a href="Quit"> <span
							class="am-icon-sign-out"></span> 退出
					</a></li>
				</ul>
			</div>
		</div>
		<div class="right-content">
			<div class="info">
				<h3>更改商品</h3>
				<div class="add">
					<form action="doUpdate_user" method="post">
						<input name="id" type="hidden" value="${u.id}"> <label>用户名<span
							class="small">Uname</span></label><input type="text" placeholder="请输入用户名"
							name="uname" value="${u.uname}"><br> <label>密码<span
							class="small">Password</span></label><input type="text"
							placeholder="请输入密码" name="password" value="${u.password}"><br>
						<label>性别<span class="small">Sex</span></label> <select name="sex">
							<option value="男" <c:if test="${u.sex == '男'}"> selected</c:if>>男</option>
							<option value="女" <c:if test="${u.sex == '女'}"> selected</c:if>>女</option>
						</select><br> <label>邮箱<span class="small">Email</span></label> <input
							type="text" placeholder="请输入邮箱" name="email" value="${u.email}">
						<label>手机号<span class="small">Tel</span></label> <input
							type="text" placeholder="请输入手机号" name="tel" value="${u.tel}">
						<button type="submit">提交</button>
						<a href="findUser" class="goback">返回</a>

					</form>
				</div>
			</div>

		</div>
	</div>
	<script>
		(function() {
			var aList = document.querySelectorAll('.nav-list h2'), aHide = document
					.querySelectorAll('.hide'), aIcon = document
					.querySelectorAll('.nav-list i'), lastIndex = 0; //保存上一次的下标

			for (var i = 0; i < aList.length; i++) {
				aList[i].index = i; //自定义属性保存下标
				aList[i].isClick = false; //定义开关，判断自己是否被点击了
				aList[i].initHeight = aHide[i].clientHeight;
				aHide[i].style.height = '0';
				aList[i].onclick = function() {
					//清除上一次的样式
					aHide[lastIndex].style.height = '0';
					aIcon[lastIndex].className = '';
					aList[lastIndex].className = '';
					if (this.isClick) { //如果自己被点击了
						aList[lastIndex].isClick = false; //未被点击的状态
					} else {
						//设置当前样式
						aHide[this.index].style.height = this.initHeight + 'px';
						aIcon[this.index].className = 'on';
						aList[this.index].className = 'on';
						aList[lastIndex].isClick = false; //清除上一次开关
						aList[this.index].isClick = true; //点击过的状态
						lastIndex = this.index;
					}
				}
			}
		})();
	</script>
</body>

</html>