package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.QnA;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.QnARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class QnAService implements SmService <QnA, Integer> {
    final QnARepository qa;

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
