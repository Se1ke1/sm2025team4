package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Cart;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CartRepository extends SmRepository<Cart,Integer>, ForeignKeyRepository<Cart,String> {
}