package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Order_Purchase;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Order_PurchaseRepository extends SmRepository<Order_Purchase,Integer>, ForeignKeyRepository<Order_Purchase,String> {
}
