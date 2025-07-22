package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Getter
@Setter
@ToString
@Builder
public class Order_Purchase {
    private int order_id;
    private String cust_id;
    private int payment_id;
    private Timestamp order_placedate;
    private int status_id;
    private int  order_price;
    private String delivery_address;
}
