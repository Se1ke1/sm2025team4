package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Order_Info;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Order_InfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Order_InfoService implements SmService<Order_Info,Integer>, ForeignKeyService<Order_Info,Integer> {

    final Order_InfoRepository order_InfoRepository;

    @Override
    public List<Order_Info> getByForeignKey(Integer order_id) throws Exception {
        return order_InfoRepository.selectByForeignKey(order_id);
    }

    @Override
    public void removeByForeignKey(Integer order_id) throws Exception {
        order_InfoRepository.deleteByForeignKey(order_id);
    }

    @Override
    public void register(Order_Info orderInfo) throws Exception {
        order_InfoRepository.insert(orderInfo);
    }

    @Override
    public void remove(Integer order_info_id) throws Exception {
        order_InfoRepository.delete(order_info_id);
    }

    @Override
    public void modify(Order_Info orderInfo) throws Exception {
        order_InfoRepository.update(orderInfo);
    }

    @Override
    public List<Order_Info> get() throws Exception {
        /// 개별로 사용될 일은 없음
        return order_InfoRepository.selectAll();
    }

    @Override
    public Order_Info get(Integer order_info_id) throws Exception {
        /// 개별로 사용될 일은 없음. 얘도 order_id를 받게 한 다음 Mapper에는 확인용 쿼리를 작성해서, 삭제 작업 전 확인용 함수로 사용할까?
        return order_InfoRepository.select(order_info_id);
    }
}
