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

public class Fav {
    private int fav_id;
    private String cust_id;
    private int product_id;
    private Timestamp fav_update;
}
