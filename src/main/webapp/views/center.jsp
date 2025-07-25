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
  let main_center = {
    init: function () {
      $('.wishlist_impl').on('click', function (e) {
        e.preventDefault();
        var productId=$(this).data('productId');
        if (productId !== null && productId !== '') {
          $.ajax({
            url:'/addWishlistimpl',
            type:"POST",
            data:{product_id:productId},
            success:function(data){

            },
            error:function(){

            }
          });
        }
      });
      $('.cart_impl').on('click', function (e) {
        e.preventDefault();
        var productId=$(this).data('productId');
        if (productId !== null && productId !== '') {
          $.ajax({
            url:'/addCartimpl',
            type:"POST",
            data:{product_id:productId},
            success:function(data){

            },
            error:function(){

            }
          });
        }
      });
      $('#exampleModal').on('show.bs.modal', function (e) {
        var button = $(e.relatedTarget);
        var productId=button.data('productId');
        var productName=button.data('productName');
        var productPrice=button.data('productPrice');
        var modal = $(this);

        modal.find('.quickview-content h2').text(productName);
        modal.find('.quickview-content h3').text(productPrice+'원');
        modal.find('.quickview-peragraph p').text('');

        $.ajax({
          url:'/getproductimg',
          type:"POST",
          data:{product_id:productId},
          dataType:'json',
          success:function(data) {

          },
          error:function(){

          }
        });
      });
    }
  }
  $().ready(()=>{
    main_center.init();
  });
</script>
<%--<!-- Start Product Area -->
<div class="product-area section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="section-title">
          <h2>Trending Item</h2>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="product-info">
          <div class="nav-main">
            <!-- Tab Nav -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#man" role="tab">Man</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#women" role="tab">Woman</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#kids" role="tab">Kids</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#accessories" role="tab">Accessories</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#essential" role="tab">Essential</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#prices" role="tab">Prices</a></li>
            </ul>
            <!--/ End Tab Nav -->
          </div>
          <div class="tab-content" id="myTabContent">
            <!-- Start Single Tab -->
            <div class="tab-pane fade show active" id="man" role="tabpanel">
              <div class="tab-single">
                <div class="row">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product_detail/product_info">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product_detail/product_info">상품 정보 테스트</a></h3>
                        <div class="product-price">
                          <span>99900원</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product_detail/product_info">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="product_detail/product_info">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="product_detail/product_info">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="new">New</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="price-dec">30% Off</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="out-of-stock">Hot</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                        <div class="product-price">
                          <span class="old">$60.00</span>
                          <span>$50.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Single Tab -->
            <!-- Start Single Tab -->
            <div class="tab-pane fade" id="women" role="tabpanel">
              <div class="tab-single">
                <div class="row">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product_detail/product_info">????</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="new">New</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="price-dec">30% Off</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="out-of-stock">Hot</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                        <div class="product-price">
                          <span class="old">$60.00</span>
                          <span>$50.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Single Tab -->
            <!-- Start Single Tab -->
            <div class="tab-pane fade" id="kids" role="tabpanel">
              <div class="tab-single">
                <div class="row">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="new">New</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="price-dec">30% Off</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="out-of-stock">Hot</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                        <div class="product-price">
                          <span class="old">$60.00</span>
                          <span>$50.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Single Tab -->
            <!-- Start Single Tab -->
            <div class="tab-pane fade" id="accessories" role="tabpanel">
              <div class="tab-single">
                <div class="row">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="new">New</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="price-dec">30% Off</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="out-of-stock">Hot</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                        <div class="product-price">
                          <span class="old">$60.00</span>
                          <span>$50.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Single Tab -->
            <!-- Start Single Tab -->
            <div class="tab-pane fade" id="essential" role="tabpanel">
              <div class="tab-single">
                <div class="row">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="new">New</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="price-dec">30% Off</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="out-of-stock">Hot</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                        <div class="product-price">
                          <span class="old">$60.00</span>
                          <span>$50.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Single Tab -->
            <!-- Start Single Tab -->
            <div class="tab-pane fade" id="prices" role="tabpanel">
              <div class="tab-single">
                <div class="row">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="new">New</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="price-dec">30% Off</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                        <div class="product-price">
                          <span>$29.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                      <div class="product-img">
                        <a href="product-details.html">
                          <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                          <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                          <span class="out-of-stock">Hot</span>
                        </a>
                        <div class="button-head">
                          <div class="product-action">
                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                          </div>
                          <div class="product-action-2">
                            <a title="Add to cart" href="#">Add to cart</a>
                          </div>
                        </div>
                      </div>
                      <div class="product-content">
                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                        <div class="product-price">
                          <span class="old">$60.00</span>
                          <span>$50.00</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ End Single Tab -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Product Area -->
--%>
<%--
<!-- Start Midium Banner  -->
<section class="midium-banner">
  <div class="container">
    <div class="row">
      <!-- Single Banner  -->
      <div class="col-lg-6 col-md-6 col-12">
        <div class="single-banner">
          <img src="https://via.placeholder.com/600x370" alt="#">
          <div class="content">
            <p>Man's Collectons</p>
            <h3>Man's items <br>Up to<span> 50%</span></h3>
            <a href="#">Shop Now</a>
          </div>
        </div>
      </div>
      <!-- /End Single Banner  -->
      <!-- Single Banner  -->
      <div class="col-lg-6 col-md-6 col-12">
        <div class="single-banner">
          <img src="https://via.placeholder.com/600x370" alt="#">
          <div class="content">
            <p>shoes women</p>
            <h3>mid season <br> up to <span>70%</span></h3>
            <a href="#" class="btn">Shop Now</a>
          </div>
        </div>
      </div>
      <!-- /End Single Banner  -->
    </div>
  </div>
</section>
<!-- End Midium Banner -->
--%>
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
          <c:forEach var="product" items="${products}">
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
    <div class="row">
      <div class="col-lg-4 col-md-6 col-12">
        <%--
        <div class="row">
          <div class="col-12">
            <div class="shop-section-title">
              <h1>On sale</h1>
            </div>
          </div>
        </div>
        --%>
        <!-- Start Single List  -->
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
        <!-- End Single List  -->
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="/imgs/down.png" alt="#">
                <a href="/product_detail/product_info?id=${product.product_id}" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="/product_detail/product_info?id=${product.product_id}">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$44</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="/imgs/down.png" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$89</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
      </div>
      <div class="col-lg-4 col-md-6 col-12">
        <%--<div class="row">
          <div class="col-12">
            <div class="shop-section-title">
              <h1>Best Seller</h1>
            </div>
          </div>
        </div>--%>
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="https://via.placeholder.com/115x140" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$65</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="https://via.placeholder.com/115x140" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$33</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="https://via.placeholder.com/115x140" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$77</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
      </div>
      <div class="col-lg-4 col-md-6 col-12">
        <%--<div class="row">
          <div class="col-12">
            <div class="shop-section-title">
              <h1>Top viewed</h1>
            </div>
          </div>
        </div>--%>
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="https://via.placeholder.com/115x140" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$22</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="https://via.placeholder.com/115x140" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$35</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
        <!-- Start Single List  -->
        <div class="single-list">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="list-image overlay">
                <img src="https://via.placeholder.com/115x140" alt="#">
                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 no-padding">
              <div class="content">
                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                <p class="price with-discount">$99</p>
              </div>
            </div>
          </div>
        </div>
        <!-- End Single List  -->
      </div>
    </div>
  </div>
</section>
<!-- /일반 상품 표시 (리스트) 구간  -->

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