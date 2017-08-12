<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="common/head.jsp"%>
<title>知乎</title>
<style>
        .navbar-default {
            background-color: #ffffff;
            border-color: #ffffff;
        }

        .navbar-default .navbar-brand {
            color: #848484;
        }

        .navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus
        {
            color: #000000;
        }

        .navbar-default .navbar-text {
            color: #848484;
        }

        .navbar-default .navbar-nav>li>a {
            color: #848484;
        }

        .navbar-default .navbar-nav>li>a:hover, .navbar-default .navbar-nav>li>a:focus
        {
            color: #000000;
        }

        .navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:hover,
        .navbar-default .navbar-nav>.active>a:focus {
            color: #000000;
            background-color: #ffffff;
        }

        .navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:hover,
        .navbar-default .navbar-nav>.open>a:focus {
            color: #000000;
            background-color: #ffffff;
        }

        .navbar-default .navbar-toggle {
            border-color: #ffffff;
        }

        .navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus
        {
            background-color: #ffffff;
        }

        .navbar-default .navbar-toggle .icon-bar {
            background-color: #848484;
        }

        .navbar-default .navbar-collapse, .navbar-default .navbar-form {
            border-color: #848484;
        }

        .navbar-default .navbar-link {
            color: #848484;
        }

        .navbar-default .navbar-link:hover {
            color: #000000;
        }

        @media ( max-width : 767px) {
            .navbar-default .navbar-nav .open .dropdown-menu>li>a {
                color: #848484;
            }
            .navbar-default .navbar-nav .open .dropdown-menu>li>a:hover,
            .navbar-default .navbar-nav .open .dropdown-menu>li>a:focus {
                color: #000000;
            }
            .navbar-default .navbar-nav .open .dropdown-menu>.active>a,
            .navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover,
            .navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus {
                color: #000000;
                background-color: #ffffff;
            }
        }

        body {
            padding-top: 60px;
            background-color: #F5F5F5;
        }

        .my-zhihu {
            color: #1E90FF;
            font-size: 180%;
        }

        #name-div{
            margin-left: 8.5%;
            margin-right: 5%;
            padding-bottom: 60px;
            background-color: #ffffff;
        }

        #editor-people{
            float: right;
        }
        
        #my-panel {
            position: fixed;
            height: 230px;
            margin-top: auto;
            margin-left: 64%;
            padding-top: 11px;
            padding-left: 1%;
            padding-right: 2%;

        }

        #my-list-button {
            position: fixed;
            height: 230px;
            width: 300px;
            margin-top: 16%;
            margin-left: 64%;
        }
        #signature{
        	font-family: "Arial","Microsoft Yahei";
            margin-left: 2%;
			font-size: 20px;
            font-weight: 400;
        }
        
        #button-list-row{
        	margin-left:7%;
        }
        
        #userContent{
        	margin-left:8.5%;
        	margin-right:33%;
        }
        .mainContent{
        	padding-bottom:15px;
        }
        .contentTitle{
        	font-weight:900;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <a class="navbar-brand"
                                                           href="${APP_PATH}"><span class="my-zhihu">知乎</span></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${APP_PATH}">首页</a></li>
                <li><a href="#about">发现</a></li>
                <li><a href="#contact">话题</a></li>
            </ul>

            <form class="navbar-form navbar-left" method="post" action="/search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>

          <ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          		<span class="glyphicon glyphicon glyphicon-user" aria-hidden="true"></span> ${user.name} <span class="caret"></span>
          	</a>
          	<ul class="dropdown-menu">
	            <li><a href="${APP_PATH}/people/${user.id}">我的主页</a></li>
	            <li><a href="#">设置</a></li>
	            <li><a href="${APP_PATH}/login/out">退出</a></li>
            </ul>
        	</li>
         </ul>
        </div>
    </div>
</nav>


<div class="container theme-showcase"  id="mine-message">
    <div class="jumbotron" id="name-div">
        <h2 style="font-weight:bold">${user.name}<span id="signature" >${user.signature}</span></h2>
        <button class="btn btn-default" id="editor-people" data-toggle="modal" data-target="#myModal">编辑个人资料</button>
    </div>
</div>

<!-- 面板 -->
<div class="panel panel-default" id="my-panel">
    <div class="panel-body">
        <button type="button" class="btn btn-link btn-lg">
            <span class="glyphicon glyphicon-flash" aria-hidden="true"></span>
            <h4>Live</h4>
        </button>
        <button type="button" class="btn btn-link btn-lg">
            <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
            <h4>书店</h4>
        </button>
        <button type="button" class="btn btn-link btn-lg">
            <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
            <h4>圆桌</h4>
        </button>
        <br />
        <button type="button" class="btn btn-link btn-lg">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            <h4>专栏</h4>
        </button>
        <button type="button" class="btn btn-link btn-lg">
            <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
            <h4>付费咨询</h4>
        </button>
    </div>
</div>

<!-- 列表组 -->
<div id="my-list-button">
    <div class="list-group">
        <button type="button" class="list-group-item" onclick="collectButton()">
            <span class='glyphicon glyphicon-star'></span>&nbsp;&nbsp;我的收藏 <span
                class="badge">14</span>
        </button>

        <button type="button" class="list-group-item" onclick="copyText()">
            <span class='glyphicon glyphicon-question-sign'></span>&nbsp;&nbsp;我关注的问题
            <span class="badge">14</span>
        </button>
        <button type="button" class="list-group-item">
            <span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;我的邀请 <span
                class="badge">3</span>
        </button>
        <button type="button" class="list-group-item">
            <span class='glyphicon glyphicon-oil'></span>&nbsp;&nbsp;我的礼券 <span
                class="badge">14</span>
        </button>
        <button type="button" class="list-group-item">
            <span class='glyphicon glyphicon-transfer'></span>&nbsp;&nbsp;社区服务中心
        </button>
        <button type="button" class="list-group-item">
            <span class='glyphicon glyphicon-copyright-mark'></span>&nbsp;&nbsp;版权服务中心
        </button>
        <button type="button" class="list-group-item">
            <span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;公共编辑状态
        </button>
    </div>
</div>


<div class="container">
<div class="btn-group  btn-group-lg btn-lg" role="group" id="button-list-row">
  <button type="button" class="btn btn-group-lg" id="dynamic">动态</button>
  <button type="button" class="btn btn-group-lg" id="answer">回答</button>
  <button type="button" class="btn btn-group-lg" id="question">提问</button>
  <button type="button" class="btn btn-group-lg" id="article">文章</button>
  <button type="button" class="btn btn-group-lg" id="Column">专栏</button>
  <button type="button" class="btn btn-group-lg" id="share">分享</button>
  <button type="button" class="btn btn-group-lg" id="share">收藏</button>
  <button type="button" class="btn btn-group-lg" id="share">关注</button>
</div>
</div>

<div class="container">
	<div class="panel panel-default" id="userContent">
	  <div class="panel-heading" id="my-title">我的动态</div>
	  <div class="panel-body" id="my-content"></div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
        <span style="color:grey;">请在需要修改的信息上直接修改，然后点击后面的"修改xxx"即可</span>
      </div>
      
      <!-- 修改主体 -->
      <div class="modal-body">
    	<div class="form-group">
			<input type="text" class="form-control" id="userName" placeholder="用户名" value="${user.name}" style="width:300px;float:left;margin-right:20px;"/>
			<button class="btn btn-success" id="changeUserName" >修改用户名</button>
			<span style="color:red;" class="checkName"></span>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="userPassword" placeholder="密码" value="${user.password}" style="width:300px;float:left;margin-right:20px;"/>
			<button class="btn btn-success" id="changeUserPassword">修改密码</button>
			<span style="color:red;" class="checkPassword"></span>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="userSignature" placeholder="你还没有设置个性签名" value="${user.signature}" style="width:300px;float:left;margin-right:20px;"/>
			<button class="btn btn-success" id="changeUserSignature">修改个性签名</button>
			<span style="color:red;" class="checkSignature"></span>
		</div>
      </div>
      <!-- 底部按钮 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">保存修改</button>
      </div>
      
    </div>
  </div>
</div>
<script type="text/javascript">
var questions;
var answers;
var collects;

var userId = ${user.id};

$(document).ready(function() {
    $.get("${APP_PATH}/people/userAllMessage", {
        "userId": userId
    },
    function(response, status, xhr) {
        questions = response.extend.questionPage.list;
        answers = response.extend.answerPage.list;
        if (response.extend.collectAnswerPage != null) {
            collects = response.extend.collectAnswerPage.list;
        }
        //取得数据先放到"动态"这一栏里
        $.each(answers,
        function(index, item) {
            var answerQuestion = $("<h4 class='contentTitle'></h4>").append(item.question);

            //问题链接
            var href = $("<a style='text-decoration:none;'></a>").attr("href", "${APP_PATH}/question/" + item.questionId).append(answerQuestion);
            var answerContent = $("<p></p>").append(item.part);
            var mydiv = $("<div class='mainContent'></div>").append(href).append(answerContent).append("<hr/>").appendTo("#my-content");
        });
    });
});

//点击回答按钮的时候
function answerButton() {
    $("#my-content").empty();
    $.each(answers,
    function(index, item) {
        //问题标题
        var answerQuestion = $("<h4 class='contentTitle'></h4>").append(item.question);
        //问题链接
        var href = $("<a style='text-decoration:none;'></a>").attr("href", "${APP_PATH}/question/" + item.questionId).append(answerQuestion);
        var answerContent = $("<p></p>").append(item.part);
        var mydiv = $("<div class='mainContent'></div>").append(href).append(answerContent).append("<hr/>").appendTo("#my-content");
    });
}
//点击提问按钮的时候
function questionButton() {
    $("#my-title").text("我的提问");
    $("#my-content").empty();
    $.each(questions,
    function(index, item) {
        //问题名
        var myTitle = $("<h4 class='contentTitle'></h4>").append(item.title);
        //问题链接
        var href = $("<a style='text-decoration:none;'></a>").attr("href", "${APP_PATH}/question/" + item.id).append(myTitle);
        //问题描述
        var myContent = $("<p></p>").append(item.tDescribe);
        //容器
        var mydiv = $("<div class='mainContent'></div>").append(href).append(myContent).append("<hr/>").appendTo("#my-content");
    });
}

//点击收藏按钮的时候
function collectButton() {
    $("#my-title").text("我的收藏");
    $("#my-content").empty();
    if (collects != null) {
        $.each(collects,
        function(index, item) {
            //问题标题
            var answerQuestion = $("<h4 class='contentTitle'></h4>").append(item.question);
            //问题链接
            var href = $("<a style='text-decoration:none;'></a>").attr("href", "${APP_PATH}/question/" + item.questionId).append(answerQuestion);
            var answerContent = $("<p></p>").append(item.part);
            var mydiv = $("<div class='mainContent'></div>").append(href).append(answerContent).append("<hr/>").appendTo("#my-content");
        });
    }
}

//按钮点击时判断那个按钮被点击，并调用相关方法
$("button").click(function() {
    var activeTab = $(this).text();
    switch (activeTab) {
    case "动态":
        $("#my-title").text("我的动态");
        $("#my-content").text("通过js拿到的数据 - 动态");
        break;
    case "回答":
        answerButton();
        break;
    case "提问":
        questionButton();
        break;
    case "文章":
        $("#my-title").text("我的文章");
        $("#my-content").text("通过js拿到的数据 -文章");
        break;
    case "专栏":
        $("#my-title").text("我的专栏");
        $("#my-content").text("通过js拿到的数据 -专栏");
        break;
    case "分享":
        $("#my-title").text("我的分享");
        $("#my-content").text("通过js拿到的数据 -分享");
        break;
    case "收藏":
        collectButton();
        break;
    case "关注":
        $("#my-title").text("我的关注");
        $("#my-content").text("通过js拿到的数据 -关注");
        break;
    }

});

 //修改用户名
$("#changeUserName").click(function() {
	
	$(".checkName").text("");
	
    //用户名检测正则表达式
    var regName = /[A-Za-z0-9\u4e00-\u9fa5]{2,18}/;
    //获取用户名
    var userName = $.trim($("#userName").val());
    if (userName == "" || !regName.test(userName)) {
        $(".checkName").text("用户名格式不正确，用户名可以包含汉字，字母和数字，长度在2-18个字符，不能包含特殊字符");
    } else {
        $(".checkName").text("");

        $.get("${APP_PATH}/people/changeUserMessage", {
            "userId": userId,
            "userName": userName
        },
        function(response, status, xhr) {
            if (response == 0) {
            	$(".checkName").text("修改失败");
                //window.location.href = "${APP_PATH}/people/" + userId;
            } else {
            	$(".checkName").text("修改成功");
                //window.location.href = "${APP_PATH}/people/" + userId;
            }
        });
    }
});

//修改密码
$("#changeUserPassword").click(function() {
    //密码检测正则表达式
    var regPassword = /[A-Za-z0-9]{6,18}/;
    //获取用户名
    var userPassword = $.trim($("#userPassword").val());
    if (userPassword == "" || !regPassword.test(userPassword)) {
        $(".checkPassword").text("密码格式不正确，密码可以包含数字及大小写字母，不能包含特殊字符,长度在6-18位之间");
    } else {
        $(".checkPassword").text("");

        $.get("${APP_PATH}/people/changeUserMessage", {
            "userId": userId,
            "userPassword": userPassword
        },
        function(response, status, xhr) {
            if (response == 0) {
                alert("修改失败，请稍后重试");
                //window.location.href = "${APP_PATH}/people/" + userId;
            } else {
                alert("修改成功");
                //window.location.href = "${APP_PATH}/people/" + userId;
            }
        });
    }
});

//修改个性签名
$("#changeUserSignature").click(function() {
    //获取用户名
    var userSignature = $.trim($("#userSignature").val());

    if (userSignature != "") {
        $.get("${APP_PATH}/people/changeUserMessage", {
            "userId": userId,
            "userSignature": userSignature
        },
        function(response, status, xhr) {
            if (response == 0) {
                alert("修改失败，请稍后重试");
                //window.location.href = "${APP_PATH}/people/" + userId;
            } else {
                alert("修改成功");
                //window.location.href = "${APP_PATH}/people/" + userId;
            }
        });
    }
}); 

/* $("#submit-button").click(function() {
	userId = ${user.id}
	var regName = /[A-Za-z0-9\u4e00-\u9fa5]{2,18}/;
	var regPassword = /[A-Za-z0-9]{6,18}/;
	
	var newName = $.trim($("#changeUserName").val());
	var newSignature = $.trim($("#changeUserSignature").val());
	var newPassword = $.trim($("#changeUserPassword").val());
	
	//检查用户名是否修改正确
    if (newName != "") {
        if (!regName.test(newName)) {
            $(".checkName").text("用户名格式不正确，用户名可以包含汉字，字母和数字，长度在2-18个字符，不能包含特殊字符");
        }
    }
    
 	//检查用密码是否修改正确
    if (newPassword != "") {
        if (!regPassword.test(newPassword)) {
            $(".checkPassword").text("密码格式不正确，密码可以包含字母和数字，长度在6-18个字符，不能包含特殊字符");
        }
    }
 	
 	//只修改用户名
  	if (newName != "" && newSignature == "" && newPassword == "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newName":newName
		},function(response, status, xhr){
			if(response == 0){
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}
 	
 	//只修改个性签名
  	else if (newSignature != "" && newName == "" && newPassword == "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newSignature":newSignature
		},function(response, status, xhr){
			if(response == 1){
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}  
 	
 	//只修改密码
  	else if (newPassword != "" && newName == "" && newSignature == "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newPassword":newPassword
		},function(response, status, xhr){
			if(response == 1){
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}
  	
 	//修改用户名及个性签名
  	else if (newName != "" && newSignature != "" && newPassword == "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newName":newName,
			"newSignature":newSignature
		},function(response, status, xhr){
			if(response == 1){
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}
 	
 	//修改用户名及密码
 	else if (newName != "" && newSignature == "" && newPassword != "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newName":newName,
			"newPassword":newPassword
		},function(response, status, xhr){
			if(response == 1){
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}
 	
 	//修改密码及个性签名
  	else if (newName != "" && newSignature == "" && newPassword != "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newPassword":newPassword,
			"newSignature":newSignature
		},function(response, status, xhr){
			if(response == 1){
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}
 	
 	//修改用户名及个性签名及密码
  	else if (newName != "" && newSignature != "" && newPassword != "") {
		$.get("${APP_PATH}/people/changeUserMessage",{
			"userId":userId,
			"newName":newName,
			"newSignature":newSignature,
			"newPassword":newPassword
		},function(response, status, xhr){
			if(response == 1){
				alert("修改成功");
				window.location.href = "${APP_PATH}/people/" + userId;
			} else {
				alert("修改失败，请稍后重试");
				window.location.href = "${APP_PATH}/people/" + userId;
			}
		});
	}
}); */
</script>
</body>
</html>








