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
    private int review_img_id;
    private int review_no;
    private String review_img;
    private Timestamp review_img_regdate;
    private Timestamp review_img_update;
}
