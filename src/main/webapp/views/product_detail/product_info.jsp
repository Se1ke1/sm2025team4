<%--
  Created by IntelliJ IDEA.
  User: 건
  Date: 2025-07-17
  Time: 오후 5:49:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%-- ▼▼▼ 스티키 동작 스크립트 ▼▼▼ --%>
<script>
    $(document).ready(function() {
        const productId = ${product.product_id};
        const currentUserId = '${cust.cust_id}';

        // [리뷰] 목록을 화면에 그리는 공통 함수
        function updateReviewList(reviews) {
            const container = $('#review-list-container');
            container.empty();
            if (!reviews || reviews.length === 0) {
                container.append('<li class="review-item"><p style="text-align:center; padding: 50px;">표시할 리뷰가 없습니다.</p></li>');
                return;
            }
            $.each(reviews, function(index, review) {
                const regdate = new Date(review.review_regdate).toISOString().split('T')[0];
                let imagesHtml = '';
                if (review.review_img_list && review.review_img_list.length > 0) {
                    $.each(review.review_img_list, function(i, img) {
                        imagesHtml += '<img src="/imgs/' + img + '" alt="리뷰 이미지" width="100" style="margin-top: 5px;">';
                    });
                }
                const reviewHtml =
                    '<li class="review-item" id="review-' + review.review_no + '">' +
                    '    <div class="top_info">' +
                    '        <span class="star_mask" style="width:' + (review.review_score * 20) + '%"></span> ' + review.review_score + '점 |' +
                    '        ' + regdate + ' | ' + review.cust_id +
                    '    </div>' +
                    '    <p><strong>' + review.review_article + '</strong></p>' + imagesHtml +
                    '</li>';
                container.append(reviewHtml);
            });
        }

        // [Q&A] 목록을 화면에 그리는 공통 함수
        function updateQnaList(qnas) {
            const container = $('#section4 .qna_list');
            container.empty();
            if (!qnas || qnas.length === 0) {
                container.append('<li><p style="text-align:center; padding: 50px;">표시할 Q&A가 없습니다.</p></li>');
                return;
            }
            const questions = qnas.filter(q => !q.qna_upper_no || q.qna_upper_no === 0);
            const replies = qnas.filter(q => q.qna_upper_no && q.qna_upper_no > 0);
            questions.forEach(qna => {
                let qnaHtml = '';
                let deleteButtonHtml = (currentUserId && currentUserId === qna.cust_id) ?
                    '<a href="/qna/delete?qna_no=' + qna.qna_no + '&product_id=' + productId + '" class="btn btn-sm btn-outline-danger" onclick="return confirm(\'이 질문을 삭제하시겠습니까?\');">삭제</a>' : '';
                qnaHtml +=
                    '<li class="cmt_item" id="qna_' + qna.qna_no + '"><div class="cmt_wrap"><div class="cont_area">' +
                    '<div class="cmt_head"><div class="user_info"><strong>' + qna.cust_id + '</strong><span class="date">' + new Date(qna.qna_regdate).toLocaleString() + '</span></div>' + deleteButtonHtml + '</div>' +
                    '<div class="cmt_cont"><p class="qna_content"><span class="qna_label qna_label_q">질문:</span> ' + qna.qna_article + '</p></div>' +
                    '</div></div></li>';
                replies.filter(r => r.qna_upper_no === qna.qna_no).forEach(reply => {
                    let replyDeleteButton = (currentUserId && currentUserId === reply.cust_id) ?
                        '<a href="/qna/delete?qna_no=' + reply.qna_no + '&product_id=' + productId + '" class="btn btn-sm btn-outline-danger" onclick="return confirm(\'이 답변을 삭제하시겠습니까?\');">삭제</a>' : '';
                    qnaHtml +=
                        '<li class="cmt_reply" id="qna_reply_' + reply.qna_no + '"><div class="cmt_wrap"><div class="cont_area">' +
                        '<div class="cmt_head"><div class="user_info"><strong>' + reply.cust_id + '</strong><span class="date">' + new Date(reply.qna_regdate).toLocaleString() + '</span></div>' + replyDeleteButton + '</div>' +
                        '<div class="cmt_cont"><p class="qna_content"><span class="qna_label qna_label_a">답변:</span> ' + reply.qna_article + '</p></div>' +
                        '</div></div></li>';
                });
                container.append(qnaHtml);
            });
            container.find('.cmt_head').css({display:'flex', justifyContent:'space-between', alignItems:'center'});
        }

        // 리뷰 검색
        $('#review-search-button').on('click', function() {
            const keyword = $('#review-search-keyword').val();
            if (keyword.trim() === "") { alert("검색어를 입력해주세요."); return; }
            $.ajax({
                url: '/review/search', type: 'GET', data: { product_id: productId, keyword: keyword },
                success: function(reviews) {
                    if (reviews.length === 0) { alert('"' + keyword + '"에 대한 검색 결과가 없습니다.'); }
                    else { updateReviewList(reviews); }
                },
                error: function() { alert("리뷰 검색 중 오류 발생"); }
            });
        });

        // Q&A 검색
        $('#prodBlog-productOpinion-button-search').on('click', function() {
            const keyword = $('#prodBlog-productOpinion-search-keyword').val();
            if (keyword.trim() === "") { alert("검색어를 입력해주세요."); return; }
            $.ajax({
                url: '/qna/search', type: 'GET', data: { product_id: productId, keyword: keyword },
                success: function(qnas) {
                    if (qnas.length === 0) { alert('"' + keyword + '"에 대한 검색 결과가 없습니다.'); }
                    else { updateQnaList(qnas); }
                },
                error: function() { alert("Q&A 검색 중 오류 발생"); }
            });
        });
        // 검색 초기화 버튼
        $('.search-reset-btn').on('click', function(e) {
            e.preventDefault();
            const product_id = ${product.product_id};
            location.href = '/product_detail/product_info?id=' + product_id;
        });

        const $stickyHeader = $('#product-sticky-header');
        const $stickyFooter = $('#product-sticky-footer');
        const $headerTabs = $stickyHeader.find('.tab_item');
        const $contentSections = $('.content-section');
        const $originalTabArea = $('#detail_tab_area');

        const headerHeight = $stickyHeader.outerHeight();

        // 1. 탭 클릭 시 부드럽게 스크롤
        $('a[href^="#section"]').on('click', function(e) {
            e.preventDefault();
            const targetId = $(this).attr('href');
            const $target = $(targetId);

            if ($target.length) {
                // 스티키 헤더가 나타났을 때와 아닐 때를 모두 고려하여 스크롤 위치 계산
                const scrollTopValue = $stickyHeader.hasClass('visible')
                    ? $target.offset().top - headerHeight + 1
                    : $target.offset().top - headerHeight - $originalTabArea.height() + 1;

                $('html, body').animate({ scrollTop: scrollTopValue }, 500);
            }
        });

        // 2. 스크롤 이벤트 핸들러
        $(window).on('scroll', function() {
            const scrollPosition = $(window).scrollTop();
            const triggerPoint = $originalTabArea.offset().top;

            if (scrollPosition > triggerPoint) {
                $stickyHeader.addClass('visible');
                $stickyFooter.addClass('visible');
            } else {
                $stickyHeader.removeClass('visible');
                $stickyFooter.removeClass('visible');
            }

            // Scroll Spy
            $contentSections.each(function() {
                const $currentSection = $(this);
                const sectionTop = $currentSection.offset().top - headerHeight - 50; // 오차 보정
                const sectionBottom = sectionTop + $currentSection.outerHeight();

                if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                    const currentId = $currentSection.attr('id');
                    $headerTabs.removeClass('on');
                    $headerTabs.find('a[href="#' + currentId + '"]').parent().addClass('on');
                }
            });
        });

        $(window).trigger('scroll');
    });
    // 추천 버튼 클릭 이벤트
    $(document).ready(function(){
        // --- 기능 1: 추천/비추천 버튼 클릭 이벤트 처리 ---
        $('.like_box').on('click', '.btn_like, .btn_dislike', function(e) {
            // a 태그나 button 태그의 기본 동작(페이지 이동 등)을 막음
            e.preventDefault();

            // --- (1) 필요한 요소들을 변수에 저장 ---
            const $button = $(this); // 현재 클릭된 버튼 (추천 또는 비추천)
            const $otherButton = $button.siblings(); // 반대편 버튼
            const $countSpan = $button.find('.num_c'); // 클릭된 버튼의 카운트 숫자 영역

            // 현재 카운트를 숫자로 변환 (만약 카운트가 없으면 0으로 시작)
            let count = parseInt($countSpan.text()) || 0;

            // --- (2) 반대편 버튼이 이미 활성화된 경우, 비활성화 처리 ---
            if ($otherButton.hasClass('active')) {
                $otherButton.removeClass('active'); // 반대편 버튼의 active 클래스 제거

                // 반대편 버튼의 카운트를 1 감소
                let otherCount = parseInt($otherButton.find('.num_c').text()) || 0;
                $otherButton.find('.num_c').text(otherCount > 0 ? otherCount - 1 : 0);
            }

            // --- (3) 현재 클릭한 버튼의 상태를 확인하고 토글(toggle) 처리 ---
            if ($button.hasClass('active')) {
                // 이미 활성화 상태라면, 비활성화 시키고 카운트 1 감소
                $button.removeClass('active');
                $countSpan.text(count > 0 ? count - 1 : 0);
            } else {
                // 비활성화 상태라면, 활성화 시키고 카운트 1 증가
                $button.addClass('active');
                $countSpan.text(count + 1);
            }
        });

    });

    // 장바구니, 즉시구매 버튼이동, 관심 등록 추가
    let productDetail = {
        init:function (){
            $('.cart_btn').on('click', function() {
                if (confirm("${product.product_name} 을(를) 장바구니에 담으시겠습니까?")) {
                    const form = $('#product_purchase_form');
                    form.attr("method","post");
                    form.attr("action", "/cart/add");
                    form.submit();
                }
            });
            $('.order_btn').on('click', function() {
                if (confirm("즉시 구매 하시겠습니까?")) {
                    location.href = '/product/결제창?id=${product.product_id}';
                }
            });
            $('.fav-btn').on('click', function() {
                const product_id = $(this).attr('data-product-id');
                const $icon = $(this).find('i');

                if (!product_id) {
                    alert('상품 정보를 가져올 수 없습니다.');
                    return;
                }

                $.ajax({
                    url: '/fav/toggle',
                    type: 'post',
                    data: { product_id: product_id },
                    success: function(response) {
                        if (response.status === 'success') {
                            if (response.action === 'added') {
                                $icon.removeClass('fa-heart-o').addClass('fa-heart');
                                productDetail.update(true);
                            } else {
                                $icon.removeClass('fa-heart').addClass('fa-heart-o');
                                productDetail.update(false);
                            }
                        } else {
                            alert("로그인이 필요합니다");
                            if (response.message.includes('로그인')) {
                                location.href = '/login';
                            }
                        }
                    },
                    error: function(xhr,status,error) {
                        console.error("error:",status,error);
                        alert('요청 처리 중 오류가 발생.');
                    }
                });
            });
        },
        update:function (plus) {
            const favCountElement = document.getElementById('fav-count');
            if (favCountElement) {
                let favSize = parseInt(favCountElement.textContent);
                if (plus) {
                    favCountElement.innerHTML = favSize+1;
                }
                else {
                    favCountElement.innerHTML = favSize-1;
                }
            }
        }
    }
    $().ready(()=>{
        productDetail.init();
    });
