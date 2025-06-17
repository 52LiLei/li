package com.sy.dao;

import com.sy.pojo.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberMapper {
    /**
     * 查询所有会员
     * @return
     */
    List<Member> selAllMembers();

    /**
     * 添加会员
     * @param member
     * @return
     */
    Integer addMember(@Param("member") Member member);

    /**
     * 删除会员
     * @param mIds
     * @return
     */
    Integer deleteMembers(@Param("mIds") String[] mIds);

    /**
     * 更新会员信息
     * @param member
     * @return
     */
    Integer updateMember(@Param("member") Member member);
}