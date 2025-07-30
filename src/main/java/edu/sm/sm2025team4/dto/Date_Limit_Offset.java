package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Date_Limit_Offset {

    ///getByRegdate 함수를 지원하기 위한 DTO

    /// 쿼리 시작일자
    private Timestamp startDate;
    /// 쿼리 종료일자
    private Timestamp endDate;
    /// 표시 개수 제한
    private int limit;
    /// 표시 시작 지점
    private int offset;
    /// 정렬 기준
    private List<SortOrderBy> sortOrderBy;
}
