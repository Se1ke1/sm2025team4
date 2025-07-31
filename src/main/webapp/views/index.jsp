<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
    let index = {
        cartSize:${fn:length(carts)},
        favSize:${fn:length(favs)},
        init: function () {
            index.update();
            document.querySelectorAll('.remove').forEach(remove => {
                remove.addEventListener('click', async function () {
                    const cart_id = this.dataset.cartId;
                    const response = await index.removeCart(cart_id);
                    if (response) {
                        remove.parentElement.style.display = 'none';
                        /*
                        if (await index.onUpdateModel()) index.update();
                        else {
                            alert("서버 통신 오류 : 재로드 실패");
                        }
                         */
                        if (index.cartSize>0) index.cartSize--;
                        index.update();
                    }
                    else {
                        console.log("서버 통신 오류 : 장바구니 제거 작업 비정상 처리");
                    }
                });
            });
            $('#btn_logout').click(async function () {
                try {
                    let response = await index.logout();
                    if (response) {
                        location.reload();
                    }
                    else {
                        console.log(response);
                    }
                }
                catch (e) {
                    console.log('서버 통신 오류' + e);
                }
            });
        },
        logout: async function () {
            return $.ajax({
                url: '/logout',
                dataType: 'json'
            });
        },
        removeCart: async function (cart_id) {
            return $.ajax({
                url: '/cart/remove',
                type: 'POST',
                dataType: 'json',
                data: {cart_id: cart_id}
            });
        },
        onUpdateModel: async function () {
            return $.ajax({
                url: '/api/update/model',
                type: 'POST',
                dataType: 'json'
            })
        },
        update: function () {
            <%--index.cartSize=${fn:length(carts)};--%>
            <%--index.favSize=${fn:length(favs)};--%>
            if (index.cartSize>0) {
                $('#cart-count').removeClass('hidden_comp').text(index.cartSize);
            }
            else {
                $('#cart-count').addClass('hidden_comp').text(0);
            }
            if (index.favSize>0) {
                $('#fav-count').removeClass('hidden_comp').text(index.favSize);
            }
            else {
                $('#fav-count').addClass('hidden_comp').text(0);
            }
            $('#cart-size').text(index.cartSize+'건');
        }
    }
    document.addEventListener('DOMContentLoaded', function () {
        index.init();
    });
</script>
<style>
    .hidden_comp {
        display: none;
    }
    .header-divider {
        border: none;
        height: 50px;
        background-color: #222;
        margin-top: 0;
        margin-bottom: 0px;
    }
    .header.sort-bar.sticky {
        position: static !important;
        box-shadow: none !important;
    }
    .sort-bar.navbar-collapse.sticky {
        position: static !important;
        box-shadow: none !important;
    }
    .main-menu .btn-sortorder {
         background: none; /* 버튼 배경 제거 */
         border: none; /* 버튼 테두리 제거 */
         color: #fff; /* 글자색을 메뉴바에 맞게 흰색으로 */
         padding: 15px; /* 기존 메뉴와 비슷한 여백 */
         font-weight: 500;
         text-transform: uppercase;
         cursor: pointer;
         transition: all .3s ease; /* 부드러운 효과 */
     }

     /* 클릭/호버 시 효과 */
    .main-menu .btn-sortorder:hover,
    .main-menu .btn-sortorder .text-dark { /* text-dark 클래스가 추가되었을 때 (선택됨) */
        color: #F7941D; /* 테마의 주황색으로 변경 */
        background-color: #333; /* 약간 밝은 배경색으로 강조 (선택적) */
    }
    .bg-grey {
        background-color: white !important;
    }
    .indicator_text {
        margin-left: 15px;
        color: #fff;
        font-weight: 500;
        text-transform: uppercase;
        font-size: 14px;
    }
    .sort-bar .nav-inner {
        width: 100% !important;
    }
    .sort-bar .navbar-nav {
        margin-left: auto !important;
        margin-right: 5px !important;
    }
</style>

<body class="js">
<!-- Header -->
<header class="header shop v3 sort-bar">
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
                                        <li><i class="ti-tag"></i> <a href="/product">상품판매</a></li>
                                        <li><i class="ti-user"></i> <a href="/account">${cust.getCust_name()}</a></li>
                                        <li><i class="ti-power-off"></i><a href="#" id="btn_logout">로그아웃</a></li>
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
                            <a href="/fav" class="single-icon">
                                <i class="fa fa-heart-o" aria-hidden="true"></i>
                                <span id="fav-count" class="total-count hidden_comp">${fn:length(favs)}</span>
                            </a>
                        </div>
<%--                        마이페이지 아이콘--%>
                        <div class="sinlge-bar">
                            <a href="/account" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                        </div>
<%--                        장바구니 아이콘--%>
                        <div class="sinlge-bar shopping">
                            <a href="/cart" class="single-icon"><i class="ti-bag"></i><span id="cart-count" class="total-count hidden_comp">${fn:length(carts)}</span></a>
<%--                            고객 ID를 받아와서 0건보다 많을 경우 아이콘 옆에 건수를 표기해줌--%>
                            <!-- Shopping Item -->
                            <div class="shopping-item">
                                <div class="dropdown-cart-header">
                                    <span id="cart-size">${fn:length(carts)} 건</span>
                                    <a href="/cart">장바구니 보기</a>
                                </div>
                                <ul class="shopping-list">
                                    <c:forEach var="cart" items="${carts}">
                                        <li>
                                            <a href="#" class="remove" title="이 상품 빼기" data-cart-id="${cart.cart_id}"><i class="fa fa-remove"></i></a>
                                            <a class="cart-img" href="/product/detail?id=${cart.product_id}"><img src="/imgs/product/${cart.product_img_main}" alt="${cart.product_img_main}"></a>
                                            <h4><a href="/product/detail?id=${cart.product_id}">${cart.product_name}</a></h4>
                                            <p class="quantity">${cart.cart_qtt} - <span class="amount"> ${cart.cart_price} </span></p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!--/ End Shopping Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr class="header-divider">
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