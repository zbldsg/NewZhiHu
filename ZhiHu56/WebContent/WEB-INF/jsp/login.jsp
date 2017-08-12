<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@include file="common/head.jsp"%>
<title>登录</title>
<style>
.title {
	margin-bottom: 10px;
	font-size: 60px;
	color: #1E90FF;
}

body {
	padding-top: 40px;
	padding-bottom: 40px;
}

button {
	color: #1E90FF;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
	font-size: 18px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	margin-top: 5px;
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

#checkPhone, #checkPassword {
	color: red;
}

#checkLogin {
	padding-right:135px;
	padding-left:135px;
}

/* #register{
	margin-left:83%;
}

#register-span{
	color: grey;
	float:right;
	margin-top:2%;
	margin-bottom:2%;
} */

#rigister-botton{
	color: grey;
	float:right;
}

</style>
<!-- 检查手机号是否存在 -->
<script>
	$(document).ready(function() {
		$("#inputPhone").blur(function() {
			var phone = $(this).val();
			var phone = $.trim(phone);
			if (phone == "") {
				$("#checkPhone").text("手机号不能为空");
			} else {
				$.get("${APP_PATH}/login/phoneCheck", {
					"phone" : phone
				}, function(response, status, xhr) {
					if (response == 0) {
						$("#checkPhone").text("手机号不存在");
					} else {
						$("#checkPhone").text("");
					}
				});
			}
		});

		$("#checkLogin").click(function() {
			var phone = $("#inputPhone").val();
			var password = $("#inputPassword").val();
			var password = $.trim(password);

			if (password == "") {
				$("#checkPassword").text("密码不能为空");
				return;
			}
			
			$.get("${APP_PATH}/login/loginCheck", {
				"phone" : phone,
				"password" : password
			}, function(response, status) {
				if (response == 0) {
					alert("密码不正确");
				}
				if (response == 1) {
					//判断记住密码的checkbox是否选中，如果选中就写入cookie。
					var isChoose = $("#isChoose").is(':checked');
					if(isChoose){
						 $.cookie('phone', phone, { expires: 7, path: '/' });
						 $.cookie('password', password, { expires: 7, path: '/' });
					}
					window.location.href = "${APP_PATH}";
				}
			})

		});

	});
	
</script>
</head>

<body>
	<div class="container-fluid">
		<form class="form-signin">

			<h1 class="title">知乎</h1>
			<h2 class="form-signin-heading">与世界分享你的知识、经验和见解</h2>

			<!-- ajax检查手机号是否合法 -->
			<span id="checkPhone"></span> <input type="text" id="inputPhone"
				class="form-control" placeholder="手机号" required autofocus>

			<!-- ajax检查密码是否合法 -->
			<span id="checkPassword"></span> <input type="password"
				id="inputPassword" class="form-control" placeholder="密码" required>
			<div class="checkbox">
				<label> <input type="checkbox" id="isChoose">记住密码
				</label>
			</div>
			<input id="checkLogin" type="button" class="btn btn-default" value="登录">
			<br/><br/>
			<div id="rigister-botton">
				<span>还没有账号,点此</span>
				<a class="btn btn-default" href="${APP_PATH}/zhihu/register">注册</a>
			</div>
		</form>
	</div>
	
</body>
</html>