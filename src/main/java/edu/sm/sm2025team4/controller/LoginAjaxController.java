package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class LoginAjaxController {
    final CustService custService;

    @RequestMapping("/registerValidate")
    public Object registerValidate(@RequestParam("id") String id) throws Exception {
        boolean result = true;
        Cust cust = custService.get(id);
        if (cust == null) {
            result = false;
        }
        return result;
    }
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