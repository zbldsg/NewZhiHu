# 创建数据库
DROP DATABASE IF EXISTS zhihu;

create database zhihu;

use zhihu;

# 用户表
create table T_USER (
	id int(10) auto_increment primary key,
	phone char(20) not null,
	name varchar(30) not null,			    		# 名字最多10个字
	password varchar(50) not null,
	signature varchar(300),							# 个人签名
	UNIQUE (phone)
);

# 问题表
create table T_QUESTION (
	id int(10) auto_increment primary key,
	user_id int(10) not null,					# 用户的id
	topic varchar(200) not null,				# 话题名
	title varchar(200) not null,				# 题目名
	t_describe varchar(3000),					# 描述1000多个字左右就够了,describe这个单词是关键字不让用
	UNIQUE (title),
	constraint question_user_fk foreign key (user_id) references T_USER(id)	 # 这个user_id参考t_user表的id
);

# 回答表
create table T_ANSWER(
	id int(10) auto_increment primary key,
	user_id int(10) not null,				# 用户的id
	user_name varchar(30) not null,			# 用户名,冗余了，但是显示的时候方便
	question_id int(10) not null,			# 问题的id
	question varchar(200) not null,			# 问题，虽然是冗余但是这样效率高。
	part varchar(3000),						# 回答的部分信息，用于集中展示的时候。
	content MEDIUMTEXT not null,			# 具体内容
	date_time DATETIME not null,			# 日期
	like_num int(10) default 0,				# 点赞数量
	hate_num int(10) default 0,				# 踩的数量
	constraint answer_user_fk foreign key (user_id) references T_USER(id),				 # 这个user_id参考t_user表的id
	constraint answer_queston_fk foreign key (question_id) references T_QUESTION(id)	 # 这个question_id参考t_question表的id
);

# 收藏表 Collection是util包里的一个类，所以避免冲突
create table T_COLLECT(
	id int(10) auto_increment primary key,
	user_id int(10) not null,
	answer_id int(10) not null,	#回答的id
	Favorites varchar(30),		# 收藏夹
	constraint collect_user_fk foreign key (user_id) references T_USER(id),	 		 # 这个user_id参考t_user表的id
	constraint collect_answer_fk foreign key (answer_id) references T_ANSWER(id)	 # 这个answer_id参考T_ANSWER表的id
);

# 评论表
create table T_COMMENT(
	id int(10) auto_increment primary key,
	user_id int(10) not null,
	user_name varchar(30) not null,
	answer_id int(10) not null,
	content varchar(3000) not null,	# 评论内容
	constraint comment_user_fk foreign key (user_id) references T_USER(id)
);

# 回答评论表
create table T_ANSWER_COMMENT(
	id int(10) auto_increment primary key,
	answer_id int(10) not null,
	user_id int(10) not null,
	user_name varchar(30) not null,
	content varchar(3000) not null,
	constraint answer_comment_fk foreign key (answer_id) references T_ANSWER(id)
);

# 关注的人
create table T_ATTENTION_PEOPLE (
	id int(10) auto_increment primary key,
	user_id int(10) not null,				# 本人的userId
	attention_user_id int(10) not null,		# 关注的人的userId
	attention_user_signature varchar(300),  # 关注人的个性签名
	constraint attention_people_my_user_fk foreign key (user_id) references T_USER(id),
	constraint attention_people_user_fk foreign key (attention_user_id) references T_USER(id)
);

# 关注的问题
create table T_ATTENTION_QUESTION (
	id int(10) auto_increment primary key,
	user_id int(10) not null,				# 用户id
	question_id int (10) not null,			# 问题的id
	question varchar(200) not null, 		# 问题的名称
	constraint attention_question_user_fk foreign key (user_id) references T_USER(id),
	constraint attention_question_question_id foreign key (question_id) references T_QUESTION(id),
	constraint attention_question_question foreign key (question) references T_QUESTION(title)
);