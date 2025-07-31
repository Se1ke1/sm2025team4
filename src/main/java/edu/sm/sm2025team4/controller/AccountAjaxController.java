package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust_Info;
import edu.sm.sm2025team4.service.Cust_InfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RequestMapping("/account/address")
@RestController
@RequiredArgsConstructor
public class AccountAjaxController {
    final Cust_InfoService custInfoService;

    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(@RequestParam("custinfo_no") int custinfo_no) throws Exception {
        boolean result = true;
        try {
            custInfoService.remove(custinfo_no);
        }
        catch (Exception e) {
            result = false;
            throw e;
        }
        return result;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String, Object> update(@RequestParam("custinfo_no") int custinfo_no,
                                      @RequestParam("custinfo_name") String custinfo_name,
                                      @RequestParam("custinfo_addr") String custinfo_addr,
                                      @RequestParam("custinfo_phone") String custinfo_phone) throws Exception {

        Map<String, Object> result = new HashMap<>();

        Cust_Info custInfo = Cust_Info.builder()
                .custinfo_no(custinfo_no)
                .custinfo_name(custinfo_name)
                .custinfo_addr(custinfo_addr)
                .custinfo_phone(custinfo_phone)
                .build();

        try {
            custInfoService.modify(custInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

}
