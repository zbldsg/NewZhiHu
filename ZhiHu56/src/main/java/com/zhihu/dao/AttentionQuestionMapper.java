package com.zhihu.dao;

import com.zhihu.model.AttentionQuestion;
import com.zhihu.model.AttentionQuestionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AttentionQuestionMapper {
    long countByExample(AttentionQuestionExample example);

    int deleteByExample(AttentionQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AttentionQuestion record);

    int insertSelective(AttentionQuestion record);

    List<AttentionQuestion> selectByExample(AttentionQuestionExample example);

    AttentionQuestion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AttentionQuestion record, @Param("example") AttentionQuestionExample example);

    int updateByExample(@Param("record") AttentionQuestion record, @Param("example") AttentionQuestionExample example);

    int updateByPrimaryKeySelective(AttentionQuestion record);

    int updateByPrimaryKey(AttentionQuestion record);
}