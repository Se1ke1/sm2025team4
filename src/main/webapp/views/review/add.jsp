<%--
  Created by IntelliJ IDEA.
  User: 건
  Date: 2025-07-29
  Time: 오전 9:32:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  /* 별점 UI 스타일 */
  .star-rating { display: flex; flex-direction: row-reverse; font-size: 2.5em; justify-content: space-around; padding: 0 .2em; text-align: center; width: 5em; margin: 20px auto; }
  .star-rating input { display: none; }
  .star-rating label { color: #ccc; cursor: pointer; transition: color 0.2s; }
  .star-rating :checked ~ label { color: #f90; }
  .star-rating label:hover, .star-rating label:hover ~ label { color: #fc0; }
</style>

<div class="container my-5">
  <div class="row">
    <div class="col-lg-8 offset-lg-2">
      <h2>리뷰 작성</h2>
      <hr>
      <%-- 리뷰 작성 대상 상품 정보 표시 --%>
      <div class="card mb-4">
        <div class="card-body d-flex align-items-center">
          <img src="/imgs/product/${product.product_img_main}" alt="${product.product_name}">
          <div>
            <h5 class="card-title mb-1">${product.product_name}</h5>
            <p class="card-text text-muted">이 상품에 대한 리뷰를 작성합니다.</p>
          </div>
        </div>
      </div>

      <%-- 리뷰 작성 폼 --%>
      <%-- 중요: 파일 업로드를 위해 enctype="multipart/form-data" 속성이 반드시 필요합니다. --%>
      <form id="review-form" action="/review/addimpl" method="post" enctype="multipart/form-data">
        <%-- Controller로 보낼 숨겨진 데이터 --%>
        <input type="hidden" name="product_id" value="${product.product_id}">

        <div class="form-group text-center">
          <label><strong>별점을 선택해주세요</strong></label>
          <div class="star-rating">
            <input type="radio" id="5-stars" name="review_score" value="5" /><label for="5-stars" class="star">&#9733;</label>
            <input type="radio" id="4-stars" name="review_score" value="4" /><label for="4-stars" class="star">&#9733;</label>
            <input type="radio" id="3-stars" name="review_score" value="3" /><label for="3-stars" class="star">&#9733;</label>
            <input type="radio" id="2-stars" name="review_score" value="2" /><label for="2-stars" class="star">&#9733;</label>
            <input type="radio" id="1-star" name="review_score" value="1" /><label for="1-star" class="star">&#9733;</label>
          </div>
          <div id="selected-score-display"></div>
        </div>

        <div class="form-group">
          <label for="review_article"><strong>리뷰 내용</strong></label>
          <textarea class="form-control" id="review_article" name="review_article" rows="8" placeholder="상품에 대한 솔직한 리뷰를 남겨주세요." required></textarea>
        </div>

        <div class="form-group">
          <label for="review_img_files"><strong>사진 첨부 (최대 5장) ctrl 키를 누르고 클릭하면 여러장 추가</strong></label>
          <input type="file" class="form-control-file" id="review_img_files" name="review_img_file_list" multiple accept="imgs/*">
        </div>

        <hr>
        <div class="text-center">
          <button type="submit" class="btn btn-primary btn-lg">리뷰 등록</button>
          <a href="/product_detail/product_info?id=${product.product_id}" class="btn btn-secondary btn-lg">취소</a>
        </div>
      </form>
    </div>
  </div>
</div>


