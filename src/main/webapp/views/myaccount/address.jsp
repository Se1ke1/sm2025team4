<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let custinfo_del = {
    init:function(){},
    del:function(custinfo_no) {
      let c = confirm('삭제하시겠습니까?');
      if(c == true) {
        location.href = '/delete?custinfo_no=' + custinfo_no;
      }
    }
  }
  $().ready(() => {
    custinfo_del.init();
  });
</script>

<!-- Shop Account -->
<div class="col-9">
  <section class="shop login section">
    <%-- mypage --%>
    <div class="col-11">
      <div class="login-form">
        <h2>주소록 관리</h2>
        <!-- Form -->
        <form class="form" method="post" id="cust_update">
            <div class="col-12">
              <c:forEach var="ci" items="${ci}">
                <li class="list-group-item" style="margin-bottom: 15px">
                <div class="form-group">
                  <label style="font-size: large; line-height: 15px; margin-top: 10px"  for="name${ci.custinfo_name}">
                    <b>
                        ${ci.custinfo_name}
                    </b>
                  </label>
                </div>
                <div class="form-group">
                  <label style="line-height: 10px" for="addr${ci.custinfo_addr}">${ci.custinfo_addr}</label>
                </div>
                <div class="form-group">
                  <label style="line-height: 10px" for="phone${ci.custinfo_no}">${ci.custinfo_phone}</label>
                </div>
                <div class="form-group login-btn d-flex justify-content-between">
                  <button class="btn btn-primary" type="button" onclick="custinfo_update.mod(${ci.custinfo_no})">수정</button>
                  <button class="btn btn-danger delete-btn" style="background-color: red;" type="button" onclick="custinfo_del.del(${ci.custinfo_no})">삭제</button>
                </div>
              </li>
              </c:forEach>
              <button class="btn btn-primary btn-block" type="button" id="add_btn" onclick="location.href='/addaddress'">배송지 추가</button>
            </div>
        </form>
        <!--/ End Form -->
      </div>
    </div>
  </section>
</div>
<!--/ End Account -->