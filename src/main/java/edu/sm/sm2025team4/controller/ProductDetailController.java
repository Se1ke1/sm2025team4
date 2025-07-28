package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.service.FavService;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.QnAService;
import edu.sm.sm2025team4.service.ReviewService;
import jakarta.servlet.http.HttpSession;
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
    final FavService favService;

    @RequestMapping("/product_info")
    public String product_info(Model model, @RequestParam("id") int product_id,
                               HttpSession session) throws Exception {
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
        // 고객id 받아서 fav 등록
        Cust loggedInUser = (Cust) session.getAttribute("cust");
        if (loggedInUser != null) {
            Fav fav = new Fav();
            fav.setCust_id(loggedInUser.getCust_id());
            fav.setProduct_id(product_id);
            model.addAttribute("isFavorited", favService.isFavorited(fav));
        } else {
            model.addAttribute("isFavorited", false);
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
