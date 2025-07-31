package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.dto.Review;
import edu.sm.sm2025team4.dto.Review_Img;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.QnARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@RequiredArgsConstructor
@Service
public class QnAService implements SmService <QnA, Integer> {
    final QnARepository qa;

    @Transactional
    public List<QnA> search(int productId, String keyword) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("product_id", productId);
        params.put("keyword", keyword);

        return qa.search(params);
    }


    public List<QnA> get_qna(int product_id) throws Exception {
        return qa.select_qna(product_id);
    }

    @Transactional
    public void insert_rp(QnA reply) throws Exception {
        qa.insert(reply);
    }

    @Override
    public void register(QnA qna) throws Exception {
        qa.insert(qna);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        qa.delete(integer);
    }

    @Override
    public void modify(QnA qna) throws Exception {
        qa.update(qna);
    }

    @Override
    public List<QnA> get() throws Exception {
        return qa.selectAll();
    }

    @Override
    public QnA get(Integer integer) throws Exception {
        return qa.select(integer);
    }

}
