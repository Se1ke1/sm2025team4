package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class MainController {
    final CustService custService;

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("center","center");
        return "index";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust, HttpSession session) {
        try {
            custService.register(cust);
            session.setAttribute("cust",cust);
        }
        catch (Exception e) {
//            TODO: 회원가입 실패(DB 접근 문제) 에러로그 전달하기
            return "redirect:/register";
        }
        return "redirect:/";
    }
}
