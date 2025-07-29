package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Review_Img;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Review_ImgRepository extends SmRepository<Review_Img, Integer>, ForeignKeyRepository<Review_Img, Integer> {
}
