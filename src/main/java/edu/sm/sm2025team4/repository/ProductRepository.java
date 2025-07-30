package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Date_Limit_Offset;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ProductRepository extends SmRepository<Product, Integer>, ForeignKeyRepository<Product, String> {
    List<Product> selectByRegdate(Date_Limit_Offset dateLimitOffset) throws Exception;
    List<Product> selectByVarious(Date_Limit_Offset condition);
}
