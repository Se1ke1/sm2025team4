<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--<script>--%>
<%--  let cust_update = {--%>
<%--    init:function(){--%>
<%--      $('#update_btn').click(()=>{--%>
<%--        let c = confirm('수정을 하시겠습니까?');--%>
<%--        if(c == true){--%>
<%--          $('#cust_update').attr('method', 'post');--%>
<%--          $('#cust_update').attr('action', '/update');--%>
<%--          $('#cust_update').submit();--%>
<%--        }--%>
<%--      });--%>
<%--    }--%>
<%--  }--%>
<%--  $().ready(()=>{--%>
<%--    cust_update.init();--%>
<%--  });--%>
<%--</script>--%>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active"><a href="/address">My address</a></li>
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
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px;" href="/account">회원정보수정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; margin-bottom: 15px; color: #8D8D8D" href="/address">주소록관리</a>
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
      <div class="col-lg-9 col-12">
        <div class="login-form">
          <h2>주소록 관리</h2>
          <!-- Form -->
          <form class="form" method="post" id="cust_update">
            <div class="row">
              <div class="col-12">
                <li class="list-group-item" style="margin-bottom: 15px">
                <c:forEach var="ci" items="${ci}">
                  <input type="hidden" name="custinfo_no" value="${ci.custinfo_no}">
                  <div class="form-group">
                    <label style="font-size: large; line-height: 15px; margin-top: 10px"  for="name${ci.custinfo_name}">
                      <b>
                          ${ci.custinfo_name}
                      </b>
                    </label>
                  </div>
                  <div class="form-group">
                    <label style="line-height: 10px" for="addr${ci.custinfo_addr}">${ci.custinfo_addr}</label>
                  </div>
                  <div class="form-group">
                    <label style="line-height: 10px" for="phone${ci.custinfo_no}">${ci.custinfo_phone}</label>
                  </div>
                  <div class="form-group login-btn">
                    <button class="btn btn-primary" type="button" id="update_btn">수정</button>
                    <button class="btn btn-danger" style="background-color: red" type="button" id="delete_btn">삭제</button>
                  </div>
                </li>
                </c:forEach>
                <button class="btn btn-primary btn-block" type="button" id="add_btn" onclick="location.href='/addaddress'">배송지 추가</button>
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