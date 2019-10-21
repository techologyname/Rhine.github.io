
			$(function() {
				var spacing = 170; //定义保存间距的变量
				function createControl(src) { //定义创建控制图片的函数
					return $('<img/>')
						.attr('src', src) //设置图片的来源
						.attr("width", 170)
						.attr("height", 170)
						.addClass('control')
						.css('opacity', 0.6) //设置透明度file:///G:/jq/第五章/06.jpg
						.css('display', 'none'); //默认为不显示
				}

				var $leftRollover = createControl('../img/left.gif'); //创建向左移动的控制图片
				var $rightRollover = createControl('../img/right.gif'); //创建向左移动的控制图片

				$('#list-img').css({ //改变图像传送带容器的CSS样式
					'width': spacing * 3,
					'height': '70px',
					'overflow': 'hidden' //溢出时隐藏
				}).find('.box a').css({
					'float': 'none',
					'position': 'absolute', //设置为绝对布局
					'left': 1000 //将左边距设置为1000，目的是不显示
				});

				var setUpbox = function() {
					var $box = $('#list-img .box a');
					$box.unbind('click mouseenter mouseleave'); //移除绑定的事件

					//左边的图片
					$box.eq(0)
						.css('left', 0)
						.click(function(event) {
							$box.eq(0).animate({
								'left': spacing
							}, 'fast'); //为第一张图片添加动画
							$box.eq(1).animate({
								'left': spacing * 2
							}, 'fast'); //为第二张图片添加动画
							$box.eq(2).animate({
								'left': spacing * 3
							}, 'fast'); //为第三张图片添加动画
							$box.eq($box.length - 1)
								.css('left', -spacing) //设置左边距
								.animate({
									'left': 0
								}, 'fast', function() {
									$(this).prependTo('#list-img .box');
									setUpbox();
								}); //添加动画

							event.preventDefault(); //取消事件的默认动作
						}).hover(function() { //设置鼠标的悬停事件
							$leftRollover.appendTo(this).fadeIn(200); //显示向左移动的控制图片
						}, function() {
							$leftRollover.fadeOut(200); //隐藏向左移动的控制图片
						});
					//右边图片
					$box.eq(2)
						.css('left', spacing * 2) //设置左边距
						.click(function(event) { //绑定单击事件
							$box.eq(0) //获取左边的图片，也就是第一张图片
								.animate({
									'left': -spacing
								}, 'fast', function() {
									$(this).appendTo('#list-img .box');
									setUpbox();
								}); //添加动画
							$box.eq(1).animate({
								'left': 0
							}, 'fast'); //添加动画
							$box.eq(2).animate({
								'left': spacing
							}, 'fast'); //添加动画
							$box.eq(3)
								.css('left', spacing * 3) //设置左边距
								.animate({
									'left': spacing * 2
								}, 'fast'); //添加动画

							event.preventDefault(); //取消事件的默认动作
						}).hover(function() { //设置鼠标的悬停事件
							$rightRollover.appendTo(this).fadeIn(200); //显示向右移动的控制图片
						}, function() {
							$rightRollover.fadeOut(200); //隐藏向右移动的控制图片
						});
					//中间图片
					$box.eq(1).css('left', spacing); //设置中间图片的左边距
				};
				setUpbox();
				$("a").attr("target", "_blank"); //查看原图时，在新的窗口中打开
			});