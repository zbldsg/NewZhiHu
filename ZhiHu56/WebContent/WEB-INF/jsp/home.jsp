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
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus {
  color: #000000;
}
.navbar-default .navbar-text {
  color: #848484;
}
.navbar-default .navbar-nav > li > a {
  color: #848484;
}
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
  color: #000000;
}
.navbar-default .navbar-nav > .active > a,
.navbar-default .navbar-nav > .active > a:hover,
.navbar-default .navbar-nav > .active > a:focus {
  color: #000000;
  background-color: #ffffff;
}
.navbar-default .navbar-nav > .open > a,
.navbar-default .navbar-nav > .open > a:hover,
.navbar-default .navbar-nav > .open > a:focus {
  color: #000000;
  background-color: #ffffff;
}
.navbar-default .navbar-toggle {
  border-color: #ffffff;
}
.navbar-default .navbar-toggle:hover,
.navbar-default .navbar-toggle:focus {
  background-color: #ffffff;
}
.navbar-default .navbar-toggle .icon-bar {
  background-color: #848484;
}
.navbar-default .navbar-collapse,
.navbar-default .navbar-form {
  border-color: #848484;
}
.navbar-default .navbar-link {
  color: #848484;
}
.navbar-default .navbar-link:hover {
  color: #000000;
}

@media (max-width: 767px) {
  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
    color: #848484;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #000000;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #000000;
    background-color: #ffffff;
  }
}

body {
	padding-top: 60px;
	background-color: #F5F5F5;
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

#my-panel {
	position: fixed;
	height: 230px;
	margin-left: 66%;
	padding-left: 1%;
	padding-right: 1%;
	padding-top: 11px;
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
}

.allAnswer:hover {
	color: #0000CD;
}

.allAnswer {
	font-size: 25px;
}

