package edu.sm.sm2025team4.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Order_Payment_Info {
    private int payment_id;
    private int status_id;
    private String status_desc;
    private int payment_price;
    private int payment_fullfil;
    private int payment_done_date;
}
