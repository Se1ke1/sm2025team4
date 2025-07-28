package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Seller;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.SellerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SellerService implements SmService<Seller,String> {
    final SellerRepository sellerRepository;

    @Override
    public void register(Seller seller) throws Exception {
        sellerRepository.insert(seller);
    }

    @Override
    public void remove(String s) throws Exception {
        sellerRepository.delete(s);
    }

    @Override
    public void modify(Seller seller) throws Exception {
        sellerRepository.update(seller);
    }

    @Override
    public List<Seller> get() throws Exception {
        return sellerRepository.selectAll();
    }

    @Override
    public Seller get(String s) throws Exception {
        return sellerRepository.select(s);
    }
}
