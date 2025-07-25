package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cart;
import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CartService;
import edu.sm.sm2025team4.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class AjaxController {
    final CustService custService;
    final CartService cartService;

    @RequestMapping("/registerValidate")
    public Object registerValidate(@RequestParam("id") String id) throws Exception {
        boolean result=true;
        Cust cust = custService.get(id);
        if (cust==null){
            result=false;
        }
        return result;
    }
    @RequestMapping("/cart/modify")
    public Object modifyCart(@RequestParam("cart_id") int cart_id,
                             @RequestParam("cart_qtt") int cart_qtt) throws Exception {
        Map<String,Object> map = new HashMap<>();
        Cart prev = cartService.get(cart_id);
        Cart cart = Cart
                .builder()
                .cart_id(cart_id)
                .cart_qtt(cart_qtt)
                .build();
        try {
            cartService.modify(cart);
        }
        catch (Exception e){
            e.printStackTrace();
            throw e;
        }
        List<Cart> carts = cartService.getByForeignKey(prev.getCust_id());
        int sm_total=0;
        int price=0;
        for (Cart c: carts) {
            sm_total+=c.getCart_price();
            if (c.getCart_id()==cart_id){
                price=c.getCart_price();
            }
        }
        int total=sm_total;
        map.put("price",price);
        map.put("sm_total",sm_total);
        map.put("total",total);
        return map;
    }
    @RequestMapping("/cart/remove")
    public Object removeCart(@RequestParam("cart_id") int cart_id) throws Exception {
        boolean result=true;
        try {
            cartService.remove(cart_id);
        }
        catch (Exception e){
            result=false;
            throw e;
        }
        return result;
    }
}
