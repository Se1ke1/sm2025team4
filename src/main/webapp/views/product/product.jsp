<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Product 페이지 전용 CSS -->
<link rel="stylesheet" href="/css/product/product.css">

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

<!-- Shop Account -->
<section class="product section">
  <div class="container">
    <div class="row">
      <%-- Navbar --%>
      <div class="col-md-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; color: #8D8D8D"
               href="/product">나의상품</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/sell">상품판매</a>
          </li>
        </ul>
      </div>
      <%-- Navbar --%>

      <%-- mypage --%>
      <div class="col-md-9">
        <div class="login-form">
          <div class="product-header">
            <h2 class="product-title">나의 상품 목록</h2>

            <div class="user-info">
              <c:if test="${not empty loggedUser}">
                <p class="user-name">
                  <strong>${loggedUser.cust_name}</strong>님의 상품
                </p>
              </c:if>
              <p class="product-count">
                총 <span style="font-size: 18px;">${productCount}</span>개 상품
              </p>

              <c:if test="${not empty plist and productCount > 0}">
                <p>상품을 수정하실려면 이미지를 눌러주세요</p>
              </c:if>

            </div>
          </div>

          <!-- 에러 메시지 표시 -->
          <c:if test="${not empty error}">
            <div class="alert alert-danger" style="margin-bottom: 20px;">
              <strong>오류!</strong> ${error}
            </div>
          </c:if>

          <!-- 상품이 없는 경우 안내 메시지 -->
          <c:if test="${empty plist or productCount == 0}">
            <div class="empty-state">
              <i class="fa fa-box-open empty-icon"></i>
              <h4 class="empty-title">등록된 상품이 없습니다</h4>
              <p class="empty-description">새로운 상품을 등록해보세요!</p>
              <a href="/sell" class="btn btn-primary add-product-btn" style="color: white;">
                <i class="fa fa-plus" style="color: white;"></i> 상품 등록하기
              </a>
            </div>
          </c:if>

          <!-- 상품 목록 -->
          <c:if test="${not empty plist and productCount > 0}">

            <!-- 데스크톱/태블릿 테이블 뷰 -->
            <div class="product-table-container">
              <table class="table product-table">
                <thead>
                <tr>
                  <th>상품</th>
                  <th>상품명</th>
                  <th class="text-center">개별 가격</th>
                  <th class="text-center">수량</th>
                  <th class="text-center regdate">등록일</th>
                  <th class="text-center category">카테</th>
                  <th class="text-center">삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${plist}">
                  <tr>
                    <td class="text-center">
                      <a href="/productDetail?id=${p.product_id}"
                         title="클릭하여 '${p.product_name}' 상세보기">
                        <img src="/imgs/product/${p.product_img_main}"
                             alt="${p.product_name}"
                             class="product-image">
                      </a>
                    </td>
                    <td>
                      <p class="product-name">
                        <a href="/productDetail?id=${p.product_id}">${p.product_name}</a>
                      </p>
                        <%--                      <p style="color: #999; font-size: 12px; margin: 0;">ID: ${p.product_id}</p>--%>
                    </td>
                    <td class="text-center">
                        <span style="color: #F7941D; font-weight: 700;">
                          <fmt:formatNumber value="${p.product_price}" pattern="#,###"/>원
                        </span>
                    </td>
                    <td class="text-center">
                        <span style="background: #f8f9fa; padding: 4px 8px; border-radius: 4px;">
                          ${p.product_qtt}개
                        </span>
                    </td>
                    <td class="text-center regdate">
                                            <span><fmt:formatDate value="${p.product_regdate}"
                                                                  pattern="yyyy-MM-dd"/></span>
                    </td>
                    <td class="text-center category">
                      <span>${p.cate_name}</span>
                    </td>
                    <td class="text-center">
                      <button type="button" class="btn btn-sm delete-btn del_btn"
                              data-product-id="${p.product_id}"
                              title="상품 삭제">
                        <i class="ti-trash"></i>
                      </button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>

            <!-- 모바일 카드 뷰 -->
            <div class="mobile-product-cards">
              <c:forEach var="p" items="${plist}">
                <div class="product-card">
                  <div class="product-card-header">
                    <img src="/imgs/product/${p.product_img_main}"
                         alt="${p.product_name}"
                         class="product-card-image">
                    <div class="product-card-info">
                      <div class="product-card-name">
                        <a href="/productDetail?id=${p.product_id}">${p.product_name}</a>
                      </div>
                      <div class="product-card-id">ID: ${p.product_id}</div>
                    </div>
                  </div>
                  <div class="product-card-details">
                    <div class="product-card-price">
                      <fmt:formatNumber value="${p.product_price}" pattern="#,###"/>원
                    </div>
                    <div class="product-card-quantity">${p.product_qtt}개</div>
                  </div>
                  <div class="product-card-actions">
                    <button type="button" class="product-card-delete del_btn"
                            data-product-id="${p.product_id}">
                      <i class="ti-trash-o"></i> 삭제
                    </button>
                  </div>
                </div>
              </c:forEach>
            </div>

          </c:if>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ End Account -->

<script>
  document.addEventListener('DOMContentLoaded', function () {
    product.init();
  });

  let product = {
    init: function () {
      // 삭제 버튼 이벤트 리스너
      document.querySelectorAll('.del_btn').forEach(button => {
        button.addEventListener('click', () => {
          if (confirm('정말로 이 상품을 삭제하시겠습니까?')) {
            const product_id = button.dataset.productId;
            product.remove(product_id);
          }
        });
      });

      // 수정 버튼 이벤트 리스너
      document.querySelectorAll('.edit_btn').forEach(button => {
        button.addEventListener('click', () => {
          const product_id = button.dataset.productId;
          product.edit(product_id);
        });
      });
    },

    remove: async function (productId) {
      return $.ajax({
        url: '/product/delete',
        method: 'POST',
        dataType: 'json',
        data: {id: productId},
        success: function (response) {
          if (response.success) {
            // 삭제 성공
            location.reload();
          } else {
            // 삭제 실패
            alert('상품 삭제에 실패했습니다: ' + response.message);
          }
        },
        error: function (xhr, status, error) {
          // 전송 실패
          alert('통신 오류가 발생했습니다.');
          console.log(xhr.responseText);
        }
      });
    },

    edit: function (productId) {
      // 수정 페이지로 이동
      window.location.href = '/product/edit?id=' + productId;
    }
  }
</script>
