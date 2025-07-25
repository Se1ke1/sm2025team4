package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Cust_Info;
import edu.sm.sm2025team4.service.CustService;
import edu.sm.sm2025team4.service.Cust_InfoService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AccountController {

    final CustService custService;
    final Cust_InfoService custInfoService;

    String dir = "myaccount/";

    @RequestMapping("/account")
    public String account(Model model, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        Cust cust = null;
        cust = custService.get(logincust.getCust_id());
        List<Cust_Info> cust_info = custInfoService.getByForeignKey(logincust.getCust_id());
        model.addAttribute("c", cust);
        model.addAttribute("ci", cust_info);
        model.addAttribute("center", dir + "account");
        return "index";
    }

    @RequestMapping("/update")
    public String update(Model model, Cust cust, Cust_Info cust_info) throws Exception {
        custService.modify(cust);
        custInfoService.modify(cust_info);
        return "redirect:/logout";
    }

}
