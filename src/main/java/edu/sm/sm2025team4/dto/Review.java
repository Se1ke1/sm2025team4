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
    private int review_no;
    private String cust_id;
    private int product_id;
    private String review_article;
    private float review_score;
    private Timestamp review_regdate;
    private Timestamp review_update;
    private List<String> review_img_list;
    private List<MultipartFile> review_img_file_list;
}
