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
      <div class="col-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; color: #8D8D8D" href="/product">나의상품</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/sell">상품판매</a>
          </li>
        </ul>
      </div>
      <%-- Navbar --%>

      <%-- mypage --%>
      <div class="col-9">
        <div class="login-form">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
            <h2>나의 상품 목록</h2>
            <div style="text-align: right;">
              <c:if test="${not empty loggedUser}">
                <p style="margin: 0; color: #666; font-size: 14px;">
                  <strong>${loggedUser.cust_name}</strong>님의 상품
                </p>
              </c:if>
              <p style="margin: 5px 0 0 0; color: #F7941D; font-weight: bold; font-size: 16px;">
                총 <span style="font-size: 18px;">${productCount}</span>개 상품
              </p>
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
            <div style="text-align: center; padding: 60px 30px; background: #f8f9fa; border-radius: 10px; margin-bottom: 20px;">
              <i class="fa fa-box-open" style="font-size: 48px; color: #ddd; margin-bottom: 15px;"></i>
              <h4 style="color: #666; margin-bottom: 10px;">등록된 상품이 없습니다</h4>
              <p style="color: #999; margin-bottom: 20px;">새로운 상품을 등록해보세요!</p>
              <a href="/sell" class="btn btn-primary" style="padding: 10px 20px;">
                <i class="fa fa-plus"></i> 상품 등록하기
              </a>
            </div>
          </c:if>

          <!-- Shopping Cart -->
          <c:if test="${not empty plist and productCount > 0}">
            <div class="shopping-cart section">
              <div class="container">
                <div class="row">
                  <div class="col-12">
                    <!-- Shopping Summery -->
                    <table class="table shopping-summery">
                      <thead>
                      <tr class="main-hading">
                        <th>상품</th>
                        <th>상품명</th>
                        <th class="text-center">개별 가격</th>
                        <th class="text-center">수량</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">카테</th>
                        <th class="text-center">삭제</th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="p" items="${plist}">
                        <tr>
                          <td class="image">
                            <img src="/imgs/${p.product_img_main}"
                                 alt="${p.product_name}"
                                 style="width: 80px; height: 80px; object-fit: cover;">
                          </td>
                          <td class="product-des">
                            <p class="product-name">
                              <a href="/productDetail?id=${p.product_id}">${p.product_name}</a>
                            </p>
                            <p class="product-des">상품 ID: ${p.product_id}</p>
                          </td>
                          <td class="price text-center">
                            <span><fmt:formatNumber value="${p.product_price}" pattern="#,###" />원</span>
                          </td>
                          <td class="quantity text-center">
                            <span>${p.product_qtt}개</span>
                          </td>
                          <td class="regdate text-center">
                            <span><fmt:formatDate value="${p.product_regdate}" pattern="yyyy-MM-dd" /></span>
                          </td>
                          <td class="category text-center">
                            <span>${p.cate_name}</span>
                          </td>
                          <td class="action text-center">
                            <a href="#" class="btn btn-xs btn-danger del_btn"
                               style="padding: 5px 5px;"
                               data-product-id="${p.product_id}">
                              <i class="ti-trash remove-icon" style="color: white"></i>
                            </a>
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                    <!--/ End Shopping Summery -->
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Shopping Cart -->
          </c:if>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ End Account -->

<script>
  document.addEventListener('DOMContentLoaded', function() {
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