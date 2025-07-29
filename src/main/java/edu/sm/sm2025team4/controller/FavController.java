package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FavController {
    String dir = "cart/";
    @RequestMapping("/fav")
    public String favorite(Model model, HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("cust");
        if (cust==null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("center",dir+"fav");
            return "index";
        }
    }
}
