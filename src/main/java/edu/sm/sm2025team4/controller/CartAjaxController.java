package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class CartAjaxController {
    final CartService cartService;
    final FavService favService;

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
//    장바구니 추가 기능 제너릭
    @RequestMapping("/cart/addimpl")
    public Object addimpl(@RequestParam("cust_id") String cust_id,
                          @RequestParam("product_id") int product_id,
                          @RequestParam("cart_qtt") int cart_qtt) throws Exception {
        boolean result=true;
        Cart cart = Cart.builder().product_id(product_id).cust_id(cust_id).cart_qtt(cart_qtt).build();
        try {
            cartService.register(cart);
        }
        catch (Exception e){
            result=false;
            throw e;
        }
        return result;
    }
//    관심상품에서 등록할때의 양식
    @Transactional
    @RequestMapping("/cart/addimplfav")
    public Object addimplfav(@RequestParam("cust_id") String cust_id,
                          @RequestParam("product_id") int product_id,
                          @RequestParam("fav_id") int fav_id) throws Exception {
        boolean result=true;
        Cart cart = Cart.builder().product_id(product_id).cust_id(cust_id).cart_qtt(1).build();
        try {
            cartService.register(cart);
            favService.remove(fav_id);
        }
        catch (Exception e){
            result=false;
            throw e;
        }
        return result;
    }
    @RequestMapping("/fav/remove")
    public Object removeFav(@RequestParam("fav_id") int fav_id) throws Exception {
        boolean result=true;
        try {
            favService.remove(fav_id);
        }
        catch (Exception e){
            result=false;
            throw e;
        }
        return result;
    }
//    관심 상품 등록 on off
    @RequestMapping("/fav/toggle")
    public Map<String, Object> toggleFav(HttpSession session, @RequestParam("product_id") int product_id) {
        Map<String, Object> response = new HashMap<>();

        Cust loggedInUser = (Cust) session.getAttribute("cust");
        if (loggedInUser == null) {
            response.put("status", "error");
            response.put("message", "로그인이 필요합니다.");
            return response;
        }
        try {
            Fav fav = new Fav();
            fav.setCust_id(loggedInUser.getCust_id());
            fav.setProduct_id(product_id);

            boolean isAdded = favService.toggleFav(fav);
            response.put("status", "success");
            response.put("action", isAdded ? "added" : "removed");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "오류가 발생했습니다.");
        }
        return response;
    }
}
