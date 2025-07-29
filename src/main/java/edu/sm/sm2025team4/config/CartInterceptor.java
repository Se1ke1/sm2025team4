package edu.sm.sm2025team4.config;

import edu.sm.sm2025team4.dto.Cart;
import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CartService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Component
@RequiredArgsConstructor
public class CartInterceptor implements HandlerInterceptor {
    private final CartService cartService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession(false);
        if (session != null&&modelAndView!=null) {
            Cust cust = (Cust)session.getAttribute("user");
            if (cust!=null) {
                List<Cart> carts = cartService.getByForeignKey(cust.getCust_id());
                modelAndView.addObject("carts",carts);
                modelAndView.addObject("cartSize",carts.size());
            }
        }
    }
}
