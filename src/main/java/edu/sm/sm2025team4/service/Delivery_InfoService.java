package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Delivery_Info;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Delivery_InfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class Delivery_InfoService implements SmService <Delivery_Info, Integer> {
    final Delivery_InfoRepository dr;

    @Override
    public void register(Delivery_Info delivery_info) throws Exception {
        dr.insert(delivery_info);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        dr.delete(integer);
    }

    @Override
    public void modify(Delivery_Info delivery_info) throws Exception {
        dr.update(delivery_info);
    }

    @Override
    public List<Delivery_Info> get() throws Exception {
        // 필요한 기능인가?..
        return dr.selectAll();
    }

    @Override
    public Delivery_Info get(Integer integer) throws Exception {
        return dr.select(integer);
    }

}
