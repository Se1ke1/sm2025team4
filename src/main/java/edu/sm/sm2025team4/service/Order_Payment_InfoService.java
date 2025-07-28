package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Order_Payment_Info;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Order_Payment_InfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Order_Payment_InfoService implements SmService<Order_Payment_Info,Integer> {

    final Order_Payment_InfoRepository order_Payment_InfoRepository;

    @Override
    public void register(Order_Payment_Info orderPaymentInfo) throws Exception {
        order_Payment_InfoRepository.insert(orderPaymentInfo);
    }

    @Override
    public void remove(Integer payment_id) throws Exception {
        order_Payment_InfoRepository.delete(payment_id);
    }

    @Override
    public void modify(Order_Payment_Info orderPaymentInfo) throws Exception {
        order_Payment_InfoRepository.update(orderPaymentInfo);
    }

    @Override
    public List<Order_Payment_Info> get() throws Exception {
        return order_Payment_InfoRepository.selectAll();
    }

    @Override
    public Order_Payment_Info get(Integer payment_id) throws Exception {
        return order_Payment_InfoRepository.select(payment_id);
    }
}
