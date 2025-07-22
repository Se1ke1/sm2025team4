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
      <div class="col-lg-6 offset-lg-3 col-12">
<%--        <c:choose>--%>
<%--          <c:when test="${sessionScope.logincust == null}">--%>
<%--            <a href="/login">login</a>--%>
<%--          </c:when>--%>
<%--          <c:otherwise>--%>
<%--            --%>
<%--          </c:otherwise>--%>
<%--        </c:choose>--%>
        <div class="login-form">
          <h2>My Account</h2>
          <p>회원 정보 변경</p>
        </div>


      </div>
    </div>
  </div>
</section>
<!--/ End Login -->