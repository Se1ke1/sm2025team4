package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.QnAService;
import edu.sm.sm2025team4.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/product_detail")
@RequiredArgsConstructor
@Slf4j
public class ProductDetailController {
    String dir = "product_detail/";
    final ProductService productService;
    final QnAService qnaService;
    final ReviewService reviewService;

    @RequestMapping("/product_info")
    public String product_info(Model model, @RequestParam("id") int product_id){
        Product product = null;
        List<QnA> qnalist = null;
        List<Review> reviewlist = null;
        try {
            product = productService.get(product_id);
            qnalist = qnaService.get_qna(product_id);
            reviewlist = reviewService.getReviewsWithImages(product_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("product", product);
        model.addAttribute("qnalist", qnalist);
        model.addAttribute("reviewlist", reviewlist);
        model.addAttribute("center",dir+"product_info");
        return "index";
    }
//    상품 디테일 페이지로 이동
//    @RequestMapping("/product_info")
//    public String product_info(Model model, @RequestParam("id") int product_id){
//        Product product = null;
//        try {
//            product = product_detailService.getProductDetail(product_id);
//        } catch (Exception e) {
//            log.info("상품 id가 없습니다");
//            throw new RuntimeException(e);
//        }
//        model.addAttribute("product", product);
//        model.addAttribute("center",dir+"product_info");
//        return "index";
//    }
}
