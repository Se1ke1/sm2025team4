package edu.sm.sm2025team4.frame;

import java.util.List;

public interface SmRepository<V,K> {
    void insert(V v) throws Exception;
    // INSERT INTO VALUES
    void update(V v) throws Exception;
    // UPDATE SET WHERE
    void delete(K k) throws Exception;
    // DELETE FROM WHERE
    List <V> selectAll() throws Exception;
    // SELECT * FROM
    V select(K k) throws Exception;
    // SELECT * FROM WHERE
}
