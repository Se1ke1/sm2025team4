package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.repository.ProductRepository;
import edu.sm.sm2025team4.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequiredArgsConstructor
public class ProductController {

    String dir = "product/";

    final ProductService productService;

    @RequestMapping("/product")
    public String procut(Model model){
        model.addAttribute("center", dir+ "productFirstPage");
        return "index";
    }

    @RequestMapping("/sale")
    public String productSale(Model model){
        model.addAttribute("center", dir+ "sale");
        return "index";
    }

    @RequestMapping("/productimpl")
    public String productimpl(Model model, Product product) throws Exception {
        model.addAttribute("center", dir+ "sale");
        productService.register(product);
        return "index";
    }




}
