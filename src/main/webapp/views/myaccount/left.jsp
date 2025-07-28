<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .nav-link {
    font-size: 20px;
    margin-bottom: 15px;
  }
  .nav-pills .nav-link.active {
    background-color: #F7941D;
    color: white;
  }
</style>

<%-- Navbar --%>
<div class="col-3">
  <ul class="nav nav-pills flex-column">
    <li class="nav-item">
      <a class="nav-link ${activePage=='account' ? 'active' : '' }" style="" href="/account">회원정보수정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${activePage=='address' ? 'active' : '' }" href="/address">주소록관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${activePage=='cart' ? 'active' : '' }" href="/cart">장바구니</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${activePage=='fav' ? 'active' : '' }" href="/fav">찜</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${activePage=='delete' ? 'active' : '' }" href="/delete">회원탈퇴</a>
    </li>
  </ul>
</div>
<%-- Navbar --%>