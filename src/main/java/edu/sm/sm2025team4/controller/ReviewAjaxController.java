package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewAjaxController {
    private final ReviewService reviewService;

    @GetMapping("/search")
    public List<Review> search(@RequestParam("product_id") int productId,
                               @RequestParam(value = "keyword", required = false) String keyword,
                               @RequestParam(value = "sort", required = false, defaultValue = "latest") String sort) throws Exception {
        return reviewService.search(productId, keyword, sort);
    }
}
