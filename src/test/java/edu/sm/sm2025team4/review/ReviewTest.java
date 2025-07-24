package edu.sm.sm2025team4.review;

import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.dto.Review_Img;
import edu.sm.sm2025team4.service.ReviewService;
import edu.sm.sm2025team4.service.Review_ImgService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class ReviewTest {
    @Autowired
    ReviewService reviewService;

    @Autowired
    Review_ImgService review_ImgService;

    @Test
    public void insertTest () throws Exception{
        Review review = Review.builder()
                .cust_id("admin")
                .product_id(1000)
                .review_article("정말 좋아요")
                .review_score(2.0F).build();
        reviewService.register(review);
        Review_Img review_Img = Review_Img.builder()
                .review_no(review.getReview_no())
                .review_img("review_img_01.jpg").build();
        review_ImgService.register(review_Img);
    }
}
