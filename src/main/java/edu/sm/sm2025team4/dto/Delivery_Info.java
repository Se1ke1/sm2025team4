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

public class Delivery_Info {
    private int delivery_id;
    private int cust_id;
    private String delivery_name;
    private String delivery_addr;
    private String delivery_phone;
    private Timestamp delivery_ondate;
    private Timestamp delivery_date;
}
