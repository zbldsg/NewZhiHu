package com.zhihu.model;

public class AttentionPeople {
    private Integer id;

    private Integer userId;

    private Integer attentionUserId;

    private String attentionUserSignature;

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

    public Integer getAttentionUserId() {
        return attentionUserId;
    }

    public void setAttentionUserId(Integer attentionUserId) {
        this.attentionUserId = attentionUserId;
    }

    public String getAttentionUserSignature() {
        return attentionUserSignature;
    }

    public void setAttentionUserSignature(String attentionUserSignature) {
        this.attentionUserSignature = attentionUserSignature == null ? null : attentionUserSignature.trim();
    }
}