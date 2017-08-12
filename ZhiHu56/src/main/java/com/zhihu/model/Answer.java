package com.zhihu.model;

import java.util.Date;

public class Answer {
    private Integer id;

    private Integer userId;

    private String userName;

    private Integer questionId;

    private String question;

    private String part;

    private Date dateTime;

    private Integer likeNum;

    private Integer hateNum;

    private String content;

    @Override
	public String toString() {
		return "Answer [id=" + id + ", userId=" + userId + ", userName=" + userName + ", questionId=" + questionId
				+ ", question=" + question + ", part=" + part + ", dateTime=" + dateTime + ", likeNum=" + likeNum
				+ ", hateNum=" + hateNum + ", content=" + content + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getPart() {
        return part;
    }

    public void setPart(String part) {
        this.part = part == null ? null : part.trim();
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getHateNum() {
        return hateNum;
    }

    public void setHateNum(Integer hateNum) {
        this.hateNum = hateNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}