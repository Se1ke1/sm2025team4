<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* 화면 줄였을 때만 반응형 처리 */

    /* 태블릿 (992px 이하) */
    @media (max-width: 992px) {
        .product-form {
            margin-right: 20px !important;
        }

        .sell-title {
            font-size: 28px !important;
            margin-right: 200px !important;
        }

        .sell-subtitle {
            margin-right: 180px !important;
        }
    }

    /* 모바일 가로 (768px 이하) */
    @media (max-width: 768px) {
        .container {
            padding-left: 15px;
            padding-right: 15px;
        }

        .row {
            margin-left: -10px;
            margin-right: -10px;
        }

        .col-md-3, .col-md-9 {
            padding-left: 10px;
            padding-right: 10px;
        }

        /* 사이드바를 상단으로 이동 */
        .col-md-3 {
            margin-bottom: 20px;
        }

        .col-md-3 .nav {
            flex-direction: row !important;
            justify-content: center;
            gap: 15px;
        }

        .col-md-3 .nav-link {
            font-size: 16px !important;
            margin-bottom: 0 !important;
            padding: 8px 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .col-md-3 .nav-link[style*="color: #8D8D8D"] {
            background-color: #F7941D !important;
            color: white !important;
            border-color: #F7941D !important;
        }

        .product-form {
            margin-right: 0 !important;
            padding: 15px;
        }

        .sell-title {
            font-size: 24px !important;
            margin-right: 0 !important;
            text-align: center;
        }

        .sell-subtitle {
            margin-right: 0 !important;
            text-align: center;
            font-size: 14px;
        }

        /* 폼 요소 모바일 최적화 */
        .form-row {
            margin-bottom: 15px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control, .form-control-file {
            font-size: 16px; /* iOS 줌 방지 */
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
        }
    }

    /* 모바일 세로 (576px 이하) */
    @media (max-width: 576px) {
        .sell-title {
            font-size: 20px !important;
        }

        .sell-subtitle {
            font-size: 13px !important;
        }

        .product-form {
            padding: 10px !important;
        }

        .col-md-3 .nav {
            gap: 10px;
        }

        .col-md-3 .nav-link {
            font-size: 14px !important;
            padding: 6px 10px;
        }

        /* 2열 폼을 1열로 변경 */
        .form-row .col-md-6 {
            margin-bottom: 15px;
        }

        .form-control, .form-control-file {
            padding: 10px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
        }

        .form-text {
            font-size: 12px;
        }
    }

    /* 아주 작은 화면 (400px 이하) */
    @media (max-width: 400px) {
        .sell-title {
            font-size: 18px !important;
        }

        .product-form {
            padding: 8px !important;
        }

        .col-md-3 .nav-link {
            font-size: 12px !important;
            padding: 5px 8px;
        }
    }
</style>

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
                <div class="product-form" style="margin-right: 60px;">
                    <h2 class="mb-4 sell-title" style="font-weight: bold; font-size: 35px; margin-right: 370px;">상품판매</h2>
                    <p class="mb-4 sell-subtitle" style="color: #F7941D; margin-right: 340px;">판매할 상품을 입력해주세요</p>

                    <%-- 에러 메시지 표시 --%>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>오류!</strong> ${error}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>

                    <form class="form" method="post" action="/productSell" enctype="multipart/form-data">


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



                        <div class="form-group login-btn mt-4"> <%-- 버튼 위쪽에 마진 추가 --%>
                            <button class="btn btn-primary mr-2" type="submit">상품등록</button> <%-- 버튼 사이에 마진 추가 --%>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</section>