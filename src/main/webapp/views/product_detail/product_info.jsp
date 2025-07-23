<%--
  Created by IntelliJ IDEA.
  User: 건
  Date: 2025-07-17
  Time: 오후 5:49:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
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
<body>
<h1>product_info Main</h1>
<h2>상품 요약?</h2>
<div class="detail_tab_area" id="detail_tab_area">
    <div class="prod_fixbar">
        <div class="inner">
            상품의 설명
        </div>
    </div>
    <div class="detail_tab">
        <ul class="tab_list">
            <li class="tab_item item01 on" id="bookmark_price_compare_item">
                <a href="#bookmark_price_compare">
                    <h3 class="tab_txt">첫번째 탭으로</h3>
                </a>
            </li>
            <li class="tab_item item02" id="bookmark_product_information_item">
                <a href="#bookmark_product_information">
                    <h3 class="tab_txt">상품 상세정보</h3>
                </a>
            </li>
            <li class="tab_item item03" id="bookmark_cm_opinion_item">
                <a href="#bookmark_3">
                    <h3 class="tab_txt">상품 리뷰</h3>
                </a>
            </li>
            <li class="tab_item item04" id="bookmark_news_expert_item">
                <a href="#bookmark_4">
                    <h3 class="tab_txt">상품 QnA</h3>
                </a>
            </li>
            <li class="tab_item item05" id="bookmark_relation_product_item">
                <a href="#bookmark_5">
                    <h3 class="tab_txt">다섯번째</h3>
                </a>
            </li>
        </ul>
    </div>
</div>

<%--첫번째 탭--%>
<div class="price_compare " id="priceCompareArea">
    <div id="bookmark_price_compare" style="height: 35px; margin-top: -35px;"></div>
    <div class="b_tit">
        <h3 class="blind">첫번째 탭</h3>
        <a href="#" target="_blank" class="rgt_link">
            11111111111111111111111111111111111<span class="ico"></span>
        </a>
    </div>
</div>

<%--상세 정보 클릭 --%>
<div class="detail_info ">
    <div class="b_tit">
        <h3 class="txt">상품 상세정보</h3>
    </div>
    <div id="bookmark_product_information" style="height: 100px; margin-top: -100px;"></div>
    <div id="productDescriptionArea"><input type="hidden" id="isChangedProductYN" value="N">
        <div class="detail_cont">
            <div class="prod_spec">
                <table class="spec_tbl">
                    <caption class="cp_hide">
                        <strong>상품 상세 스펙</strong>
                        <p>상품 상세 정보 제공</p>
                    </caption>
                    <colgroup>
                        <col class="tit">
                        <col class="dsc">
                        <col class="tit">
                        <col class="dsc">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="tit">제조회사</th>
                        <td class="dsc">ㅁㄴㅇ회사</td>
                        <th scope="row" class="tit">등록년월</th>
                        <td class="dsc">2025년 02월 </td>
                    </tr>
                    <tr>
                        <th scope="row" class="tit"><a onclick="$.termDicViewLink(23939,'view',this,3,'infoBottom');">제품 분류</a></th>
                        <td class="dsc"><a onclick="$.termDicViewLink(22959,'view',this,3,'infoBottom');">노트북</a></td>
                        <th scope="row" class="tit"><a onclick="$.termDicViewLink(1476,'view',this,3,'infoBottom');">화면 크기</a></th>
                        <td class="dsc"><a onclick="$.termDicViewLink(1476,'view',this,3,'infoBottom');">43.9cm(17.3인치)</a></td>
                    </tr>												<tr>
                        <th scope="row" class="tit"><a onclick="$.termDicViewLink(1478,'view',this,3,'infoBottom');">무게</a></th>
                        <td class="dsc"><a onclick="$.termDicViewLink(1478,'view',this,3,'infoBottom');">2kg</a></td>
                        <th scope="row" class="tit"><a onclick="$.termDicViewLink(313,'view',this,3,'infoBottom');">운영체제(OS)</a></th>
                        <td class="dsc"><a onclick="$.termDicViewLink(324,'view',this,3,'infoBottom');">OS미포함</a></td>
                    </tbody>
                </table>
            </div>

            <div class="mid_banner">사진 넣어서 보여줄수 있음
            </div>
        </div>
    </div>
</div>

