package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Cust {
    private String cust_id;
    private String cust_pwd;
    private String cust_name;
    private Timestamp cust_regdate;
    private Timestamp cust_update;
}
