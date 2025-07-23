package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class AccountController {
    final CustService custService;

    String dir = "myaccount/";

    @RequestMapping("/account")
    public String account(Model model){
        model.addAttribute("center",dir+"account");
        return "index";
    }

//    @RequestMapping("/account")
//    public String account(Model model, HttpSession session) throws Exception {
//        Cust logincust = (Cust) session.getAttribute("logincust");
//
//        if(logincust == null) {
//            return "redirect:/login";
//        }
//
//        Cust cust = null;
//        cust = custService.get(logincust.getCust_id());
//        model.addAttribute("c", cust);
//        model.addAttribute("center", dir + "account");
//        return "index";
//    }

}
