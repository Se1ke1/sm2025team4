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
    public List<Cart> getByForeignKey(String s) throws Exception {
        return cartRepository.selectByForeignKey(s);
    }

    @Override
    public void removeByForeignKey(String s) throws Exception {
        cartRepository.deleteByForeignKey(s);
    }

    @Override
    public void register(Cart cart) throws Exception {
        cartRepository.insert(cart);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        cartRepository.delete(integer);
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
    public Cart get(Integer integer) throws Exception {
        return cartRepository.select(integer);
    }
}
