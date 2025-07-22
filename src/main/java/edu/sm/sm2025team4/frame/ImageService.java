package edu.sm.sm2025team4.frame;

import java.util.List;

public interface ImageService <V,K>{
//    FK에 대한 열람 명령
    List<V> getByForeignKey(K k);

    //    FK에 대한 삭제 명령
    void removeByForeignKey(K k);
}
