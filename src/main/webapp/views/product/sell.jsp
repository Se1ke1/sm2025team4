<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Product 페이지 전용 CSS -->
<link rel="stylesheet" href="/css/product/sell.css">

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


                        <!-- 이미지 미리보기 영역 -->
                        <div class="form-row" id="imagePreviewContainer" style="display: none;">
                            <div class="form-group col-md-12">
                                <label>이미지 미리보기</label>
                                <div class="text-center" style="margin-bottom: 20px;">
                                    <img id="imagePreview"
                                         alt="선택된 이미지 미리보기"
                                         style="width: 300px; height: 300px; object-fit: cover; border: 2px solid #28a745; border-radius: 10px;">
                                </div>
                            </div>
                        </div>

                        <div class="form-row"> <%-- Bootstrap의 form-row는 내부 col에 대해 간격을 줄여줍니다. --%>
                            <div class="form-group col-md-12"> <%-- 한 줄 전체 사용 --%>
                                <label for="productMainImage">상품 대표 이미지 업로드</label>
                                <input type="file" name="product_img_main_file" class="form-control-file" id="productMainImage" accept="image/*" required>
                                <small class="form-text text-muted">상품의 대표 이미지를 선택하면 위에 미리보기가 나타납니다.</small>
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
                                    <option value="10">상위</option>
                                    <option value="20">하의</option>
                                    <option value="30">신발</option>
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

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 이미지 미리보기 기능
        const imageUpload = document.getElementById('productMainImage');
        const imagePreview = document.getElementById('imagePreview');
        const previewContainer = document.getElementById('imagePreviewContainer');

        imageUpload.addEventListener('change', function(event) {
            const file = event.target.files[0];

            if (file) {
                // 파일이 이미지인지 확인
                if (file.type.startsWith('image/')) {
                    const reader = new FileReader();

                    reader.onload = function(e) {
                        // 이미지 미리보기 표시
                        imagePreview.src = e.target.result;
                        previewContainer.style.display = 'block';

                        // 미리보기 영역으로 스크롤
                        previewContainer.scrollIntoView({
                            behavior: 'smooth',
                            block: 'center'
                        });

                        console.log('이미지 미리보기 표시 완료');
                    };

                    reader.readAsDataURL(file);
                } else {
                    alert('이미지 파일만 선택해주세요.');
                    event.target.value = ''; // 파일 선택 초기화
                    previewContainer.style.display = 'none'; // 미리보기 숨김
                }
            } else {
                // 파일 선택이 취소된 경우 미리보기 숨김
                previewContainer.style.display = 'none';
                console.log('파일 선택 취소 - 미리보기 숨김');
            }
        });

        // 폼 제출 전 이미지 선택 여부 확인
        const form = document.querySelector('form');
        form.addEventListener('submit', function(event) {
            const file = imageUpload.files[0];
            if (!file) {
                alert('상품 대표 이미지를 선택해주세요.');
                event.preventDefault(); // 폼 제출 중단
                imageUpload.focus(); // 파일 input에 포커스
            }
        });
    });
</script>