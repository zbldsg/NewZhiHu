<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@include file="common/head.jsp"%>
<title>Title</title>
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

#checkName, #checkPassword {
	color: red;
}

.checkPhone, .checkName, .checkPassword, .checkPassword2 {
	color: red;
}

#inputSubmit {
	padding-right: 135px;
	padding-left: 135px;
}

#login-botton{
	color: grey;
	float:right;
}

</style>

<script type="text/javascript">
$(document).ready(function() {

    var regName = /[A-Za-z0-9\u4e00-\u9fa5]{2,18}/;
    var regPhone = /^1[3|4|5|7|8][0-9]{9}$/;
    var regPassword = /[A-Za-z0-9]{6,18}/;

    $("#inputPhone").blur(function() {
        var phone = $.trim($("#inputPhone").val());
        if (phone == "") {
            $(".checkPhone").text("手机号不能为空");
        } else {
            $(".checkPhone").text("");
            if (regPhone.test(phone)) {
                $.get("${APP_PATH}/register/phoneCheck", {
                    "phone": phone
                },
                function(response, status, xhr) {
                    if (response == 0) {
                        $(".checkPhone").text("");
                    } else {
                        $(".checkPhone").text("手机号已存在");
                    }
                });
            } else {
                $(".checkPhone").text("手机号不合法");
            }
        }
    });

    $("#inputName").blur(function() {
        var name = $.trim($("#inputName").val());
        if (name == "") {
            $(".checkName").text("用户名不能为空");
        } else {
            $(".checkName").text("");
            if (!regName.test(name)) {
                $(".checkName").text("用户名格式不正确，用户名可以包含汉字，字母和数字，长度在2-18个字符，不能包含特殊字符");
            }
        }
    });

    $("#inputPassword").blur(function() {
        var password = $.trim($("#inputPassword").val());
        if (password == "") {
            $(".checkPassword").text("密码不能为空");
        } else {
            $(".checkPassword").text("");
            if (!regPassword.test(password)) {
                $(".checkPassword").text("密码格式不正确，密码可以包含字母和数字，长度在6-18个字符，不能包含特殊字符");
            }
        }
    });

    $("#inputPassword2").blur(function() {
        var password2 = $.trim($("#inputPassword2").val());
        if (password2 == "") {
            $(".checkPassword2").text("密码不能为空");
        } else {
            $(".checkPassword2").text("");
            if (!regPassword.test(password2)) {
                $(".checkPassword2").text("密码格式不正确，密码可以包含字母和数字，长度在6-18个字符，不能包含特殊字符");
            } else {
                $(".checkPassword2").text("");
                var password = $.trim($("#inputPassword").val());
                if (password2 != password) {
                    $(".checkPassword2").text("两次密码输入不正确");
                }
            }
        }
    });

    $("#inputSubmit").click(function() {
        var phone = $.trim($("#inputPhone").val());
        var name = $.trim($("#inputName").val());
        var password = $.trim($("#inputPassword").val());
        var password2 = $.trim($("#inputPassword2").val());

        if (phone == "" || name == "" || password == "" || password2 == "" || password != password2) {
            alert("请重新输入");
        } else {

            if (regPhone.test(phone) && regName.test(name) && regPassword.test(password) && regPassword.test(password2)) {
                $.get("${APP_PATH}/register/registerCheck", {
                    "phone": phone,
                    "name": name,
                    "password": password
                },
                function(response, status) {
                    if (response == 0) {
                        alert("注册失败，请重试");
                    }
                    if (response == 1) {
                        window.location.href = "${APP_PATH}";
                    }
                });
            } else {
                alert("请重新输入");
            }
        }
    });
});
</script>
</head>

<body>
	<div class="container-fluid">
		<form class="form-signin">
			<h1 class="title">知乎</h1>
			<h2 class="form-signin-heading">与世界分享你的知识、经验和见解</h2>

			<!-- 检查电话 -->
			<span class="checkPhone"></span> <input type="text" id="inputPhone"
				class="form-control" placeholder="手机号" required autofocus>

			<!-- 检查姓名 -->
			<span class="checkName"></span> <input type="text" id="inputName"
				class="form-control" placeholder="用户名" required autofocus>

			<!-- 检查密码 -->
			<span class="checkPassword"></span> <input type="password"
				id="inputPassword" class="form-control" placeholder="密码" required>

			<!-- 检查两次密码是否一样 -->
			<span class="checkPassword2"></span> <input type="password"
				id="inputPassword2" class="form-control" placeholder="确认密码" required>

			<br> <input id="inputSubmit" type="button"
				class="btn btn-default" value="注册"> <br> <span
				id="register">点击「注册」按钮，即代表你同意《知乎协议》</span>
				<br/><br/>
			<div id="login-botton">
			<span id="login-span">已有账号,点此</span>
			<a id="login" class="btn btn-default"
				href="${APP_PATH}/zhihu/login">登录</a>
			</div>
		</form>


	</div>

</body>
</html>