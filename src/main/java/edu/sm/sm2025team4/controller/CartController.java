package edu.sm.sm2025team4.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {
    String dir = "cart/";
    @RequestMapping("")
    public String index(Model model){
        model.addAttribute("center",dir+"center");
        return "index";
    }
}