#double-button {
	padding-top: 8px;
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
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
     <a class="navbar-brand" href="${APP_PATH}"><span class="my-zhihu-font">知乎</span></a> 
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
       <a class="btn btn-default" href="${APP_PATH}/zhihu/login">登录</a> 
       <a class="btn btn-primary" href="${APP_PATH}/zhihu/register">加入知乎</a> 
      </div> 
     </ul> 
    </div> 
   </div> 
  </nav> 
  <!--提问和回答按钮 --> 
  <div class="my-question-answer-button"> 
   <nav class="navbar navbar-default"> 
    <div class="container-fluid"> 
     <div class="navbar-header"> 
      <a class="navbar-brand" href="${APP_PATH}/zhihu/login"> <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> 提问 &nbsp; </a> 
      <a class="navbar-brand" href="${APP_PATH}/zhihu/login"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 回答 &nbsp; </a> 
      <a class="navbar-brand" href="${APP_PATH}/zhihu/login"> <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 写文章 &nbsp; </a> 
     </div> 
    </div> 
   </nav> 
  </div> 
  <!-- 面板 --> 
  <div class="panel panel-default" id="my-panel"> 
   <div class="panel-body"> 
    <button type="button" class="btn btn-link btn-lg"> <span class="glyphicon glyphicon-flash" aria-hidden="true"></span> <h4>Live</h4> </button> 
    <button type="button" class="btn btn-link btn-lg"> <span class="glyphicon glyphicon-book" aria-hidden="true"></span> <h4>书店</h4> </button> 
    <button type="button" class="btn btn-link btn-lg"> <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span> <h4>圆桌</h4> </button> 
    <br /> 
    <button type="button" class="btn btn-link btn-lg"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <h4>专栏</h4> </button> 
    <button type="button" class="btn btn-link btn-lg"> <span class="glyphicon glyphicon-usd" aria-hidden="true"></span> <h4>付费咨询</h4> </button> 
   </div> 
  </div> 
  <div class="jackson-content"></div> 
  <div id="my-hidden-div"></div> 
	
	<script type="text/javascript">
	//声明全局变量
	var jsonDataList;
	//取得的第几页数据
	var pn = 1;
	//定义一个变量代表json取得的数据，如果等于false就不使用滑动去的数据了
	var hasNext = true;

	$(document).ready(function() {
	    //调用取得json数据
	    to_page(pn);
	});

	//AJAX 取得json数据
	function to_page(pageNum) {
	    $.get("${APP_PATH}/zhihu/jsonQuestion", {
	        "pageNum": pageNum
	    },
	    function(response, status, xhr) {
	        if (pageNum == 1) {
	        	//如果是第一次请求那就让直接赋值后调用
	            jsonDataList = response.extend.pageInfo.list;
	            build_question_answer(jsonDataList);
	        } else {
	        	
	        	//如果不是第一次请求就会，判断后面服务器还有没有数据，如果有再构建
	        	if(response.extend.pageInfo.list.length != 0){
	        		//这时jsonDataList需要跟后面的合并
		            jsonDataList = jsonDataList.concat(response.extend.pageInfo.list);
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
		//每次构建先清空
		$(".jackson-content").empty();
		
	    $.each(entity,function(index, item) {
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
	        //问题的部分
	        var entityPart = $("<p class='part'></p>").append(item.part == "" ? item.content: item.part).append(item.part == "" ? "": unfold);

	        //问题的时间
	        var entitydateTime = $("<p></p>").append(new Date(item.dateTime));

	        contentList.append(peopleHref).append(entityQuestion).append(entityPart).append(entitydateTime);

	        // 每篇文章下面的按钮 与图标
	        var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + item.likeNum);
	        var likeButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(likeIcon);

	        var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'> </span>").append(item.hateNum);
	        var hateButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(hateIcon);

	        var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 评论");
	        var commentButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(commentIcon);

	        var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
	        var CollectionButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(CollectionIcon);

	        var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢");
	        var thankButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(thankIcon);

	        // 图标的集合
	        var buttonList = $("<div class='btn-group'></div>").append(likeButton).append(hateButton).append(commentButton).append(CollectionButton).append(thankButton);

	        contentList.append(buttonList).appendTo(".jackson-content");
	    });
	}

	//当点击全部展开按钮的时候，加载全部数据与底部状态栏
	$(document).on('click', '#unfold',function() {
	    //拿到当前问题在json中数组的下标位置
	    var index = $(this).children().text();

	    //通过下标值取得回答的内容
	    var content = jsonDataList[index].content;

	    //获取到显示部分内容字元素
	    var part = $(this).parent();

	    //先删除评论条
	    $(this).parent().parent().children("div.btn-group").remove();

	    //将里面的部分内容替换为全部内容
	    part.html(content);
	    var indexSpan = $("<span class='indexSpan' hidden='hidden'></span>").append(index);
	    part.append(indexSpan);

	    // 生成状态栏的图标
	    var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + jsonDataList[index].likeNum);
	    var likeButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login' style='color:#4682B4'></a>").append(likeIcon);

	    var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'> </span>").append(jsonDataList[index].hateNum);
	    var hateButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login' style='color:#4682B4'></a>").append(hateIcon);

	    var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 评论");
	    var commentButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login' style='color:#4682B4'></a>").append(commentIcon);

	    var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏" );
	    var CollectionButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login' style='color:#4682B4'></a>").append(CollectionIcon);

	    var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢");
	    var thankButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login' style='color:#4682B4'></a>").append(thankIcon);

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

	    //添加一个隐藏字段用于保存index值
	    var indexSpan = $("<span class='indexSpan' hidden='hidden'></span>").append(index);
	    var unfold = $("<button type='button' class='btn btn-link' id='unfold'>阅读全文</button>").append(indexSpan);

	    $.each($(".indexSpan"),function() {
	        if ($(this).text() == index) {
	        	// 每篇文章下面的按钮 与图标
				var likeIcon = $("<span class='glyphicon glyphicon-triangle-top'></span>").append(" 赞同" + jsonDataList[index].likeNum);
				var likeButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(likeIcon);

				var hateIcon = $("<span class='glyphicon glyphicon-triangle-bottom'> </span>").append(jsonDataList[index].hateNum);
				var hateButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(hateIcon);

				var commentIcon = $("<span class='glyphicon glyphicon-pencil'></span>").append(" 评论");
				var commentButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(commentIcon);

				var CollectionIcon = $("<span class='glyphicon glyphicon-star'></span>").append(" 收藏");
				var CollectionButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(CollectionIcon);

				var thankIcon = $("<span class='glyphicon glyphicon-heart'></span>").append(" 感谢");
				var thankButton = $("<a type='button' class='btn btn-link' href = '${APP_PATH}/zhihu/login'></a>").append(thankIcon);

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
				
	            $("#bottom-button").remove();
	        }
	    });
	    
	});

	var timeId;
	//当状态栏滚动到底部的时候重新获取json数据
	$(window).scroll(function() {
	    //文档的高度(内容的总高度)	3748
	    var documentHeight = $(document).height();
	    //当前显示的高度				735
	    var viewHeight = $(this).height();
	    //已滚动的距离				3012
	    var scrollTop = $(this).scrollTop();

	    //判断是否滑动到底了，并且上一次请求不是null
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
	
	</script>
</body>
</html>













