package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Date_Limit_Offset;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.service.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    final ProductService productService;

    @RequestMapping("/")
    public String index(Model model, HttpSession session) throws Exception {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime sDate = now.minusDays(7);
        Timestamp startDate = Timestamp.valueOf(sDate);
        Timestamp endDate = Timestamp.valueOf(now);
        Date_Limit_Offset dateLimitOffset = Date_Limit_Offset
                .builder()
                .startDate(startDate)
                .endDate(endDate)
                .limit(10)
                .offset(0)
                .order("DESC")
                .build();
        List<Product> products = productService.get();
        model.addAttribute("products",products);
        model.addAttribute("center","center");
        return "index";
    }
}
