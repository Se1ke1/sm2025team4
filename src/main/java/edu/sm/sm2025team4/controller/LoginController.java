package edu.sm.sm2025team4.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class LoginController {

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


    /*
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id")  String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("ID:{}, PWD:{}", id, pwd);

        Cust dbCust = null;
        dbCust = custService.get(id);
        String next = "index";

        if(dbCust == null){
            model.addAttribute("center","login");
        }else{
            if(dbCust.getCustPwd().equals(pwd)){
                session.setAttribute("logincust",dbCust);
                next = "redirect:/";
            }else{
                model.addAttribute("center","login");
            }
        }

        return next;
    }
    */

}
