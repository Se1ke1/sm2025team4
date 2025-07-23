package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product_detail")
@RequiredArgsConstructor
public class ProductDetailController {
    String dir = "product_detail/";
    final ProductService productService;

    @RequestMapping("/product_info")
    public String product_info(Model model){
        model.addAttribute("center",dir+"product_info");
        return "index";
    }
}
