<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="/sell">product</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="shop product section">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/product">나의상품</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; color: #8D8D8D" href="/sell">상품판매</a>
                    </li>
                </ul>
            </div>

            <div class="col-md-9">
                <div class="product-form">
                    <h2 class="mb-4">상품판매</h2>
                    <p class="mb-4">판매할 상품을 입력해주세요</p>

                    <form class="form" method="post" action="/sell" enctype="multipart/form-data">


                        <div class="form-row"> <%-- Bootstrap의 form-row는 내부 col에 대해 간격을 줄여줍니다. --%>
                            <div class="form-group col-md-12"> <%-- 한 줄 전체 사용 --%>
                                <label for="productMainImage">상품 대표 이미지 업로드</label>
                                <input type="file" name="product_img_main_file" class="form-control-file" id="productMainImage" accept="image/*" required>
                                <small class="form-text text-muted">상품의 대표 이미지를 선택해주세요.</small>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="productName">상품 이름</label>
                                <input type="text" name="product_name" class="form-control" id="productName" placeholder="상품명을 입력하세요" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="productPrice">상품 가격</label>
                                <input type="number" name="product_price" class="form-control" id="productPrice" placeholder="가격을 입력하세요 (원)" min="0" required>
                                <small class="form-text text-muted">숫자만 입력하세요 (예: 15000)</small>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="productQuantity">상품 수량</label>
                                <input type="number" name="product_qtt" class="form-control" id="productQuantity" placeholder="재고 수량을 입력하세요" min="1" required>
                                <small class="form-text text-muted">판매할 수량을 입력하세요</small>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="productCategory">상품 카테고리</label>
                                <select name="cate_no" class="form-control" id="productCategory" required>
                                    <option value="">카테고리를 선택하세요</option>
                                    <option value="10">전자제품</option>
                                    <option value="20">의류</option>
                                    <option value="30">생활용품</option>
                                </select>
                            </div>
                        </div>

                        <input type="hidden" name="seller_id" value="${sessionScope.seller_id != null ? sessionScope.seller_id : 'test_seller'}">

                        <div class="form-group login-btn mt-4"> <%-- 버튼 위쪽에 마진 추가 --%>
                            <button class="btn btn-primary mr-2" type="submit">상품등록</button> <%-- 버튼 사이에 마진 추가 --%>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</section>