package edu.sm.sm2025team4.dto;

import lombok.*;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class SortOrderBy {
    ///  정렬할 컬럼명
    private String order;
    ///  정렬 순서
    private String orderBy;
    public SortOrderBy(String order, String orderBy) {
        if (orderBy == null || orderBy.isEmpty() || !(orderBy.equalsIgnoreCase("ASC"))&&!(orderBy.equalsIgnoreCase("DESC"))) {
            this.orderBy = "ASC";
        }
        else  {
            this.orderBy = orderBy.toUpperCase();
        }
        this.order = order;
    }
}
