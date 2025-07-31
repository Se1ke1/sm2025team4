<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let order_placed = {
      init: function () {
        document.querySelectorAll('.order-purchase-row').forEach(row => {
          row.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const detailsRow = document.querySelector(targetId);
            if (detailsRow.style.display === 'table-row') {
              detailsRow.style.display = 'none';
            } else {
              detailsRow.style.display = 'table-row';
            }
          });
        });
      }
    }
    document.addEventListener("DOMContentLoaded", function() {
      order_placed.init();
    });
</script>
<style>
  .order-purchase-row { cursor: pointer; }
  .order-info-details { display: none; }
  .order-info-table { margin: 15px; }
</style>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active">주문 목록</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Breadcrumbs -->
<div class="shopping-cart section">
  <div class="container">
    <h2>주문 내역</h2>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <!-- Shopping Summery -->
        <table class="table shopping-summery">
          <thead>
          <tr class="main-hading">
            <th class="text-center">주문번호</th>
            <th class="text-center">주문일</th>
            <th class="text-center">주문금액</th>
            <th class="text-center">배송정보</th>
            <th class="text-center">주문상태</th>
          </tr>
          </thead>
          <tbody>
          <c:choose>
            <c:when test="true">
              <c:forEach var="op" varStatus="status" items="${order_purchases}">
                <tr class="order-purchase-row" data-target="#details_${status.index}">
                  <td class="product-des"><span>${op.order_id}</span></td>
                  <td class="product-des"><span>${op.order_placedate}</span></td>
                  <td class="product-price"><span>${op.order_price}</span></td>
                  <td class="product-des">
                    <p>${op.delivery_name}</p>
                    <p>${op.delivery_address}</p>
                    <p>${op.delivery_phone}</p>
                  </td>
                  <td class="product-des"><span>${op.status_info}</span></td>
                </tr>
                <tr class="order-info-details" id="details_${status.index}">
                  <td colspan="4">
                    <table class="table table-bordered order-info-table">
                      <thead>
                        <tr>
                          <th>상품</th>
                          <th>상품명</th>
                          <th>개수</th>
                          <th>소계</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="order_info" items="${op.order_info_list}">
                          <tr>
                            <td><a href="product_detail/product_info?id=${order_info.product_id}"><img src="/imgs/product/${order_info.order_prod_img}" alt="${order_info.order_prod_img}"></a></td>
                            <td><span><a href="product_detail/product_info?id=${order_info.product_id}">${order_info.order_prod_name}</a></span></td>
                            <td><span>${order_info.order_prod_qtt}</span></td>
                            <td><span>${order_info.order_prod_price}</span></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <tr>
                <td colspan="4"><p class="text text-center">주문한 상품이 없습니다.</p><td>
              </tr>
            </c:otherwise>
          </c:choose>
          </tbody>
        </table>
        <!--/ End Shopping Summery -->
      </div>
    </div>
  </div>
</div>