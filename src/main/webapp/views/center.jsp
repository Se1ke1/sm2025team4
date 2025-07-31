<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  let main = {
    page: 0,
    isLoading: false,
    isEndOfData: false,
    productContainer: null,
    selected_button:"product_regdate",
    sortOrder:'ASC',
    init: function () {
      this.productContainer = document.getElementById('product-container');
      main.fetchProducts();
      const observer = new IntersectionObserver((entries) => {
        if (entries[0].isIntersecting) {
          main.fetchProducts();
        }
      },{
        threshold: 0.1,
      });
      const trigger = document.getElementById('scroll-trigger');
      if (trigger) {
        observer.observe(trigger);
      }
    },
    fetchProducts: async function () {
      if (this.isLoading || this.isEndOfData) return;
      this.isLoading = true;
      try {
        let url = `/api/vsearch?page=`+this.page+`&sort=`+main.selected_button+`,`+main.sortOrder;
        console.log(url);
        const response = await fetch(url);
        console.log(this.page);
        if (!response.ok) {
          alert('데이터 수신 오류 : 서버')
        }
        const newProducts = await response.json();
        console.log(newProducts);
        if (newProducts.length === 0) {
          this.isEndOfData = true;
          document.getElementById('scroll-trigger').innerHTML = '<p style="text-align:center;">모든 상품을 보셨습니다.</p>';
        }
        else {
          const template = document.getElementById('product_item_template');
          newProducts.forEach((product) => {
            const productClone = document.importNode(template.content,true);
            productClone.querySelector('.product_img').src=`/imgs/product/`+product.product_img_main;
            productClone.querySelector('.product_img').alt=product.product_img_main;
            productClone.querySelectorAll('.product_link').forEach(link => {
              link.href = '/product_detail/product_info?id='+product.product_id;
            });
            productClone.querySelector('.product_name').textContent = product.product_name;
            productClone.querySelector('.product_price').textContent = product.product_price.toLocaleString()+'원';
            this.productContainer.appendChild(productClone);
          });
          this.page++;
        }
      }
      catch (error) {
        console.log(error);
      }
      finally {
        this.isLoading = false;
      }
    },
    resetAndFetch: function () {
      main.page=0;
      main.isEndOfData = false;
      main.isLoading = false;
      main.productContainer.innerHTML = '';
      document.getElementById('scroll-trigger').innerHTML = '';
      main.fetchProducts();
    }
  }
  let main_center = {
    init: function () {
      document.querySelectorAll('.wishlist_impl').forEach((item) => {
        item.addEventListener('click', async (e) => {
          e.preventDefault();
          let product_id = e.currentTarget.dataset.productId;
          if (product_id !== null && product_id !== '') {
            let response = await main_center.addWishlist(product_id);
            if (response.result) {
              index.favSize++;
              index.update();
              /*if (await index.onUpdateModel()) index.update();
              else {
                alert("서버 통신 오류")
              }*/
            }
            else {
              if (response.message==="로그인이 필요한 서비스입니다.") {
                location.href = "/login";
              }
              else {
                alert(response.message);
              }
            }
          }
        });
      });
      document.querySelectorAll('.cart_impl').forEach((item) => {
        item.addEventListener('click', async (e) => {
          e.preventDefault();
          let product_id = e.target.dataset.productId;
          if (product_id !== null && product_id !== '') {
            let response = await main_center.addCart(product_id);
            if (response.result) {
              /*
              if (await index.onUpdateModel()) {
                index.update();
              }
              else {
                alert("서버 통신 오류")
              }
               */
              location.reload();
            }
            else {
              if (response.message==="로그인이 필요한 서비스입니다.") {
                location.href="/login";
              }
              else {
                alert(response.message);
              }
            }
          }
        });
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
        url:'/fav/add',
        type:"POST",
        dataType:"json",
        data:{product_id:productId}
      });
    },
    addCart: async function (productId) {
      return $.ajax({
        url:'/cart/addimpl',
        type:"POST",
        dataType:"json",
        data:{product_id:productId,cart_qtt:1}
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
  let main_sort = {
    init: function () {
      const items=document.querySelectorAll('.btn-sortorder');
      let indicator_text = '';
      let indicator_sort = '';
      items.forEach((item) => {
        item.addEventListener('click', (e) => {
          e.preventDefault();
          const selectedBtn = e.currentTarget;
          items.forEach((btn)=>{
            btn.classList.remove('text-dark');
            btn.classList.remove('bg-grey');
          });
          selectedBtn.classList.add('bg-grey');
          selectedBtn.classList.add('text-dark');
          if (main.selected_button !== e.target.dataset.sortOrder) {
            main.selected_button = e.target.dataset.sortOrder;
            main.sortOrder = 'DESC';
          }
          else {
            if (main.sortOrder === 'ASC') {
              main.sortOrder = 'DESC';
            }
            else {
              main.sortOrder = 'ASC';
            }
          }
          indicator_text = selectedBtn.textContent;
          indicator_sort = main.sortOrder==='ASC' ? '오름차순' : '내림차순';
          document.querySelector('#sort_order_indicator').textContent = indicator_text + ` : ` + indicator_sort ;
          main.resetAndFetch();
        })
      })
    }
  }
  document.addEventListener("DOMContentLoaded", function() {
    main.init();
    main_center.init();
    main_sort.init();
  });
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
<!-- Header Inner -->
<div class="header shop v3 sort-bar">
  <div class="header-inner">
    <div class="container">
      <div class="cat-nav-head">
        <div class="row">
          <div class="col-12">
            <div class="menu-area">
              <!-- 메인메뉴 -->
              <nav class="navbar navbar-expand-lg">
                <div class="navbar-collapse">
                  <div class="nav-inner d-flex justify-content-lg-between align-items-center">
                    <div><span id="sort_order_indicator" class="indicator_text">등록일자 : 오름차순</span></div>
                    <ul class="nav main-menu menu navbar-nav ms-auto">
                      <li><button type="button" class="btn btn-sortorder bg-grey text-dark" data-sort-order="product_regdate">등록일자</button></li>
                      <li><button type="button" class="btn btn-sortorder" data-sort-order="product_price">가격</button></li>
                      <li><button type="button" class="btn btn-sortorder" data-sort-order="product_name">이름</button></li>
                    </ul>
                  </div>
                </div>
              </nav>
              <!--/ 메인메뉴 -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--/ End Header Inner -->
<!-- 일반 상품 표시 (리스트) 구간 -->
<section class="shop-home-list section">
  <div class="container">
    <div id="product-container" class="row">
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