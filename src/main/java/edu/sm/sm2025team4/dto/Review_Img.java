package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Review_Img {
//    리뷰 이미지 파일 ID. 자동 생성 PK
    private int review_img_id;
//    리뷰 번호. FK
    private int review_no;
//    리뷰 이미지 파일명
    private String review_img;
//    리뷰 이미지 등록일
    private Timestamp review_img_regdate;
//    리뷰 이미지 수정일
    private Timestamp review_img_update;
}
