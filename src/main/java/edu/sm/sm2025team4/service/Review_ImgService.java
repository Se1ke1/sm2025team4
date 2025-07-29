package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Review_Img;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Review_ImgRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class Review_ImgService implements SmService<Review_Img, Integer>, ForeignKeyService<Review_Img, Integer> {
    final Review_ImgRepository review_ImgRepository;

    @Override
    public List<Review_Img> getByForeignKey(Integer review_no) throws Exception {
        return review_ImgRepository.selectByForeignKey(review_no);
    }

    @Override
    public void removeByForeignKey(Integer review_no) throws Exception {
        review_ImgRepository.deleteByForeignKey(review_no);
    }

    @Override
    public void register(Review_Img reviewImg) throws Exception {
        review_ImgRepository.insert(reviewImg);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        review_ImgRepository.delete(integer);
    }

    @Override
    public void modify(Review_Img reviewImg) throws Exception {
        review_ImgRepository.update(reviewImg);
    }

    @Override
    public List<Review_Img> get() throws Exception {
        return review_ImgRepository.selectAll();
    }

    @Override
    public Review_Img get(Integer integer) throws Exception {
        return review_ImgRepository.select(integer);
    }
}
