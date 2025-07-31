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
          <h2 class="mb-4 detail-title" style="font-weight: bold; font-size: 35px;">상품 상세 정보</h2>
          <p class="mb-4 detail-subtitle" style="color: #F7941D;">상품 정보를 확인하고 수정할 수 있습니다</p>

          <form id="product_update_form" class="form" method="post" action="/product/update" enctype="multipart/form-data">

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
                <img id="current_image" src="/imgs/product/${p.product_img_main}"
                     alt="${p.product_name}"
                     style="width: 300px; height: 300px; object-fit: cover; border: 1px solid #ddd; border-radius: 10px;">
              </div>
            </div>

            <!-- 기존 이미지 히든 필드 -->
            <input type="hidden" value="${p.product_img_main}" name="product_img_main">

            <!-- 새 상품 이미지 업로드 -->
            <div class="form-group">
              <label>새 상품 이미지 업로드 (선택사항)</label>
              <input type="file" id="image_upload" name="product_img_main_file" class="form-control" accept="image/*">
              <small class="form-text text-muted">새 이미지를 선택하면 위 이미지가 바로 미리보기로 변경됩니다.</small>
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
                  <option value="10" <c:if test="${p.cate_no == 10}">selected</c:if>>전자제품</option>
                  <option value="20" <c:if test="${p.cate_no == 20}">selected</c:if>>의류</option>
                  <option value="30" <c:if test="${p.cate_no == 30}">selected</c:if>>생활용품</option>
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
    // 폼 초기 상태 저장
    const form = document.getElementById('product_update_form');
    const initialFormData = new FormData(form);

    // 버튼 요소들
    const updateBtn = document.getElementById('update_btn');
    const deleteBtn = document.getElementById('delete_btn');

    // 초기에는 수정 버튼 비활성화
    updateBtn.disabled = true;
    updateBtn.style.opacity = '0.6';
    updateBtn.style.cursor = 'not-allowed';

    // 폼 입력 요소들 감시하여 변경 시 수정 버튼 활성화
    const formInputs = form.querySelectorAll('input[type="text"], input[type="number"], select, input[type="file"]');
    formInputs.forEach(input => {
      input.addEventListener('change', function() {
        // 변경사항이 있으면 수정 버튼 활성화
        updateBtn.disabled = false;
        updateBtn.style.opacity = '1';
        updateBtn.style.cursor = 'pointer';
        updateBtn.style.backgroundColor = '#007bff';
      });
    });

    // 이미지 미리보기 기능
    const imageUpload = document.getElementById('image_upload');
    const currentImage = document.getElementById('current_image');
    const originalImageSrc = currentImage.src; // 원본 이미지 경로 저장

    imageUpload.addEventListener('change', function(event) {
      const file = event.target.files[0];

      if (file) {
        // 파일이 이미지인지 확인
        if (file.type.startsWith('image/')) {
          const reader = new FileReader();

          reader.onload = function(e) {
            // 기존 이미지를 새로 선택한 이미지로 교체
            currentImage.src = e.target.result;
            currentImage.style.border = '2px solid #28a745'; // 변경된 것을 표시
            console.log('이미지 미리보기 업데이트 완료');
          };

          reader.readAsDataURL(file);
        } else {
          alert('이미지 파일만 선택해주세요.');
          event.target.value = ''; // 파일 선택 초기화
        }
      } else {
        // 파일 선택이 취소된 경우 원본 이미지로 복원
        currentImage.src = originalImageSrc;
        currentImage.style.border = '1px solid #ddd'; // 원래 테두리로 복원
        console.log('원본 이미지로 복원 완료');
      }
    });

    // 삭제 버튼 이벤트 리스너
    deleteBtn.addEventListener('click', function() {
      if (confirm('정말로 이 상품을 삭제하시겠습니까?\n삭제된 상품은 복구할 수 없습니다.')) {
        // 삭제 버튼 비활성화 (중복 클릭 방지)
        deleteBtn.disabled = true;
        deleteBtn.textContent = '삭제 중...';

        const productId = form.querySelector('input[name="product_id"]').value;
        product.remove(productId);
      }
    });

    // 수정 버튼 이벤트 리스너
    updateBtn.addEventListener('click', function() {
      if (!updateBtn.disabled) {
        if (confirm('상품 정보를 수정하시겠습니까?')) {
          // 수정 버튼 비활성화 (중복 클릭 방지)
          updateBtn.disabled = true;
          updateBtn.textContent = '수정 중...';

          // 폼 제출
          form.submit();
        }
      }
    });

    product.init();
  });

  let product = {
    init: function() {
      console.log('상품 detail 페이지 초기화 완료');

      // 카테고리 선택 값 설정
      const cateSelect = document.querySelector('select[name="cate_no"]');
      const currentCateNo = '${p.cate_no}';
      if (currentCateNo && cateSelect) {
        cateSelect.value = currentCateNo;
      }
    },

    remove: async function(productId) {
      try {
        const response = await $.ajax({
          url: '/product/delete',
          method: 'POST',
          dataType: 'json',
          data: { id: productId },
          timeout: 10000 // 10초 타임아웃
        });

        if (response.success) {
          alert('상품이 성공적으로 삭제되었습니다.');
          // 상품 목록 페이지로 이동
          window.location.href = '/product';
        } else {
          alert('상품 삭제에 실패했습니다: ' + response.message);
          // 삭제 버튼 다시 활성화
          const deleteBtn = document.getElementById('delete_btn');
          deleteBtn.disabled = false;
          deleteBtn.textContent = '상품 삭제';
        }
      } catch (error) {
        console.error('삭제 요청 중 오류:', error);
        alert('통신 오류가 발생했습니다. 다시 시도해주세요.');
        // 삭제 버튼 다시 활성화
        const deleteBtn = document.getElementById('delete_btn');
        deleteBtn.disabled = false;
        deleteBtn.textContent = '상품 삭제';
      }
    }
  }
</script>