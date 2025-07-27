<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
    <meta charset="UTF-8">
    <title>상품판매</title>
</head>
<body>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="/product">product</a></li>
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
                        <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; " href="/product">나의상품</a>
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
                    <p>판매할 상픔을 입력해주세요</p>

                    <form class="form" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label>상품 이미지 업로드</label>
                            <input type="file" name="product_image" class="form-control" accept="image/*" required>
                        </div>

                        <div class="form-group">
                            <label>상품 이름</label>
                            <input type="text" name="product_name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>상품 가격</label>
                            <input type="text" name="product_price" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>상품 수량</label>
                            <input type="number" name="product_price" class="form-control" required>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>상품 카테고리</label>
                                <select name="product_category">
                                    <option value = 10>선택하세요</option>
                                    <option value = 20>전자제품</option>
                                    <option value= 30>의류</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group login-btn">
                            <button class="btn" type="submit">상품등록</button>
                        </div>


                    </form>

                </div>
            </div>
            <!-- 상품 추가 폼 -->



        </div>
    </div>
</section>
<!-- /메인 영역 -->


</body>
</html>
