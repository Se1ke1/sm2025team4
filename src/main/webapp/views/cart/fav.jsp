<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-25
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.addCartImpl').forEach(button=>{
      button.addEventListener('click', async function(){
        const cust_id = '${sessionScope.cust.cust_id}'
        const product_id = this.dataset.productId;
        const favId = this.dataset.favId;
        if (await fav.addCart(cust_id, product_id,favId)) {
          location.href="/cart";
        }
      })
    });
    document.querySelectorAll('.del_btn').forEach(button=>{
      button.addEventListener('click', async ()=>{
        if (confirm('정말 삭제하시겠습니까?')) {
          const favId=button.dataset.favId;
          if (await fav.remove(favId)) {
            location.reload();
          }
        }
      });
    });
  });
  let fav = {
    remove: async function(favId){
      return $.ajax({
        url:'/fav/remove',
        method:'POST',
        dataType: 'json',
        data: {fav_id:favId}
      });
    },
    addCart: async function(cust_id,product_id,fav_id){
      return $.ajax({
        url:'/cart/addimplfav',
        method:'POST',
        data:{cust_id:cust_id,product_id:product_id,fav_id:fav_id},
        dataType:'json'
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
            <li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active"><a href="blog-single.html">관심 상품</a></li>
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
            <th class="text-center">상품 가격</th>
            <th class="text-center"></th>
            <th class="text-center"><i class="ti-trash remove-icon"></i></th>
          </tr>
          </thead>
          <tbody>
          <c:choose>
            <c:when test="${favSize>0}">
              <c:forEach var="fav" items="${favs}">
                <tr>
                  <td class="image" data-title="No"><img src="/imgs/product/${fav.product_img_main}" alt="${fav.product_img_main}"></td>
                  <td class="product-des" data-title="Description">
                    <p class="text-center product-name"><a href="/product/detail?id=${fav.product_id}">${fav.product_name}</a></p>
                  </td>
                  <td class="price" data-title="Price"><span>${fav.product_price}</span></td>
                  <td><button type="button" class="btn primary-btn addCartImpl" data-fav-id="${fav.fav_id}" data-product-id="${fav.product_id}">장바구니에 담기</button></td>
                  <td><button class="del_btn" data-fav-id="${fav.fav_id}"><i class="ti-trash remove-icon"></i></button></td>
                </tr>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <td class="text-center">-</td>
              <td class="text-center">아직 관심 있는 물품이 없어요</td>
              <td class="text-center">-</td>
              <td class="text-center">-</td>
              <td class="text-center">-</td>
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

