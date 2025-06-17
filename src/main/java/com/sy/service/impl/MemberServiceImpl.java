package com.sy.service.impl;

import com.sy.dao.MemberMapper;
import com.sy.dto.ResultDto;
import com.sy.pojo.Member;
import com.sy.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Member> getAllMembers() {
        return memberMapper.selAllMembers();
    }

    @Override
    public ResultDto<Object> addMember(Member member) {
        Integer index = memberMapper.addMember(member);
        if (index > 0) {
            return new ResultDto<>(200, "添加成功!");
        } else {
            return new ResultDto<>(2002, "添加失败");
        }
    }

    @Override
    public ResultDto<String> deleteMembers(String mIds) {
        if (mIds == null || mIds.isEmpty()) {
            return new ResultDto<>(5001, "删除数据异常");
        }
        String[] m_ids = mIds.split(",");
        Integer rows = memberMapper.deleteMembers(m_ids);
        if (rows > 0) {
            return new ResultDto<>(200, "删除成功!");
        }
        return new ResultDto<>(5002, "删除失败!");
    }

    @Override
    public ResultDto<Object> updateMember(Member member) {
        Integer index = memberMapper.updateMember(member);
        if (index > 0) {
            return new ResultDto<>(200, "更新成功!");
        } else {
            return new ResultDto<>(2002, "更新失败");
        }
    }
}