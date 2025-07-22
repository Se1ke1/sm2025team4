package edu.sm.sm2025team4.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;
import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Data
public class Product {
//    상품 아이디(자동배정)
    private int product_id;
//    상품명
    private String product_name;
//    상품 대표 이미지
    private String product_img_main;
//    상품 가격
    private int product_price;
//    상품 수량(재고)
    private int product_qtt;
//    데이터 최초 등록일
    private Timestamp product_regdate;
//    데이터 수정일
    private Timestamp product_update;
//    카테고리 코드
    private int cate_no;
//    카테고리명
    private String cate_name;
//    판매자 이름
    private String seller_id;
//    이미지 테이블 리스트
    private List<Product_Img_Table> product_img_list;
//    입력용 이미지 파일 리스트
    private List<MultipartFile> product_img_file_list;
}
