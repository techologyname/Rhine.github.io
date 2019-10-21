/**
 * 
 */
	function updateCart(idVal,obj) {
		var quantityVal = $.trim(obj.value);
		var flag = false;
		
		var $tr = $(obj).parent().parent();
		var title = $.trim($tr.find("td:first").text());
		var reg = /^\d+$/g;
		if(quantityVal == 0){
			alert("商品数量不能为0!");
			$(this).val($(obj).attr("step"));
			return;
		}
		if(reg.test(quantityVal)){
			quantity = parseInt(quantityVal);
			if(quantity >= 0){
				flag = true;
			}	
		}else{
			alert("输入的数量不合法!");
			$(obj).val($(obj).attr("step"));
			return;
		}
		
		var flag = confirm("确定要修改" + title + "的数量吗?");
		if(flag){	
			//2. 请求地址为: commodityService
			var url = "commodityService";
			//3. 请求参数为: method:updateItemQuantity, id:name属性值, quantity:val, time:new Date()
			/*var idVal = $.trim(this.name);*/
			var args = {"id":idVal, "quantity":quantityVal, "time":new Date()};
			//4. 在 updateItemQuantity 方法中, 获取 quanity, id, 再获取购物车对象, 调用 service 的方法做修改
			//5. 传回 JSON 数据: commodityNumber:xx, totalMoney
			//6. 更新当前页面的 commodityNumber 和 totalMoney
			$.post(url, args, function(data){
				if(data == "yes"){
					window.location.href="cart.jsp";
				}
			},"text");
		}
	}
	 
	function deleteCartItem(idVal,obj) {
		var $tr = $(obj).parent().parent();
		var title = $.trim($tr.find("td:first").text());
		var flag = confirm("确定要删除" + title + "吗?");
		if(flag){
			var id = $.trim($(this).parent().parent().children("#productImg").attr("alt"));
			$.post("remove", {"id":idVal}, function(data){
				alert("删除成功！！！");
				if(data=="yes"){
					window.location.href="cart.jsp";
				}else {
					window.location.href = "emptycart.jsp";
				}
			},"text");
		}
	}

