package edu.sm.sm2025team4.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequiredArgsConstructor
public class ProductSaleController {

    String dir = "productSale/";

    @RequestMapping("/productSale")
    public String procutSale(Model model){
        model.addAttribute("center", dir+ "productSale");
        return "index";
    }


}
