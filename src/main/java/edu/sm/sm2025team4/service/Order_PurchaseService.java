package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Order_Purchase;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Order_PurchaseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class Order_PurchaseService implements SmService<Order_Purchase,Integer>, ForeignKeyService<Order_Purchase,String> {

    final Order_PurchaseRepository order_PurchaseRepository;

    @Override
    public List<Order_Purchase> getByForeignKey(String cust_id) throws Exception {
        /// 고객 ID 기준으로 검색
        return order_PurchaseRepository.selectByForeignKey(cust_id);
    }

    @Override
    public void removeByForeignKey(String cust_id) throws Exception {
        /// 고객 ID 기준으로 삭제
        order_PurchaseRepository.deleteByForeignKey(cust_id);
    }

    @Override
    public void register(Order_Purchase orderPurchase) throws Exception {
        order_PurchaseRepository.insert(orderPurchase);
    }

    @Override
    public void remove(Integer order_id) throws Exception {
        order_PurchaseRepository.delete(order_id);
    }

    @Override
    public void modify(Order_Purchase orderPurchase) throws Exception {
        order_PurchaseRepository.update(orderPurchase);
    }

    @Override
    public List<Order_Purchase> get() throws Exception {
        return order_PurchaseRepository.selectAll();
    }

    @Override
    public Order_Purchase get(Integer order_id) throws Exception {
        return order_PurchaseRepository.select(order_id);
    }
}