<div class="price_compare " id="priceCompareArea">
    <div id="bookmark_3" style="height: 35px; margin-top: -35px;"></div>
    <div class="b_tit">
        <h3 class="blind">상품 리뷰</h3>
        <a href="#" target="_blank" class="rgt_link">
            33333333333333333<span class="ico"></span>
        </a>
        <div class="review-header">
            <div class="review-sort">
                <a href="#" class="btn btn-sm btn-outline-primary active">유용한 리뷰순</a>
                <a href="#" class="btn btn-sm btn-outline-primary">최신순</a>
            </div>
            <div class="review-average">
                <span class="star_mask" style="width:98%"></span>
                <strong>4.9점 (40명)</strong>
            </div>
            <div class="review-search">
                <input type="text" class="form-control" placeholder="키워드 검색">
                <button class="btn btn-sm btn-secondary">검색</button>
            </div>

            <ul class="review-list">
                <li class="review-item">
                    <div class="top_info">
                        <span class="star_mask" style="width:100%"></span> 5점 | 2025.02.19. | un****
                    </div>
                    <p><strong>만족 그 잡채~~!!</strong></p>
                    <p>새해 특가로 구입한 msi노트북 가격 대비 성능이 정말 뛰어나요.</p>
                    <img src="//bampic.gmarket.co.kr/v1/230/062/2793062230/00076/2793062230425084607600.jpg" alt="리뷰 이미지" width="100">
                </li>
                <li class="review-item">
                    <div class="top_info">
                        <span class="star_mask" style="width:100%"></span> 5점 | 2024.11.06. | mo****
                    </div>
                    <p><strong>MSI 게이밍 노트북</strong></p>
                    <p>토요일 주문 화요일 배송 완료입니다.</p>
                    <img src="//bampic.gmarket.co.kr/v1/230/062/2793062230/00503/2793062230421847250301.jpg" alt="리뷰 이미지" width="100">
                </li>
                <li class="review-item">
                    <div class="top_info">
                        <span class="star_mask" style="width:100%"></span> 4점 | 2025.03.12. | hi****
                    </div>
                    <p><strong>좋아요</strong></p>
                    <p>고등학생 아들은 자판이 화려하니 좋아하네요</p>
                </li>
                <li class="review-item">
                    <div class="top_info">
                        <span class="star_mask" style="width:100%"></span> 5점 | 2024.12.30. | xz****
                    </div>
                    <p><strong>최고예요</strong></p>
                    <p>집에 노트북이 오래되니 속도가 느려지고</p>
                </li>
                <li class="review-item">
                    <div class="top_info">
                        <span class="star_mask" style="width:100%"></span> 5점 | 2025.01.23. | ch****
                    </div>
                    <p><strong>정말 오랜만에 pc를 구입하네요</strong></p>
                    <p>집에 pc 없이 지낸지 거의 5년째인데</p>
                    <img src="//bampic.gmarket.co.kr/v1/230/062/2793062230/00649/2793062230425510664900.jpg" alt="리뷰 이미지" width="100">
                </li>
            </ul>

            <nav aria-label="Page navigation" class="text-center mt-3">
                <ul class="pagination justify-content-center">
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
</div>

<div class="price_compare " id="priceCompareArea">
    <div id="bookmark_4" style="height: 35px; margin-top: -35px;"></div>
    <div class="b_tit">
        <h3 class="blind">상품 QnA</h3>
        <a href="#" target="_blank" class="rgt_link">
            4444444444444444<span class="ico"></span>
        </a>
        <li class="cmt_item" id="prodBlog-productOpinion-list-self-1234567">
            <div class="search_form">
                <div class="srch_inpt_w">
                    <input type="text" class="srch_input" title="상품의견 검색" placeholder="상품의견 검색" id="prodBlog-productOpinion-search-keyword" value="">
                </div>
                <button type="button" class="btn_srch" id="prodBlog-productOpinion-button-search">
                    <span class="ico">검색</span>
                </button>
            </div>
            <div class="search_reset">
                <a id="prodBlog-productOpinion-button-searchReset" href="#" class="btn_reset"><span class="ico">검색 초기화</span></a>
            </div>
            <div class="cmt_wrap">
                <div class="cont_area">
                    <!-- cmt_head -->
                    <div class="cmt_head clr">
                        <div class="oh_left">
                            <div class="user_info">
                              <a href="#" onclick="return false;" class="id_name prodBlog-memberInfo-clazz" data-uid="555555">
                                  <strong id="prodBlog-productOpinion-nickname-1234567">dlakftnr</strong>
                              </a>
                            </div>
                            <span class="date">2025.07.07. 01:15:52</span>
                        </div>
                    </div>
                    <!--// cmt_head -->
                    <!-- cmt_cont -->
                    <div class="cmt_cont " id="prodBlog-productOpinion-list-wrap-1234567">
                        <p class="prodBlog-productOpinion-clazz-content" data-seq="N">
                            <span class="lb_qs head_text_name">질문: </span>문제 없나요?																								<input id="prodBlog-productOpinion-content-text-1234567" type="hidden" value="이 정도 제품이면 와우 25인 레이드도 문제 없나요?">
                        </p>
                    </div>
                    <!--// cmt_cont -->
                    <!-- cmt_feedback -->
                    <div class="cmt_feedback" id="prodBlog-productOpinion-list-feedback-1234567">
                        <a href="#" onclick="return false;" class="btn_reply" id="prodBlog-productOpinion-button-subComment-1234567">답글</a>												<div class="like_box"><button type="button" class="btn_like" id="prodBlog-productOpinion-button-recommend-1234567" data-recommend-type="0"><span class="ico i_like">추천</span><span class="num_c recommend_count"></span></button><button type="button" class="btn_dislike" id="prodBlog-productOpinion-button-decommend-1234567" data-recommend-type="1"><span class="ico i_dislike">비추천</span><span class="num_c recommend_count"></span></button></div>												<input id="prodBlog-productOpinion-list-headSeq-1234567" type="hidden" value="33">
                        <input id="prodBlog-productOpinion-list-depth-1234567" type="hidden" value="1">
                    </div>
                    <!--// cmt_feedback -->
                    <div id="prodBlog-productOpinion-editCommentInput-wrap-1234567"> </div>
                </div>
            </div>
        </li>
    </div>
