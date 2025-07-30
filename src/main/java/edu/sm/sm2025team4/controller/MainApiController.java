package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Date_Limit_Offset;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.dto.SortOrderBy;
import edu.sm.sm2025team4.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class MainApiController {
    final ProductService productService;

    @RequestMapping("/vsearch")
    public ResponseEntity<List<Product>> variousResponse(@RequestParam(defaultValue = "0") int page,
                                                         @RequestParam(required = false) List<String> sort) throws Exception {
        Date_Limit_Offset offset = new Date_Limit_Offset();
        int pageSize = 20;
        offset.setOffset(page*pageSize);
        offset.setLimit(pageSize);

        if (sort != null && !sort.isEmpty()) {
            List<SortOrderBy> sortOrderBys = new ArrayList<SortOrderBy>();
            for (String s : sort) {
                String[] split = s.split(",");
                if (split.length == 2) {
                    sortOrderBys.add(new SortOrderBy(split[0], split[1]));
                }
            }
            offset.setSortOrderBy(sortOrderBys);
        }
        List<Product> productList = productService.getByVarious(offset);
        return new ResponseEntity<>(productList, HttpStatus.OK);

    }
}
