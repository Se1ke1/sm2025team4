<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<head>
    <!-- Meta Tag -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name='copyright' content=''>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title Tag  -->
    <title>4조 shop - eCommerce HTML5 Template.</title>
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="images/favicon.png">
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <!-- StyleSheet -->

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="/css/magnific-popup.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/css/font-awesome.css">
    <!-- Fancybox -->
    <link rel="stylesheet" href="/css/jquery.fancybox.min.css">
    <!-- Themify Icons -->
    <link rel="stylesheet" href="/css/themify-icons.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="/css/niceselect.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Flex Slider CSS -->
    <link rel="stylesheet" href="/css/flex-slider.min.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/css/owl-carousel.css">
    <!-- Slicknav -->
    <link rel="stylesheet" href="/css/slicknav.min.css">

    <!-- Eshop StyleSheet -->
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/css/responsive.css">

    <!-- Color CSS -->
    <link rel="stylesheet" href="/css/color/color1.css">

</head>
<body class="js">

<!-- Header -->
<header class="header shop v3">
    <!-- Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="inner-content">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-12">
                        <!-- Top Left -->
                        <div class="top-left">
                            <ul class="list-main">
                                <li><i class="ti-headphone-alt"></i> 010-1234-1234</li>
                                <li><i class="ti-email"></i> sm2025team4@github.com</li>
                            </ul>
                        </div>
                        <!--/ End Top Left -->
                    </div>
                    <div class="col-lg-8 col-md-12 col-12">
                        <!-- Top Right -->
                        <div class="right-content">
                            <ul class="list-main">
                                <!--
                                <li><i class="ti-location-pin"></i>지역</li>
                                <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>
                                -->
                                <c:choose>
                                    <c:when test="${sessionScope.cust.getCust_id()==null}">
                                        <li><i class="ti-user"></i> <a href="/register">회원가입</a></li>
                                        <li><i class="ti-power-off"></i><a href="/login">로그인</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><i class="ti-user"></i> <a href="/account">${cust.getCust_name()}</a></li>
                                        <li><i class="ti-power-off"></i><a href="/logout">로그아웃</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        <!-- End Top Right -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Topbar -->
    <div class="middle-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-12">
                    <!-- Logo -->
                    <div class="logo">
                        <a href="/"><img src="images/logo.png" alt="logo"></a>
                    </div>
                    <!--/ End Logo -->
                    <!-- Search Form -->
                    <div class="search-top">
                        <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                        <!-- Search Form -->
                        <div class="search-top">
                            <form class="search-form">
                                <input type="text" placeholder="Search here..." name="search">
                                <button value="search" type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div>
                        <!--/ End Search Form -->
                    </div>
                    <!--/ End Search Form -->
                    <div class="mobile-nav"></div>
                </div>
                <div class="col-lg-8 col-md-7 col-12">
                    <div class="search-bar-top">
                        <div class="search-bar">
                            <select>
                                <option selected="selected">All Category</option>
                                <option>watch</option>
                                <option>mobile</option>
                                <option>kid’s item</option>
                            </select>
                            <form>
                                <input name="search" placeholder="Search Products Here....." type="search">
                                <button class="btnn"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-12">
                    <div class="right-bar">
                        <!-- Search Form -->
<%--                        찜목록(즐겨찾기) 아이콘--%>
                        <div class="sinlge-bar">
                            <c:choose>
                                <c:when test="${favSize>0}">
                                    <a href="/fav" class="single-icon">
                                        <i class="fa fa-heart-o" aria-hidden="true"></i>
                                        <span id="fav-count" class="total-count">${favSize}</span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/fav" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                </c:otherwise>
                            </c:choose>

                        </div>
<%--                        마이페이지 아이콘--%>
                        <div class="sinlge-bar">
                            <a href="/account" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                        </div>
<%--                        장바구니 아이콘--%>
                        <div class="sinlge-bar shopping">
                            <c:choose>
                                <c:when test="${cartSize>0}">
                                    <a href="/cart" class="single-icon"><i class="ti-bag"></i> <span class="total-count">${cartSize}</span></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/cart" class="single-icon"><i class="ti-bag"></i></a>
                                </c:otherwise>
                            </c:choose>
<%--                            고객 ID를 받아와서 0건보다 많을 경우 아이콘 옆에 건수를 표기해줌--%>

                            <!-- Shopping Item -->
                            <div class="shopping-item">
                                <div class="dropdown-cart-header">
                                    <c:choose>
                                        <c:when test="${cartSize>0}">
                                            <span>${cartSize} 건</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>0 건</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="/cart">장바구니 보기</a>
                                </div>
                                <ul class="shopping-list">
                                    <c:forEach var="cart" items="${carts}">
                                        <li>
                                            <a href="#" class="remove" title="이 상품 빼기"><i class="fa fa-remove"></i></a>
