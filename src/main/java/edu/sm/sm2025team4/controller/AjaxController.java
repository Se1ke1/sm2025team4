package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.repository.Order_PurchaseRepository;
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
public class AjaxController {
    final CustService custService;
    final CartService cartService;
    final FavService favService;

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
    /*
     * 동작 메커니즘
     * 주문 명령이 들어오면 카트를 열람해서 그에 맞게 결제정보를 작성하고, 그 다음 주문명세서, 그 다음 주문정보를 작성
     * 결제 동작이 수행되면(미구현) 결제정보의 실 결제금액 수치와 결제 상태 수치를 갱신하고, 그에 맞게 주문명세서의 주문 상태도 갱신함
     * */
    /*
     * 결제정보 : 총 cartService.getByForeignKey(cust_id)로 불러온 값의 총합 total을 입력
     * 주문명세서 : 이전에 작성된 payment_info의 payment_id, cust_id, total을 입력
     * 주문정보 : 이전에 작성된 order_id와, cart를 전부 순회하며 뽑아낸 각 cart_price와 cart_qtt에 대하여 작성
     * */

    final Order_Payment_InfoService orderPaymentInfoService;
    final Order_PurchaseService orderPurchaseService;
    final Order_InfoService orderInfoService;

    @RequestMapping("/orderimpl")
    public String orderimpl(Model model, @RequestParam("id") String cust_id) throws Exception {
        int total = 0;
        List<Cart> carts = cartService.getByForeignKey(cust_id);
        for (Cart cart : carts) {
            total+=cart.getCart_price();
        }
        Order_Payment_Info opi = Order_Payment_Info
                .builder()
                .status_id(0)
                .payment_price(total)
                .build();
        orderPaymentInfoService.register(opi);
        int payment_id = opi.getPayment_id();
        Order_Purchase op = Order_Purchase
                .builder()
                .cust_id(cust_id)
                .payment_id(payment_id)
                .status_id(0)
                .order_price(total)
                .build();
        orderPurchaseService.register(op);
        for (Cart cart : carts) {
            Order_Info oi = Order_Info
                    .builder()
                    .order_id(op.getOrder_id())
                    .order_prod_price(cart.getCart_price())
                    .order_prod_qtt(cart.getCart_qtt())
                    .build();
            orderInfoService.register(oi);
        }
        return "redirect:/purchases";
    }

    final Cust_InfoService custInfoService;
    @RequestMapping("/custinfo/get")
    public Object getCustinfo(@RequestParam("custinfo_no") Integer custinfo_no) throws Exception {
        return custInfoService.get(custinfo_no);
    }
}
