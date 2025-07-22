package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Product_Img_Table;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Product_Img_TableRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class Product_Img_TableService implements SmService <Product_Img_Table, Integer>, ForeignKeyService<Product_Img_Table,Integer> {

    final Product_Img_TableRepository pit;

    @Override
    public void register(Product_Img_Table productImgTable) throws Exception {
//        이미지 삽입
        pit.insert(productImgTable);
    }

    @Override
    public void remove(Integer integer) throws Exception {
//        Primary Key인 product_img_id 기준으로 제거해야 하는 경우 이 함수를 호출한다.
        pit.delete(integer);
    }

    @Override
    public void modify(Product_Img_Table productImgTable) throws Exception {
//        Primary Key인 product_img_id 기준으로 해당 사진을 수정한다.
        pit.update(productImgTable);
    }

    @Override
    public List<Product_Img_Table> get() throws Exception {
        return pit.selectAll();
    }

    @Override
    public Product_Img_Table get(Integer integer) throws Exception {
//        Primary Key인 product_img_id 기준으로 해당 사진을 불러온다.
        return pit.select(integer);
    }

    @Override
    public List<Product_Img_Table> getByForeignKey(Integer integer) throws Exception {
//        Foreign Key인 product_id 기준으로 사진들을 모두 불러온다.
        return pit.selectByForeignKey(integer);
    }

    @Override
    public void removeByForeignKey(Integer integer) throws Exception {
//        Foreign Key인 product_id 기준으로 사진들을 모두 삭제한다.
        pit.deleteByForeignKey(integer);
    }
}
