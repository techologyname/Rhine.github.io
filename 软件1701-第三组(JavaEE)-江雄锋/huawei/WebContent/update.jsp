<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/update.css" />
<title>更改商品</title>
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
					<form action="doUpdate" method="post">
						<input name="id" type="hidden" value="${c.id}"> <label>类型<span
							class="small">Type</span></label><input type="text" placeholder="请输入类型" name="type"
							value="${c.type}"><br> <label>名称<span
							class="small">Name</span></label><input type="text" placeholder="请输入名称" name="name"
							value="${c.name}"><br> <label>价格<span
							class="small">Price</span></label><input type="text" placeholder="请输入价格" name="price"
							value="${c.price}"><br> <label>现图片<span
							class="small">img</span><img src="${c.img} "
							style="width: 200px; height: 200px; margin-left: 100px;"></label><br><input
							type="file" name="img" /><br>
						<button type="submit">提交</button>
						<a href="findshopAll_admin" class="goback">返回</a>

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