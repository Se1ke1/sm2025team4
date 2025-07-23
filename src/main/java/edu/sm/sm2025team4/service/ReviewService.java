package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.dto.Review_Img;
import edu.sm.sm2025team4.repository.ReviewRepository;
import edu.sm.sm2025team4.repository.Review_ImgRepository;
import edu.sm.sm2025team4.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService {
    final ReviewRepository reviewRepository;
    final Review_ImgService review_ImgService;

    @Value("${app.dir.uploadimgsdir}")
    String uploadDir;

//    SELECT->GET
    public List<Review> getByProductId(Integer product_id) throws Exception{
        return reviewRepository.selectByProductId(product_id);
    }
    public List<Review> getByCustId(String cust_id) throws Exception{
        return reviewRepository.selectByCustId(cust_id);
    }
    public Review getByReviewNo(Integer review_no) throws Exception{
        return reviewRepository.selectByReviewNo(review_no);
    }
//    INSERT
    @Transactional
    public void register(Review review) throws Exception{
        reviewRepository.insert(review);
        int rid=review.getReview_no();
        List<MultipartFile> rifs = review.getReview_img_file_list();
        if(rifs!=null&&!rifs.isEmpty()){
            for (MultipartFile rif : rifs) {
                if(!rif.isEmpty()){
                    FileUploadUtil.saveFile(rif,uploadDir);
                    Review_Img review_Img = Review_Img.builder()
                            .review_no(rid)
                            .review_img(rif.getOriginalFilename())
                            .build();
                    review_ImgService.register(review_Img);
                }
            }
        }
    }
//    UPDATE
    public void modify(Review review) throws Exception{
        reviewRepository.update(review);
    }
//    DELETE
    public void removeByReviewNo(Integer review_no) throws Exception{
        review_ImgService.removeByForeignKey(review_no);
        reviewRepository.deleteByReviewNo(review_no);
    }
    public void removeByProductId(Integer product_id) throws Exception{
        List<Review> reviews = reviewRepository.selectByProductId(product_id);
        if (reviews!=null&&!reviews.isEmpty()){
            for (Review review : reviews) {
                if(review!=null) {
                    review_ImgService.removeByForeignKey(review.getReview_no());
                }
            }
        }
        reviewRepository.deleteByProductId(product_id);
    }
    public void removeByCustId(String cust_id) throws Exception{
        List<Review> reviews = reviewRepository.selectByCustId(cust_id);
        if (reviews!=null&&!reviews.isEmpty()){
            for (Review review : reviews) {
                if(review!=null) {
                    review_ImgService.removeByForeignKey(review.getReview_no());
                }
            }
        }
        reviewRepository.deleteByCustId(cust_id);
    }
}
