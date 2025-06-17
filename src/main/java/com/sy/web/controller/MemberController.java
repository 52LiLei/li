package com.sy.web.controller;

import com.sy.dto.ResultDto;
import com.sy.pojo.Member;
import com.sy.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping("/member/list")
    public String memberPage(Model model) {
        List<Member> members = memberService.getAllMembers();
        model.addAttribute("members", members);
        return "member/member-list";
    }

    @RequestMapping("/member/add")
    public String add() {
        return "member/member-add";
    }

    @RequestMapping("/member/add/action")
    @ResponseBody
    public ResultDto<Object> addAction(Member member) {
        return memberService.addMember(member);
    }

    @RequestMapping("/member/delete")
    @ResponseBody
    public ResultDto<String> deleteMembers(String mIds) {
        return memberService.deleteMembers(mIds);
    }

    @RequestMapping("/member/update/action")
    @ResponseBody
    public ResultDto<Object> updateAction(Member member) {
        return memberService.updateMember(member);
    }
}