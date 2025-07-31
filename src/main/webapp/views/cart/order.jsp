<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--TODO: 주소 등 필수 항목 입력하지 않았을때 거부하는 메커니즘 추가--%>
<script>
  // TODO:이거 cart.jsp 스크립트!
  let cart = {
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
  // order 스크립트 시작 지점
  let custinfo = {
    cust_id:null,
    custinfo_name:null,
    custinfo_addr:null,
    custinfo_phone:null,
    init: function(){
      custinfo.cust_id = '${sessionScope.cust.cust_id}';
      custinfo.update();
      $('#ci_name,#ci_address,#ci_phone').on('input', function(){
        if (custinfo.validate()) {
          custinfo.update();
        }
      });
    },
    update: function(){
      custinfo.custinfo_name = $('#ci_name').val();
      custinfo.custinfo_phone = $('#ci_phone').val();
      custinfo.custinfo_addr = $('#ci_address').val();
    },
    upload: async function(custinfodata){
      return $.ajax({
        url:'/api/modify/custinfo',
        method:'POST',
        dataType: 'json',
        data:custinfodata
      });
    },
    validate: function(){
      let result = true;
      let custinfo_name = $('#ci_name').val();
      let custinfo_addr = $('#ci_address').val();
      let custinfo_phone = $('#ci_phone').val();
      if (!custinfo_name||custinfo_name===''){
        $('#anno_name').text('이름은 필수 입력 사항입니다!');
        result = false;
      }
      else {
        $('#anno_name').text('');
      }
      if (!custinfo_addr||custinfo_addr===''){
        $('#anno_address').text('주소는 필수 입력 사항입니다!');
        result=false;
      }
      else {
        $('#anno_address').text('');
      }
      if (!custinfo_phone||custinfo_phone===''){
        $('#anno_phone').text('전화번호는 필수 입력 사항입니다!');
        result=false;
      }
      else {
        const regex = /^010-\d{4}-\d{4}$/;
        const reg = /^010\d{8}$/;
        if (regex.test(custinfo_phone)||reg.test(custinfo_phone)){
          $('#anno_phone').text('');
        }
        else {
          $('#anno_phone').text('000-0000-0000 또는 01011112222 형태로 입력해주세요!');
          result = false;
        }
      }
      return result;
    }
  }
  let order = {
    init: function() {
      document.querySelectorAll('.minus_btn').forEach(button=>{
        button.addEventListener('click',()=>{
          const cart_id=button.dataset.cartId;
          const qttInput=button.parentElement.nextElementSibling;
          let newQtt = parseInt(qttInput.value)-1;
          if (newQtt>0) qttInput.value=newQtt;
          order.change(cart_id,qttInput.value);
        });
      });
      document.querySelectorAll('.plus_btn').forEach(button=>{
        button.addEventListener('click', ()=>{
          const cart_id=button.dataset.cartId;
          const qttInput=button.parentElement.previousElementSibling;
          qttInput.value=parseInt(qttInput.value)+1;
          order.change(cart_id,qttInput.value);
        });
      });
      document.querySelectorAll('.del_btn').forEach(button=>{
        button.addEventListener('click',()=>{
          if (confirm('정말 삭제하시겠습니까?')) {
            const cart_id=button.dataset.cartId;
            cart.remove(cart_id);
          }
        })
      });
      $('#btn_checkout').click(async function() {
        const cb = $('#cb_addCI').prop('checked');
        if (custinfo.validate()) {
          if (confirm("결제하시겠습니까?")) {
            try {
              const response = await order.proceedCheckOut(custinfo);
              if (response&&response.redirectURL) {
                if (cb==='checked') {
                  const ci_response = await custinfo.upload(custinfo);
                  if (!ci_response){
                    alert("계정 정보 갱신 실패")
                  }
                }
                if (response&&response.message) alert(response.message);
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
        }
      });
      $('#cust_info').on('change',async function() {
        const custInfoNo = $(this).val();
        if (custInfoNo==='default') {
          $('#ci_name').val('');
          $('#ci_address').val('');
          $('#ci_phone').val('');
        }
        else {
          try {
            const response = await order.showCI(custInfoNo);
            if (response) {
              $('#ci_name').val(response.custinfo_name);
              $('#ci_address').val(response.custinfo_addr);
              $('#ci_phone').val(response.custinfo_phone);
            }
          }
          catch (error) {
            console.log(error);
          }
        }
        custinfo.validate();
        custinfo.update();
      });
    },
    change: async function(cartId,qtt){
      return $.ajax({
        url:'/cart/modify',
        method:'POST',
        data:{cart_id:cartId,cart_qtt:qtt},
        dataType: 'json',
        success:function(response){
          $('#'+cartId).text(response.price);
          $('#order_sub_total').text(response.sm_total);
          $('#order_total').text(response.total);
        },
        error:function(xhr, status, error) {
          alert('통신오류');
          console.log(xhr.responseText);
        }
      });
    },
    showCI: async function(custInfoNo){
      return $.ajax({
        url:'/api/get/custinfo',
        method:'POST',
        dataType: 'json',
        data: {custinfo_no:custInfoNo}
      });
    },
    proceedCheckOut: async function(custinfodata){
      return $.ajax({
        url:'/orderimpl',
        method:'POST',
        dataType: 'json',
        data: custinfodata
      });
    }
  }
  document.addEventListener('DOMContentLoaded', function() {
    custinfo.init();
    order.init();
  });
</script>
<style>
  .red_text {
    color: red;
  }
</style>
<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active">주문</li>
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
                  <th class="text-center">상품</th>
                  <th class="text-center">상품명</th>
                  <th class="text-center">개별 가격</th>
                  <th class="text-center">수량</th>
                  <th class="text-center">총합</th>
                  <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                  <c:when test="${not empty carts}">
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
        </div>
        <div class="row">
          <div class="col-12">
            <div class="form-group">
              <label>주소</label>
              <select name="cust_info" id="cust_info">
                <option value="default" selected>직접 입력</option>
                <c:forEach var="ci" items="${custInfos}">
                  <option value="${ci.custinfo_no}">${ci.custinfo_name}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="col-12">
            <div class="login-form">
              <form class="form">
                <div class="form-group">
                  <label>수신자 이름<span>*</span></label>
                  <input id="ci_name" type="text">
                  <p id="anno_name" class="red_text"></p>
                </div>
                <div class="form-group">
                  <label>수신자 주소<span>*</span></label>
                  <input id="ci_address" type="text">
                  <p id="anno_address" class="red_text"></p>
                </div>
                <div class="form-group">
                  <label>수신자 전화번호<span>*</span></label>
                  <input id="ci_phone" type="tel">
                  <p id="anno_phone" class="red_text"></p>
                </div>
                <div class="form-check">
                  <label class="form-check-label">
                    <input id="cb_addCI" type="checkbox" class="form-check-input">주소록에 저장하기
                  </label>
                </div>
              </form>
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
<%--                TODO: 가격 소계 및 배송비, 총계를 실시간 구현 --%>
                <li>소계<span id="order_sub_total">${total}</span></li>
                <li>(+) 배송비<span id="order_delivery_fee">0</span></li>
                <li class="last">총계<span id="order_total">${total}</span></li>
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