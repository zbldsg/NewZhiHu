package com.zhihu.test;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhihu.dao.AnswerMapper;
import com.zhihu.dao.QuestionMapper;
import com.zhihu.dao.UserMapper;
import com.zhihu.model.Answer;
import com.zhihu.model.AnswerExample;
import com.zhihu.model.Question;
import com.zhihu.model.User;
import com.zhihu.model.AnswerExample.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml",
		"classpath:spring/spring-web.xml" })
public class MapperTest {

	@Autowired
	UserMapper um;

	@Autowired
	QuestionMapper qm;

	@Autowired
	AnswerMapper am;
	
	@Test
	public void testAnswerMapperExample() {
		AnswerExample example = new AnswerExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(1);
		List<Answer> answers = am.selectByExample(example);
		for(Answer str : answers) {//其内部实质上还是调用了迭代器遍历方式，这种循环方式还有其他限制，不建议使用。
		    System.out.println(str.getQuestion());
		}
	}

/*
	@Test
	public void testUser() {
		System.out.println(um);
		um.insertSelective(new User(null, "13300033300", "王大锤", "zhihuwangdachui","万万没想到，我最后还是 ......."));
		um.insertSelective(new User(null, "15500055500", "葛布", "zhihugebu","上不知天文，下不知地理，中间知道点生理。"));
	}

	@Test
	public void testQuestion() {
		qm.insertSelective(new Question(null, 1, "计算机", "如何假装自己是一个AI?","很想知道一个人怎么样假装可以弄出AI的感觉"));
		qm.insertSelective(new Question(null, 2,"教育", "没文化可以有多可怕？",
				"问题补充，大家回答的时候，希望大家分清没有文化和没有知识之间的区别。有文化的人，不一定有知识，比如某文盲高僧。有知识的人，也不一定有文化，比如某些砖家叫兽。"));
	}*/

