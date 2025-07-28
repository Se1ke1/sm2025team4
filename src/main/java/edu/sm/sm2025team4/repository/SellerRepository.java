package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Seller;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SellerRepository extends SmRepository<Seller,String> {
}
