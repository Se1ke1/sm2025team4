package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){
        if (session != null){
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id")  String id,
                            @RequestParam("password") String pwd,
                            HttpSession session) throws Exception {

        Cust cust_db = null;
        cust_db = custService.get(id);
        String next = "index";

        if(cust_db == null){
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다");
            model.addAttribute("center","login");
        }else{
            if(cust_db.getCust_pwd().equals(pwd)){
                session.setAttribute("logincust",cust_db);
                next = "redirect:/";
            }else{
                model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다");
                model.addAttribute("center","login");
            }
        }

        return next;
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
