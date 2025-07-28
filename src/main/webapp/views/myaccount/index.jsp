<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                            <li class="active">
                                <c:choose>
                                    <c:when test="${activePage =='account'}">
                                        <li class="active"><a href="/account">My Account</a></li>
                                    </c:when>
                                    <c:when test="${activePage =='address'}">
                                        <li class="active"><a href="/address">My Address</a></li>
                                    </c:when>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Breadcrumbs -->
    <div class="row" style="margin-top:50px; margin-bottom: 30px;">
        <%-- Left Menu Start ........  --%>
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose>
        <%-- Left Menu End ........  --%>

        <%-- Center Start ........  --%>
        <c:choose>
            <c:when test="${right == null}">
                <jsp:include page="account.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${right}.jsp"/>
            </c:otherwise>
        </c:choose>
        <%-- Center End ........  --%>
    </div>
</div>