package edu.sm.sm2025team4.Product;

import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class ProductTest {


    @Autowired
    ProductService productService;

    @Test
    void registerTest(){
        Product product = Product
                .builder()
                .product_name("Test Product")
                .product_price(100)
                .product_qtt(10)
                .product_img_main("p1.jpg")
                .cate_no(10)
                .seller_id("id01")
                .build();
        log.info(product.toString());
        try {
            productService.register(product);
            log.info("product registered successfully"+product);
        }
        catch (Exception e){
            log.error("registerTest",e);
        }
    }
}
