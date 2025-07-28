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
  // TODO:이거 cart.jsp 스크립트니까 수정해야함!!!!
  document.addEventListener('DOMContentLoaded', function() {
    order.init();
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
      let sm_total=0;
      let total=0;
      sm_total=parseInt($('#cart_sm_total').text());
      total=parseInt($('#cart_total').text());
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
  let order = {
    init: function() {
      $('#btn_checkout').click(async function() {
        const cust_id = '${sessionScope.cust.cust_id}';
        const custinfo_no = $('#cust_info').val();
        if (confirm("결제하시겠습니까?")) {
          try {
            const response = await order.proceedCheckOut(cust_id,custinfo_no);
            if (response&&response.redirectURL) {
              location.href = response.redirectURL;
            }
            else {
              alert("이동페이지 정보 없음")
            }
          }
          catch (error) {
            console.log(error);
            alert("요청 거부")
          }
        }
      });
      $('#cust_info').on('change',async function() {
        const custInfoNo = $(this).val();
        if (custInfoNo==='default') {
          $('#ci_nickname').val('');
          $('#ci_address').val('');
          $('#ci_phone').val('');
        }
        else {
          try {
            const response = await order.showCI(custInfoNo);
            if (response) {
              $('#ci_nickname').val(response.custinfo_name);
              $('#ci_address').val(response.custinfo_addr);
              $('#ci_phone').val(response.custinfo_phone);
            }
          }
          catch (error) {
            console.log(error);
          }
        }
      });
    },
    showCI: async function(custInfoNo){
      return $.ajax({
        url:'/custinfo/get',
        method:'POST',
        dataType: 'json',
        data: {custinfo_no:custInfoNo}
      });
    },
    proceedCheckOut: async function(cust_id,custinfo_no){
      return $.ajax({
        url:'/orderimpl',
        method:'POST',
        dataType: 'json',
        data: {id:cust_id,info:custinfo_no}
      });
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
<section class="shop checkout section">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-12">
        <!-- Shopping Cart -->
        <div class="shopping-cart section">
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
                      <td>결제할 상품이 없습니다.<td>
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
              <div class="form-group">
                <label>주소<span>*</span></label>
                <select name="cust_info" id="cust_info">
                  <option value="default" selected>직접 입력</option>
                  <c:forEach var="ci" items="${custInfos}">
                    <option value="${ci.custinfo_no}">${ci.custinfo_name}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="col-12">
              <div class="form-group">
                <label>주소록 별명</label>
                <input id="ci_nickname" type="text">
                <label>주소<span>*</span></label>
                <input id="ci_address" type="text">
                <label>전화번호<span>*</span></label>
                <input id="ci_phone" type="text">
              </div>
            </div>
          </div>
        </div>
        <!--/ End Shopping Cart -->
      </div>
      <div class="col-lg-4 col-12">
        <div class="order-details">
          <!-- Order Widget -->
          <div class="single-widget">
            <h2>CART  TOTALS</h2>
            <div class="content">
              <ul>
                <li>Sub Total<span>$330.00</span></li>
                <li>(+) Shipping<span>$10.00</span></li>
                <li class="last">Total<span>$340.00</span></li>
              </ul>
            </div>
          </div>
          <!--/ End Order Widget -->
          <!-- Order Widget -->
          <div class="single-widget">
            <h2>Payments</h2>
            <div class="content">
              <div class="checkbox">
                <label class="checkbox-inline" for="1"><input name="updates" id="1" type="checkbox"> Check Payments</label>
                <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox"> Cash On Delivery</label>
                <label class="checkbox-inline" for="3"><input name="news" id="3" type="checkbox"> PayPal</label>
              </div>
            </div>
          </div>
          <!--/ End Order Widget -->
          <!-- Payment Method Widget -->
          <div class="single-widget payement">
            <div class="content">
              <img src="imgs/payment-method.png" alt="payment-method">
            </div>
          </div>
          <!--/ End Payment Method Widget -->
          <!-- Button Widget -->
          <div class="single-widget get-button">
            <div class="content">
              <div class="button">
                <button id="btn_checkout" class="btn">proceed to checkout</button>
              </div>
            </div>
          </div>
          <!--/ End Button Widget -->
        </div>
      </div>
    </div>
  </div>
</section>