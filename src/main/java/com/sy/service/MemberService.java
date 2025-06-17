package com.sy.service;

import com.sy.dto.ResultDto;
import com.sy.pojo.Member;

import java.util.List;

public interface MemberService {
    /**
     * 查询所有会员
     * @return
     */
    List<Member> getAllMembers();

    /**
     * 添加会员
     * @param member
     * @return
     */
    ResultDto<Object> addMember(Member member);

    /**
     * 删除会员
     * @param mIds
     * @return
     */
    ResultDto<String> deleteMembers(String mIds);

    /**
     * 更新会员信息
     * @param member
     * @return
     */
    ResultDto<Object> updateMember(Member member);
}