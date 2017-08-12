package com.zhihu.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AnswerExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AnswerExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNull() {
            addCriterion("user_name is null");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNotNull() {
            addCriterion("user_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserNameEqualTo(String value) {
            addCriterion("user_name =", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotEqualTo(String value) {
            addCriterion("user_name <>", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThan(String value) {
            addCriterion("user_name >", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_name >=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThan(String value) {
            addCriterion("user_name <", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThanOrEqualTo(String value) {
            addCriterion("user_name <=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLike(String value) {
            addCriterion("user_name like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotLike(String value) {
            addCriterion("user_name not like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameIn(List<String> values) {
            addCriterion("user_name in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotIn(List<String> values) {
            addCriterion("user_name not in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameBetween(String value1, String value2) {
            addCriterion("user_name between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotBetween(String value1, String value2) {
            addCriterion("user_name not between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andQuestionIdIsNull() {
            addCriterion("question_id is null");
            return (Criteria) this;
        }

        public Criteria andQuestionIdIsNotNull() {
            addCriterion("question_id is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionIdEqualTo(Integer value) {
            addCriterion("question_id =", value, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdNotEqualTo(Integer value) {
            addCriterion("question_id <>", value, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdGreaterThan(Integer value) {
            addCriterion("question_id >", value, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("question_id >=", value, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdLessThan(Integer value) {
            addCriterion("question_id <", value, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdLessThanOrEqualTo(Integer value) {
            addCriterion("question_id <=", value, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdIn(List<Integer> values) {
            addCriterion("question_id in", values, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdNotIn(List<Integer> values) {
            addCriterion("question_id not in", values, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdBetween(Integer value1, Integer value2) {
            addCriterion("question_id between", value1, value2, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("question_id not between", value1, value2, "questionId");
            return (Criteria) this;
        }

        public Criteria andQuestionIsNull() {
            addCriterion("question is null");
            return (Criteria) this;
        }

        public Criteria andQuestionIsNotNull() {
            addCriterion("question is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionEqualTo(String value) {
            addCriterion("question =", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotEqualTo(String value) {
            addCriterion("question <>", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionGreaterThan(String value) {
            addCriterion("question >", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionGreaterThanOrEqualTo(String value) {
            addCriterion("question >=", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionLessThan(String value) {
            addCriterion("question <", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionLessThanOrEqualTo(String value) {
            addCriterion("question <=", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionLike(String value) {
            addCriterion("question like", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotLike(String value) {
            addCriterion("question not like", value, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionIn(List<String> values) {
            addCriterion("question in", values, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotIn(List<String> values) {
            addCriterion("question not in", values, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionBetween(String value1, String value2) {
            addCriterion("question between", value1, value2, "question");
            return (Criteria) this;
        }

        public Criteria andQuestionNotBetween(String value1, String value2) {
            addCriterion("question not between", value1, value2, "question");
            return (Criteria) this;
        }

        public Criteria andPartIsNull() {
            addCriterion("part is null");
            return (Criteria) this;
        }

        public Criteria andPartIsNotNull() {
            addCriterion("part is not null");
            return (Criteria) this;
        }

        public Criteria andPartEqualTo(String value) {
            addCriterion("part =", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartNotEqualTo(String value) {
            addCriterion("part <>", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartGreaterThan(String value) {
            addCriterion("part >", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartGreaterThanOrEqualTo(String value) {
            addCriterion("part >=", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartLessThan(String value) {
            addCriterion("part <", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartLessThanOrEqualTo(String value) {
            addCriterion("part <=", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartLike(String value) {
            addCriterion("part like", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartNotLike(String value) {
            addCriterion("part not like", value, "part");
            return (Criteria) this;
        }

        public Criteria andPartIn(List<String> values) {
            addCriterion("part in", values, "part");
            return (Criteria) this;
        }

        public Criteria andPartNotIn(List<String> values) {
            addCriterion("part not in", values, "part");
            return (Criteria) this;
        }

        public Criteria andPartBetween(String value1, String value2) {
            addCriterion("part between", value1, value2, "part");
            return (Criteria) this;
        }

        public Criteria andPartNotBetween(String value1, String value2) {
            addCriterion("part not between", value1, value2, "part");
            return (Criteria) this;
        }

        public Criteria andDateTimeIsNull() {
            addCriterion("date_time is null");
            return (Criteria) this;
        }

        public Criteria andDateTimeIsNotNull() {
            addCriterion("date_time is not null");
            return (Criteria) this;
        }

        public Criteria andDateTimeEqualTo(Date value) {
            addCriterion("date_time =", value, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeNotEqualTo(Date value) {
            addCriterion("date_time <>", value, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeGreaterThan(Date value) {
            addCriterion("date_time >", value, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("date_time >=", value, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeLessThan(Date value) {
            addCriterion("date_time <", value, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeLessThanOrEqualTo(Date value) {
            addCriterion("date_time <=", value, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeIn(List<Date> values) {
            addCriterion("date_time in", values, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeNotIn(List<Date> values) {
            addCriterion("date_time not in", values, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeBetween(Date value1, Date value2) {
            addCriterion("date_time between", value1, value2, "dateTime");
            return (Criteria) this;
        }

        public Criteria andDateTimeNotBetween(Date value1, Date value2) {
            addCriterion("date_time not between", value1, value2, "dateTime");
            return (Criteria) this;
        }

        public Criteria andLikeNumIsNull() {
            addCriterion("like_num is null");
            return (Criteria) this;
        }

        public Criteria andLikeNumIsNotNull() {
            addCriterion("like_num is not null");
            return (Criteria) this;
        }

        public Criteria andLikeNumEqualTo(Integer value) {
            addCriterion("like_num =", value, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumNotEqualTo(Integer value) {
            addCriterion("like_num <>", value, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumGreaterThan(Integer value) {
            addCriterion("like_num >", value, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("like_num >=", value, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumLessThan(Integer value) {
            addCriterion("like_num <", value, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumLessThanOrEqualTo(Integer value) {
            addCriterion("like_num <=", value, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumIn(List<Integer> values) {
            addCriterion("like_num in", values, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumNotIn(List<Integer> values) {
            addCriterion("like_num not in", values, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumBetween(Integer value1, Integer value2) {
            addCriterion("like_num between", value1, value2, "likeNum");
            return (Criteria) this;
        }

        public Criteria andLikeNumNotBetween(Integer value1, Integer value2) {
            addCriterion("like_num not between", value1, value2, "likeNum");
            return (Criteria) this;
        }

        public Criteria andHateNumIsNull() {
            addCriterion("hate_num is null");
            return (Criteria) this;
        }

        public Criteria andHateNumIsNotNull() {
            addCriterion("hate_num is not null");
            return (Criteria) this;
        }

        public Criteria andHateNumEqualTo(Integer value) {
            addCriterion("hate_num =", value, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumNotEqualTo(Integer value) {
            addCriterion("hate_num <>", value, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumGreaterThan(Integer value) {
            addCriterion("hate_num >", value, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("hate_num >=", value, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumLessThan(Integer value) {
            addCriterion("hate_num <", value, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumLessThanOrEqualTo(Integer value) {
            addCriterion("hate_num <=", value, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumIn(List<Integer> values) {
            addCriterion("hate_num in", values, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumNotIn(List<Integer> values) {
            addCriterion("hate_num not in", values, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumBetween(Integer value1, Integer value2) {
            addCriterion("hate_num between", value1, value2, "hateNum");
            return (Criteria) this;
        }

        public Criteria andHateNumNotBetween(Integer value1, Integer value2) {
            addCriterion("hate_num not between", value1, value2, "hateNum");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}