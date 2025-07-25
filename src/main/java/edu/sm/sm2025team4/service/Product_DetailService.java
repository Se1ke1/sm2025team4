package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.repository.Product_DetailRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class Product_DetailService {

    private final Product_DetailRepository productDetailRepository;

    public Product getProductDetail(int productId) throws Exception {
        return productDetailRepository.select_detail(productId);
    }
}
