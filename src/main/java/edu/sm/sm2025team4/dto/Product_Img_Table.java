package edu.sm.sm2025team4.dto;


import lombok.*;

import java.sql.Timestamp;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product_Img_Table {
//    이미지 테이블 아이디(자동배정)
    private int product_img_id;
//    이미지가 가리키는 상품의 ID
    private int product_id;
//    이미지 파일 명칭
    private String product_img;
//    이미지 등록일
    private Timestamp product_img_regdate;
//    이미지 수정일
    private Timestamp product_img_update;
}
