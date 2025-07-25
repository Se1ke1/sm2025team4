<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active"><a href="blog-single.html">Cart</a></li>
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
            <th>PRODUCT</th>
            <th>NAME</th>
            <th class="text-center">UNIT PRICE</th>
            <th class="text-center">QUANTITY</th>
            <th class="text-center">TOTAL</th>
            <th class="text-center"><i class="ti-trash remove-icon"></i></th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td>
            <td class="product-des" data-title="Description">
              <p class="product-name"><a href="#">Women Dress</a></p>
              <p class="product-des">Maboriosam in a tonto nesciung eget  distingy magndapibus.</p>
            </td>
            <td class="price" data-title="Price"><span>$110.00 </span></td>
            <td class="qty" data-title="Qty"><!-- Input Order -->
              <div class="input-group">
                <div class="button minus">
                  <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                    <i class="ti-minus"></i>
                  </button>
                </div>
                <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="100" value="1">
                <div class="button plus">
                  <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                    <i class="ti-plus"></i>
                  </button>
                </div>
              </div>
              <!--/ End Input Order -->
            </td>
            <td class="total-amount" data-title="Total"><span>$220.88</span></td>
            <td class="action" data-title="Remove"><a href="#"><i class="ti-trash remove-icon"></i></a></td>
          </tr>
          <tr>
            <td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td>
            <td class="product-des" data-title="Description">
              <p class="product-name"><a href="#">Women Dress</a></p>
              <p class="product-des">Maboriosam in a tonto nesciung eget  distingy magndapibus.</p>
            </td>
            <td class="price" data-title="Price"><span>$110.00 </span></td>
            <td class="qty" data-title="Qty"><!-- Input Order -->
              <div class="input-group">
                <div class="button minus">
                  <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[2]">
                    <i class="ti-minus"></i>
                  </button>
                </div>
                <input type="text" name="quant[2]" class="input-number"  data-min="1" data-max="100" value="2">
                <div class="button plus">
                  <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[2]">
                    <i class="ti-plus"></i>
                  </button>
                </div>
              </div>
              <!--/ End Input Order -->
            </td>
            <td class="total-amount" data-title="Total"><span>$220.88</span></td>
            <td class="action" data-title="Remove"><a href="#"><i class="ti-trash remove-icon"></i></a></td>
          </tr>
          <tr>
            <td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td>
            <td class="product-des" data-title="Description">
              <p class="product-name"><a href="#">Women Dress</a></p>
              <p class="product-des">Maboriosam in a tonto nesciung eget  distingy magndapibus.</p>
            </td>
            <td class="price" data-title="Price"><span>$110.00 </span></td>
            <td class="qty" data-title="Qty"><!-- Input Order -->
              <div class="input-group">
                <div class="button minus">
                  <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[3]">
                    <i class="ti-minus"></i>
                  </button>
                </div>
                <input type="text" name="quant[3]" class="input-number"  data-min="1" data-max="100" value="3">
                <div class="button plus">
                  <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[3]">
                    <i class="ti-plus"></i>
                  </button>
                </div>
              </div>
              <!--/ End Input Order -->
            </td>
            <td class="total-amount" data-title="Total"><span>$220.88</span></td>
            <td class="action" data-title="Remove"><a href="#"><i class="ti-trash remove-icon"></i></a></td>
          </tr>
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
                  <li>Cart Subtotal<span>$330.00</span></li>
                  <li>Shipping<span>Free</span></li>
                  <li class="last">You Pay<span>$310.00</span></li>
                </ul>
                <div class="button5">
                  <a href="#" class="btn">Checkout</a>
                  <a href="#" class="btn">Continue shopping</a>
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