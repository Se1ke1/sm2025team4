package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Fav {
    private int fav_id;
    private String cust_id;
    private int product_id;
    private Timestamp fav_update;
    private String product_name;
    private String product_img_main;
    private int product_price;
}
