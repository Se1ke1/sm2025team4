package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Product;
import edu.sm.sm2025team4.service.ProductService;
import edu.sm.sm2025team4.service.Product_Img_TableService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    String dir = "product/";
    final ProductService productService;
    final Product_Img_TableService pitService;

    /**
     * 판매 페이지 이동 - 로그인 체크
     */
    @RequestMapping("/sell")
    public String sell(Model model, HttpSession session) {
        // 로그인 체크
        Cust loggedUser = (Cust) session.getAttribute("cust");
        if (loggedUser == null) {
            return "redirect:/login?redirectURL=/sell";
        }

        model.addAttribute("center", dir + "sell");
        return "index";
    }

    @RequestMapping("productDetail")
    public String productDetail(Model model ,@RequestParam("id") int id) throws Exception {
        Product product = null;
        product = productService.get(id);
        model.addAttribute("p",product);
        model.addAttribute("center",dir+"detail");
        return "index";
    }


    /*
    @RequestMapping("/productSell")
    public String productSell(Model model, Product product) throws Exception {
        productService.register(product);
        return "redirect:/product";
    }
*/

    @RequestMapping("/productSell")
    public String productSell(@ModelAttribute Product product,
                              @RequestParam(value = "product_img_main_file", required = false) MultipartFile mainImageFile,
                              HttpSession session,
                              Model model) throws Exception {

        // 로그인 체크
        Cust loggedUser = (Cust) session.getAttribute("cust");
        if (loggedUser == null) {
            return "redirect:/login";
        }

        // 1. 대표 이미지 파일을 Product DTO에 설정
        if (mainImageFile != null && !mainImageFile.isEmpty()) {
            product.setProduct_img_main_file(mainImageFile);
        } else {
            // 이미지가 없는 경우 에러 처리
            model.addAttribute("error", "상품 대표 이미지를 선택해주세요.");
            model.addAttribute("center", dir + "sell");
            return "index";
        }

        // 2. 입력 데이터 유효성 검사
        try {
            if (product.getProduct_name() == null || product.getProduct_name().trim().isEmpty()) {
                model.addAttribute("error", "상품명을 입력해주세요.");
                model.addAttribute("center", dir + "sell");
                return "index";
            }

            if (product.getProduct_price() <= 0) {
                model.addAttribute("error", "상품 가격을 올바르게 입력해주세요.");
                model.addAttribute("center", dir + "sell");
                return "index";
            }

            if (product.getProduct_qtt() <= 0) {
                model.addAttribute("error", "상품 수량을 올바르게 입력해주세요.");
                model.addAttribute("center", dir + "sell");
                return "index";
            }

            if (product.getCate_no() <= 0) {
                model.addAttribute("error", "카테고리를 선택해주세요.");
                model.addAttribute("center", dir + "sell");
                return "index";
            }

            // 3. 로그인한 사용자를 판매자로 설정
            product.setSeller_id(loggedUser.getCust_id());

            log.info("상품 등록 요청 - 판매자: {}, 상품명: {}, 가격: {}",
                    loggedUser.getCust_id(), product.getProduct_name(), product.getProduct_price());

            // 4. DB 저장 (Service에서 이미지 파일도 함께 처리)
            productService.register(product);

            log.info("상품 등록 완료 - 상품 ID: {}", product.getProduct_id());
            return "redirect:/product";

        } catch (NumberFormatException e) {
            log.error("숫자 형식 오류", e);
            model.addAttribute("error", "가격이나 수량에 올바른 숫자를 입력해주세요.");
            model.addAttribute("center", dir + "sell");
            return "index";
        } catch (Exception e) {
            log.error("상품 등록 중 오류 발생", e);
            model.addAttribute("error", "상품 등록 중 오류가 발생했습니다: " + e.getMessage());
            model.addAttribute("center", dir + "sell");
            return "index";
        }
    }


    /**
     * 상품 목록 조회 - 로그인한 사용자(판매자)의 상품만 조회
     * seller_id = cust_id 관계를 이용하여 현재 로그인된 고객이 판매하고 있는 상품들을 조회
     */
    @RequestMapping("/product")
    public String productList(Model model, HttpSession session) throws Exception {
        try {
            // 세션에서 로그인한 사용자 정보 가져오기
            Cust loggedUser = (Cust) session.getAttribute("cust");

            if (loggedUser == null) {
                // 로그인 정보가 없는 경우 (보안상 이중 체크)
                log.warn("세션에 사용자 정보가 없습니다.");
                return "redirect:/login?redirectURL=/product";
            }

            String sellerId = loggedUser.getCust_id();
            log.info("판매자 {} 의 상품 목록 조회 요청", sellerId);

            // seller_id = cust_id 조건으로 해당 사용자(판매자)의 상품들만 조회
            List<Product> userProducts = productService.getByForeignKey(sellerId);

            if (userProducts == null) {
                userProducts = new ArrayList<>(); // null 방지
            }

            log.info("판매자 {} 의 상품 {}개 조회 완료", sellerId, userProducts.size());

            // 화면에 전달할 데이터 설정
            model.addAttribute("plist", userProducts);
            model.addAttribute("loggedUser", loggedUser); // 사용자 정보도 함께 전달
            model.addAttribute("productCount", userProducts.size()); // 상품 개수
            model.addAttribute("center", dir + "product");

            return "index";

        } catch (Exception e) {
            log.error("상품 목록 조회 중 오류 발생", e);
            model.addAttribute("error", "상품 목록을 불러오는 중 오류가 발생했습니다.");
            model.addAttribute("center", dir + "product");
            return "index";
        }
    }

    /**
     * 상품 삭제 - 본인 상품만 삭제 가능
     */
    @RequestMapping("/product/delete")
    @ResponseBody
    public Map<String, Object> deleteProduct(@RequestParam("id") int productId, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 로그인 체크
            Cust loggedUser = (Cust) session.getAttribute("cust");
            if (loggedUser == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 해당 상품이 로그인한 사용자의 상품인지 확인
            Product product = productService.get(productId);
            if (product == null || !product.getSeller_id().equals(loggedUser.getCust_id())) {
                response.put("success", false);
                response.put("message", "삭제 권한이 없습니다.");
                return response;
            }

            productService.remove(productId);
            response.put("success", true);
            response.put("message", "상품이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "상품 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        return response;
    }



    /**
     * 상품 수정 - 본인 상품만 수정 가능
     */
    @RequestMapping("/product/update")
    public String updateProduct(@ModelAttribute Product product,
                                @RequestParam(value = "product_img_main_file", required = false) MultipartFile mainImageFile,
                                HttpSession session,
                                Model model) {
        try {
            // 로그인 체크
            Cust loggedUser = (Cust) session.getAttribute("cust");
            if (loggedUser == null) {
                return "redirect:/login";
            }

            // 해당 상품이 로그인한 사용자의 상품인지 확인
            Product existingProduct = productService.get(product.getProduct_id());
            if (existingProduct == null || !existingProduct.getSeller_id().equals(loggedUser.getCust_id())) {
                model.addAttribute("error", "수정 권한이 없습니다.");
                model.addAttribute("p", existingProduct);
                model.addAttribute("center", dir + "detail");
                return "index";
            }

            // 입력 데이터 유효성 검사
            if (product.getProduct_name() == null || product.getProduct_name().trim().isEmpty()) {
                model.addAttribute("error", "상품명을 입력해주세요.");
                model.addAttribute("p", product);
                model.addAttribute("center", dir + "detail");
                return "index";
            }

            if (product.getProduct_price() <= 0) {
                model.addAttribute("error", "상품 가격을 올바르게 입력해주세요.");
                model.addAttribute("p", product);
                model.addAttribute("center", dir + "detail");
                return "index";
            }

            if (product.getProduct_qtt() <= 0) {
                model.addAttribute("error", "상품 수량을 올바르게 입력해주세요.");
                model.addAttribute("p", product);
                model.addAttribute("center", dir + "detail");
                return "index";
            }

            if (product.getCate_no() <= 0) {
                model.addAttribute("error", "카테고리를 선택해주세요.");
                model.addAttribute("p", product);
                model.addAttribute("center", dir + "detail");
                return "index";
            }

            // 새 이미지가 업로드된 경우 처리
            if (mainImageFile != null && !mainImageFile.isEmpty()) {
                product.setProduct_img_main_file(mainImageFile);
            } else {
                // 기존 이미지 유지
                product.setProduct_img_main(existingProduct.getProduct_img_main());
            }

            // 판매자 ID 설정 (보안상 기존 값 유지)
            product.setSeller_id(existingProduct.getSeller_id());

            log.info("상품 수정 요청 - 상품 ID: {}, 판매자: {}, 상품명: {}",
                    product.getProduct_id(), loggedUser.getCust_id(), product.getProduct_name());

            // DB 수정
            productService.modify(product);

            log.info("상품 수정 완료 - 상품 ID: {}", product.getProduct_id());

            // 성공 시 상품 목록 페이지로 리다이렉트
            return "redirect:/product";

        } catch (Exception e) {
            log.error("상품 수정 중 오류 발생", e);
            model.addAttribute("error", "상품 수정 중 오류가 발생했습니다: " + e.getMessage());
            model.addAttribute("p", product);
            model.addAttribute("center", dir + "detail");
            return "index";
        }
    }


}
