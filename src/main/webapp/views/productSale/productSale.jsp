<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<meta charset="UTF-8">
<!-- CSS 경로 수정: contextPath 사용 -->
<link rel="stylesheet" href="css/product-add.css">


<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="/productSale">Product Sale</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->


<section class="shop login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-12">
                <div class="login-form">
                    <h2>상품 판매</h2>
                    <!-- Form -->
                    <form class="form" method="post" action="/loginimpl">
                        <div class="row">

                            <div class="col-12">
                                <div class="form-selection">
                                    <input type="file" class="form-control" placeholder="Enter image name">
                                    <div class="image-box">
                                        <span>이미지 등록</span>
                                    </div>
                                </div>

                                <!-- 상품명 -->
                                <div class="col-12" style="margin-top: 20px">
                                    <div class="form-group">
                                        <label>상품명</label>
                                        <div style="display: flex; align-items: center; flex-wrap: wrap;">
                                            <input type="text" placeholder="상품명을 입력해 주세요." maxlength="40"
                                                   id="productName">
                                        </div>
                                    </div>
                                </div>

                                <!-- 가격 -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>가격</label>
                                        <div style="display: flex; align-items: center; flex-wrap: wrap;">
                                            <input type="text" placeholder="상품가격을 입력해 주세요." maxlength="40"
                                                   id="productName">
                                        </div>
                                    </div>
                                </div>


                                <!-- 상품 소개란 -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>상품 소개란</label>
                                        <div style="display: flex; align-items: center; flex-wrap: wrap;">
                                            <textarea placeholder="상품 내용을 적어주세요." class="form-control" rows="5"
                                                      id="comment"></textarea>
                                        </div>
                                    </div>
                                </div>


                                <!-- 카테고리 -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>상품 소개란</label>
                                        <div class="category-selection">
                                            <select id="mainCategory">
                                                <option>분류 선택</option>
                                                <option>가구/인테리어</option>
                                                <option>생활/주방용품</option>
                                                <option>공구/산업용품</option>
                                                <option>식품</option>
                                                <option>유아동/출산</option>
                                                <option>반려동물용품</option>
                                                <option>의류/패션잡화</option>
                                                <option>뷰티/미용</option>
                                                <option>스포츠/레저</option>
                                                <option>취미/게임/음반</option>
                                                <option>도서/티켓/문구</option>
                                                <option>가전제품</option>
                                                <option>디지털/가전</option>
                                                <option>차량/오토바이</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group login-btn">
                                        <button class="btn" type="submit">등록하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- End Form -->
                </div>
            </div>
        </div>
    </div>
</section>



