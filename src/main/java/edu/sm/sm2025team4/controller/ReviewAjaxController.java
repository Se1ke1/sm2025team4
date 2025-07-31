package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewAjaxController {
    private final ReviewService reviewService;

    @GetMapping("/search")
    public Map<String, Object> search(
            @RequestParam("product_id") int productId,
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "sort", required = false, defaultValue = "latest") String sort,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "5") int size) throws Exception {

        List<Review> reviews = reviewService.search(productId, keyword, sort, page, size);
        int totalCount = reviewService.countSearch(productId, keyword);

        Map<String, Object> result = new HashMap<>();
        result.put("reviews", reviews);
        result.put("totalCount", totalCount);

        return result;
    }
}
