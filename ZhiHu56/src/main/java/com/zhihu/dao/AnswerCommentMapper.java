package com.zhihu.dao;

import com.zhihu.model.AnswerComment;
import com.zhihu.model.AnswerCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AnswerCommentMapper {
    long countByExample(AnswerCommentExample example);

    int deleteByExample(AnswerCommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AnswerComment record);

    int insertSelective(AnswerComment record);

    List<AnswerComment> selectByExample(AnswerCommentExample example);

    AnswerComment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AnswerComment record, @Param("example") AnswerCommentExample example);

    int updateByExample(@Param("record") AnswerComment record, @Param("example") AnswerCommentExample example);

    int updateByPrimaryKeySelective(AnswerComment record);

    int updateByPrimaryKey(AnswerComment record);
}