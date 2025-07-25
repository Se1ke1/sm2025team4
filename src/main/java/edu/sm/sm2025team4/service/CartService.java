package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Cart;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class CartService implements SmService<Cart,Integer>, ForeignKeyService<Cart,String> {
    final CartRepository cartRepository;

    @Override
    public List<Cart> getByForeignKey(String cust_id) throws Exception {
        return cartRepository.selectByForeignKey(cust_id);
    }

    @Override
    public void removeByForeignKey(String cust_id) throws Exception {
        cartRepository.deleteByForeignKey(cust_id);
    }

    @Override
    public void register(Cart cart) throws Exception {
        cartRepository.insert(cart);
    }

    @Override
    public void remove(Integer cart_id) throws Exception {
        cartRepository.delete(cart_id);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        cartRepository.update(cart);
    }

    @Override
    public List<Cart> get() throws Exception {
        return cartRepository.selectAll();
    }

    @Override
    public Cart get(Integer cart_id) throws Exception {
        return cartRepository.select(cart_id);
    }
}
