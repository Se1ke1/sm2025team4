package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Order_Payment_Info;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Order_Payment_InfoRepository extends SmRepository<Order_Payment_Info,Integer> {
}
