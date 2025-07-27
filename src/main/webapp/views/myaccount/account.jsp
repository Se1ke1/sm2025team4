<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let cust_update = {
    init:function(){
      $('#update_btn').click(()=>{
        let c = confirm('수정을 하시겠습니까?');
        if(c == true){
          $('#cust_update').attr('method', 'post');
          $('#cust_update').attr('action', '/update');
          $('#cust_update').submit();
        }
      });
    }
  }
  $().ready(()=>{
    cust_update.init();
  });
</script>

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
      <%-- Navbar --%>
      <div class="col-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; color: #8D8D8D" href="/account">회원정보수정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/address">주소록관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/cart">장바구니</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/fav">찜</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/delete">회원탈퇴</a>
          </li>
        </ul>
      </div>
      <%-- Navbar --%>
      <%-- mypage --%>
      <div class="col-lg-6 col-12">
        <div class="login-form">
          <h2>회원 정보 수정</h2>
          <!-- Form -->
          <form class="form" method="post" id="cust_update">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label>Id:</label>
                  <li class="list-group-item">${c.cust_id}</li>
                  <input type="hidden" name="cust_id" value="${c.cust_id}">
                </div>
                <div class="form-group">
                  <label>Password:</label>
                  <input type="password" name="cust_pwd" value="${c.cust_pwd}" placeholder="New password">
                </div>
                <div class="form-group">
                  <label for="name">Name:</label>
                  <input type="text" class="form-control" value="${c.cust_name}" id="name" name="cust_name">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group login-btn">
                  <button class="btn btn-primary" type="submit" id="update_btn">수정</button>
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