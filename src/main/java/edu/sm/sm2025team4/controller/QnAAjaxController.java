package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.QnAService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/qna")
public class QnAAjaxController {
    private final QnAService qnaService;
    private final ProductService productService;

    @PostMapping("/reply")
    public Map<String, Object> reply(@RequestParam("product_id") int product_id,
                                     @RequestParam("qna_upper_no") int qnaUpperNo,
                                     @RequestParam("qna_article") String qnaArticle,
                                     HttpSession session) {
        Map<String,Object> result = new HashMap<>();

        try {
            Cust cust = (Cust) session.getAttribute("cust");
            if (cust == null) {
                result.put("status", "error");
                result.put("message", "로그인이 필요합니다.");
                return result;
            }
            // 판매자 권한 확인
            Product product = productService.get(product_id);
            if (!product.getSeller_id().equals(cust.getCust_id())) {
                result.put("status", "error");
                result.put("message", "판매자만 답글 등록이 가능합니다.");
                return result;
            }
            QnA reply = new QnA();
            reply.setProduct_id(product_id);
            reply.setQna_upper_no(qnaUpperNo);
            reply.setQna_article(qnaArticle);
            reply.setCust_id(cust.getCust_id());

            qnaService.insert_rp(reply);
            result.put("status", "success");
        } catch (Exception e) {
            result.put("status", "error");
        }
        return result;
    }

    @GetMapping("/search")
    public Map<String, Object> search(@RequestParam("product_id") int productId,
                                      @RequestParam(value = "keyword",required = false) String keyword,
                                      @RequestParam(value = "page", defaultValue = "1") int page,
                                      @RequestParam(value = "size", defaultValue = "5") int size
                            ) throws Exception {
        List<QnA> qnas = qnaService.search(productId, keyword, page, size);
        int totalCount = qnaService.countSearch(productId, keyword);

        Map<String,Object> result = new HashMap<>();
        result.put("qnas", qnas);
        result.put("totalCount", totalCount);

        return result;
    }
}
