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

@Slf4j
@Controller
@RequiredArgsConstructor
public class AccountController {

    final CustService custService;
    final Cust_InfoService custInfoService;

    String dir = "myaccount/";

//    @RequestMapping("/account")
//    public String account(Model model){
//        model.addAttribute("center",dir+"account");
//        return "index";
//    }

    // 테스트
    @RequestMapping("/account")
    public String account(Model model) {
        Cust cust = new Cust();
        cust.setCust_id("testuser");
        cust.setCust_name("홍길동");

        Cust_Info custInfo = new Cust_Info();
        custInfo.setCustinfo_addr("천안시 동남구 풍세로");
        custInfo.setCustinfo_phone("010-0000-0000");

        model.addAttribute("c", cust);
        model.addAttribute("ci", custInfo);
        model.addAttribute("center", dir+"/account");

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
//        Cust_Info cust_info = (Cust_Info) custInfoService.getByForeignKey(logincust.getCust_id());
//        model.addAttribute("c", cust);
//        model.addAttribute("ci", cust_info);
//        model.addAttribute("center", dir + "account");
//        return "index";
//    }

    @RequestMapping("/update")
    public String update(Model model, Cust cust, Cust_Info cust_info) throws Exception {
        custService.modify(cust);
        custInfoService.modify(cust_info);
        return "redirect:/account";
    }

}
