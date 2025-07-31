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
    //TODO:스크립트들이 객체 안에 담겨있지 않음. 작업 완료 후 리팩포링 과정 필요
    $(document).ready(function() {
        const isSeller = ('${cust.cust_id}' === '${product.seller_id}');

        // 1. '답글' 버튼 클릭 이벤트 (가장 중요한 기능)
        $('#section4').on('click', '.btn_reply', function(e) {
            e.preventDefault();
            const qnaNo = $(this).data('qna-no');
            if (!qnaNo) {
                alert('data: qna/no가 없습니다!');
                return;
            }
            if (isSeller) {
                // 토글할 답글폼이 실제로 있는지도 체크!
                const form = $('#reply-form-' + qnaNo);
                if (form.length) {
                    form.toggle();
                } else {
                    console.warn('[경고] reply-form-' + qnaNo + ' 폼이 HTML에 없습니다!');
                }
            } else {
                alert('답글을 작성할 권한이 없습니다.');
            }
        });

        // 2. 판매자 답글 등록 (AJAX)
        $('#section4').on('submit', '.qna-reply-form', function(e) {
            e.preventDefault(); // form의 기본 동작(페이지 새로고침)을 막음
            const $form = $(this);
            const formData = $form.serialize(); // 폼 데이터를 서버로 보낼 형태로 변환

            $.ajax({
                url: '/qna/reply',
                type: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    if (response.status === 'success') {
                        alert('답글이 성공적으로 등록되었습니다.');
                        location.reload();
                    } else {
                        alert(response.message || '답글 등록에 실패했습니다.');
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('답글 등록 중 서버 오류가 발생했습니다.\n\n' +
                        'status: ' + jqXHR.status + '\n' +
                        'statusText: ' + jqXHR.statusText + '\n' +
                        'responseText: ' + jqXHR.responseText);
                    location.reload();
                }
            });
        });

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
                let deleteButtonHtml = '';
                if (currentUserId && currentUserId === review.cust_id) {
                    deleteButtonHtml = '<a href="/review/delete?review_no=' + review.review_no + '&product_id=' + productId + '" ' +
                        'class="btn btn-danger btn-sm del_right" onclick="return confirm(\'정말 삭제하시겠습니까?\');">리뷰 삭제</a>';
                }
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
                    '        <span>' +
                    '           <span class="star_mask" style="width:' + (review.review_score * 20) + '%"></span> ' + review.review_score + '점 | ' +
                    '           ' + regdate + ' | ' + (review.cust_name || review.cust_id) +
                    '        </span>' +
                    '        ' + deleteButtonHtml +
                    '    </div>' +
                    '    <p><strong>' + review.review_article + '</strong></p>' + imagesHtml +
                    '</li>';
                container.append(reviewHtml);
            });
        }

        // 리뷰 검색 및 필터링 기능
        let currentSort = 'latest'; // 현재 정렬 상태를 저장하는 변수
        function fetchAndDisplayReviews() {
            const keyword = $('#review-search-keyword').val();

            $.ajax({
                url: '/review/search',
                type: 'GET',
                data: {
                    product_id: productId,
                    keyword: keyword,
                    sort: currentSort
                },
                success: function(reviews) {
                    if (reviews.length > 0) {
                        updateReviewList(reviews);
                    } else {
                        if (keyword.trim() !== '') {
                            alert('"' + keyword + '"에 대한 검색 결과가 없습니다.');
                            $('#review-search-keyword').val('');
                            fetchAndDisplayReviews();
                        } else {
                            updateReviewList([]);
                        }
                    }
                },
                error: function() { alert("리뷰 목록을 불러오는 중 오류가 발생했습니다."); }
            });
        }

// 1. 정렬 버튼 클릭 이벤트
        $('.review-sort a').on('click', function(e) {
            e.preventDefault();
            $('.review-sort a').removeClass('active btn-primary').addClass('btn-outline-secondary');
            $(this).addClass('active btn-primary').removeClass('btn-outline-secondary');

            currentSort = $(this).data('sort'); // 클릭된 버튼의 정렬 값으로 상태 변경
            fetchAndDisplayReviews(); // 목록 새로고침
        });

