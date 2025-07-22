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
        log.info("ID:{}, PWD:{}", id, pwd);

        Cust cust_db = null;
        cust_db = custService.get(id);
        String next = "index";

        if(cust_db == null){
            model.addAttribute("center","login");
        }else{
            if(cust_db.getCust_pwd().equals(pwd)){
                session.setAttribute("logincust",cust_db);
                next = "redirect:/";
            }else{
                model.addAttribute("center","login");
            }
        }

        return next;
    }


}
