package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Date_Limit_Offset;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.Product_Img_Table;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.ProductRepository;
import edu.sm.sm2025team4.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService implements SmService <Product, Integer>, ForeignKeyService<Product,String> {
//    상품 리포지토리
    final ProductRepository productRepository;
//    상품 이미지 서비스
    final Product_Img_TableService pitService;
//업로드된 파일 저장 경로 지정
    @Value("${app.dir.uploadimgsdir}")
    String uploadDir;

//    두 리포지토리에 동시에 접근해야하므로 트랜잭션
@Transactional
@Override
public void register(Product product) throws Exception {
    // 1. 대표 이미지 파일 처리 (product_img_main)
    MultipartFile mainFile = product.getProduct_img_main_file();
    if (mainFile != null && !mainFile.isEmpty()) {
        // 서버의 imgs 폴더에 이미지 파일 저장
        String imgDir = uploadDir + "/imgs";
        // imgs 폴더가 없으면 생성
        java.io.File dir = new java.io.File(imgDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        FileUploadUtil.saveFile(mainFile, imgDir);
        // DB에는 파일명만 저장
        product.setProduct_img_main(mainFile.getOriginalFilename());
    }

//        2. 일반 데이터 저장 (이제 product_img_main에 파일명이 설정됨)
    productRepository.insert(product);
    int pid=product.getProduct_id();

    // 3. 추가 이미지들 처리 (product_img_file_list)
    List<MultipartFile> pifs = product.getProduct_img_file_list();
//        이후 데이터에서 불러온 이미지들이 공란이 아닐 경우에
    if (pifs != null && !pifs.isEmpty()) {
        String imgDir = uploadDir + "/imgs";
        for (MultipartFile pif : pifs) {
            if(!pif.isEmpty()){
                FileUploadUtil.saveFile(pif, imgDir);
//                    이미지 테이블 DTO을 작성하고
                Product_Img_Table pit=Product_Img_Table.builder()
                        .product_id(pid)
                        .product_img(pif.getOriginalFilename())
                        .build();
//                    이미지 테이블 서비스를 호출하여 업로드
                pitService.register(pit);
            }
        }
    }
}

    @Transactional
    @Override
    public void remove(Integer integer) throws Exception {
        /// 상품 테이블은 어차피 FK로 가져가는 테이블들이 너무 많아서 삭제가 사실상 불가능함
//        이미지 테이블 전체 소거
        pitService.removeByForeignKey(integer);
//        이후 일반 데이터 제거
        productRepository.delete(integer);
    }

    @Transactional
    @Override
    public void removeByForeignKey(String seller_id) throws Exception {
        List<Product> products = productRepository.selectByForeignKey(seller_id);
        if (products != null && !products.isEmpty()) {
            for (Product p : products) {
                if(p!=null){
                    pitService.removeByForeignKey(p.getProduct_id());
                }
            }
        }
        productRepository.deleteByForeignKey(seller_id);
    }

    @Transactional
    @Override
    public void modify(Product product) throws Exception {
//        이미지 제어는 Product_ImgService 호출해서 별도로 처리할 것
//        이후 일반 데이터 업데이트
        // 1. 새로운 대표 이미지 파일이 있는 경우 처리
        MultipartFile mainFile = product.getProduct_img_main_file();
        if (mainFile != null && !mainFile.isEmpty()) {
            // 서버의 imgs 폴더에 이미지 파일 저장
            String imgDir = uploadDir + "/imgs";
            // imgs 폴더가 없으면 생성
            java.io.File dir = new java.io.File(imgDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            FileUploadUtil.saveFile(mainFile, imgDir);
            // DB에는 파일명만 저장
            product.setProduct_img_main(mainFile.getOriginalFilename());
        }
        // mainFile이 null이거나 비어있으면 기존 이미지 유지 (Controller에서 설정됨)

        // 2. 일반 데이터 업데이트
        productRepository.update(product);

        // 3. 추가 이미지들 처리 (필요시)
        List<MultipartFile> pifs = product.getProduct_img_file_list();
        if (pifs != null && !pifs.isEmpty()) {
            String imgDir = uploadDir + "/imgs";
            for (MultipartFile pif : pifs) {
                if(!pif.isEmpty()){
                    FileUploadUtil.saveFile(pif, imgDir);
                    // 이미지 테이블 DTO를 작성하고
                    Product_Img_Table pit = Product_Img_Table.builder()
                            .product_id(product.getProduct_id())
                            .product_img(pif.getOriginalFilename())
                            .build();
                    // 이미지 테이블 서비스를 호출하여 업로드
                    pitService.register(pit);
                }
            }
        }
    }

    @Override
    public List<Product> get() throws Exception {
        return productRepository.selectAll();
    }

    @Override
    public Product get(Integer integer) throws Exception {
        return productRepository.select(integer);
    }

    @Override
    public List<Product> getByForeignKey(String seller_id) throws Exception {
        return productRepository.selectByForeignKey(seller_id);
    }

    public List<Product> getByRegdate(Date_Limit_Offset dateLimitOffset) throws Exception {
        return productRepository.selectByRegdate(dateLimitOffset);
    }

    public List<Product> getByVarious(Date_Limit_Offset dateLimitOffset) throws Exception {
        return productRepository.selectByVarious(dateLimitOffset);
    }
}