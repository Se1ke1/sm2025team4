<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/sale">상품판매</a>
          </li>
        </ul>
      </div>
      <%-- Navbar --%>

      <%-- mypage --%>
      <div class=" col-9">
        <div class="login-form">
          <h2>나의 상품 목록</h2>
          <!-- Shopping Cart -->
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
                      <th class="text-center">총합</th>
                      <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                      <c:when test="${cartSize>0}">
                        <c:forEach var="cart" items="${carts}">
                          <tr>
                            <td class="image" data-title="No"><img src="/imgs/product/${cart.product_img_main}" alt="${cart.product_img_main}"></td>
                            <td class="product-des" data-title="Description">
                              <p class="product-name"><a href="/product_detail?id=${cart.product_id}">${cart.product_name}</a></p>
                              <p class="product-des"></p>
                            </td>
                            <td class="price" data-title="Price"><span>${cart.product_price}</span></td>
                            <td class="qty" data-title="Qty"><!-- Input Order -->
                              <div class="input-group">
                                <div class="button minus">
                                  <button type="button" class="btn btn-primary btn-number minus_btn" data-cart-id="${cart.cart_id}">
                                    <i class="ti-minus"></i>
                                  </button>
                                </div>
                                <input type="text" class="input-number cartQtt"  data-min="1" data-max="100" value="${cart.cart_qtt}">
                                <div class="button plus">
                                  <button type="button" class="btn btn-primary btn-number plus_btn" data-cart-id="${cart.cart_id}">
                                    <i class="ti-plus"></i>
                                  </button>
                                </div>
                              </div>
                              <!--/ End Input Order -->
                            </td>
                            <td><span id="${cart.cart_id}">${cart.cart_price}</span></td>
                            <td><button class="del_btn" data-cart-id="${cart.cart_id}"><i class="ti-trash remove-icon"></i></button></td>
                          </tr>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <tr>
                          <td></td>
                          <td>상품 없음<td>
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
          <!--/ End Shopping Cart -->
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ End Account -->