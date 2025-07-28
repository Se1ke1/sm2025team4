<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="/sale">상품판매</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- 메인 영역 -->
<section class="shop product section">
    <div class="container">
        <div class="row">

            <!-- 왼쪽 메뉴 -->
            <div class="col-md-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/product">나의상품</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; color: #8D8D8D" href="/sale">상품판매</a>
                    </li>
                </ul>
            </div>

            <!-- 상품 추가 폼 -->
            <div class="col-md-9">
                <div class="product-form">
                    <h2>상품판매</h2>
                    <p>판매할 상품을 입력해주세요</p>

                    <form class="form" method="post" action="/productimpl" enctype="multipart/form-data">

                        <!-- 상품 대표 이미지 -->
                        <div class="form-group">
                            <label>상품 대표 이미지 업로드</label>
                            <input type="file" name="product_img_file_list" class="form-control" accept="imgs/*" required>
                            <small class="form-text text-muted">상품의 대표 이미지를 선택해주세요.</small>
                        </div>

                        <!-- 상품명 -->
                        <div class="form-group">
                            <label>상품 이름</label>
                            <input type="text" name="product_name" class="form-control" placeholder="상품명을 입력하세요" required>
                        </div>

                        <!-- 상품 가격 -->
                        <div class="form-group">
                            <label>상품 가격</label>
                            <input type="number" name="product_price" class="form-control" placeholder="가격을 입력하세요 (원)" min="0" required>
                            <small class="form-text text-muted">숫자만 입력하세요 (예: 15000)</small>
                        </div>

                        <!-- 상품 수량 -->
                        <div class="form-group">
                            <label>상품 수량</label>
                            <input type="number" name="product_qtt" class="form-control" placeholder="재고 수량을 입력하세요" min="1" required>
                            <small class="form-text text-muted">판매할 수량을 입력하세요</small>
                        </div>

                        <!-- 카테고리 -->
                        <div class="form-group">
                            <label>상품 카테고리</label>
                            <select name="cate_no" class="form-control" required>
                                <option value="">카테고리를 선택하세요</option>
                                <option value="10">전자제품</option>
                                <option value="20">의류</option>
                                <option value="30">생활용품</option>
                                <option value="40">스포츠</option>
                                <option value="50">도서</option>
                            </select>
                        </div>

                        <!-- 판매자 정보 (세션에서 가져오거나 히든 필드로) -->
                        <input type="hidden" name="seller_id" value="${sessionScope.seller_id != null ? sessionScope.seller_id : 'test_seller'}">

                        <!-- 등록 버튼 -->
                        <div class="form-group login-btn">
                            <button class="btn btn-primary" type="submit">상품등록</button>
                            <a href="/product" class="btn btn-secondary">취소</a>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</section>