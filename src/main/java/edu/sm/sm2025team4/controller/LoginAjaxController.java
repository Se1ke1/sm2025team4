package edu.sm.sm2025team4.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class LoginAjaxController {
    @RequestMapping("/logout")
    public Object logout(HttpSession session){
        boolean result = false;
        if (session != null){
            session.invalidate();
            result = true;
        }
        return result;
    }
}