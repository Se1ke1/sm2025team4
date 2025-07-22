package edu.sm.sm2025team4.frame;

import java.util.List;

public interface ImageRepository <V,K> {
//    FK에 대한 열람 명령
    List<V> selectByForeignKey(K k);
//    FK에 대한 삭제 명령
    void deleteByForeignKey(K k);
}
