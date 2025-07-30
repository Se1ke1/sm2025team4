package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.service.*;
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
    final CartService cartService;
    final Order_Payment_InfoService orderPaymentInfoService;
    final Order_PurchaseService orderPurchaseService;
    final Order_InfoService orderInfoService;
    final Cust_InfoService custInfoService;
    /*
     * 동작 메커니즘
     * 주문 명령이 들어오면 카트를 열람해서 그에 맞게 결제정보를 작성하고, 그 다음 주문명세서, 그 다음 주문정보를 작성
     * 결제 동작이 수행되면(미구현) 결제정보의 실 결제금액 수치와 결제 상태 수치를 갱신하고, 그에 맞게 주문명세서의 주문 상태도 갱신함
     *
     * 결제정보 : 총 cartService.getByForeignKey(cust_id)로 불러온 값의 총합 total을 입력
     * 주문명세서 : 이전에 작성된 payment_info의 payment_id, cust_id, total을 입력
     * 주문정보 : 이전에 작성된 order_id와, cart를 전부 순회하며 뽑아낸 각 cart_price와 cart_qtt에 대하여 작성
     * */
    @Transactional
    @RequestMapping("/orderimpl")
    public Object orderimpl(Model model,
                            @RequestParam("id") String cust_id,
                            @RequestParam("info") Integer custinfo_no) throws Exception {
        Map<String,Object> response = new HashMap<>();
        try {
            int total = 0;
//            주문할 물품 목록 가져오기
            List<Cart> carts = cartService.getByForeignKey(cust_id);
            for (Cart cart : carts) {
                total+=cart.getCart_price();
            }
//            결제정보 테이블 작성
            Order_Payment_Info opi = Order_Payment_Info
                    .builder()
                    .status_id(0)
                    .payment_price(total)
                    .build();
//            결제정보 테이블 입력
            orderPaymentInfoService.register(opi);
//            주소 가져오기
            String address = custInfoService.get(custinfo_no).getCustinfo_addr();
//            결제정보 ID 가져오기
            int payment_id = opi.getPayment_id();
//            주문 테이블 작성
            Order_Purchase op = Order_Purchase
                    .builder()
                    .cust_id(cust_id)
                    .payment_id(payment_id)
                    .status_id(0)
                    .order_price(total)
                    .delivery_address(address)
                    .build();
//            주문 테이블 입력
            orderPurchaseService.register(op);
//            모든 목록 상의 cart에 대하여 주문정보 테이블 작성 후 입력
            for (Cart cart : carts) {
                Order_Info oi = Order_Info
                        .builder()
                        .order_id(op.getOrder_id())
                        .product_id(cart.getProduct_id())
                        .order_prod_price(cart.getProduct_price())
                        .order_prod_qtt(cart.getCart_qtt())
                        .build();
                orderInfoService.register(oi);
            }
//            모든 주문이 성공적으로 완료된 이후 장바구니를 소거
            cartService.removeByForeignKey(cust_id);
            response.put("redirectURL","/order");
        }
        catch (Exception e){
            response.put("redirectURL","/");
            throw e;
        }
        return response;
    }


}
