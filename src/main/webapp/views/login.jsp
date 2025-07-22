<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #error {
        color: red;
        font-size: 0.9rem;
        margin-bottom: 15px;
    }
</style>

<script>
    setTimeout(function (){
        const errorlimit = document.getElementById('error');
        if (errorlimit) {
            errorlimit.style.display = 'none';
        }
    }, 5000);
</script>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="/login">Login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Login -->
<section class="shop login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-12">
                <div class="login-form">
                    <h2>로그인</h2>
                    <!-- Form -->
                    <form class="form" method="post" action="/loginimpl">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Id<span>*</span></label>
                                    <input type="text" name="id" placeholder="" required="required">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Password<span>*</span></label>
                                    <input type="password" name="password" placeholder="" required="required">
                                </div>
                            </div>

                            <%-- Start error messeage --%>
                            <div class="col-12">
                                <c:if test="${not empty error}">
                                    <p id="error">
                                            ${error}
                                    </p>
                                </c:if>
                            </div>
                            <%-- End error messeage --%>

                            <div class="col-12">
                                <div class="form-group login-btn">
                                    <button class="btn" type="submit">로그인</button>
                                    <a href="/register" class="btn">회원가입</a>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- End Form -->
                </div>
            </div>
        </div>
    </div>
</section>
<!--/ End Login -->

