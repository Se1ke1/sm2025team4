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
    <title>product detail Title</title>
</head>
<body>
<h1>Main</h1>
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
                    <strong class="num_c" id="priceCompareTabCount">70</strong>
                </a>
            </li>
            <li class="tab_item item02" id="bookmark_product_information_item">
                <a href="#bookmark_product_information">
                    <h3 class="tab_txt">상품 상세정보</h3>
                </a>
            </li>
            <li class="tab_item item03" id="bookmark_cm_opinion_item">
                <a href="#bookmark_3">
                    <h3 class="tab_txt">세번째 탭</h3>
                    <strong class="num_c" id="productOpinionTabCount">465</strong>
                </a>
            </li>
            <li class="tab_item item04" id="bookmark_news_expert_item">
                <a href="#bookmark_4">
                    <h3 class="tab_txt">네번째 탭</h3>
                    <strong class="num_c" id="newsCommunityCount">68</strong>
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
        <h3 class="blind">세번째 탭</h3>
        <a href="#" target="_blank" class="rgt_link">
            33333333333333333<span class="ico"></span>
        </a>
    </div>
</div>

<div class="price_compare " id="priceCompareArea">
    <div id="bookmark_4" style="height: 35px; margin-top: -35px;"></div>
    <div class="b_tit">
        <h3 class="blind">네번째 탭</h3>
        <a href="#" target="_blank" class="rgt_link">
            4444444444444444<span class="ico"></span>
        </a>
    </div>
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
