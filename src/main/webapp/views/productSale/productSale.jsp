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

<!-- 상품 등록 페이지 시작 -->
<section class="product-registration">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3 col-12">
        <div class="page-title">
          <h2 style="margin-top: 20px">상품 등록</h2>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-10 col-12">
        <div class="product-form">
          <form>
            <!-- 상품 이미지 -->
            <div class="form-section">
              <label>상품이미지</label>
              <input type="file" accept="image/*" multiple>
              <div class="image-box">
                <span>이미지 등록</span>
              </div>
              <p class="note">상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여져요.</p>
            </div>

            <!-- 상품명 -->
            <div class="form-section">
              <label>상품명</label>
              <div style="display: flex; align-items: center; flex-wrap: wrap;">
                <input type="text" placeholder="상품명을 입력해 주세요." maxlength="40" id="productName">
              </div>
            </div>

            <!-- 가격 -->
            <div class="form-section">
              <label>가격</label>
              <div style="display: flex; align-items: center; flex-wrap: wrap;">
                <input type="text" placeholder="상품가격을 입력해 주세요." maxlength="40" id="productPrice">
              </div>
            </div>

            <!--상품 소개란 -->
            <div class="form-section">
              <label>상품 소개란</label>
              <textarea placeholder="상품 내용을 적어주세요." class="form-control" rows="5" id="comment"></textarea>
            </div>

            <!-- 카테고리 -->
            <div class="form-section">
              <label>카테고리</label>
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
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 상품 등록 페이지 끝 -->


