package edu.sm.sm2025team4.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class Order_Payment_Info {
    private int payment_id;
    private int status_id;
    private int payment_price;
    private int payment_fullfil;
    private int payment_done_date;
}
