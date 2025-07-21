package edu.sm.sm2025team4.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class MainController {

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

    @RequestMapping("/product_detail/product_info")
    public String product_info(Model model){
        model.addAttribute("center","product_detail/product_info");
        return "index";
    }
}
