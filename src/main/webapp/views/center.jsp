<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template id="product_item_template">
  <div class="col-lg-4 col-md-6 col-12">
    <div class="single-list">
      <div class="row">
        <div class="col-lg-6 col-md-6 col-12">
          <div class="list-image overlay">
            <img class="product_img" src="" alt=""><a href="#" class="buy product_link"><i class="fa fa-shopping-bag"></i></a>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-12 no-padding">
          <div class="content">
            <h4 class="title"><a href="#" class="product_link product_name"></a></h4>
            <p class="price with-discount product_price">$</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  let page = 0;
  let isLoading = false;
  let isEndOfData = false;
  const CONTEXT_PATH = "${pageContext.request.contextPath}";
  let productContainer;

  async function fetchProducts () {
    if (isLoading || isEndOfData) return;
    isLoading = true;
    try {
      const response = await fetch(CONTEXT_PATH+`/api/vsearch?page=`+page+`&sort=product_regdate,DESC`);
      if (!response.ok) {
        throw new Error('데이터 수신 오류 : 서버')
      }
      const newProducts = await response.json();
      if (newProducts.length === 0) {
        isEndOfData = true;
        document.getElementById('scroll-trigger').innerHTML = '<p style="text-align:center;">모든 상품을 보셨습니다.</p>';
        return;
      }
      else {
        const template = document.getElementById('product_item_template');
        newProducts.forEach((product) => {
          const productClone = document.importNode(template.content,true);
          productClone.querySelector('.product_img').src=CONTEXT_PATH+`/imgs/product/`+product.product_img_main;
          productClone.querySelector('.product_img').alt=product.product_img_main;
          productClone.querySelectorAll('.product_link').forEach(link => {
            link.href = CONTEXT_PATH+'/product_detail/product_info?id='+product.product_id;
          });
          productClone.querySelector('.product_name').textContent = product.product_name;
          productClone.querySelector('.product_price').textContent = product.product_price.toLocaleString()+'원';
          productContainer.appendChild(productClone);
        });
        page++;
      }
    }
    catch (error) {
      console.log(error);
    }
    finally {
      isLoading = false;
    }
  }
  document.addEventListener("DOMContentLoaded", function() {
    productContainer = document.getElementById('product-container');
    main_center.init();
    fetchProducts();
    const observer = new IntersectionObserver((entries) => {
      if (entries[0].isIntersecting) {
        fetchProducts();
      }
    },{
      threshold: 0.1,
    });
    const trigger = document.getElementById('scroll-trigger');
    if (trigger) {
      observer.observe(trigger);
    }
  });

  let main_center = {
    init: function () {
      $('.wishlist_impl').on('click', function (e) {
        e.preventDefault();
        let productId=$(this).data('productId');
        if (productId !== null && productId !== '') {
          main_center.addWishlist();
        }
      });
      $('.cart_impl').on('click', function (e) {
        e.preventDefault();
        let productId=$(this).data('productId');
        if (productId !== null && productId !== '') {
          main_center.addCart(productId);
        }
      });
      $('#exampleModal').on('show.bs.modal', function (e) {
        let button = $(e.relatedTarget);
        let productId=button.data('productId');
        let productName=button.data('productName');
        let productPrice=button.data('productPrice');
        let modal = $(this);
        modal.find('.quickview-content h2').text(productName);
        modal.find('.quickview-content h3').text(productPrice+'원');
        modal.find('.quickview-peragraph p').text('');
        main_center.displayModal(productId);
      });
    },
    addWishlist: async function (productId) {
      return $.ajax({
        url:'/addWishlistimpl',
        type:"POST",
        data:{product_id:productId}
      });
    },
    addCart: async function (productId) {
      return $.ajax({
        url:'/addCartimpl',
        type:"POST",
        data:{product_id:productId}
      });
    },
    displayModal: async function (productId) {
      return $.ajax({
        url:'/getproductimg',
        type:"POST",
        data:{product_id:productId},
        dataType:'json'
      });
    }
  }
</script>

<!-- 새 상품 표시 (캐로셀) 구간 -->
<div class="product-area most-popular section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="section-title">
          <h2>새로 등록된 상품들</h2>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="owl-carousel popular-slider">
