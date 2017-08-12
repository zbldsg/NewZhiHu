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

.my-question-answer-button {
	width: 66%;
	height: 7px;
	padding-left: 19%;
	padding-right: 1%;
}

#my-panel {
	position: fixed;
	height: 230px;
	margin-left: 66%;
	padding-left: 1%;
	padding-right: 2%;
	padding-top: 11px;
	margin-top: auto;
}

#my-list-button {
	position: fixed;
	height: 230px;
	width: 300px;
	margin-top: 16%;
	margin-left: 66%;
}

.my-content {
	margin-top: 1%;
	margin-left: 19%;
	margin-right: 35%;
	background-color: white;
	padding-top: 1%;
	padding-bottom: 1%;
	padding-right: 4%;
	padding-left: 4%;
	font-family: sans-serif;
}

#exampleModalLabel {
	padding-left: 30%;
}

#modal-title-span {
	color: grey;
}

#title-span, #topic-span {
	color: red;
}

.jackson-content {
	margin-top: 4%;
}

#questionHref {
	text-decoration: none;
}

.name {
	font-weight: bold;
}

#bottom-button {
	float: right;
	margin-left: 19%;
	margin-right: 35%;
}

#bottom-button-div {
	padding-top: 10px;
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
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> <span
								class="glyphicon glyphicon glyphicon-user" aria-hidden="true"></span>
								${user.name} <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="${APP_PATH}/people/${user.id}">我的主页</a></li>
								<li><a href="#">设置</a></li>
								<li><a href="${APP_PATH}/login/out">退出</a></li>
							</ul></li>
					</ul>
				</ul>
			</div>
		</div>
	</nav>
	<!--提问和回答按钮 -->
	<div class="my-question-answer-button">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" data-toggle="modal" data-target="#exampleModal"> 
						<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
						提问 &nbsp;
					</a>
					<a class="navbar-brand" href="#"> <span
						class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 回答
						&nbsp;
					</a> <a class="navbar-brand" href="#"> <span
						class="glyphicon glyphicon-edit" aria-hidden="true"></span> 写文章
						&nbsp;
					</a>
				</div>
			</div>
		</nav>
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
			<a href="${APP_PATH}/people/${user.id}" style="text-decoration:none;">
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;我的收藏 <span
					class="badge">14</span>
			</button></a>
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-question-sign"></span>&nbsp;&nbsp;我关注的问题
				<span class="badge">14</span>
			</button>
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;我的邀请 <span
					class="badge">3</span>
			</button>
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-oil"></span>&nbsp;&nbsp;我的礼券 <span
					class="badge">14</span>
			</button>
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-transfer"></span>&nbsp;&nbsp;社区服务中心
			</button>
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;&nbsp;版权服务中心
			</button>
			<button type="button" class="list-group-item">
				<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;公共编辑状态
			</button>
		</div>
	</div>
	
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div id="exampleModalLabel">
						<h3 class="modal-title">&nbsp;&nbsp;&nbsp;&nbsp;写下你的问题</h3>
						<span id="modal-title-span">&nbsp;&nbsp;描述精确的问题更易得到解答</span>
					</div>
				</div>
				<!-- 输入框主体共三个 -->
				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="text" class="form-control" id="title"
								placeholder="问题标题" /> <span id="title-span"></span>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="topic"
								placeholder="添加话题" /> <span id="topic-span"></span>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">问题描述(可选)：</label>
							<textarea class="form-control" id="tDescribe"
								placeholder="问题背景、条件等详细信息"></textarea>
						</div>
					</form>
				</div>
				<!-- 提交按钮 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="submit-button">提交问题</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 回答的内容 -->
	<div class="jackson-content"></div>

	<!-- 底部状态栏 -->
	<div id="my-hidden-div"></div>

	<script type="text/javascript">
	//声明一个全局变量
	var jsonDataList;
	var jsonCollectList;
	var pn = 1;
	var userId = ${user.id};
	//定义一个变量代表json取得的数据，如果等于false就不使用滑动去的数据了
	var hasNext = true;

	//jQuery 函数
	$(document).ready(function() {
	    to_page(pn);
	});

	//AJAX 取得json数据
	function to_page(pageNum) {
	    $.get("${APP_PATH}/zhihu/loginJsonQuestion", {
	        "pageNum": pageNum,
	        "userId":userId
	    },
	    function(response, status, xhr) {
	        if (pageNum == 1) {
	            //如果是第一次请求那就让直接赋值后调用
	            jsonDataList = response.extend.answerPage.list;
	            jsonCollectList = response.extend.collectPage.list;
	            build_question_answer(jsonDataList);
	        } else {

	            //如果不是第一次请求就会，判断后面服务器还有没有数据，如果有再构建
	            if (response.extend.pageInfo.list.length != 0) {

	                //这时jsonDataList需要跟后来取得的数据合并
	                jsonDataList = jsonDataList.concat(response.extend.answerPage.list);
	                //传入合并后的数据构建
	                build_question_answer(jsonDataList);
	            } else {
	        		//如果没有就将hasNext设为false，下次滚动到底部不再取数据
	        		hasNext = false;
	        	}
	        }

	    });
	}

	//构建内容列表,接收jsonList
	function build_question_answer(entity) {
	    //每次构建先清空,不然会构建重复
	    $(".jackson-content").empty();

	    $.each(entity,
	    function(index, item) {
	        //用来装每一条记录的容器
	        var contentList = $("<div class='my-content'></div>");

	        //问题的连接，用来加在问题里面
	        var a = $("<a id='questionHref'></a>").attr("href", "${APP_PATH}/question/" + item.questionId);
	        var href = a.append(item.question);

	      	//用户名
	        var entityUserName = $("<span class='name'></span>").append(item.userName);
	        //用户名链接
	        var peopleHref = $("<a style='text-decoration:none;'></a>").attr("href","${APP_PATH}/people/"+item.userId).append(entityUserName);
	        
	        //问题的名称
	        var entityQuestion = $("<h4 class='allAnswer'></h4>").append(href);
	        //添加一个隐藏字段用于保存index值
	        var indexSpan = $("<span class='indexSpan' hidden='hidden'></span>").append(index);
	        var unfold = $("<button type='button' class='btn btn-link' id='unfold' text-algin:right>阅读全文</button>").append(indexSpan);
	        //回答的部分
	        var entityPart = $("<p class='part'></p>").append(item.part == "" ? item.content: item.part).append(item.part == "" ? "": unfold);

	        //回答的时间
	        var entitydateTime = $("<p></p>").append(new Date(item.dateTime));

	        contentList.append(peopleHref).append(entityQuestion).append(entityPart).append(entitydateTime);

	        // 每篇文章下面的按钮 与图标
	        var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + item.likeNum);
	        var likeButton = $("<button type='button' class='btn btn-link'></button>").append(likeIcon);

	        var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'></span>").append(" 踩" + item.hateNum);
	        var hateButton = $("<button type='button' class='btn btn-link'></button>").append(hateIcon);

	        var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 评论");
	        var commentButton = $("<button type='button' class='btn btn-link'></button>").append(commentIcon);

	        var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
	        
	        //遍历所有收藏数据
	        $.each(jsonCollectList,function(num, model) {
	        	//当前回答的id
	        	var id = item.id;
	        	//收藏表中的回答id
	        	var cid = model.answerId;
	        	//如果当前的收藏表的回答id和这个id一样就说明已收藏
	        	if(id == cid){
	        		//将这个改为已收藏
	        		CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 已收藏");
	        	}
	        });
	        
	        var CollectionButton = $("<button type='button' class='btn btn-link'></button>").append(CollectionIcon);

	        var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢");
	        var thankButton = $("<button type='button' class='btn btn-link'></button>").append(thankIcon);

	        // 图标的集合
	        var buttonList = $("<div class='btn-group'></div>").append(likeButton).append(hateButton).append(commentButton).append(CollectionButton).append(thankButton);

	        contentList.append(buttonList).appendTo(".jackson-content");
	    });
	}

	//当点击全部展开按钮的时候，加载全部数据与底部状态栏
	$(document).on('click', '#unfold',function() {
	    //拿到当前问题在json中数组的下标位置
	    var index = $(this).children().text();
	    
	    var id = jsonDataList[index].id;

	    //通过下标值取得回答的内容
	    var content = jsonDataList[index].content;

	    //获取到显示部分内容字元素
	    var part = $(this).parent();
	    
	    //先删除评论条
	    $(this).parent().parent().children("div.btn-group").remove();

	    //将里面的部分内容替换为全部内容
	    part.html(content);
	    //隐藏字段用于储存index值
	    var indexSpan = $("<span class='indexSpan' hidden='hidden'></span>").append(index);
	    part.append(indexSpan);
	    
	    
	 // 生成状态栏的图标
	    var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + jsonDataList[index].likeNum);
	    var likeButton = $("<button type='button' class='btn btn-link' style='color:#4682B4'></button>").append(likeIcon);

	    var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'></span>").append(" 踩" + jsonDataList[index].hateNum);
	    var hateButton = $("<button type='button' class='btn btn-link' style='color:#4682B4'></button>").append(hateIcon);

	    var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 评论");
	    var commentButton = $("<button type='button' class='btn btn-link' style='color:#4682B4'></button>").append(commentIcon);

	   /*  var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
	    var CollectionButton = $("<button type='button' class='btn btn-link'></button>").append(CollectionIcon); */
	    
        var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
        
        //遍历所有收藏数据
        $.each(jsonCollectList,function(num, model) {
        	//收藏表中的回答id
        	var cid = model.answerId;
        	//如果当前的收藏表的回答id和这个id一样就说明已收藏
        	if(id == cid){
        		//将这个改为已收藏
        		CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 已收藏");
        	}
        });
        
        var CollectionButton = $("<button type='button' class='btn btn-link' style='color:#4682B4'></button>").append(CollectionIcon);

	    var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢");
	    var thankButton = $("<button type='button' class='btn btn-link' style='color:#4682B4'></button>").append(thankIcon);

	    var hiddenSpan = $("<span hidden='hidden' class='hiddenSpan'></span>").append(index);

	    var indexSpanNavbar = $("<span id='indexSpanNavbar' hidden='hidden' class='glyphicon glyphicon-chevron-up'></span>");
	    //
	    var closeButton = $("<button type='button' class='btn btn-link' id='closeButton' style='color:#4682B4'>收起 </button>").append(indexSpanNavbar);

	    // 图标的集合
	    var buttonList = $("<div id='bottom-button-div'></div>").append(likeButton).append(hateButton).append(commentButton).append(CollectionButton).append(thankButton).append(hiddenSpan).append(closeButton);

	    //生成状态栏，将图标添加上
	    var container = $("<div class='container'></div>").append(buttonList);
	    var bigContainer = $("<nav class='navbar navbar-default navbar-fixed-bottom' id='bottom-button'>").append(container).appendTo("#my-hidden-div");
	    

		
	});

	//当点击收起按钮的时候，收起状态栏并将全部内容替换为部分内容
	$(document).on('click', '#closeButton',function() {
	    //拿到父元素状态栏的子元素span的index值
	    var index = $(this).parent().children("span.hiddenSpan").text();
	    var part = jsonDataList[index].part;
	    var id = jsonDataList[index].id;

	    //添加一个隐藏字段用于保存index值
	    var indexSpan = $("<span class='indexSpan' hidden='hidden'></span>").append(index);
	    var unfold = $("<button type='button' class='btn btn-link' id='unfold'>阅读全文</button>").append(indexSpan);
		
	    $("#bottom-button").remove();
	    
	    $.each($(".indexSpan"),function() {
	        if ($(this).text() == index) {
	        	
				// 每篇文章下面的按钮 与图标
				var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + jsonDataList[index].likeNum);
				var likeButton = $("<button type='button' class='btn btn-link'></button>").append(likeIcon);

				var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'></span>").append(" 踩" + jsonDataList[index].hateNum);
				var hateButton = $("<button type='button' class='btn btn-link'></button>").append(hateIcon);

				var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 评论");
				var commentButton = $("<button type='button' class='btn btn-link'></button>").append(commentIcon);

				/* var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
				var CollectionButton = $("<button type='button' class='btn btn-link'></button>").append(CollectionIcon); */

		        var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
		        
		        //遍历所有收藏数据
		        $.each(jsonCollectList,function(num, model) {
		        	//收藏表中的回答id
		        	var cid = model.answerId;
		        	//如果当前的收藏表的回答id和这个id一样就说明已收藏
		        	if(id == cid){
		        		//将这个改为已收藏
		        		CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 已收藏");
		        	}
		        });
		        
		        var CollectionButton = $("<button type='button' class='btn btn-link'></button>").append(CollectionIcon);

				
				var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢");
				var thankButton = $("<button type='button' class='btn btn-link'></button>").append(thankIcon);

				// 图标的集合
				var buttonList = $("<div class='btn-group'></div>").append(likeButton).append(hateButton).append(commentButton).append(CollectionButton).append(thankButton);
	        	
				//获取当前回答的元素
	            var comment = $(this).parent().parent().children("p.part");
				//替换全部内容为部分内容
	            comment.html(part);
				//添加“阅读全文”链接
	            comment.append(unfold);

	         	//添加点赞。。图标
				comment.parent().append(buttonList);
	          
	        }
	    });

	});

	//当状态栏滚动到底部的时候重新获取json数据
	var timeId;
	$(window).scroll(function() {
	    //文档的高度(内容的总高度)	3748
	    var documentHeight = $(document).height();
	    //当前显示的高度				735
	    var viewHeight = $(this).height();
	    //已滚动的距离				3012
	    var scrollTop = $(this).scrollTop();

	    if ((documentHeight - scrollTop - viewHeight) < 10 && hasNext) {
	        clearTimeout(timeId);

	        //300毫秒以后执行函数加载
	        timeId = setTimeout(function() {
	            pn = pn + 1;
	            to_page(pn);
	        },
	        300);
	    }
	});

	//处理问题提交的模态框按钮
	$("#submit-button").click(function() {
	    //问题和话题正则表达式
	    var regTitle = /[A-Za-z0-9\u4e00-\u9fa5]{4,20}/;
	    var regTopic = /[A-Za-z0-9\u4e00-\u9fa5]{2,15}/;

	    //拿到输入框中的内容并去掉空格
	    var title = $.trim($("#title").val());
	    var topic = $.trim($("#topic").val());
	    var tDescribe = $.trim($("#tDescribe").val());

	    //首先判断问题的字数
	    if (title.length < 4) {
	        $("#title-span").text("字数太少了吧");
	    } else {
	        //如果字数符合规范就清空span
	        $("#title-span").text("");

	        //再判断问题是否通过正则表达式，如果不符合就显示不符合规范
	        if (!regTitle.test(title)) {
	            $("#title-span").text("您的问题格式不符合规范，问题可以包括中文英文和数字，长度在20个字以内");
	        } else {
	            //如果符合规范就清空内容
	            $("#title-span").text("");

	            //接着判断话题是否为空
	            if (topic == "") {
	                $("#topic-span").text("请填写话题");
	            } else {
	                //不为空就清空span并开始用正则表达式判断
	                $("#topic-span").text("");
	                if (!regTopic.test(topic)) {
	                    $("#topic-span").text("您的话题格式不符合规范，问题可以包括中文英文和数字，长度在20个字以内");
	                } else {
	                    //如果通过了正则表达式就清空span，并开始判断描述，由于描述不是必须填写了，所以如果不等于空就提交
	                    $("#topic-span").text("");
	                    if (tDescribe != "") {
	                        $.get("${APP_PATH}/question/questionTopicDesc", {
	                            "title": title,
	                            "topic": topic,
	                            "tDescribe": tDescribe
	                        },
	                        function(response, status, xhr) {
	                            //根据服务器返回的数据判断成功或失败，成功就转入另一个页面(问题页面)
	                            if (response == 0) {
	                                alert("提交失败，请重试");
	                            } else {
	                                window.location.href = "${APP_PATH}/question/" + response;
	                            }
	                        });
	                    } else {

	                        //如果描述等于空就只提交问题和话题
	                        $.get("${APP_PATH}/question/questionTopic", {
	                            "title": title,
	                            "topic": topic
	                        },
	                        function(response, status, xhr) {
	                            //根据服务器返回的数据判断成功或失败，成功就转入另一个页面(问题页面)
	                            if (response == 0) {
	                                alert("提交失败，请重试");
	                            } else {
	                                window.location.href = "${APP_PATH}/question/" + response;
	                            }
	                        });
	                    }
	                }

	            }
	        }

	    }

	});

	 $(document).on('click', '.btn',function() {
	    //拿到在json数据当前回答的下标,用children只能找直接子元素，用find可以找直接子元素包括子元素的子元素。
	    var index = $(this).parent().parent().find("span.indexSpan").text();
	    //当前回答的id
	    var id = jsonDataList[index].id;
	    //正常问题下的图标栏
	    var bSpan = $(this).children("span.glyphicon");
	    
	    //展开全文状态的图标栏
	   // var nSpan = $(this).parent().parent();

	    if ($(this).children("span").attr("class") == "glyphicon glyphicon-triangle-top") {
	        $.get("${APP_PATH}/answer/addLike", {
	            "id": id
	        },
	        function(response, status, xhr) {
	        	jsonDataList[index].likeNum = response;
	            bSpan.text(" 赞同" + response);
	            
	        });
	    } else if ($(this).children().attr("class") == "glyphicon glyphicon-triangle-bottom") {
	        $.get("${APP_PATH}/answer/addHate", {
	            "id": id
	        },
	        function(response, status, xhr) {
	        	jsonDataList[index].hateNum = response;
	            bSpan.text(" 踩" + response);
	        });
	    } else if($(this).children().attr("class") == "glyphicon glyphicon-star") {
	    	$.get("${APP_PATH}/answer/collect", {
	            "answerId": id,
	            "userId":userId
	        },
	        function(response, status, xhr) {
	            bSpan.text(" "+response);
	        });
	    }

	}); 
	
	</script>

</body>
</html>








