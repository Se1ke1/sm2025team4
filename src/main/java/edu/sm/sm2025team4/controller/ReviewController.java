package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {
    private final ReviewService reviewService;
    private final ProductService productService;

    // 리뷰 작성 페이지를 보여주는 메소드
    @GetMapping("/add")
    public String add(@RequestParam("product_id") int productId, Model model,
                              HttpSession session) {
        if (session.getAttribute("cust") == null) {
            return "redirect:/login";
        }

        try {
            Product product = productService.get(productId);
            model.addAttribute("product", product);
        } catch (Exception e) {
            log.error("리뷰 작성 페이지 상품 정보 조회 오류", e);
            return "redirect:/";
        }

        model.addAttribute("center", "review/add");
        return "index";
    }

    // 작성된 리뷰를 DB에 등록하는 메소드
    @PostMapping("/addimpl")
    public String addimpl(Review review, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("cust");
        if (cust == null) {
            return "redirect:/login";
        }

        review.setCust_id(cust.getCust_id());
        try {
            reviewService.register(review);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/review/add?product_id=" + review.getProduct_id();
        }
        return "redirect:/product_detail/product_info?id=" + review.getProduct_id();
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("review_no") int review_no,
                         @RequestParam("product_id") int product_id,
                         HttpSession session) {
        Cust cust = (Cust) session.getAttribute("cust");
        if (cust == null) {
            return "redirect:/login";
        }
        try {// 삭제할 리뷰
            Review review = reviewService.getByReviewNo(review_no);
            // 현재 로그인한 사용자와 리뷰 작성자가 동일한지 확인
            if (review != null && review.getCust_id().equals(cust.getCust_id())) {
                reviewService.removeByReviewNo(review_no);
            } else {
                log.warn("사용자(" + cust.getCust_id() + ")는 (" + review_no + ") 권한이 없습니다.");
            }
        } catch (Exception e) {
            log.error("리뷰 삭제 중 오류 발생", e);
            return "redirect:/product_detail/product_info?id=" + product_id;
        }
        return "redirect:/product_detail/product_info?id=" + product_id;
    }

}
