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

.my-zhihu-font {
	color: #1E90FF;
	font-size: 180%;
}

.my-question-answer-button {
	width: 66%;
	height: 7px;
	padding-left: 19%;
	padding-right: 1%;
}

#double-button {
	padding-top: 8px;
}

#name-div {
	margin-left: 8.5%;
	margin-right: 5%;
	padding-bottom: 60px;
	background-color: #ffffff;
}

#sendMessage {
	margin-left: 1%;
}

#middle-button {
	margin-left: 80%;
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

#signature {
	margin-left: 2%;
	font-size: 15px;
	font-weight: 600;
}

#button-list-row {
	margin-left: 7%;
}

#userContent {
	margin-left: 8.5%;
	margin-right: 33%;
}

.mainContent {
	padding-bottom: 15px;
}

.contentTitle {
	font-weight: 900;
}
</style>
</head>
<body>


	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <a class="navbar-brand"
					href="${APP_PATH}"><span class="my-zhihu-font">知乎</span></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${APP_PATH}">首页</a></li>
					<li><a href="#about">发现</a></li>
					<li><a href="#contact">话题</a></li>
				</ul>
				<form class="navbar-form navbar-left" method="post" action="/search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search" />
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<div id="double-button">
						<a class="btn btn-default" href="${APP_PATH}/zhihu/login">登录</a> <a
							class="btn btn-primary" href="${APP_PATH}/zhihu/register">加入知乎</a>
					</div>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container theme-showcase" id="mine-message">
		<div class="jumbotron" id="name-div">
			<h2 style="font-weight: bold">${user.name}<span id="signature">${user.signature}</span>
			</h2>
			<div id="middle-button">
				<button class="btn btn-primary" id="attention">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>关注他
				</button>
				<button class="btn btn-default" id="sendMessage">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>发私信
				</button>
			</div>
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
			<button type="button" class="list-group-item"
				onclick="collectButton()">
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
		<div class="btn-group  btn-group-lg btn-lg" role="group"
			id="button-list-row">
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


	<script type="text/javascript">
		var questions;
		var answers;
		var collects;

		userId = $
		{
			user.id
		};
		$(document).ready(
				function() {
					$.get("${APP_PATH}/people/userAllMessage", {
						"userId" : userId
					}, function(response, status, xhr) {
						questions = response.extend.questionPage.list;
						answers = response.extend.answerPage.list;
						if (response.extend.collectAnswerPage != null) {
							collects = response.extend.collectAnswerPage.list;
						}
						//取得数据先放到"动态"框里
						$.each(answers, function(index, item) {
							var answerQuestion = $(
									"<h4 class='contentTitle'></h4>").append(
									item.question);
							//问题链接
							var href = $(
									"<a style='text-decoration:none;'></a>")
									.attr(
											"href",
											"${APP_PATH}/question/"
													+ item.questionId).append(
											answerQuestion);
							var answerContent = $("<p></p>").append(item.part);
							var mydiv = $("<div class='mainContent'></div>")
									.append(href).append(answerContent).append(
											"<hr/>").appendTo("#my-content");
						});
					});
				});

		//点击回答按钮的时候
		function answerButton() {
			$("#my-content").empty();
			$.each(answers, function(index, item) {
				//问题标题
				var answerQuestion = $("<h4 class='contentTitle'></h4>")
						.append(item.question);
				//问题链接
				var href = $("<a style='text-decoration:none;'></a>").attr(
						"href", "${APP_PATH}/question/" + item.questionId)
						.append(answerQuestion);
				var answerContent = $("<p></p>").append(item.part);
				var mydiv = $("<div class='mainContent'></div>").append(href)
						.append(answerContent).append("<hr/>").appendTo(
								"#my-content");
			});
		}
		//点击提问按钮的时候
		function questionButton() {
			$("#my-title").text("我的提问");
			$("#my-content").empty();
			$.each(questions, function(index, item) {
				//问题名
				var myTitle = $("<h4 class='contentTitle'></h4>").append(
						item.title);
				//问题链接
				var href = $("<a style='text-decoration:none;'></a>").attr(
						"href", "${APP_PATH}/question/" + item.id).append(
						myTitle);
				//问题描述
				var myContent = $("<p></p>").append(item.tDescribe);
				//容器
				var mydiv = $("<div class='mainContent'></div>").append(href)
						.append(myContent).append("<hr/>").appendTo(
								"#my-content");
			});
		}

		//点击收藏按钮的时候
		function collectButton() {
			$("#my-title").text("我的收藏");
			$("#my-content").empty();
			if (collects != null) {
				$.each(collects, function(index, item) {
					//问题标题
					var answerQuestion = $("<h4 class='contentTitle'></h4>")
							.append(item.question);
					//问题链接
					var href = $("<a style='text-decoration:none;'></a>").attr(
							"href", "${APP_PATH}/question/" + item.questionId)
							.append(answerQuestion);
					var answerContent = $("<p></p>").append(item.part);
					var mydiv = $("<div class='mainContent'></div>").append(
							href).append(answerContent).append("<hr/>")
							.appendTo("#my-content");
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
	</script>
</body>
</html>