	@Test
	public void testAnswer() {
		String part = new String();
		String part2 = new String();

		part = "\r\n" + "很简单啊,你想想有什么事只有计算机做得到人类做不到...\r\n" + "\r\n" + "==========================================\r\n"
				+ "\r\n" + "有次出去拼桌游,休息的时候不知咋的讨论起运算能力了....\r\n" + "\r\n" + "然后大家准备比比,从1开始每次翻倍,看到谁答不出来...\r\n" + "\r\n"
				+ "1,2,4,8,16.....第一轮没啥问题";

		part2 = "1.依稀记得某保健品广告宣称富含34种人体所需的氨基酸。12种非必需氨基酸,8种必需氨基酸。剩下14种，你来说说看？2.小学语文是班主任教。班主任不是很喜欢我。她说：“balabala，世界上有好多凶猛的鱼类，比如鲨鱼，鳄鱼…”我说：“鳄鱼不是鱼…”她说：“你挺能啊？”";

		String content = new String();
		String content2 = new String();

		content = "很简单啊,你想想有什么事只有计算机做得到人类做不到...\r\n" + "\r\n" + "==========================================\r\n"
				+ "\r\n" + "有次出去拼桌游,休息的时候不知咋的讨论起运算能力了....\r\n" + "\r\n" + "然后大家准备比比,从1开始每次翻倍,看到谁答不出来...\r\n" + "\r\n"
				+ "1,2,4,8,16.....第一轮没啥问题\r\n" + "\r\n" + "第二轮上千以后就比较慢了但还是能算出来\r\n" + "\r\n"
				+ "最后对面的兄弟 1 6384 翻倍翻不出来了...\r\n" + "\r\n" + "然后我淡定的说\r\n" + "\r\n"
				+ "翻倍是 3 2768,再翻倍是 6 5536 这都太简单了,我甚至可以算出来这个数的平方是 42亿9496万7296 你们可以掏出手机验算一下...\r\n"
				+ "------------------------------------------------------------------\r\n" + "\r\n"
				+ "然后各位用手机算了下后用看外星人的眼神看着我.....\r\n" + "\r\n" + "我觉得还能再补一刀\r\n" + "\r\n"
				+ "在你们掏手机验算的时间里我又算了一次平方 大概是1844兆6744万0737亿,后面几位手机可能显示不出来,不过我能算出来是 0955 1616...\r\n"
				+ "你一定是AI对吧.....你一定是最新AI.................\r\n" + "\r\n" + "后来参团碰上都要抓着我这么问...\r\n" + "\r\n"
				+ "=============================\r\n" + "\r\n" + "嗯...有这个特异功能的举个爪...";

		content2 = "1.依稀记得某保健品广告宣称富含34种人体所需的氨基酸。12种非必需氨基酸,8种必需氨基酸。剩下14种，你来说说看？2.小学语文是班主任教。班主任不是很喜欢我。她说：“balabala，世界上有好多凶猛的鱼类，比如鲨鱼，鳄鱼…”我说：“鳄鱼不是鱼…”她说：“你挺能啊？”\r\n"
				+ "\r\n"
				+ "3.初中语文是班主任教。班主任不喜欢我。他说：“三国演义最开头儿的那首词，滚滚长江东逝水的作者，你们会读么？”我当时还心想，这有什么不会读的，杨慎啊？难不成还有别的读法？他在黑板上写下两个大大的“杨滇”。杨，滇。我说：“老师，作者是杨慎。”他说：“你不会读就说不会读，能不能别装大明白？”4.曾经在一个卖酵素的微商的动态下面留言：酵素是酶，胃酸很有可能破坏酶的结构。我被拉黑了。5.群中突然传来一条广告：“招打字员，千字30~70，当日结账。”我：“你知道起点上，签约买断网文一千字多少钱么？”没理我。对于海量底层的网络写手来说，千字二十都是梦寐以求的高价。6.亲戚群中说：“他娘的美国人的安卓都是坑中国老百姓的，里面把中国的情报全给你捅出去了。”我：“Android系统是开源的。”亲戚：“大学生净整这些玄乎的词儿。”我：“…不是玄乎…安卓系统所有代码都是公开的，是没地方可藏东西的…”亲戚：“行行行就你知道的多。”7.理发。理发师：“你在大学学啥的？”我：“软件。”理发师：“就是游戏呗？”我：“不是，是Android应用开发。”理发师：“就，就安卓游戏呗？”我：“不是游戏。我是做应用的。比如QQ，就是个聊天应用嘛。”理发师：“那你是不是做QQ脚本的？”啥是QQ脚本.....我咋没听说过…\r\n"
				+ "我：“不是…而且QQ脚本是什么…”\r\n" + "理发师：“就QQ游戏大厅呗。”\r\n" + "8.\r\n" + "坐出租车。\r\n" + "出租车司机：“念哪个专业的啊？”\r\n"
				+ "我：“软件。”\r\n" + "司机：“软件？软件好啊，我闺女就学那个，一年奖学金拿了8W多…”\r\n" + "8W…\r\n" + "我：“哦…”\r\n"
				+ "司机：“软件是不是黑客？”\r\n" + "我：“不是，而且我是做移动端的，搞手机应用开发的。”\r\n" + "司机：“就是手机QQ，密码你能攻破不？”\r\n"
				+ "我：“不能…我是写软件的，不是搞破坏的…”\r\n" + "司机：“那我这微信有一句话，你说能不能发完了还让大家看不着？”\r\n"
				+ "我：“撤回。”9.亲戚AB以及我在客厅闲聊。A：“武汉离武昌有多远？”B：“不远吧。”A：“我咋觉得挺远的。”B：“我感觉不远，XX的孩子就在武昌住，在武汉上学，没几个小时就到了。”我：“的确不远，0米。”10.三舅：“中国就是人太多了，你看那日本鬼子，就是占了人少的便宜。”我：“按国土面积比例换算的话，日本人口不算少吧。”三舅：“咋可能？小日本一共也就个一两千万人。”日本人口，1.26亿，全球第十。\r\n"
				+ "没文化不可怕，可怕的是不愿意有文化。\r\n" + "\r\n" + "真让人头大。";

/*		Answer a = new Answer(null, 1, "王大锤", 1, "如何假装自己是一个AI?", part, content, new Date(),null,null);

		Answer a2 = new Answer(null, 2, "葛布", 2, "没文化可以有多可怕？", part2, content2, new Date(),null,null);

		am.insertSelective(a);
		am.insertSelective(a2);*/
	}

}
