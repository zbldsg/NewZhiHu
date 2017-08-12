package com.zhihu.dao;

import com.zhihu.model.AttentionPeople;
import com.zhihu.model.AttentionPeopleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AttentionPeopleMapper {
    long countByExample(AttentionPeopleExample example);

    int deleteByExample(AttentionPeopleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AttentionPeople record);

    int insertSelective(AttentionPeople record);

    List<AttentionPeople> selectByExample(AttentionPeopleExample example);

    AttentionPeople selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AttentionPeople record, @Param("example") AttentionPeopleExample example);

    int updateByExample(@Param("record") AttentionPeople record, @Param("example") AttentionPeopleExample example);

    int updateByPrimaryKeySelective(AttentionPeople record);

    int updateByPrimaryKey(AttentionPeople record);
}