<%--                                            TODO: ajax로 실시간 카트에서 제거 동작 넣기--%>
                                            <a class="cart-img" href="/product/detail?id=${cart.product_id}"><img src="/imgs/product/${cart.product_img_main}" alt="${cart.product_img_main}"></a>
                                            <h4><a href="/product/detail?id=${cart.product_id}">${cart.product_name}</a></h4>
                                            <p class="quantity">${cart.cart_qtt} - <span class="amount"> ${cart.cart_price} </span></p>
                                        </li>
                                    </c:forEach>
<!--
                                    <li>
                                        <a href="/product_detail/product_info" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                        <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                        <h4><a href="#">Woman Ring</a></h4>
                                        <p class="quantity">1x - <span class="amount">$99.00</span></p>
                                    </li>
                                    <li>
                                        <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                        <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                        <h4><a href="#">Woman Necklace</a></h4>
                                        <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                    </li>
                                    -->
                                </ul>
                            </div>
                            <!--/ End Shopping Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Inner -->
    <div class="header-inner">
        <div class="container">
            <div class="cat-nav-head">
                <div class="row">
                    <div class="col-12">
                        <div class="menu-area">
                            <!-- 메인메뉴 -->
                            <nav class="navbar navbar-expand-lg">
                                <div class="navbar-collapse">
                                    <div class="nav-inner">
                                        <ul class="nav main-menu menu navbar-nav">
                                            <li class="active"><a href="/">Home</a></li>
                                            <li><a href="/product">Product</a></li>
                                            <li><a href="/">Service</a></li>
                                            <li><a href="/">Shop</a></li>
                                            <li><a href="/">Blog</a></li>
                                            <li><a href="/">Contact Us</a></li>
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
    <!--/ End Header Inner -->
</header>
<!--/ End Header -->

<%-- center로 중앙 부분 분리 --%>
<c:choose>
    <c:when test="${center==null}">
        <jsp:include page="center.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="${center}.jsp"/>
    </c:otherwise>
</c:choose>
<!-- /center로 중앙 부분 분리-->

<!-- Start Footer Area -->
<footer class="footer">
    <!-- Footer Top -->
    <div class="footer-top section">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer about">
                        <div class="logo">
                            <a href="index.html"><img src="/images/logo2.png" alt="#"></a>
                        </div>
                        <p class="text">여긴 footer임</p>
                        <p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">+0123 456 789</a></span></p>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-2 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer links">
                        <h4>Information</h4>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Faq</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-2 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer links">
                        <h4>Customer Service</h4>
                        <ul>
                            <li><a href="#">Payment Methods</a></li>
                            <li><a href="#">Money-back</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer social">
                        <h4>Get In Tuch</h4>
                        <!-- Single Widget -->
                        <div class="contact">
                            <ul>
                                <li>NO. 342 - London Oxford Street.</li>
                                <li>012 United Kingdom.</li>
                                <li>info@eshop.com</li>
                                <li>+032 3456 7890</li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                        <ul>
                            <li><a href="#"><i class="ti-facebook"></i></a></li>
                            <li><a href="#"><i class="ti-twitter"></i></a></li>
                            <li><a href="#"><i class="ti-flickr"></i></a></li>
                            <li><a href="#"><i class="ti-instagram"></i></a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Top -->
    <div class="copyright">
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="left">
                            <p>Copyright © 2020 <a href="http://www.wpthemesgrid.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="right">
                            <img src="images/payments.png" alt="#">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- /End Footer Area -->


<%--아래로 전부 스크립트--%>

<!-- Jquery -->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-migrate-3.0.0.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<!-- Popper JS -->
<script src="/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="/js/bootstrap.min.js"></script>
<!-- Color JS -->
<script src="/js/colors.js"></script>
<!-- Slicknav JS -->
<script src="/js/slicknav.min.js"></script>
<!-- Owl Carousel JS -->
<script src="/js/owl-carousel.js"></script>
<!-- Magnific Popup JS -->
<script src="/js/magnific-popup.js"></script>
<!-- Fancybox JS -->
<script src="/js/facnybox.min.js"></script>
<!-- Waypoints JS -->
<script src="/js/waypoints.min.js"></script>
<!-- Countdown JS -->
<script src="/js/finalcountdown.min.js"></script>
<!-- Nice Select JS -->
<script src="/js/nicesellect.js"></script>
<!-- Ytplayer JS -->
<script src="/js/ytplayer.min.js"></script>
<!-- Flex Slider JS -->
<script src="/js/flex-slider.js"></script>
<!-- ScrollUp JS -->
<script src="/js/scrollup.js"></script>
<!-- Onepage Nav JS -->
<script src="/js/onepage-nav.min.js"></script>
<!-- Easing JS -->
<script src="/js/easing.js"></script>
<!-- Active JS -->
<script src="/js/active.js"></script>
</body>
</html>