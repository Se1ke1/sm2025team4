package edu.sm.sm2025team4.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ForeignKeyService<V,K>{
//    FK에 대한 열람 명령
    List<V> getByForeignKey(K k) throws Exception;
    //    FK에 대한 삭제 명령
    @Transactional
    void removeByForeignKey(K k) throws Exception;
}
