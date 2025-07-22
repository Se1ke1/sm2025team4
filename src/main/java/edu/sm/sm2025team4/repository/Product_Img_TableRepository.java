package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Product_Img_Table;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Product_Img_TableRepository extends SmRepository<Product_Img_Table, Integer> {
}
