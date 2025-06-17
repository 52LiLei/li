package com.sy.pojo;

import java.sql.Timestamp;

public class Member {
    private String mId;
    private String mName;
    private String mPhone;
    private Integer mPoints;
    private Timestamp mJoinDate;
    private Integer mState;

    public Member() {
    }

    public String getMId() {
        return mId;
    }

    public void setMId(String mId) {
        this.mId = mId;
    }

    public String getMName() {
        return mName;
    }

    public void setMName(String mName) {
        this.mName = mName;
    }

    public String getMPhone() {
        return mPhone;
    }

    public void setMPhone(String mPhone) {
        this.mPhone = mPhone;
    }

    public Integer getMPoints() {
        return mPoints;
    }

    public void setMPoints(Integer mPoints) {
        this.mPoints = mPoints;
    }

    public Timestamp getMJoinDate() {
        return mJoinDate;
    }

    public void setMJoinDate(Timestamp mJoinDate) {
        this.mJoinDate = mJoinDate;
    }

    public Integer getMState() {
        return mState;
    }

    public void setMState(Integer mState) {
        this.mState = mState;
    }

    @Override
    public String toString() {
        return "Member{" +
                "mId='" + mId + '\'' +
                ", mName='" + mName + '\'' +
                ", mPhone='" + mPhone + '\'' +
                ", mPoints=" + mPoints +
                ", mJoinDate=" + mJoinDate +
                ", mState=" + mState +
                '}';
    }
}