// 2. 검색 버튼 클릭 이벤트
        $('#review-search-button').on('click', function() {
            fetchAndDisplayReviews(); // 현재 정렬 상태를 유지하며 검색
        });

// 3. 검색 초기화 버튼 클릭 이벤트 (AJAX 방식)
        $('#review-search-reset').on('click', function(e) {
            e.preventDefault();
            $('#review-search-keyword').val('');
            currentSort = 'latest';
            $('.review-sort a').removeClass('active btn-primary').addClass('btn-outline-secondary');
            $('.review-sort a[data-sort="latest"]').addClass('active btn-primary').removeClass('btn-outline-secondary');
            fetchAndDisplayReviews();

            $('#product-sticky-header a[href="#section3"]').trigger('click');
        });


        // qna 목록을 다시 그림
        let qnaCurrentPage = 1;
        const qnaPageSize = 5; // 한 페이지에 표시할 '질문' 개수
        // qna 목록을 그리는 함수
        function updateQnaList(qnas) {
            const container = $('#section4 .qna_list');
            container.empty();
            if (!qnas || qnas.length === 0) {
                container.append('<li><p style="text-align:center; padding: 50px;">Q&A가 없습니다.</p></li>');
                return;
            }
            const questions = qnas.filter(q => !q.qna_upper_no || q.qna_upper_no === 0);
            const replies = qnas.filter(q => q.qna_upper_no && q.qna_upper_no > 0);

            questions.forEach(qna => {
                let deleteButtonHtml = '';
                if (currentUserId && currentUserId === qna.cust_id) {
                    deleteButtonHtml = '<a href="/qna/delete?qna_no=' + qna.qna_no + '&product_id=' + productId + '" class="btn btn-sm btn-outline-danger del_right" onclick="return confirm(\'이 질문을 삭제하시겠습니까?\');">삭제</a>';
                }
                const questionerName = qna.cust_name || qna.cust_id;
                let qnaHtml = '';
                qnaHtml += '<li class="cmt_item" id="qna_' + qna.qna_no + '"><div class="cmt_wrap"><div class="cont_area">';
                qnaHtml += '<div class="cmt_head"><div class="user_info"><strong>' + questionerName + '</strong><span class="date">' + new Date(qna.qna_regdate).toLocaleString() + '</span></div>' + deleteButtonHtml + '</div>';
                qnaHtml += '<div class="cmt_cont"><p class="qna_content"><span class="qna_label qna_label_q">질문:</span> ' + qna.qna_article + '</p></div>';
                qnaHtml += '<div class="cmt_feedback"><a href="#" class="btn_reply" data-qna-no="' + qna.qna_no + '">답글</a></div>';
                qnaHtml += '</div></div></li>';
                container.append(qnaHtml);

                if (isSeller) {
                    let replyFormHtml = '';
                    replyFormHtml += '<li class="cmt_reply reply_form_wrapper" id="reply-form-' + qna.qna_no + '" style="display:none;">';
                    replyFormHtml += '<form class="qna-reply-form">';
                    replyFormHtml += '<input type="hidden" name="product_id" value="' + productId + '">';
                    replyFormHtml += '<input type="hidden" name="qna_upper_no" value="' + qna.qna_no + '">';
                    replyFormHtml += '<div class="form-group"><textarea name="qna_article" class="form-control" rows="3" placeholder="판매자로서 답변을 남겨주세요." required></textarea></div>';
                    replyFormHtml += '<div class="form-group text-right mb-0"><button type="submit" class="btn btn-primary btn-sm">답글 등록</button></div>';
                    replyFormHtml += '</form></li>';
                    container.append(replyFormHtml);
                }
                replies.filter(r => r.qna_upper_no === qna.qna_no).forEach(reply => {
                    let replyDeleteButton = '';
                    if (currentUserId && currentUserId === reply.cust_id) {
                        replyDeleteButton = '<a href="/qna/delete?qna_no=' + reply.qna_no + '&product_id=' + productId + '" class="btn btn-sm btn-outline-danger" onclick="return confirm(\'이 답변을 삭제하시겠습니까?\');">삭제</a>';
                    }
                    const replierName = reply.cust_name || reply.cust_id;
                    let replyHtml = '';
                    replyHtml += '<li class="cmt_reply" id="qna_reply_' + reply.qna_no + '"><div class="cmt_wrap"><div class="cont_area">';
                    replyHtml += '<div class="cmt_head"><div class="user_info"><strong>' + replierName + '</strong><span class="date">' + new Date(reply.qna_regdate).toLocaleString() + '</span></div>' + replyDeleteButton + '</div>';
                    replyHtml += '<div class="cmt_cont"><p class="qna_content"><span class="qna_label qna_label_a">답변:</span> ' + reply.qna_article + '</p></div>';
                    replyHtml += '</div></div></li>';
                    container.append(replyHtml);
                });
            });
        }
        // Q&A 목록을 서버에서 가져오는 함수
        function fetchAndDisplayQnas(keyword, page, size) {
            $.ajax({
                url: '/qna/search',
                type: 'GET',
                data: { product_id: productId, keyword: keyword, page: page, size: size },
                dataType: 'json',
                success: function (data) {
                    if (data && data.qnas) {
                        updateQnaList(data.qnas);
                        renderQnaPagination(data.totalCount, page, size);
                    } else {
                        if (keyword && keyword.trim() !== '') {
                            alert('"' + keyword + '"에 대한 검색 결과가 없습니다.');
                            $('#prodBlog-productOpinion-search-keyword').val('');
                            fetchAndDisplayQnas('', 1, qnaPageSize);
                        } else {
                            updateQnaList([]);
                            renderQnaPagination(0, 1, qnaPageSize);
                        }
                    }
                    $(window).trigger('scroll');
                },
                error: function () { alert("Q&A 검색 중 오류가 발생했습니다."); }
            });
        }
        // Q&A 페이지네이션 UI를 그리는 함수
        function renderQnaPagination(totalCount, currentPage, pageSize) {
            const $pagination = $('#qna-pagination');
            $pagination.empty();
            const totalPages = Math.ceil(totalCount / pageSize);
            if (totalPages <= 1) return;

            const prevDisabled = currentPage === 1 ? 'disabled' : '';
            $pagination.append('<li class="page-item ' + prevDisabled + '"><a href="#" class="page-link" data-page="' + (currentPage - 1) + '">이전</a></li>');

            const maxVisiblePages = 5;
            let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
            let endPage = startPage + maxVisiblePages - 1;
            if (endPage > totalPages) {
                endPage = totalPages;
                startPage = Math.max(1, endPage - maxVisiblePages + 1);
            }
            for (let i = startPage; i <= endPage; i++) {
                const activeClass = i === currentPage ? 'active' : '';
                $pagination.append('<li class="page-item ' + activeClass + '"><a href="#" class="page-link" data-page="' + i + '">' + i + '</a></li>');
            }
            const nextDisabled = currentPage === totalPages ? 'disabled' : '';
            $pagination.append('<li class="page-item ' + nextDisabled + '"><a href="#" class="page-link" data-page="' + (currentPage + 1) + '">다음</a></li>');
        }
        // 페이지네이션 클릭 이벤트
        $('#qna-pagination').on('click', 'a.page-link', function(e) {
            e.preventDefault(); // 새로고침 방지
            const selectedPage = parseInt($(this).data('page'));
            if (!isNaN(selectedPage) && selectedPage >= 1 && selectedPage !== qnaCurrentPage) {
                qnaCurrentPage = selectedPage;
                const keyword = $('#prodBlog-productOpinion-search-keyword').val().trim();
                fetchAndDisplayQnas(keyword, qnaCurrentPage, qnaPageSize);
                $('html, body').animate({ scrollTop: $('#section4').offset().top - 100 }, 300);
            }
        });
        // qna 검색 버튼
        $('#prodBlog-productOpinion-button-search').on('click', function () {
            qnaCurrentPage = 1;
            const keyword = $('#prodBlog-productOpinion-search-keyword').val().trim();
            fetchAndDisplayQnas(keyword, qnaCurrentPage, qnaPageSize);
        });
        // qna 초기화 버튼
        $('#prodBlog-productOpinion-button-searchReset').on('click', function(e) {
            e.preventDefault();
            $('#prodBlog-productOpinion-search-keyword').val('');
            qnaCurrentPage = 1;
            fetchAndDisplayQnas('', qnaCurrentPage, qnaPageSize);
        });
        // 최초 Q&A 목록 로드
        fetchAndDisplayQnas('', qnaCurrentPage, qnaPageSize);



        // 스티키 스크립트
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
                        location.href = '/order?id=${product.product_id}';
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

    });
