package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Cust_Info {
    private int custinfo_no;
    private String cust_id;
    private String custinfo_name;
    private String custinfo_addr;
    private String custinfo_phone;
    private Timestamp custinfo_regdate;
    private Timestamp custinfo_update;
}
