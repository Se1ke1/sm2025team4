package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Review;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ReviewRepository{
//    일단 SELECT문.
//    cust_id로 검색해야하는 경우 - 특정 고객의 본인이 작성한 리뷰 조회
    List<Review> selectByCustId(String cust_id) throws Exception;
//    prouct_id로 검색해야하는 경우 - 특정 상품의 리뷰들 조회
    List<Review> selectByProductId(Integer product_id) throws Exception;
//    review_no로 검색해야하는 경우 - 단일 리뷰 조회
    Review selectByReviewNo(Integer review_no) throws Exception;
//    전체 조회는 필요하지 않다.

//    INSERT,UPDATE
//    Review 객체를 받기 때문에 동일
    void insert(Review review) throws Exception;
    void update(Review review) throws Exception;

//    DELETE
//    cust_id로 검색해야하는 경우 - 특정 고객이 탈퇴해 모두 삭제해야 하는 경우
    void deleteByCustId(String cust_id) throws Exception;
//    product_id로 검색해야하는 경우 - 특정 제품이 삭제되어 모두 삭제해야하는 경우
//      그런데 상품이 제거되어야하는 상황이라는게 발생 가능한가? 그럼 주문 정보도 날려야하는데
//          그렇게 치면 고객정보도 못 날리니까 고려는 해야할듯
    void deleteByProductId(Integer product_id) throws Exception;
//    cust_id와 product_id 모두로 검색 or review_no로 검색해야하는 경우 - 단일 리뷰 삭제
    void deleteByReviewNo(Integer review_no) throws Exception;
}
