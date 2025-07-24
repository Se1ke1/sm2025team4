package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cart;
import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.Product_Img_Table;
import edu.sm.sm2025team4.service.CartService;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.Product_Img_TableService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    final CartService cartService;
    final ProductService productService;

    @RequestMapping("/")
    public String index(Model model, HttpSession session) throws Exception {
        Cust cust = (Cust)session.getAttribute("cust");
        if (cust!=null){
            List<Cart> carts=cartService.getByForeignKey(cust.getCust_id());
            int size=carts.size();
            model.addAttribute("carts",carts);
            model.addAttribute("cartSize",size);
        }
        List<Product> products = productService.get();
        model.addAttribute("products",products);
        model.addAttribute("center","center");
        return "index";
    }
}
