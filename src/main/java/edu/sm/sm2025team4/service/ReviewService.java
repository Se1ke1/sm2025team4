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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReviewService {
    final ReviewRepository reviewRepository;
    final Review_ImgService review_ImgService;
    final Review_ImgRepository reviewImgRepository;

    @Value("${app.dir.uploadimgsdir}")
    String uploadDir;

//    키워드 검색
    @Transactional
    public List<Review> search(int productId, String keyword, String sort,int page,int size) throws Exception {
        // Map에 담아 Repository에 전달
        Map<String, Object> params = new HashMap<>();
        params.put("product_id", productId);
        params.put("keyword", keyword);
        params.put("sort", sort);
        params.put("size",size);
        params.put("offset", (page - 1) * size);
        List<Review> reviews = reviewRepository.search(params);

        // 검색된 각 리뷰에 해당하는 이미지 파일명 리스트를 찾아서 DTO에 넣어줍니다.
        for (Review review : reviews) {
            List<Review_Img> reviewImages = reviewImgRepository.selectByForeignKey(review.getReview_no());
            List<String> imgNameList = new ArrayList<>();
            for (Review_Img img : reviewImages) {
                imgNameList.add(img.getReview_img());
            }
            review.setReview_img_list(imgNameList);
        }
        return reviews;
    }

    public int countSearch(int productId, String keyword) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("product_id", productId);
        params.put("keyword", keyword);
        return reviewRepository.countSearch(params);
    }

    // 특정 상품의 리뷰 목록을 이미지와 함께 조회
    @Transactional
    public List<Review> getReviewsWithImages(int productId) throws Exception {
        // 1. 상품 ID로 리뷰 목록을 먼저 가져온다.
        List<Review> reviews = reviewRepository.selectByProductId(productId);

        // 2. 각 리뷰에 해당하는 이미지 파일명(String) 리스트를 찾아서 DTO에 넣어준다.
        for (Review review : reviews) {
            List<Review_Img> review_images = reviewImgRepository.selectByForeignKey(review.getReview_no());
            List<String> imglist = new ArrayList<>();
            for (Review_Img img : review_images) {
                imglist.add(img.getReview_img()); // Review_Img 객체에서 파일명만 추출하여 추가
            }
            review.setReview_img_list(imglist); // DTO의 review_img_list 필드에 설정
        }
        return reviews;
    }

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
    @Transactional
    public void removeByReviewNo(Integer review_no) throws Exception{
        review_ImgService.removeByForeignKey(review_no);
        reviewRepository.deleteByReviewNo(review_no);
    }
    @Transactional
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
    @Transactional
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
