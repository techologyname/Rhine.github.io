<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wh.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.11.1/jquery.min.js"></script>
<style>
.toolbar{
    position: fixed;
    right: 10px;
    bottom: 20px;
}
.toolbar-item{
    position: relative;
    display: block;
    width: 50px;
    height: 50px;


    &:hover{
        .toolbar-icon{
            top: -@toolbar-size;
        }
        .toolbar-text {
            top: 0;
        }
    }
}
.toolbar-btn{
    position: absolute;
    left: 0;
    top: 0;
    width: 50px;
    height: 50px;
    overflow: hidden;

    .toolbar-icon{
        position: absolute;
        left: 0;
        top: 0;
        width: 50px;
        height: 50px;
        background-color: #ccc;
        font-size: 30px;
        color: #fff;
        text-align: center;
        transition: top 1s;
    } 
    .toolbar-text{
        position: absolute;
        left: 0;
        top: 50px;
        width: 50px;
        height:50px;
        background-color: #A0A0A0;
        font-size: 24px;
        color: #fff;
        text-align: center;
        transition: top 1s;
    }
}
</style>
<script type="text/javascript">
        $(function() {
            $('#backtop').on('click',move);   
            $(window).on('scroll',function(){
                checkposition( $(window).height() );
            });

            function move() {
                $('html,body').animate({
                    scrollTop: 0
                },800);
            }

            function checkposition(H) {
                if($(window).scrollTop() > H){
                    $('#backtop').fadeIn();
                }
                else{
                    $('#backtop').fadeOut();
                }
            }
        })
</script>

<script>
	$(document).ready(
			function() {
				var size = $('.img li').size();
				for (var i = 1; i < size + 1; i++) {
					var li = '<li>' + i + '</li>';
					$('.num').append(li);
				}
				$('.img li').first().show();
				$('.num li').first().addClass('active');
				/* 手动轮播*/
				$('.num li').mousemove(
						function() {
							$(this).addClass('active').siblings().removeClass(
									'active');
							var index = $(this).index();
							i = index;
							$('.img li ').eq(index).stop().fadeIn(300)
									.siblings().stop().fadeOut(300);
						})
				/* 核心向左运动函数*/
				function moveL() {
					i--;
					if (i == -1)
						i = size - 1;
					$('.num li').eq(i).addClass('active').siblings()
							.removeClass('active');
					$('.img li').eq(i).fadeIn(300).siblings().fadeOut(300);
				}
				;
				/* 自动播放*/
				var i = 0;
				var t = setInterval(move, 1500);
				/* 核心向右运动函数*/
				function move() {
					i++;
					if (i == size)
						i = 0;
					$('.num li').eq(i).addClass('active').siblings()
							.removeClass('active');
					$('.img li').eq(i).fadeIn(300).siblings().fadeOut(300);
				}
				;
				$('.wrapper').hover(function() {
					clearInterval(t);
				}, function() {
					t = setInterval(move, 1000);
				})
				$('.btn-left').click(function() {
					moveL();
				})
				$('.btn-right').click(function() {
					move();
				})
			});
	$(function() {

		$(".phone,.right-siderbar").mouseover(function() {
			$(".left-sidebar").css("border-top-right-radius", "0px");
			$(".left-sidebar").css("border-bottom-right-radius", "0px");
			$(".right-siderbar").show();
		}), $(".phone,.right-siderbar").mouseout(function() {
			$(".left-sidebar").css("border-top-right-radius", "15px");
			$(".left-sidebar").css("border-bottom-right-radius", "15px");
			$(".right-siderbar").hide();
		});

		$(".laptop,.right-siderbar-laptop").mouseover(function() {
			$(".left-sidebar").css("border-top-right-radius", "0px");
			$(".left-sidebar").css("border-bottom-right-radius", "0px");
			$(".right-siderbar-laptop").show();
		}), $(".laptop,.right-siderbar-laptop").mouseout(function() {
			$(".left-sidebar").css("border-top-right-radius", "15px");
			$(".left-sidebar").css("border-bottom-right-radius", "15px");
			$(".right-siderbar-laptop").hide();
		});

		$(".handband,.right-siderbar-handband").mouseover(function() {
			$(".left-sidebar").css("border-top-right-radius", "0px");
			$(".left-sidebar").css("border-bottom-right-radius", "0px");
			$(".right-siderbar-handband").show();
		}), $(".handband,.right-siderbar-handband").mouseout(function() {
			$(".left-sidebar").css("border-top-right-radius", "15px");
			$(".left-sidebar").css("border-bottom-right-radius", "15px");
			$(".right-siderbar-handband").hide();
		});

		$(".smart-home,.right-siderbar-smartHome").mouseover(function() {
			$(".left-sidebar").css("border-top-right-radius", "0px");
			$(".left-sidebar").css("border-bottom-right-radius", "0px");
			$(".right-siderbar-smartHome").show();
		}), $(".smart-home,.right-siderbar-smartHome").mouseout(function() {
			$(".left-sidebar").css("border-top-right-radius", "15px");
			$(".left-sidebar").css("border-bottom-right-radius", "15px");
			$(".right-siderbar-smartHome").hide();
		});

		$(".accessory,.right-siderbar-accessory").mouseover(function() {
			$(".left-sidebar").css("border-top-right-radius", "0px");
			$(".left-sidebar").css("border-bottom-right-radius", "0px");
			$(".right-siderbar-accessory").show();
		}), $(".accessory,.right-siderbar-accessory").mouseout(function() {
			$(".left-sidebar").css("border-top-right-radius", "15px");
			$(".left-sidebar").css("border-bottom-right-radius", "15px");
			$(".right-siderbar-accessory").hide();
		});

		$(".serve,.right-siderbar-serve").mouseover(function() {
			$(".left-sidebar").css("border-top-right-radius", "0px");
			$(".left-sidebar").css("border-bottom-right-radius", "0px");
			$(".right-siderbar-serve").show();
		}), $(".serve,.right-siderbar-serve").mouseout(function() {
			$(".left-sidebar").css("border-top-right-radius", "15px");
			$(".left-sidebar").css("border-bottom-right-radius", "15px");
			$(".right-siderbar-serve").hide();
		});
	})
