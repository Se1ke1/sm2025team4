package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface QnARepository extends SmRepository<QnA, Integer> {
    List<QnA> select_qna(int product_id) throws Exception;
    List<QnA> search(Map<String, Object> params) throws Exception;
}
