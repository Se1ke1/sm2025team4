package edu.sm.sm2025team4.config;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Fav;
import edu.sm.sm2025team4.service.FavService;
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
public class FavInterceptor implements HandlerInterceptor {
    private final FavService favService;
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession(false);
        if (session != null&&modelAndView!=null) {
            Cust cust = (Cust) session.getAttribute("cust");
            if (cust!=null) {
                List<Fav> favs = favService.getByForeignKey(cust.getCust_id());
                modelAndView.addObject("favs",favs);
                modelAndView.addObject("favSize",favs.size());
            }
        }
    }
}