</script>
<style>
    /*메인 탭 스타일*/
    #detail_tab_area {
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        margin-top: 20px;
        margin-bottom: 20px;
        padding: 5px;
    }
    #detail_tab_area .tab_list {
        display: flex;
        justify-content: space-around;
        list-style: none;
        padding: 0;
        margin: 0;
        width: 100%;
        border: none;
    }
    #detail_tab_area .tab_item {
        flex: 1;
        text-align: center;
        border-right: 1px solid #d3d9e0; /* 칸막이 효과 */
    }
    #detail_tab_area .tab_item:last-child {
        border-right: none; /* 마지막 탭 칸막이 제거 */
    }
    #detail_tab_area .tab_item a {
        display: block;
        padding: 15px 10px;
        text-decoration: none;
        color: #495057; /* 기본 글자색 */
        background-color: #87CEFA; /* 기본 배경색
        font-weight: 600; /* 모든 탭의 글자를 살짝 굵게 */
        transition: background-color 0.2s ease-in-out;
    }
    #detail_tab_area .tab_item a:hover {
        background-color: #e9ecef; /* 배경색을 살짝 변경 */
    }
    #detail_tab_area .tab_item .tab_txt {
        margin: 0;
        font-size: 16px;
    }

    /* ───────── 상품 상세정보 섹션 레이아웃 ───────── */
    .details-section-wrapper {
        max-width: 900px; /* 콘텐츠의 최대 너비를 900px로 제한 */
        margin: 0 auto;   /* 블록 요소를 수평 중앙에 배치 */
        padding: 20px 0;
    }
    /* 상세정보 테이블 스타일 */
    .product-spec-table {
        width: 100%;
        border-collapse: collapse; /* 테두리를 한 줄로 합침 */
        margin-bottom: 50px; /* 테이블과 상세이미지 사이 간격 */
        font-size: 16px;
    }
    .product-spec-table th,
    .product-spec-table td {
        border: 1px solid #e9ecef; /* 부드러운 회색 테두리 */
        padding: 15px;
        vertical-align: middle; /* 내용 수직 가운데 정렬 */
    }
    .product-spec-table th {
        background-color: #f8f9fa; /* 헤더 셀 배경색 */
        font-weight: 600;
        text-align: center; /* 헤더 텍스트 가운데 정렬 */
        width: 180px; /* 제목 칸 너비 고정 */
    }
    .product-spec-table td {
        color: #333;
    }
    /* 상세 이미지 컨테이너 스타일 */
    .detailed-images-container {
        text-align: center; /* 내부 이미지들을 가운데 정렬 */
    }
    .detailed-images-container h4 {
        margin-bottom: 25px;
        font-size: 20px;
    }
    .detailed-images-container img {
        max-width: 100%; /* 이미지가 컨테이너를 넘어가지 않도록 함 */
        height: auto;
        display: block; /* 이미지를 블록 요소로 변경 */
        margin: 0 auto 20px auto; /* 위아래 간격 및 수평 가운데 정렬 */
        border-radius: 4px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }

    /* ───────── 상품 구매 섹션 레이아웃 ───────── */
    .purchase-section-container {
        display: flex; /* Flexbox 레이아웃 적용 */
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: center; /* 수직 가운데 정렬 */
        gap: 40px; /* 이미지와 정보 사이의 간격 */
        padding: 40px 0; /* 위아래 여백 */
        max-width: 900px; /* 전체 컨테이너의 최대 너비 설정 */
        margin: 0 auto; /* 컨테이너 자체를 가운데로 */
    }
    .product-image-container {
        flex-shrink: 0; /* 이미지가 줄어들지 않도록 설정 */
    }
    .product-image-container img {
        width: 500px; /* 이미지 너비 고정 */
        height: auto;
        border-radius: 8px; /* 이미지 모서리를 살짝 둥글게 */
        border: 1px solid #eee; /* 얇은 테두리 추가 */
    }
    .product-details-container {
        display: flex;
        flex-direction: column; /* 항목을 세로로 정렬 */
        gap: 20px; /* 정보 항목들 사이의 간격 */
        text-align: left; /* 텍스트 왼쪽 정렬 */
    }
    .product-details-container .product-title {
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .product-info-item {
        font-size: 18px;
    }
    .product-info-item .label {
        font-weight: 500;
        color: #555;
        margin-right: 10px;
    }
    .product-info-item .value {
        font-weight: bold;
        font-size: 20px;
        color: #333;
    }
    .product-actions {
        display: flex;
        gap: 10px;
        margin-top: 20px;
    }

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
        margin-right: 4px;
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
        position:fixed;top:0;left:0;width:100%;height:60px;
        background:rgba(255,255,255,.95);backdrop-filter:blur(5px);
        box-shadow:0 1px 5px rgba(0,0,0,.08);z-index:1020;
        display:flex;align-items:center;justify-content:center;
        padding:10px 30px;opacity:0;visibility:hidden;
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
        <li class="tab_item item02"><a href="#section2">상세 정보</a></li>
        <li class="tab_item item03"><a href="#section3">상품 리뷰</a></li>
        <li class="tab_item item04"><a href="#section4">상품 QnA</a></li>
        <li class="tab_item item05"><a href="#section5">주의사항</a></li>
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


<%--product_info Main - tab_list--%>
<div class="detail_tab_area" id="detail_tab_area">
    <div class="inline_tab">
        <ul class="tab_list">
            <li class="tab_item item01 on" id="bookmark_item">
                <a href="#section1">
                    <h3 class="tab_txt">상품 구매</h3>
                </a>
            </li>
            <li class="tab_item item02" id="bookmark_product_information_item">
                <a href="#section2">
                    <h3 class="tab_txt">상세 정보</h3>
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
                    <h3 class="tab_txt">주의사항</h3>
                </a>
            </li>
        </ul>
    </div>
</div>

<%--상품 구매--%>
<div class="content-section" id="section1">
    <form id="product_purchase_form">
        <%-- 1. 전체를 감싸는 컨테이너 --%>
        <div class="purchase-section-container">
            <%-- 2. 왼쪽 이미지 컨테이너 --%>
            <div class="product-image-container">
                <img src="/imgs/product/${product.product_img_main}" alt="${product.product_name} 대표 이미지">
            </div>
            <%-- 3. 오른쪽 정보 및 버튼 컨테이너 --%>
            <div class="product-details-container">
                <h1 class="product-title">${product.product_name}</h1>
                <div class="product-info-item">
                    <span class="label">가격:</span>
                    <span class="value"><fmt:formatNumber type="number" pattern="###,###" value="${product.product_price}"/>원</span>
                </div>
                <div class="product-info-item">
                    <span class="label">남은 수량:</span>
                    <span class="value">${product.product_qtt}</span>
                </div>
                <%-- 서버로 전송할 숨겨진 데이터 --%>
                <input type="hidden" name="product_id" value="${product.product_id}">
                <input type="hidden" name="cart_qtt" value="1">
                <%-- 액션 버튼 그룹 --%>
                <div class="product-actions">
                    <button type="button" class="btn fav-btn" data-product-id="${product.product_id}">
                        <i class="${isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
                    </button>
                    <button type="button" class="btn btn-outline-primary cart_btn">장바구니</button>
                    <button type="button" class="btn btn-primary order_btn">즉시구매</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%--상세 정보 --%>
<div class="content-section" id="section2">
    <div class="details-section-wrapper">
        <div class="b_tit">
            <h3 class="txt">상품 상세정보</h3>
        </div>
        <div id="productDescriptionArea">
            <div class="prod_spec">
                <table class="spec_tbl product-spec-table">
                    <tbody>
                    <tr>
                        <th scope="row">판매자</th>
                        <td>${product.seller_name}</td>
                        <th scope="row">등록날짜</th>
                        <td><fmt:formatDate value="${product.product_regdate}" pattern="yyyy년 MM월 dd일"/></td>
                    </tr>
                    <tr>
                        <th scope="row">상품 분류</th>
                        <td>${product.cate_name}</td>
                        <th scope="row">상품 이름</th>
                        <td>${product.product_name}</td>
                    </tr>
                    <tr>
                        <th scope="row">가격</th>
                        <td><fmt:formatNumber type="number" pattern="###,###" value="${product.product_price}"/>원</td>
                        <th scope="row">남은 수량</th>
                        <td>${product.product_qtt}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
<%--        상세이미지--%>
        <c:if test="${not empty pitlist}">
            <div class="detailed-images-container">
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
            </div>
        </c:if>
        <caption class="cp_hide">
            <strong>실제 정보와 다를 수 있습니다</strong>
        </caption>
    </div>
</div>

<%--상품 리뷰--%>
<div class="content-section" id="section3">
    <div class="b_tit">
        <h3 class="blind">상품 리뷰</h3>
        <div class="review-header">
            <div class="flex">
                <div class="review-sort">
                    <a href="#" data-sort="rating" class="btn btn-sm btn-outline-primary active">유용한 리뷰순</a>
                    <a href="#" data-sort="latest" class="btn btn-sm btn-primary">최신순</a>
                </div>
                <div class="review-average">
                    <%-- 평균 별점과 리뷰 수는 AJAX로 함께 업데이트 가능(수정필요) --%>
                    <span id="review-count"><strong>총 ${reviewlist.size()}개 리뷰</strong></span>
                </div>
                <div class="review-search">
                    <input type="text" id="review-search-keyword" placeholder="키워드 검색">
                    <button class="prodBlog-productOpinion-button-search" id="review-search-button">검색 </button>
                    <button type="button" id="review-search-reset" class="btn btn-sm btn-outline-secondary">검색 초기화</button>                </div>
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

<%--상품 qna--%>
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
            <button type="button" id="prodBlog-productOpinion-button-searchReset" class="btn btn-sm btn-outline-secondary">검색 초기화</button>
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
                                <%-- 질문 피드백 영역--%>
                            <div class="cmt_feedback">
                                <a href="#" class="btn_reply" data-qna-no="${qna.qna_no}">답글</a>
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
<%--                                    답글 피드백--%>
                                    <div class="cmt_feedback">
                                        <a href="#" class="btn_reply" data-qna-no="${qna.qna_no}">답글</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
                <%--                판매자일 경우 답글 작성--%>
                <c:if test="${not empty cust && cust.cust_id == product.seller_id}">
                    <li class="cmt_reply reply_form_wrapper" id="reply-form-${qna.qna_no}" style="display:none;">
                            <%-- form 태그에서 action과 method 제거, class 추가 --%>
                        <form class="qna-reply-form">
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
        <ul class="pagination" id="qna-pagination">
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

<%--주의사항--%>
<div class="content-section" id="section5">
    <div class="b_tit">
        <h3 class="blind">주의사항</h3>
        <a href="#" target="_blank" class="rgt_link">
            <span class="ico">교환 및 반품은 어렵습니다.</span>
        </a>
        <ul data-v-60569746="" class="bullet"><li data-v-60569746="" style="color: rgb(102, 102, 102);">
            미성년 고객께서 상품을 주문(계약) 하시는 경우,법정대리인(부모님 등)의 동의가 없으면 미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수있습니다.
        </li><li data-v-60569746="" style="color: rgb(102, 102, 102);">안전검사 대상 공산품을 구매하시는 경우 품질경영 및 공산품 안전관리법에 따른 안전검사표시가 있는 제품인지 확인하시기 바랍니다.</li><li data-v-60569746="" style="color: rgb(102, 102, 102);">정보,전기통신기기를 구매하시는 경우 관련법률에 따라 인증 또는 승인을 받은 상품인지 확인하시기 바랍니다.</li><li data-v-60569746="" style="color: rgb(102, 102, 102);">
            해당 사이트의 결제시스템을 이용하지 않고 판매자와 직접거래 하실 경우 상품을 받지 못하거나, 구매한 상품과 상이한 상품을 받는 등 피해가 발생 할 수 있으니 유의하시기 바랍니다.
        </li></ul>
    </div>
</div>