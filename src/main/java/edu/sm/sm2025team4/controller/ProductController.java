package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.repository.ProductRepository;
import edu.sm.sm2025team4.service.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequiredArgsConstructor
public class ProductController {

    String dir = "product/";

    final ProductService productService;

//    @RequestMapping("/product")
//    public String procut(Model model){
//        model.addAttribute("center", dir+ "productFirstPage");
//        return "index";
//    }

    @RequestMapping("/sale")
    public String productSale(Model model){
        model.addAttribute("center", dir+ "sale");
        return "index";
    }


    @RequestMapping("/productimpl")
    public String productimpl(Model model, Product product) throws Exception {
        try {

            // 상품 등록
            productService.register(product);

            System.out.println("상품 등록 성공! 생성된 ID: " + product.getProduct_id());

            // 등록 성공 후 상품 목록 페이지로 리다이렉트
            return "redirect:/product";
        } catch (Exception e) {
            // 상세한 에러 로그
            System.err.println("상품 등록 실패: " + e.getMessage());
            e.printStackTrace();

            // 등록 실패 시 에러 메시지와 함께 등록 페이지로 돌아가기
            model.addAttribute("error", "상품 등록 중 오류가 발생했습니다: " + e.getMessage());
            model.addAttribute("center", dir + "sale");
            return "index";
        }
    }

    // 메인 상품 목록 페이지 - JSP에서 사용하는 변수명과 일치하도록 수정
    @RequestMapping("/product")
    public String product(Model model, HttpSession session) throws Exception {
        List<Product> products = productService.get();
        model.addAttribute("plist", products);  // JSP에서 사용하는 변수명
        model.addAttribute("center", dir + "product");
        return "index";
    }

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
