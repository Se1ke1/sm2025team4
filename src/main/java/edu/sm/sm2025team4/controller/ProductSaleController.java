package edu.sm.sm2025team4.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class ProductSaleController {
    @RequestMapping("/procutSale")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }


}
