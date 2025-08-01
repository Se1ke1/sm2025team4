package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.service.QnAService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
@Slf4j
public class QnAController {

    private final QnAService qnaService;

    @PostMapping("/add")
    public String addQuestion(@RequestParam("product_id") int product_id,
                              @RequestParam("qna_article") String qnaArticle,
                              HttpSession session) {

        try {
            Cust loggedInUser = (Cust) session.getAttribute("cust");
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

    @RequestMapping("/delete")
    public String delete(@RequestParam("qna_no") int qna_no,
                         @RequestParam("product_id") int product_id,
                         HttpSession session) {
        Cust cust = (Cust) session.getAttribute("cust");
        if (cust == null) {
            return "redirect:/login";
        }
        try {
            QnA qna = qnaService.get(qna_no);
            log.info("qna: {}", qna);
            if (qna != null && qna.getCust_id().equals(cust.getCust_id())) {
                qnaService.remove(qna_no);
            } else {
                log.warn("권한이 없습니다.");
            }
        } catch (Exception e) {
            log.error("Q&A 삭제 중 오류 발생", e);
        }
        return "redirect:/product_detail/product_info?id=" + product_id;
    }
}
