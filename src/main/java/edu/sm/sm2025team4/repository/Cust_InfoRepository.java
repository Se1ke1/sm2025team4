package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Cust_Info;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface Cust_InfoRepository extends SmRepository<Cust_Info, Integer>, ForeignKeyRepository<Cust_Info, String> {
}
