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
  document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.minus_btn').forEach(button=>{
      button.addEventListener('click',()=>{
        const cart_id=button.dataset.cartId;
        const qttInput=button.parentElement.nextElementSibling;
        let newQtt = parseInt(qttInput.value)-1;
        if (newQtt>0) qttInput.value=newQtt;
        cart.change(cart_id,qttInput.value);
      });
    });
    document.querySelectorAll('.plus_btn').forEach(button=>{
      button.addEventListener('click', ()=>{
        const cart_id=button.dataset.cartId;
        const qttInput=button.parentElement.previousElementSibling;
        qttInput.value=parseInt(qttInput.value)+1;
        cart.change(cart_id,qttInput.value);
      });
    });
    document.querySelectorAll('.del_btn').forEach(button=>{
      button.addEventListener('click',()=>{
        if (confirm('정말 삭제하시겠습니까?')) {
          const cart_id=button.dataset.cartId;
          cart.remove(cart_id);
        }
      })
    })
  });
  let cart = {
    change: async function(cartId,qtt){
      return $.ajax({
        url:'/cart/modify',
        method:'POST',
        data:{cart_id:cartId,cart_qtt:qtt},
        dataType: 'json',
        success:function(response){
          $('#'+cartId).text(response.price);
          $('#cart_sm_total').text(response.sm_total);
          $('#cart_total').text(response.total);
        },
        error:function(xhr, status, error) {
          alert('통신오류');
          console.log(xhr.responseText);
        }
      });
    },
    remove: async function(cartId){
      return $.ajax({
        url:'/cart/remove',
        method:'POST',
        dataType: 'json',
        data: {cart_id:cartId},
        success:function(response){
          if(response) {
          //   삭제 성공
            location.reload();
          }
          else {
          //   삭제 실패
          }
        },
        error:function(xhr, status, error) {
        //   전송 실패
        }
      })
    }
  }
</script>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active">장바구니</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Breadcrumbs -->

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
                <td>아직 장바구니에 상품이 없습니다.<td>
              </tr>
            </c:otherwise>
          </c:choose>

          </tbody>
        </table>
        <!--/ End Shopping Summery -->
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <!-- Total Amount -->
        <div class="total-amount">
          <div class="row">
            <div class="col-lg-8 col-md-5 col-12">
              <div class="left">
              </div>
            </div>
            <div class="col-lg-4 col-md-7 col-12">
              <div class="right">
                <ul>
                  <li>소계<span id="cart_sm_total">${total}</span></li>
                  <li>배송비<span>Free</span></li>
                  <li class="last">총계<span id="cart_total">${total}</span></li>
                </ul>
                <div class="button5">
                  <a href="/order" class="btn">결제하기</a>
                  <a href="/" class="btn">계속 쇼핑하기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--/ End Total Amount -->
      </div>
    </div>
  </div>
</div>
<!--/ End Shopping Cart -->