第五十五个版本

解决收藏问题，之前没有彻底解决，这次更改了mapper问题，因为在mapper.xml需要传入多个参数

推荐用第三种



第一种方案 
DAO层的函数方法 

Public User selectUser(String name,String area);  

    对应的Mapper.xml
	<select id="selectUser" resultMap="BaseResultMap">  
      select  *  from user_user_t   where user_name = #{0} and user_area=#{1}  
    </select>  
    
    其中，#{0}代表接收的是dao层中的第一个参数，#{1}代表dao层中第二参数，更多参数一致往后加即可。
------------------------------------------------------------------------------------------


第二种方案
此方法采用Map传多参数.

Dao层的函数方法

PublicUser selectUser(Map paramMap);  

对应的Mapper.xml

<select id=" selectUser" resultMap="BaseResultMap">  
   select  *  from user_user_t   where user_name = #{userName，jdbcType=VARCHAR} and user_area=#{userArea,jdbcType=VARCHAR}  
</select>  

Service层调用
PrivateUserxxxSelectUser(){

Map paramMap=new hashMap();

paramMap.put(“userName”,”对应具体的参数值”);

paramMap.put(“userArea”,”对应具体的参数值”);

Useruser=xxx.selectUser(paramMap);}
个人认为此方法不够直观，见到接口方法不能直接的知道要传的参数是什么。


第三种方案
    Dao层的函数方法

Public User selectUser(@param(“userName”)String name,@param(“userArea”)String area);  

    对应的Mapper.xml

<select id=" selectUser" resultMap="BaseResultMap">  
   select  *  from user_user_t   where user_name = #{userName，jdbcType=VARCHAR} and user_area=#{userArea,jdbcType=VARCHAR}  
</select>   

     个人觉得这种方法比较好，能让开发者看到dao层方法就知道该传什么样的参数，比较直观，个人推荐用此种方案。
