package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.Product_Img_Table;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.CustRepository;
import edu.sm.sm2025team4.repository.ProductRepository;
import edu.sm.sm2025team4.repository.Product_Img_TableRepository;
import edu.sm.sm2025team4.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService implements SmService <Product, Integer> {
//    상품 리포지토리
    final ProductRepository productRepository;
//    상품 이미지 리포지토리
    final Product_Img_TableRepository piRepository;
//업로드된 파일 저장 경로 지정
    @Value("${app.dir.uploadimgsdir}")
    String uploadDir;

//    두 리포지토리에 동시에 접근해야하므로 트랜잭션
    @Transactional
    @Override
    public void register(Product product) throws Exception {
//        일반 데이터 저장
        productRepository.insert(product);
        int pid=product.getProduct_id();
        List<MultipartFile> pifs = product.getProduct_img_file_list();
//        이후 데이터에서 불러온 이미지들이 공란이 아닐 경우에
        if (pifs != null && !pifs.isEmpty()) {
            for (MultipartFile pif : pifs) {
                if(!pif.isEmpty()){
                    FileUploadUtil.saveFile(pif,uploadDir);
//                    이미지 테이블 DTO을 작성하고
                    Product_Img_Table pit=Product_Img_Table.builder()
                            .product_id(pid)
                            .product_img(pif.getOriginalFilename())
                            .build();
//                    이미지 테이블 리포지토리를 호출하여 업로드
                    piRepository.insert(pit);
                }
            }
        }
    }

    @Override
    public void remove(Integer integer) throws Exception {
//        TODO:사전에 상품을 외래키로 가지는 관계 테이블들을 제거해야함

//        이미지 테이블 전체 소거
        piRepository.delete(integer);
//        이후 일반 데이터 제거
        productRepository.delete(integer);
    }

    @Override
    public void modify(Product product) throws Exception {
//        TODO:신규 이미지가 추가되었을 경우
        
//        TODO:기존 이미지를 삭제했을 경우
        
//        이후 일반 데이터 업데이트
        productRepository.update(product);
    }

    @Override
    public List<Product> get() throws Exception {
        return productRepository.selectAll();
    }

    @Override
    public Product get(Integer integer) throws Exception {
        return productRepository.select(integer);
    }
}