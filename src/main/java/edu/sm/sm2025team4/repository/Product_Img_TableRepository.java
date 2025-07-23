package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Product_Img_Table;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Product_Img_TableRepository extends SmRepository<Product_Img_Table, Integer>, ForeignKeyRepository<Product_Img_Table,Integer> {
//    PK 상품 사진 ID product_img_id
//    FK 상품 ID product_id
}
