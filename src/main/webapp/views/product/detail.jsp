<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li><a href="/product">나의상품<i class="ti-arrow-right"></i></a></li>
            <li class="active"><a href="#">상품상세</a></li>
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
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/sale">상품판매</a>
          </li>
        </ul>
      </div>

      <!-- 상품 상세/수정 폼 -->
      <div class="col-md-9">
        <div class="product-form">
          <h2>상품 상세 정보</h2>
          <p>상품 정보를 확인하고 수정할 수 있습니다</p>

          <form id="product_update_form" class="form" method="post" action="/detail" enctype="multipart/form-data">

            <!-- 상품 ID (숨김) -->
            <input type="hidden" name="product_id" value="${p.product_id}">
            <input type="hidden" name="seller_id" value="${p.seller_id}">

            <!-- 상품 ID 표시 -->
            <div class="form-group">
              <label>상품 ID</label>
              <p class="form-control-static" style="padding: 10px; background-color: #f8f9fa; border: 1px solid #ced4da; border-radius: 4px;">
                ${p.product_id}
              </p>
            </div>

            <!-- 현재 상품 이미지 표시 -->
            <div class="form-group">
              <label>현재 상품 이미지</label>
              <div class="text-center" style="margin-bottom: 20px;">
                <img src="/imgs/product/${p.product_img_main}"
                     alt="${p.product_name}"
                     style="width: 300px; height: 300px; object-fit: cover; border: 1px solid #ddd; border-radius: 10px;">
              </div>
            </div>

            <!-- 기존 이미지 히든 필드 -->
            <input type="hidden" value="${p.product_img_main}" name="product_img_main">

            <!-- 새 상품 이미지 업로드 -->
            <div class="form-group">
              <label>새 상품 이미지 업로드 (선택사항)</label>
              <input type="file" name="product_img_file_list" class="form-control" accept="imgs/*">
              <small class="form-text text-muted">새 이미지를 선택하면 기존 이미지가 교체됩니다.</small>
            </div>

            <!-- 상품명 -->
            <div class="form-group">
              <label>상품 이름</label>
              <input type="text" name="product_name" class="form-control"
                     value="${p.product_name}" placeholder="상품명을 입력하세요" required>
            </div>

            <!-- 상품 가격 -->
            <div class="form-group">
              <label>상품 가격</label>
              <input type="number" name="product_price" class="form-control"
                     value="${p.product_price}" placeholder="가격을 입력하세요 (원)" min="0" required>
              <small class="form-text text-muted">숫자만 입력하세요 (예: 15000)</small>
            </div>

            <!-- 상품 수량 -->
            <div class="form-group">
              <label>상품 수량</label>
              <input type="number" name="product_qtt" class="form-control"
                     value="${p.product_qtt}" placeholder="재고 수량을 입력하세요" min="1" required>
              <small class="form-text text-muted">판매할 수량을 입력하세요</small>
            </div>

            <!-- 카테고리 -->
            <div class="form-row">
            <div class="form-group">
              <label>상품 카테고리</label>
              <select name="cate_no" class="form-control" required>
                <option value="">카테고리를 선택하세요</option>
                <option value="10" >전자제품</option>
                <option value="20" >의류</option>
                <option value="30">생활용품</option>
              </select>
            </div>
            </div>



            <!-- 등록일 -->
            <div class="form-group">
              <label>등록일</label>
              <p class="form-control-static" style="padding: 10px; background-color: #f8f9fa; border: 1px solid #ced4da; border-radius: 4px;">
                <fmt:parseDate value="${p.product_regdate}"
                               pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
                <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" value="${parsedDateTime}" />
              </p>
            </div>

            <!-- 수정일 -->
            <div class="form-group">
              <label>최종 수정일</label>
              <p class="form-control-static" style="padding: 10px; background-color: #f8f9fa; border: 1px solid #ced4da; border-radius: 4px;">
                <c:choose>
                  <c:when test="${p.product_update != null}">
                    <fmt:parseDate value="${p.product_update}"
                                   pattern="yyyy-MM-dd HH:mm:ss" var="parsedUpdateTime" type="both" />
                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" value="${parsedUpdateTime}" />
                  </c:when>
                  <c:otherwise>
                    수정된 적 없음
                  </c:otherwise>
                </c:choose>
              </p>
            </div>

            <!-- 버튼 그룹 -->
            <div class="form-group login-btn">
              <button type="button" class="btn btn-primary" id="update_btn">상품 수정</button>
              <button type="button" class="btn btn-danger" id="delete_btn">상품 삭제</button>
              <a href="/product" class="btn btn-secondary">목록으로</a>
            </div>

          </form>

        </div>
      </div>

    </div>
  </div>
</section>


<script>
  document.addEventListener('DOMContentLoaded', function() {
    // 삭제 버튼 이벤트 리스너
    document.querySelectorAll('.delete_btn').forEach(button => {
      button.addEventListener('click', () => {
        if (confirm('정말로 이 상품을 삭제하시겠습니까?')) {
          const product_id = button.dataset.productId;
          product.remove(product_id);
        }
      });
    });

    // 수정 버튼 이벤트 리스너
    document.querySelectorAll('.update_btn').forEach(button => {
      button.addEventListener('click', () => {
        const product_id = button.dataset.productId;
        product.edit(product_id);
      });
    });

    product.init();
  });

  let product = {
    init: function() {
      // 초기화 로직 (필요시)
    },

    remove: async function(productId) {
      return $.ajax({
        url: '/product/delete',
        method: 'POST',
        dataType: 'json',
        data: { id: productId },
        success: function(response) {
          if (response.success) {
            // 삭제 성공
            location.reload();
          } else {
            // 삭제 실패
            alert('상품 삭제에 실패했습니다: ' + response.message);
          }
        },
        error: function(xhr, status, error) {
          // 전송 실패
          alert('통신 오류가 발생했습니다.');
          console.log(xhr.responseText);
        }
      });
    },

    edit: function(productId) {
      // 수정 페이지로 이동
      window.location.href = '/product/edit?id=' + productId;
    }
  }
</script>