package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.service.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    String dir = "product/";
    final ProductService productService;

    /**
     * 판매 페이지 이동
     */
    @RequestMapping("/sell")
    public String productSale(Model model) {
        model.addAttribute("center", dir + "sell");
        return "index";
    }

    /**
     * 상품 목록 조회
     */
    @RequestMapping("/product")
    public String productList(Model model) throws Exception {
        List<Product> list = productService.get();
        model.addAttribute("plist", list);
        model.addAttribute("center", dir + "product");
        return "index";
    }

    /**
     * 상품 삭제
     */
    @RequestMapping("/product/delete")
    @ResponseBody
    public Map<String, Object> deleteProduct(@RequestParam("id") int productId) {
        Map<String, Object> response = new HashMap<>();
        try {
            productService.remove(productId);
            response.put("success", true);
            response.put("message", "상품이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "상품 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        return response;
    }
}
