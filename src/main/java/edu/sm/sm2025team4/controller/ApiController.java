package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.*;
import edu.sm.sm2025team4.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ApiController {
    final ProductService productService;
    final Cust_InfoService custInfoService;
    final CustService custService;
    private final CartService cartService;
    private final FavService favService;

    @RequestMapping("/vsearch")
    public ResponseEntity<List<Product>> variousResponse(@RequestParam(defaultValue = "0") int page,
                                                         @RequestParam(required = false) List<String> sort) throws Exception {
        Date_Limit_Offset offset = new Date_Limit_Offset();
        int pageSize = 20;
        offset.setOffset(page*pageSize);
        offset.setLimit(pageSize);
        if (sort != null && !sort.isEmpty()) {
            List<SortOrderBy> list = new ArrayList<>();
            if (sort.size()>2) {
                for (String s : sort) {
                    String[] split = s.split(",");
                    if (split.length == 2) {
                        list.add(new SortOrderBy(split[0], split[1]));
                    }
                }
            }
            else {
                list.add(new SortOrderBy(sort.get(0),sort.get(1)));
            }
            offset.setSortOrderBy(list);
        }
        List<Product> productList = productService.getByVarious(offset);
        return new ResponseEntity<>(productList, HttpStatus.OK);
    }
    @RequestMapping("/get/custinfo")
    public Object getCustinfo(@RequestParam("custinfo_no") Integer custinfo_no) throws Exception {
        ///주문 화면 주소록 표시 함수
        return custInfoService.get(custinfo_no);
    }

    @RequestMapping("/registerValidate")
    public Object registerValidate(@RequestParam("id") String id) throws Exception {
        boolean result = false;
        Cust cust = custService.get(id);
        if (cust == null) {
            //해당 계정이 존재하지 않을 경우 true 반환
            result = true;
        }
        return result;
    }

    @RequestMapping("/modify/custinfo")
    public Object modifyCustinfo(@RequestParam("custinfodata")Cust_Info custInfo) throws Exception {
        boolean result = true;
        try {
            custInfoService.register(custInfo);
        }
        catch (Exception e) {
            result = false;
            throw e;
        }
        return result;
    }

    @RequestMapping("/update/model")
    public Object updateModel(Model model, HttpSession session) throws Exception {
        boolean result = true;
        Cust cust = (Cust)session.getAttribute("cust");
        if (cust == null) {
            result = false;
        }
        else {
            try {
                List<Cart> carts = cartService.getByForeignKey(cust.getCust_id());
                List<Fav> favs = favService.getByForeignKey(cust.getCust_id());
                model.addAttribute("carts", carts);
                model.addAttribute("favs", favs);
            }
            catch (Exception e) {
                result = false;
                throw e;
            }
        }
        return result;
    }
}