</div>
<li class="cmt_reply cmt_official" id="prodBlog-productOpinion-list-self-12">
    <div class="cmt_wrap">
        <span class="ico reply">대댓글</span>
        <div class="cont_area">
            <!-- cmt_head -->
            <div class="cmt_head clr">
                <div class="oh_left">
                    <div class="user_info">
                        <span class="txt_ofc">브랜드 공식계정</span>
                        <a href="#" onclick="return false;" class="id_name prodBlog-memberInfo-clazz" data-uid="111111">
                            <strong id="prodBlog-productOpinion-nickname-12">관리자</strong>
                        </a>
                    </div>
                    <span class="date">2025.07.07. 10:34:55</span>
                </div>
                <div class="oh_right">
                    <!-- 수정/삭제/신고 레이어 활성화시 layer_show 클래스 추가 -->
                    <div class="edit_opt">
                        <button class="edit_opt_btn" id="prodBlog-productOpinion-button-side-12">댓글 추가 기능</button>
                    </div>
                </div>
                <!--// cmt_head -->
                <!-- cmt_cont -->
                <div class="cmt_cont " id="prodBlog-productOpinion-list-wrap-12">
                    <p class="prodBlog-productOpinion-clazz-content" data-seq="N">답변:
                        안녕하십니까 고객님<br>
                        어렵습니다<br>
                        감사합니다
                        <input id="prodBlog-productOpinion-content-text-12" type="hidden" value="안녕하십니까 고객님 어렵습니다 감사합니다">
                    </p>
                </div>
                <!--// cmt_cont -->
                <!-- cmt_feedback -->
                <div class="cmt_feedback" id="prodBlog-productOpinion-list-feedback-12">
                    <div class="like_box">
                        <button type="button" class="btn_like" id="prodBlog-productOpinion-button-recommend-12" data-recommend-type="0">
                            <span class="ico i_like">추천</span><span class="num_c recommend_count"></span>
                        </button>
                        <button type="button" class="btn_dislike" id="prodBlog-productOpinion-button-decommend-12" data-recommend-type="1">
                            <span class="ico i_dislike">비추천</span><span class="num_c recommend_count"></span>
                        </button>
                    </div>
                    <input id="prodBlog-productOpinion-list-headSeq-12" type="hidden" value="33">
                    <input id="prodBlog-productOpinion-list-depth-12" type="hidden" value="2">
                </div>
                <!--// cmt_feedback -->
                <div id="prodBlog-productOpinion-editCommentInput-wrap-12"> </div>
            </div>
        </div>
    </div>
</li>
<div class="page_nav_area">
    <span class="nav_edge nav_edge_prev nav_edge_off">
        <span class="point_arw_l"><em class="txt_hide">이전 보기</em>
        </span>
    </span>
    <div class="nums_area"><span class="page_num now_page">1</span>
        <a href="#" onclick="return false;" class="page_num" id="pagination-button-page-687f38b795c13" data-pagenumber="2">2</a>
        <a href="#" onclick="return false;" class="page_num" id="pagination-button-page-687f38b795c15" data-pagenumber="3">3</a>
        <a href="#" onclick="return false;" class="page_num" id="pagination-button-page-687f38b795c16" data-pagenumber="4">4</a>
        <a href="#" onclick="return false;" class="page_num" id="pagination-button-page-687f38b795c17" data-pagenumber="5">5</a>
    </div>
    <span class="nav_edge nav_edge_next nav_edge_off">
        <span class="point_arw_r"><em class="txt_hide">다음 보기</em>
        </span>
    </span>
</div>

<div class="price_compare " id="priceCompareArea">
    <div id="bookmark_5" style="height: 35px; margin-top: -35px;"></div>
    <div class="b_tit">
        <h3 class="blind">다섯번째 탭</h3>
        <a href="#" target="_blank" class="rgt_link">
            5<span class="ico"></span>
        </a>
    </div>
</div>

</body>
</html>