</script>
<style>
    /*인라인 탭*/
    .inline_tab .tab_list{
        display: flex; /* 가로 정렬 */
        width: 100%;   /* 가로로 꽉 채움 */
        justify-content: space-between; /* 항목 간 간격 자동 정리 */
        list-style: none; /* 점 제거 */
        padding: 0;
        margin: 0px;
        border-bottom: 1px solid #ccc;
    }
    .inline_tab .tab_item {
        flex: 1;
        text-align: center;
    }

    /*리뷰 인라인*/
    .flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        margin-bottom: 10px;
    }

    /*추천버튼*/
    .like_box .btn_like.active {
        background-color: #d4edda; /* 연한 녹색 배경 */
        border-color: #c3e6cb;
    }
    .like_box .btn_dislike.active {
        background-color: #f8d7da; /* 연한 빨간색 배경 */
        border-color: #f5c6cb;
    }
    .like_box .btn_like.active .ico,
    .like_box .btn_dislike.active .ico {
        font-weight: bold; /* 글씨를 굵게 처리 */
    }

    /*삭제 버튼 오른쪽으로*/
    .del_right {
        float: right; //오른쪽으로
        justify-content: space-between;
        align-items: center;
    }

    /*qna박스*/
    #section4 .qna_list {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    /* 질문과 답변 각각의 박스(li) 공통 스타일 */
    #section4 .cmt_item,
    #section4 .cmt_reply {
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 10px;
    }
    /* 답변(.cmt_reply) 박스에만 적용될 추가 스타일 */
    #section4 .cmt_reply {
        margin-left: 40px;      /* 들여쓰기 효과 */
        background-color: #f9f9f9;
    }
    /* 작성자 정보(.user_info) 라인 스타일 */
    #section4 .user_info {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
        color: #666;
    }
    #section4 .user_info strong {
        color: #333;
        font-weight: bold;
    }
    /* 질문/답변 내용(<p>) 스타일 */
    #section4 .qna_content {
        margin-top: 10px;
        margin-bottom: 0; /* p태그 기본 하단 여백 제거 */
        line-height: 1.6;
    }
    .qna-write-form{
        border: 1px solid #eee;
        padding: 20px;
        margin-bottom: 30px;
        border-radius: 5px;"
    }
    /* "질문:", "답변:" 라벨 스타일 */
    #section4 .qna_label {
        font-weight: bold;
        margin-right: 4px; /* 라벨과 내용 사이 간격 */
    }
    #section4 .qna_label_q {
        color: #007bff;
    }
    #section4 .qna_label_a {
        color: #dc3545;
    }
    /* 페이지네이션 영역 스타일 */
    #section4 .page_nav_area {
        text-align: center;
        margin-top: 20px;
    }
    .pagination {
        display: flex;
        justify-content: center;
        list-style: none;
        padding: 0;
    }
    /*검색 폼 스타일*/
    .qna_search_form {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
        margin-bottom: 20px;
        padding: 10px;
    }
    .search_form {
        display: flex;
        align-items: center;
    }
    .search_reset a {
        text-decoration: none;
        color: #666;
        font-size: 14px;
    }

    /* ───────── 상단 스티키 헤더 ───────── */
    #product-sticky-header{
        position:fixed;top:0;left:0;width:100%;height:50px;
        background:rgba(255,255,255,.95);backdrop-filter:blur(5px);
        box-shadow:0 1px 5px rgba(0,0,0,.08);z-index:1020;
        display:flex;align-items:center;justify-content:center;
        padding:0 30px;opacity:0;visibility:hidden;
        transform:translateY(-100%);transition:all .3s ease-in-out;
    }
    #product-sticky-header.visible{opacity:1;visibility:visible;transform:none}
    #product-sticky-header .tab_list{display:flex;margin:0;padding:0;list-style:none}
    #product-sticky-header .tab_item a{
        padding:0 20px;line-height:50px;font-size:15px;color:#555;
        text-decoration:none;border-bottom:3px solid transparent;transition:.2s;
    }
    #product-sticky-header .tab_item.on a{color:#007bff;border-bottom-color:#007bff;font-weight:600}

    /* ───────── 하단 스티키 푸터 ───────── */
    #product-sticky-footer{
        position:fixed;bottom:0;left:0;width:100%;
        background:#fff;border-top:1px solid #e9ecef;z-index:1020;
        display:flex;align-items:center;justify-content:space-between;
        padding:15px 30px;opacity:0;visibility:hidden;
        transform:translateY(100%);transition:all .3s ease-in-out;
    }
    #product-sticky-footer.visible{opacity:1;visibility:visible;transform:none}
    #product-sticky-footer .footer-info .product-title{font-size:16px;font-weight:bold;color:#333;margin-bottom:5px}
    #product-sticky-footer .footer-info .price{font-size:22px;font-weight:bold;color:#e84c3d}
    #product-sticky-footer .actions{display:flex;gap:10px; position: relative; right:25px;}
    #product-sticky-footer .actions .btn{min-width:120px;font-weight:bold;padding:10px 20px}

    /* ───────── 콘텐츠 섹션 & 바텀 여백 ───────── */
    .content-section{padding-top:50px;margin-top:-50px;padding-bottom:40px;border-bottom:1px solid #eee}
    #product_content_wrapper{padding-bottom:120px} /* 푸터 겹침 방지 */
</style>


<!-- 상단 스티키 헤더 -->
<div id="product-sticky-header">
    <ul class="tab_list">
        <li class="tab_item item01 on"><a href="#section1">상품 구매</a></li>
        <li class="tab_item item02"><a href="#section2">상품 상세정보</a></li>
        <li class="tab_item item03"><a href="#section3">상품 리뷰</a></li>
        <li class="tab_item item04"><a href="#section4">상품 QnA</a></li>
        <li class="tab_item item05"><a href="#section5">다섯번째</a></li>
    </ul>
</div>

<!-- 하단 스티키 푸터 -->
<div id="product-sticky-footer">
    <div class="footer-info">
        <div class="product-title">${product.product_name}</div>
        <div class="price">${product.product_price}원</div>
    </div>
    <div class="actions">
        <button type="button" class="btn fav-btn" data-product-id="${product.product_id}">
            <i class="${isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
        </button>
        <button type="button" class="btn btn-outline-primary cart_btn">장바구니</button>
        <button type="button" class="btn btn-primary order_btn">즉시구매</button>
    </div>
</div>

<%--<h1 type="hidden">product_info Main</h1>--%>
<div class="detail_tab_area" id="detail_tab_area">
    <div class="inline_tab">&nbsp;
        <ul class="tab_list">
            <li class="tab_item item01 on" id="bookmark_item">
                <a href="#section1">
                    <h3 class="tab_txt">상품 구매</h3>
                </a>
            </li>
            <li class="tab_item item02" id="bookmark_product_information_item">
                <a href="#section2">
                    <h3 class="tab_txt">상품 상세정보</h3>
                </a>
            </li>
            <li class="tab_item item03" id="bookmark_cm_opinion_item">
                <a href="#section3">
                    <h3 class="tab_txt">상품 리뷰</h3>
                </a>
            </li>
            <li class="tab_item item04" id="bookmark_news_expert_item">
                <a href="#section4">
                    <h3 class="tab_txt">상품 QnA</h3>
                </a>
            </li>
            <li class="tab_item item05" id="bookmark_relation_product_item">
                <a href="#section5">
                    <h3 class="tab_txt"></h3>
                </a>
            </li>
        </ul>
    </div>
</div>

<%--첫번째 탭--%>
<div class="content-section" id="section1">
    <form id="product_purchase_form">
        <div class="b_tit">&nbsp;
            <h1 class="blind">${product.product_name}</h1>
            <tr>
                <td class="dsc"><img src="/imgs/product/${product.product_img_main}" alt="${product.product_name} 대표 이미지"></td>
            </tr>
            <tr>
                <th scope="row" class="tit"><a onclick="$.termDicViewLink(1478,'view',this,3,'infoBottom');">가격</a></th>
                <td class="dsc"><fmt:formatNumber type="number" pattern="###,###원" value="${product.product_price}"/></td>
            </tr>
            <tr>
                <th scope="row" class="tit"><a onclick="$.termDicViewLink(313,'view',this,3,'infoBottom');">남은 수량</a></th>
                <td class="dsc">${product.product_qtt}</td>
            </tr>
            <%--                상품id와 기본 qtt=1 INPUT 및 버튼--%>
            <input type="hidden" name="product_id" value="${product.product_id}">
            <input type="hidden" name="cart_qtt" value="1">
            <button type="button" class="btn fav-btn" data-product-id="${product.product_id}">
                <i class="${isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
            </button>
            <button type="button" class="btn btn-outline-primary cart_btn">장바구니</button>
            <button type="button" class="btn btn-primary order_btn">즉시구매</button>
        </div>
    </form>
</div>


<%--상세 정보 클릭 --%>
<div class="content-section" id="section2">
    <div class="b_tit">
        <h3 class="txt">상품 상세정보</h3>
    </div>
    <div id="productDescriptionArea">
        <div class="prod_spec">
            <table class="spec_tbl">
                <caption class="cp_hide">
                    <strong>실제 정보와 다를 수 있습니다</strong>
                </caption>
                <colgroup>
                    <col class="tit">
                    <col class="dsc">
                    <col class="tit">
                    <col class="dsc">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="tit">판매자</th>
                    <td class="dsc">${product.seller_name}</td>
                    <th scope="row" class="tit">등록날짜</th>
                    <td class="dsc"><fmt:formatDate value="${product.product_regdate}" pattern="yyyy년MM월dd일"/></td>
                </tr>
                <tr>
                    <th scope="row" class="tit"><a onclick="$.termDicViewLink(23939,'view',this,3,'infoBottom');">상품 분류</a></th>
                    <td class="dsc">${product.cate_name}</td>
                    <th scope="row" class="tit"><a onclick="$.termDicViewLink(1476,'view',this,3,'infoBottom');"></a>상품 이름</th>
                    <td class="dsc">${product.product_name}</td>
                </tr>
                <tr>
                    <th scope="row" class="tit"><a onclick="$.termDicViewLink(1478,'view',this,3,'infoBottom');">가격</a></th>
                    <td class="dsc"><fmt:formatNumber type="number" pattern="###,###원" value="${product.product_price}"/></td>
                    <th scope="row" class="tit"><a onclick="$.termDicViewLink(313,'view',this,3,'infoBottom');">남은 수량</a></th>
                    <td class="dsc">${product.product_qtt}</td>
                </tr>
                <%--상세 이미지 리스트 출력--%>
                <c:if test="${not empty pitlist}">
                    <tr>
                        <th scope="row" class="tit">&nbsp;</th>
                        <td colspan="3">
                            <c:forEach var="pit" items="${pitlist}">
                                <c:choose>
                                    <c:when test="${pit.product_img.startsWith('http')}">
                                        <img src="${pit.product_img}" alt="상세 이미지">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/imgs/product/${pit.product_img}" alt="상세 이미지">
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>


<%--상품 리뷰--%>
<div class="content-section" id="section3">
    <div class="b_tit">
        <h3 class="blind">상품 리뷰</h3>
        <c:if test="${empty reviewlist}">
            <li class="review-item">
                <p>등록된 리뷰가 없습니다.</p>
            </li>
        </c:if>
        <div class="review-header">
            <div class="flex">
                <div class="review-sort">
                    <a href="#" class="btn btn-sm btn-outline-primary active">유용한 리뷰순</a>
                    <a href="#" class="btn btn-sm btn-primary">최신순</a>
                </div>
                <div class="review-average">
                    <%-- 평균 별점과 리뷰 수는 AJAX로 함께 업데이트 가능(수정필요) --%>
                    <span id="review-count"><strong>총 ${reviewlist.size()}개 리뷰</strong></span>
                </div>
                <div class="review-search">
                    <input type="text" id="review-search-keyword" placeholder="키워드 검색">
                    <button class="prodBlog-productOpinion-button-search" id="review-search-button">검색 </button>
                    <a href="#" id="review-search-reset" class="prodBlog-productOpinion-button-searchReset search-reset-btn">검색 초기화</a>
                </div>
                <c:if test="${not empty cust}">
                    <a href="/review/add?product_id=${product.product_id}" class="btn btn-primary">리뷰 작성</a>
                </c:if>
            </div>

            <ul class="review-list" id="review-list-container">
                <c:if test="${empty reviewlist}">
                    <li class="review-item">
                        <p>등록된 리뷰가 없습니다.</p>
                    </li>
                </c:if>

                <c:forEach var="review" items="${reviewlist}">
                    <li class="review-item" id="review-${review.review_no}">
                        <div class="top_info">
                            <span class="star_mask" style="width:${review.review_score * 20}%"></span> ${review.review_score}점 |
                            <fmt:formatDate value="${review.review_regdate}" pattern="yyyy.MM.dd."/> |
                            <c:out value="${review.cust_id}" />
<%--                            리뷰 삭제 버튼--%>
                            <c:if test="${not empty cust && cust.cust_id == review.cust_id}">
                                <a href="/review/delete?review_no=${review.review_no}&product_id=${product.product_id}"
                                   class="btn btn-danger btn-sm del_right"
                                   onclick="return confirm('정말 삭제하시겠습니까?');">리뷰 삭제</a>
                            </c:if>
                        </div>
                        <p><strong><c:out value="${review.review_article}" escapeXml="false"/></strong></p>
                            <%--                        list<String> 순회하며 이미지 표시--%>
                        <c:forEach var="img" items="${review.review_img_list}">
                            <img src="/imgs/${img}" alt="리뷰 이미지" width="100" style="margin-top: 5px;">
                        </c:forEach>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <%--            리뷰 페이지네이션--%>
        <nav aria-label="Page navigation" class="text-center mt-3">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">다음</a></li>
            </ul>
        </nav>
    </div>
</div>



<div class="content-section" id="section4">
    <div class="b_tit">
        <h3>상품 QnA</h3>
    </div>
    <%-- Q&A 검색 폼 --%>
    <div class="qna_search_form">
        <div class="search_form">
            <div class="srch_inpt_w">
                <input type="text" class="srch_input" title="상품의견 검색" placeholder="상품의견 검색" id="prodBlog-productOpinion-search-keyword" value="">
            </div>
            <button type="button" class="btn_srch" id="prodBlog-productOpinion-button-search">
                <span class="ico">검색</span>
            </button>
        </div>
        <div class="search-reset-btn">
            <a id="prodBlog-productOpinion-button-searchReset" href="#" class="btn_reset"><span class="ico">검색 초기화</span></a>
        </div>
    </div>
    <%-- QnA --%>
    <ul class="qna_list">
        <%-- 1. qnalist가 비어있을 경우 메시지 표시 --%>
        <c:if test="${empty qnalist}">
            <li>
                <p>등록된 상품 문의가 없습니다.</p>
            </li>
        </c:if>
        <%-- 2. qnalist를 순회하며 질문과 답변을 동적으로 생성 --%>
        <c:forEach var="qna" items="${qnalist}">
            <%-- 3. qna_upper_no가 없거나 0이면 질문으로 간주하고 질문(cmt_item) li 생성 --%>
            <c:if test="${empty qna.qna_upper_no || qna.qna_upper_no == 0}">
                <li class="cmt_item" id="qna_${qna.qna_no}">
                    <div class="cmt_wrap">
                        <div class="cont_area">
                            <div class="cmt_head">
                                <div class="oh_left">
                                    <div class="user_info">
                                        <a href="#" onclick="return false;" class="id_name">
                                                <%-- 동적 데이터: 작성자 ID --%>
                                            <strong><c:out value="${qna.cust_id}" /></strong>
                                        </a>
                                        <span class="date">
                                        <%-- 동적 데이터: 작성일 --%>
                                        <fmt:formatDate value="${qna.qna_regdate}" pattern="yyyy.MM.dd. HH:mm:ss"/>
                                    </span>
                                    </div>
<%--                                    질문 삭제 버튼--%>
                                    <c:if test="${not empty cust && cust.cust_id == qna.cust_id}">
                                        <a href="/qna/delete?qna_no=${qna.qna_no}&product_id=${product.product_id}"
                                           class="btn btn-sm btn-outline-danger del_right"
                                           onclick="return confirm('이 질문을 삭제하시겠습니까?');">질문 삭제</a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="cmt_cont">
                                <p class="qna_content">
                                    <span class="qna_label qna_label_q">질문:</span>
                                    <c:out value="${qna.qna_article}" />
                                </p>
                            </div>
                                <%-- 피드백 영역은 정적임 저장도 안함(수정필요) --%>
                            <div class="cmt_feedback">
                                <a href="#" class="btn_reply">답글</a>
                                <div class="like_box">
                                    <button type="button" class="btn_like"><span class="ico i_like">추천</span><span class="num_c recommend_count"></span></button>
                                    <button type="button" class="btn_dislike"><span class="ico i_dislike">비추천</span><span class="num_c recommend_count"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <%-- 4. 현재 질문(qna)에 대한 답변(reply)을 찾아서 답변(cmt_reply) li 생성 --%>
                <c:forEach var="reply" items="${qnalist}">
                    <c:if test="${not empty reply.qna_upper_no && reply.qna_upper_no == qna.qna_no}">
                        <li class="cmt_reply" id="qna_reply_${reply.qna_no}">
                            <div class="cmt_wrap">
                                <div class="cont_area">
                                    <div class="cmt_head">
                                        <div class="oh_left">
                                            <div class="user_info">
                                                    <%-- 답변 작성자가 관리자인지 등에 따라 분기 처리 가능 --%>
                                                <a href="#" onclick="return false;" class="id_name">
                                                    <strong><c:out value="${reply.cust_id}" /></strong>
                                                </a>
                                                <span class="date">
                                                <fmt:formatDate value="${reply.qna_regdate}" pattern="yyyy.MM.dd. HH:mm:ss"/>
                                            </span>
                                            </div>
<%--                                            답변 삭제 버튼--%>
                                            <c:if test="${not empty cust && cust.cust_id == reply.cust_id}">
                                                <a href="/qna/delete?qna_no=${reply.qna_no}&product_id=${product.product_id}"
                                                   class="btn btn-sm btn-outline-danger"
                                                   onclick="return confirm('이 답변을 삭제하시겠습니까?');">삭제</a>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="cmt_cont">
                                        <p class="qna_content">
                                            <span class="qna_label qna_label_a">답변:</span>
                                                <%-- DB에 저장된 답변 내용이 <br> 태그를 포함할 수 있으므로 escapeXml="false" 사용 --%>
                                            <c:out value="${reply.qna_article}" escapeXml="false" />
                                        </p>
                                    </div>
                                    <div class="cmt_feedback">
                                        <div class="like_box">
                                            <button type="button" class="btn_like"><span class="ico i_like">추천</span><span class="num_c recommend_count"></span></button>
                                            <button type="button" class="btn_dislike"><span class="ico i_dislike">비추천</span><span class="num_c recommend_count"></span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
                <%--                판매자일 경우 답글 작성--%>
                <c:if test="${not empty user && user.getCust_id() == product.seller_id}">
                    <li class="cmt_reply reply_form_wrapper">
                        <form action="/qna/reply" method="post">
                                <%-- Controller로 넘겨줄 숨겨진 데이터들 --%>
                            <input type="hidden" name="product_id" value="${product.product_id}">
                            <input type="hidden" name="qna_upper_no" value="${qna.qna_no}">

                            <div class="form-group">
                                <textarea name="qna_article" class="form-control" rows="3" placeholder="판매자로서 답변을 남겨주세요." required></textarea>
                            </div>
                            <div class="form-group text-right mb-0">
                                <button type="submit" class="btn btn-primary btn-sm">답글 등록</button>
                            </div>
                        </form>
                    </li>
                </c:if>

            </c:if>
        </c:forEach>
    </ul>

    <%--    고객이 상품에 대해 질문 등록--%>
    <c:if test="${not empty cust}">
        <div class="qna-write-form">
            <h4>상품에 대해 문의하기</h4>
            <form action="/qna/add" method="post">
                <input type="hidden" name="product_id" value="${product.product_id}">
                <div class="form-group">
                    <textarea name="qna_article" class="form-control" rows="4" placeholder="상품에 대한 질문을 남겨주세요." required></textarea>
                </div>
                <div class="form-group text-right mb-0">
                    <button type="submit" class="btn btn-primary">질문 등록</button>
                </div>
            </form>
        </div>
    </c:if>

    <%-- QnA 페이지네이션 --%>
    <nav aria-label="Page navigation" class="text-center mt-3">
        <ul class="pagination">
            <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">다음</a></li>
        </ul>
    </nav>
</div>


<div class="content-section" id="section5">
    <div class="b_tit">
        <h3 class="blind">다섯번째 탭</h3>
        <a href="#" target="_blank" class="rgt_link">
            5<span class="ico"></span>
        </a>
    </div>
</div>