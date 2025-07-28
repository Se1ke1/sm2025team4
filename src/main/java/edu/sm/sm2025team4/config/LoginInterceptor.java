package edu.sm.sm2025team4.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);
        if (session == null||session.getAttribute("cust") == null) {
            String requestURI = request.getRequestURI();
            String queryString = request.getQueryString();
            String redirectURL = requestURI;
            if (queryString != null) {
                redirectURL = "?" + queryString;
            }
            response.sendRedirect("/login?redirectURL=" + redirectURL);
            return false;
        }
        return true;
    }
}
