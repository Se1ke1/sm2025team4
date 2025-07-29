package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.service.Cust_InfoService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    final Cust_InfoService custInfoService;

    @RequestMapping("/order")
    public String order(Model model, HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("cust");
        if (cust == null) {
            return "redirect:/login";
        }
        List<Cust_Info> custInfos = custInfoService.getByForeignKey(cust.getCust_id());
        model.addAttribute("custInfos",custInfos);
        model.addAttribute("center","order/order");
        return "index";
    }
}