<%--          캐로셀에 상품 뿌리기--%>
          <c:forEach var="product" items="${recent_products}">
            <!-- Start Single Product -->
            <div class="single-product">
              <div class="product-img">
                <a href="/product_detail/product_info?id=${product.product_id}">
                  <img class="default-img" src="/imgs/product/${product.product_img_main}" alt="${product.product_img_main}">
                  <img class="hover-img" src="/imgs/product/${product.product_img_main}" alt="${product.product_img_main}">
                  <span class="new">NEW</span>
                </a>
                <div class="button-head">
                  <div class="product-action">
                    <a data-toggle="modal" data-target="#exampleModal" title="Quick View"
                       data-product-id="${product.product_id}"
                       data-product-name="${product.product_name}"
                       data-product-price="${product.product_price}">
                      <i class=" ti-eye"></i>
                      <span>상세정보 보기</span>
                    </a>
                    <a title="Wishlist" class="wishlist_impl" data-product-id="${product.product_id}"><i class=" ti-heart "></i><span>찜 목록에 넣기</span></a>
                  </div>
                  <div class="product-action-2">
                    <a title="Add to cart" class="cart_impl" data-product-id="${product.product_id}">장바구니에 담기</a>
                  </div>
                </div>
              </div>
              <div class="product-content">
                <h3><a href="/product_detail/product_info?id=${product.product_id}">${product.product_name}</a></h3>
                <div class="product-price">
                  <span>${product.product_price}원</span>
                </div>
              </div>
            </div>
            <!-- End Single Product -->
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /새 상품 표시 (캐로셀) 구간 -->
<!-- 일반 상품 표시 (리스트) 구간 -->
<section class="shop-home-list section">
  <div class="container">
    <div id="product-container" class="row">
      <%--<div class="col-lg-4 col-md-6 col-12">
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="/imgs/down.png" alt="down.png">
                <a href="/product_detail/product_info?id=${product.product_id}" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h4 class="title"><a href="/product_detail/product_info?id=${product.product_id}">상품 ID가 NULL임</a></h4>
                <p class="price with-discount">$59</p>
              </div>
            </div>
          </div>
        </div>
      </div>--%>
    </div>
  </div>
</section>
<!-- /일반 상품 표시 (리스트) 구간  -->
<div id="scroll-trigger" style="height: 50px;"></div>
<!-- 상품 정보 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
      </div>
      <div class="modal-body">
        <div class="row no-gutters">
          <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
            <!-- Product Slider -->
            <div class="product-gallery">
              <div class="quickview-slider-active">
<%--                <c:forEach var="productImg" items="productImgs">--%>
                  <div class="single-slider">
<%--                    <img src="/imgs/product/${productImg.product_img}" alt="${productImg.product_img}">--%>
                    <img src="" alt="">
                  </div>
<%--                </c:forEach>--%>
              </div>
            </div>
            <!-- End Product slider -->
          </div>
          <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
            <div class="quickview-content">
              <h2>상품 정보</h2>
              <div class="quickview-ratting-review">
                <div class="quickview-ratting-wrap">
                  <div class="quickview-ratting">
                    <i class="yellow fa fa-star"></i>
                    <i class="yellow fa fa-star"></i>
                    <i class="yellow fa fa-star"></i>
                    <i class="yellow fa fa-star"></i>
                    <i class="fa fa-star"></i>
                  </div>
                  <a href="#"> (1 customer review)</a>
                </div>
                <div class="quickview-stock">
                  <span><i class="fa fa-check-circle-o"></i> in stock</span>
                </div>
              </div>
              <h3>99900원</h3>
              <div class="quickview-peragraph">
                <p>ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</p>
              </div>
              <div class="size">
                <div class="row">
                  <div class="col-lg-6 col-12">
                    <h5 class="title">Size</h5>
                    <select>
                      <option selected="selected">s</option>
                      <option>m</option>
                      <option>l</option>
                      <option>xl</option>
                    </select>
                  </div>
                  <div class="col-lg-6 col-12">
                    <h5 class="title">Color</h5>
                    <select>
                      <option selected="selected">orange</option>
                      <option>purple</option>
                      <option>black</option>
                      <option>pink</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="quantity">
                <!-- Input Order -->
                <div class="input-group">
                  <div class="button minus">
                    <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                      <i class="ti-minus"></i>
                    </button>
                  </div>
                  <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
                  <div class="button plus">
                    <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                      <i class="ti-plus"></i>
                    </button>
                  </div>
                </div>
                <!--/ End Input Order -->
              </div>
              <div class="add-to-cart">
                <a href="#" class="btn">Add to cart</a>
                <a href="#" class="btn min"><i class="ti-heart"></i></a>
                <a href="#" class="btn min"><i class="fa fa-compress"></i></a>
              </div>
              <div class="default-social">
                <h4 class="share-now">Share: 공유하기</h4>
                <ul>
                  <li><a class="facebook" href="#"><i class="fa fa-facebook">페이스북</i></a></li>
                  <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
                  <li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /상품 정보 모달 -->