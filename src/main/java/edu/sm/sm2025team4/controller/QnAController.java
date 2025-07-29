package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.QnAService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
@Slf4j
public class QnAController {

    private final QnAService qnaService;
    private final ProductService productService;

    @PostMapping("/add")
    public String addQuestion(@RequestParam("product_id") int product_id,
                              @RequestParam("qna_article") String qnaArticle,
                              HttpSession session) {

        try {
            Cust loggedInUser = (Cust) session.getAttribute("user");
            if (loggedInUser == null) {
                return "redirect:/login";
            }
            QnA question = new QnA();
            question.setProduct_id(product_id);
            question.setQna_article(qnaArticle);
            question.setCust_id(loggedInUser.getCust_id());

            qnaService.register(question);
        } catch (Exception e) {
            log.error("Q&A 질문 등록 중 오류 발생", e);
            return "redirect:/product_detail/product_info?id=" + product_id;
        }
        return "redirect:/product_detail/product_info?id=" + product_id;
    }

    @PostMapping("/reply")
    public String reply(@RequestParam("product_id") int product_id,
                           @RequestParam("qna_upper_no") int qnaUpperNo,
                           @RequestParam("qna_article") String qnaArticle,
                           HttpSession session) {
        try {
            Cust loggedInUser = (Cust) session.getAttribute("user");
            if (loggedInUser == null) {
                return "redirect:/login";
            }
            // 판매자 권한 확인
            Product product = productService.get(product_id);
            if (!product.getSeller_id().equals(loggedInUser.getCust_id())) {
                return "redirect:/product_detail/product_info?id=" + product_id;
            }
            QnA reply = new QnA();
            reply.setProduct_id(product_id);
            reply.setQna_upper_no(qnaUpperNo);
            reply.setQna_article(qnaArticle);
            reply.setCust_id(loggedInUser.getCust_id());

            qnaService.insert_rp(reply);
        } catch (Exception e) {
            log.error("Q&A 답글 등록 중 오류 발생", e);
            return "redirect:/product_detail/product_info?id=" + product_id;
        }
        return "redirect:/product_detail/product_info?id=" + product_id;
    }
}