</script>
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
		<img src="img/SXppnESYv4K11DBxDFc2.png" width="210" height="35"
			class="logo">
		<ul class="fl">
			<li><a href="#" class="special-red">华为专区</a></li>
			<li><a href="#" class="special-blue">荣耀专区</a></li>
			<li><a href="#" class="normal-black">华为P30</a></li>
			<li><a href="#" class="normal-black">荣耀20</a></li>
			<li><a href="#" class="normal-black">Mate 20系列</a></li>
			<li><a href="#" class="normal-black">荣耀V20</a></li>
		</ul>
		<div class="search">
			<input class="search-text">
			<div class="search-button">
				<a href="#"><img src="img/未标题-1.png" width="30" height="30"></a>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<!--轮播图-->
		<div class="middle">

			<div class="carousel-figure">
				<ul class="img">
					<li><a href=""><img src="img/e5lg2uBBzdSjGHocyRa4.jpg"></a>
					</li>
					<li><a href=""><img src="img/fFKk1u5dZkKSCkrdqgZa.jpg"></a>
					</li>
					<li><a href=""><img src="img/Gzl5RDmVTlhgd1naZq3i.jpg"></a>
					</li>
					<li><a href=""><img src="img/kUY0T0mXSOwuHBNbMCKy.jpg"></a>
					</li>
					<li><a href=""><img src="img/kXe5QROOWSxQ5pP0yRon.jpg"></a>
					</li>
					<li><a href=""><img src="img/pnO9uarG6qJ9Oy8WcWMN.jpg"></a>
					</li>
					<li><a href=""><img src="img/PZYdEc2Unz4iQQ88E1nj.jpg"></a>
					</li>
				</ul>
				<ul class="num">
				</ul>
				<div class="btn btn-left">&lt;</div>
				<div class="btn btn-right">&gt;</div>
			</div>
			<div class="left-sidebar">
				<div class="phone">
					<div class="left">
						<h3>
							<a href="findshopAll">手机</a>
						</h3>
						<span><a href="#">荣耀</a></span> <span><a href="#">HUAWEI
								P系列</a></span>
						<div class="hr"></div>
					</div>
				</div>
				<div class="laptop">
					<div class="left">
						<h3>
							<a href="findshopAll">笔记本 & 平板</a>
						</h3>
						<span><a href="#">平板电脑</a></span> <span><a href="#">笔记本电脑</a></span>
						<div class="hr"></div>
					</div>
				</div>
				<div class="handband">
					<div class="left">
						<h3>
							<a href="findshopAll">智能穿戴</a>
						</h3>
						<span><a href="#">手环</a></span> <span><a href="#">手表</a></span> <span><a
							href="#">VR</a></span>
						<div class="hr"></div>
					</div>
				</div>
				<div class="smart-home">
					<div class="left">
						<h3>
							<a href="findshopAll">智能家居</a>
						</h3>
						<span><a href="#">路由器</a></span> <span><a href="#">电视盒子</a></span>
						<span><a href="#">照明</a></span>
						<div class="hr"></div>
					</div>
				</div>
				<div class="accessory">
					<div class="left">
						<h3>
							<a href="findshopAll">热销配件</a>
						</h3>
						<span><a href="#">保护壳</a></span> <span><a href="#">移动电源</a></span>
						<span><a href="#">耳机</a></span>
						<div class="hr"></div>
					</div>
				</div>
				<div class="serve">
					<div class="left">
						<h3>
							<a href="findshopAll">增值服务&其他</a>
						</h3>
						<span><a href="#">服务器</a></span> <span><a href="#">AI计算平台</a></span>
					</div>
				</div>
			</div>
			<div class="right-siderbar">
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						nova系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI P系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>华为畅享系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						Mate系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						麦芒系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀畅玩系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="all">
					<a href="#">查看所有</a>
				</div>
			</div>
			<div class="right-siderbar-laptop">
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						nova系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI P系列</span>
				</div>
				<div class="all">
					<a href="#">查看所有</a>
				</div>
			</div>
			<div class="right-siderbar-handband">
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						nova系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI P系列</span>
				</div>
				<div class="all">
					<a href="#">查看所有</a>
				</div>
			</div>
			<div class="right-siderbar-smartHome">
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						nova系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI P系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>华为畅享系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						Mate系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						麦芒系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀畅玩系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="all">
					<a href="#">查看所有</a>
				</div>
			</div>
			<div class="right-siderbar-accessory">
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						nova系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI P系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>华为畅享系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						Mate系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						麦芒系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀畅玩系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>移动4G+专区</span>
				</div>
				<div class="all">
					<a href="#">查看所有</a>
				</div>
			</div>
			<div class="right-siderbar-serve">
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>荣耀</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI
						nova系列</span>
				</div>
				<div class="shop">
					<img src="img/vQgeYhJ8nzPnL57QQikv.png" /> <span>HUAWEI P系列</span>
				</div>
				<div class="all">
					<a href="#">查看所有</a>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="recommend">
				<img src="img/CLFvOhkt4pADCZ1fL3SR.jpg"> <img
					src="img/IbiIZ6IyMZUi4own40Kx.jpg"> <img
					src="img/SkTPMxTi2YhSN9kZBG5h.jpg"> <img
					src="img/SmZz7V1iqKhpjonlDkTu.png">
			</div>
			<h2>热销单品</h2>
			<div class="danping">
				<div class="img-left">
					<img src="img/6Q32lUUpIlHmS0nvTf5I.png">
				</div>
				<div class="img-right">
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<img src="img/428_428_1545877216682mp.png">
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
				</div>
			</div>
			<h2>精品推荐</h2>
			<div class="transmit">
				<div class="box">
					<div class="list-img">
						<a href="img/428_428_1555751874478mp.png"><img
							src="img/428_428_1555751874478mp.png"></a>
						<div class="describe">
							<p>HUAWEI MateBook 14</p>
							<p class="red">￥5999</p>
						</div>
					</div>
					<div class="list-img">
						<a href="img/428_428_1555751874478mp.png"><img
							src="img/428_428_1555751874478mp.png"></a>
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<a href="img/428_428_1555751874478mp.png"><img
							src="img/428_428_1555751874478mp.png"></a>
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<a href="img/428_428_1555751874478mp.png"><img
							src="img/428_428_1555751874478mp.png"></a>
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
					<div class="list-img">
						<a href="img/428_428_1555751874478mp.png"><img
							src="img/428_428_1555751874478mp.png"></a>
						<div class="describe">
							<p>荣耀V20</p>
							<p class="red">￥2699</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="toolbar">
			<a href="javascript:;" class="toolbar-item"> <span
				class="toolbar-btn" id="backtop"> <i
					class="toolbar-icon icon-upload2"></i><span
					class="toolbar-text">返回<br />顶部
				</span>
			</span>
			</a>
		</div>
	</div>
</body>
</html>