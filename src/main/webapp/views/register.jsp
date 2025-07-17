<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:40
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
            <li class="active"><a href="blog-single.html">Register</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Login -->
<section class="shop login section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3 col-12">
        <div class="login-form">
          <h2>Register</h2>
          <p>Please register in order to checkout more quickly</p>
          <!-- Form -->
          <form class="form" method="post" action="#">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label>Your Name<span>*</span></label>
                  <input type="text" name="name" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>Your Email<span>*</span></label>
                  <input type="text" name="email" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>Your Password<span>*</span></label>
                  <input type="password" name="password" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>Confirm Password<span>*</span></label>
                  <input type="password" name="password" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group login-btn">
                  <button class="btn" type="submit">Register</button>
                  <a href="login.html" class="btn">Login</a>
                </div>
                <div class="checkbox">
                  <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox">Sign Up for Newsletter</label>
                </div>
              </div>
            </div>
          </form>
          <!--/ End Form -->
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ End Login -->