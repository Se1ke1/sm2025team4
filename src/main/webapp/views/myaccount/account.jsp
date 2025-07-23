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
            <li class="active"><a href="/account">My account</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Account -->
<section class="shop login section">
  <div class="container">
    <div class="row">
      <%-- mypage --%>
      <div class="col-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 10px; color: #8D8D8D" href="/account">회원정보수정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 10px;" href="#">상품정보조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 10px;" href="#">상품판매현황</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 10px;" href="#">회원탈퇴</a>
          </li>
        </ul>
      </div>
      <div class="col-lg-6 col-12">
        <div class="login-form">
          <h2>회원 정보 수정</h2>
          <!-- Form -->
          <form class="form" method="post" action="/accountimpl">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label>Id</label>
                  <p id="id">${c.cust_id}</p>
                  <input type="hidden" name="custid" value="${c.cust_id}">
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input type="password" name="custpassword" placeholder="">
                </div>
                <div class="form-group">
                  <label for="name">Name:</label>
                  <input type="text" class="form-control" value="${c.cust_name}"  id="name" name="custname">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group login-btn">
                  <button class="btn" type="submit">확인</button>
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
<!--/ End Account -->