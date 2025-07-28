package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.dto.Fav;
import edu.sm.sm2025team4.repository.FavRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FavService implements SmService <Fav,Integer>, ForeignKeyService<Fav,String> {

    final FavRepository favRepository;

    @Override
    public List<Fav> getByForeignKey(String cust_id) throws Exception {
        return favRepository.selectByForeignKey(cust_id);
    }

    @Override
    public void removeByForeignKey(String cust_id) throws Exception {
        favRepository.deleteByForeignKey(cust_id);
    }
//    fav의 상태에 따라 추가,삭제
    public boolean isFavorited(Fav fav) throws Exception {
        return favRepository.checkFav(fav) > 0;
    }
    public boolean toggleFav(Fav fav) throws Exception {
        if (isFavorited(fav)) {
            favRepository.deleteFav(fav);
            return false;
        } else {
            favRepository.insert(fav);
            return true;
        }
    }

    @Override
    public void register(Fav fav) throws Exception {
        favRepository.insert(fav);
    }

    @Override
    public void remove(Integer fav_id) throws Exception {
        favRepository.delete(fav_id);
    }

    @Override
    public void modify(Fav fav) throws Exception {
        favRepository.update(fav);
    }

    @Override
    public List<Fav> get() throws Exception {
        return favRepository.selectAll();
    }

    @Override
    public Fav get(Integer fav_id) throws Exception {
        return favRepository.select(fav_id);
    }
}
