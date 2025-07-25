package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.service.Product_DetailService;
import edu.sm.sm2025team4.service.QnAService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product_detail")
@RequiredArgsConstructor
@Slf4j
public class ProductDetailController {
    private final QnAService qnAService;
    String dir = "product_detail/";
    final Product_DetailService product_detailService;

    @RequestMapping("/product_info")
    public String product_info(Model model, @RequestParam("id") int product_id){
        Product product = null;
        try {
            product = product_detailService.getProductDetail(product_id);
        } catch (Exception e) {
            log.info("상품 id가 없습니다");
            throw new RuntimeException(e);
        }
        model.addAttribute("product", product);
        model.addAttribute("center",dir+"product_info");
        return "index";
    }

    @RequestMapping("/product_info")
    public String qna(Model model, @RequestParam("id") int product_id){
        QnA qna = null;
        try {
            qna = qnAService.get_qna(product_id);
        } catch (Exception e) {
            log.info("상품 id가 없습니다");
            throw new RuntimeException(e);
        }
        model.addAttribute("product", product);
        model.addAttribute("center",dir+"product_info");
        return "index";
    }
}
