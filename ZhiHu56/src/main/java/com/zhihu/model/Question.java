package com.zhihu.model;

public class Question {
    private Integer id;

    private Integer userId;

    private String topic;

    private String title;

    private String tDescribe;

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

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic == null ? null : topic.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String gettDescribe() {
        return tDescribe;
    }

    public void settDescribe(String tDescribe) {
        this.tDescribe = tDescribe == null ? null : tDescribe.trim();
    }
}