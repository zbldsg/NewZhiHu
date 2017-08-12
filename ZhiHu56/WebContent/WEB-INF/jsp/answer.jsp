<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="common/head.jsp"%>
<title>知乎</title>
<style>
body {
	padding-top: 50px;
	background-color: #F5F5F5;
}

.my-zhihu {
	color: #1E90FF;
	font-size: 180%;
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

#question-span, #topic-span {
	color: red;
}

#topic {
	color: #1E90FF;
	padding-left: 18%;
	font-size: medium;
}

#title {
	font-weight: bold;
	margin-left: 18%;
}

#tDescribe {
	margin-left: 18%;
	margin-right: 30%;
	font-size: 15px;
}

#my-panel {
	 position: fixed;
	 height: 230px;
	 margin-left:65%;
	 padding-left:1%;
	 padding-right:2%;
	 padding-top:11px;
	 margin-top:1%; 
}

#jackson-content {
}

#double-button {
	padding-top: 8px;
}

#attention-answer {
	margin-right: 18%;
}

.jumbotron {
	padding-bottom: 4%;
}

</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
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
					<div id="double-button">
						<a class="btn btn-default" href="${APP_PATH}/zhihu/login">登录</a> <a
							class="btn btn-primary" href="${APP_PATH}/zhihu/register">加入知乎</a>
					</div>
				</ul>
			</div>
		</div>
	</nav>



	<div class="container-fluid">
		<div class="jumbotron">
			<h5 id="topic"></h5>
			<h3 id="title"></h3>
			<div id="tDescribe"></div>
			<ul class="nav navbar-nav navbar-right" id="attention-answer">
				<div id="double-button">
					<a class="btn btn-default" href="${APP_PATH}">关注问题</a> <a
						class="btn btn-primary" href="${APP_PATH}"> <span
						class="glyphicon glyphicon-pencil" aria-hidden="true">&nbsp;</span>写回答
					</a>
				</div>
			</ul>
		</div>
		
		
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
	</div>

		<div id="jackson-content"></div>

	<script type="text/javascript">
$(document).ready(function() {
    $.get("${APP_PATH}/question/jsonAnswer", {
        "pageNum": 1,
        "questionId":${questionId}
    },
    function(response, status, xhr) {
    	//拿到问题的标题，描述。。。。
        var topic = response.extend.question.topic;
        var title = response.extend.question.title;
        var tDescribe = response.extend.question.tDescribe;
        
        //添加到页面的标签内
        $("#topic").text(topic);
        $("#title").text(title);
        $("#tDescribe").text(tDescribe);
        
        var answerList = response.extend.pageInfo.list;
        $.each(answerList,function(index, item) {
        	
		        	//用来装每一条记录的容器
		            var contentList = $("<div class='my-content'></div>");
    	        	//用户名
    	            var answerUserName = $("<h5></h5>").append(item.userName);
    	        	
    	          		//添加一个隐藏字段用于保存index值
    	            	var indexSpan = $("<span hidden='hidden'></span>").append(index);
    	            	var unfold = $("<button type='button' class='btn btn-link' id='unfold'>阅读全文</button>").append(indexSpan);
    	        	
    	          	//问题的部分
    	            var entityPart = $("<p class='part'></p>").append(item.part==""?item.content:item.part).append(item.part==""?"":unfold);

    	            //问题的时间
    	            var entitydateTime = $("<p></p>").append(new Date(item.dateTime));

    	            contentList.append(answerUserName).append(entityPart).append(entitydateTime);

    	            // 每篇文章下面的按钮 与图标
    	            var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + item.id);
    	            var likeButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(likeIcon);

    	            var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'></span>").append(" 踩" + item.id);
    	            var hateButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(hateIcon);

    	            var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 添加评论" + item.id);
    	            var commentButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(commentIcon);

    	            var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏" + item.id);
    	            var CollectionButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(CollectionIcon);

    	            var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢" + item.id);

    	            var thankButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(thankIcon);

    	            // 图标的集合
    	            var buttonList = $("<div class='btn-group'></div>").append(likeButton).append(hateButton).append(commentButton).append(CollectionButton).append(thankButton);

    	            contentList.append(buttonList).appendTo("#jackson-content");
    	        });
        
	    $(document).on('click', '#unfold', function(){
	    	//拿到当前问题在json中数组的下标位置
	    	var index = $(this).children().text();
	    	
	    	//通过下标值取得回答的内容
	    	var content = answerList[index].content;
	    	//获取到显示部分内容字元素
	    	var part = $(this).parent().parent().children("p.part");
	    	//将里面的部分内容替换为全部内容
	    	part.html(content);
	    }); 
    });
	
});
</script>
</body>
</html>