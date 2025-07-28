package edu.sm.sm2025team4.repository;

import edu.sm.sm2025team4.dto.Fav;
import edu.sm.sm2025team4.frame.ForeignKeyRepository;
import edu.sm.sm2025team4.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface FavRepository extends SmRepository<Fav,Integer>, ForeignKeyRepository<Fav,String> {
    int checkFav(Fav fav) throws Exception;
    void deleteFav(Fav fav) throws Exception;
}
