package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cart;
import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
@Slf4j
public class CartController {

    final CartService cartService;

    String dir = "cart/";

    @RequestMapping("")
    public String index(Model model, HttpSession session) throws Exception {
        try {
            Cust cust= (Cust) session.getAttribute("cust");
            String cust_id = cust.getCust_id();
            List <Cart> carts = cartService.getByForeignKey(cust_id);
            int total=0;
            int cartSize=carts.size();
            if (!carts.isEmpty()) {
                for (Cart cart : carts) {
                    total+=cart.getCart_price();
                }
            }
            model.addAttribute("carts", carts);
            model.addAttribute("total", total);
            model.addAttribute("cartSize", cartSize);
            model.addAttribute("center",dir+"cart");
            return "index";
        }
        catch (Exception e) {
            return "redirect:/login";
        }
    }

    @RequestMapping("add")
    public String add_cart(Model model,
                        @RequestParam("product_id") int product_id,
                        @RequestParam("cart_qtt") int cart_qtt,
                        HttpSession session) throws Exception {
        try {
            Cust cust= (Cust) session.getAttribute("cust");
            if(cust==null){
                return "redirect:/login";
            }
            String cust_id = cust.getCust_id();
            Cart cart = new Cart();
            cart.setCust_id(cust_id);
            cart.setProduct_id(product_id);
            cart.setCart_qtt(cart_qtt);
            cartService.register(cart);

            return "redirect:/cart";
        }
        catch (Exception e) {
            return "redirect:/login";
        }
    }
}
