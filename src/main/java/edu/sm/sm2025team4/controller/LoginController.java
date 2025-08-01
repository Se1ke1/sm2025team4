package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }


//    @RequestMapping("/logout")
    public String logout(HttpSession session){
        if (session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/loginimpl")
    public RedirectView loginimpl(Model model,
                            @RequestParam("id")  String id,
                            @RequestParam("password") String pwd,
                            @RequestParam(value="redirectURL",required=false, defaultValue = "/") String redirectURL,
                            RedirectAttributes redirectAttributes,
                            HttpSession session) throws Exception {
        Cust sessionUser = null;
        sessionUser = custService.get(id);
        String next = "login";
        if(sessionUser == null){
            redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            model.addAttribute("center","login");
        }else{
            if(sessionUser.getCust_pwd().equals(pwd)){
                session.setAttribute("cust",sessionUser);
                return new RedirectView(redirectURL);
            }else{
                redirectAttributes.addFlashAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
                model.addAttribute("center","login");
            }
        }
        return new RedirectView(next);
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Cust cust, HttpSession session) throws Exception {
        if (cust.getCust_id() == null||cust.getCust_pwd() == null||cust.getCust_name() == null){
            return "redirect:/register";
        }
        if (custService.get(cust.getCust_id()) != null){
            return "redirect:/register";
        }
        custService.register(cust);
        session.setAttribute("cust",cust);
        return "redirect:/";
    }

}
