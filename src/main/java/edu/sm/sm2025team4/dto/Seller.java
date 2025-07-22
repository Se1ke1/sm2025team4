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
public class Seller {
    private String seller_id;
    private String seller_pwd;
    private String seller_name;
    private String seller_phone;
    private String seller_address;
    private String seller_reliable;
    private Timestamp seller_regdate;
    private Timestamp seller_update;
}
