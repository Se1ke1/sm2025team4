package edu.sm.sm2025team4.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class Order_Info {
    private int order_id;
    private int product_id;
    private int order_prod_qtt;
    private int order_prod_price;
}
