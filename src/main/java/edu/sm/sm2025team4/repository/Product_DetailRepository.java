package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Product_DetailRepository {
    Product select_detail(int product_id) throws Exception;
}
