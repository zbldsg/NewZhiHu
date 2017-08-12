<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="common/head.jsp"%>
<script src="${APP_PATH }/js/ckeditor/ckeditor.js"></script>
<title>知乎</title>
<style>
body {
	padding-top: 60px;
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
	margin-left: 65%;
	padding-left: 1%;
	padding-right: 2%;
	padding-top: 11px;
	margin-top: 1%;
}

#jackson-content {
	
}

#my-form {
	margin-top: 10%;
	margin-left: 19.5%;
	margin-right: 35%;
}

#submit-button {
	float: right;
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
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="jumbotron">
			<h5 id="topic"></h5>
			<h3 id="title"></h3>
			<div id="tDescribe"></div>
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

	<form id='my-form' method='post'
		action='${APP_PATH}/question/${questionId}/answer'>
		<textarea id='editor' rows='10' cols='80' name='answerContent'></textarea>
		<input id='submit-button' class='btn btn-primary' type='submit'
			value='提交回答'>
	</form>
	<script>CKEDITOR.replace( 'editor' );</script>

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
          	//用户名链接
	        var peopleHref = $("<a style='text-decoration:none;'></a>").attr("href","${APP_PATH}/people/"+item.userId).append(answerUserName);
        	
            var unfold = $("<button type='button' class='btn btn-link' id='unfold'>阅读全文</button>");
        	
          	//回答的部分
            var entityPart = $("<p class='part'></p>").append(item.part==""?item.content:item.part).append(item.part==""?"":unfold);
          	
          	//隐藏字段用于储存index值
            var indexSpan = $("<span class='indexSpan' hidden='hidden'></span>").append(index);
            entityPart.append(indexSpan);

            //回答的时间
            var entitydateTime = $("<p></p>").append(new Date(item.dateTime));

            contentList.append(peopleHref).append(entityPart).append(entitydateTime);
			
            // 每篇文章下面的按钮 与图标
            var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + item.likeNum);
            var likeButton = $("<button type='button' class='btn btn-link'></div>").append(likeIcon);

            var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'></span>").append(" 踩" + item.hateNum);
            var hateButton = $("<button type='button' class='btn btn-link'></div>").append(hateIcon);

            var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 添加评论" + item.id);
            var commentButton = $("<button type='button' class='btn btn-link'></div>").append(commentIcon);

            var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏" + item.id);
            var CollectionButton = $("<button type='button' class='btn btn-link'></div>").append(CollectionIcon);

            var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢" + item.id);

            var thankButton = $("<button type='button' class='btn btn-link'></div>").append(thankIcon);

            // 图标的集合
            var buttonList = $("<div class='btn-group'></div>").append(likeButton).append(hateButton).append(commentButton).append(CollectionButton).append(thankButton);

            contentList.append(buttonList).appendTo("#jackson-content");
    	   });
        
	    $(document).on('click', '#unfold', function(){
	    	//拿到当前问题在json中数组的下标位置
	    	var index = $(this).parent().children(".indexSpan").text();
	    	//拿到的隐藏下标的span，在更改内容后重新添加上
	    	var indexSpan = $(this).parent().children(".indexSpan");
	    	
	    	//通过下标值取得回答的内容
	    	var content = answerList[index].content;
	    	//获取到显示部分内容字元素
	    	var part = $(this).parent().parent().children("p.part");
	    	//将里面的部分内容替换为全部内容
	    	part.html(content);
	    	part.append(indexSpan);
	    }); 
       
	    
	    $(document).on('click', '.btn',function () {
	    	//拿到在json数据当前回答的下标,用children只能找直接子元素，用find可以找直接子元素包括子元素的子元素。
	    	var index = $(this).parent().parent().find("span.indexSpan").text();
	    	//当前回答的id
	    	var id = answerList[index].id;
	    	var bSpan = $(this).children("span.glyphicon");
	    	
	    	if($(this).children("span").attr("class") == "glyphicon glyphicon-triangle-top"){
	        	$.get("${APP_PATH}/answer/addLike", {
	        		"id":id
	        	},function(response, status, xhr){
	        		bSpan.text(" 赞同" + response);
	        	});
	    	} else if($(this).children().attr("class") == "glyphicon glyphicon-triangle-bottom"){
	        	$.get("${APP_PATH}/answer/addHate", {
	        		"id":id
	        	},function(response, status, xhr){
	        		bSpan.text(" 踩" + response);
	        	});
	    	}
	    	
	    });
	    
    });
    
    
	
});

</script>
</body>
</html>