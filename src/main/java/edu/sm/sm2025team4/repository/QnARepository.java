package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Delivery_Info;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface QnARepository extends SmRepository<QnA, Integer> {
    List<QnA> select_qna(int product_id) throws Exception;
    public void insert_reply(QnA reply) throws Exception;
}
