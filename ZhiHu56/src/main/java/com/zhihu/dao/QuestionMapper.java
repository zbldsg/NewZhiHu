package com.zhihu.dao;

import com.zhihu.model.Question;
import com.zhihu.model.QuestionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QuestionMapper {
    long countByExample(QuestionExample example);

    int deleteByExample(QuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    int insertSelective(Question record);
    
    //插入问题后返回主键
    Integer insertResponseId(Question record);

    List<Question> selectByExample(QuestionExample example);

    Question selectByPrimaryKey(Integer id);
    

    int updateByExampleSelective(@Param("record") Question record, @Param("example") QuestionExample example);

    int updateByExample(@Param("record") Question record, @Param("example") QuestionExample example);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);
}