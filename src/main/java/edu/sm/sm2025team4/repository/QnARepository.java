package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Delivery_Info;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QnARepository extends SmRepository<QnA, Integer> {
}
