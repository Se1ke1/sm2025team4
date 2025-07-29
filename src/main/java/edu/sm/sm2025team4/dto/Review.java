package edu.sm.sm2025team4.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Review {
//    리뷰 번호. 자동생성 PK
    private int review_no;
//    사용자 ID. FK
    private String cust_id;
//    상품 ID. FK
    private int product_id;
//    리뷰 내용
    private String review_article;
//    리뷰 점수. 현재 0~10점 범위만 받고 있음
    private float review_score;
//    리뷰 등록일
    private Timestamp review_regdate;
//    리뷰 수정일
    private Timestamp review_update;
//    리뷰 이미지의 이름을 review_img 테이블에 등록하는데 사용하는 리스트
    private List<String> review_img_list;
//    리뷰 이미지 자체를 저장하는데 사용하는 리스트
    private List<MultipartFile> review_img_file_list;
}
