package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Cart {
    private int cart_id;
    private String cust_id;
    private int product_id;
    private int cart_qtt;
    private Timestamp cust_regdate;
    private Timestamp cust_update;
    private String product_name;
    private int product_price;
    private String product_img_main;
    private int cart_price;
}
