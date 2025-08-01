<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let custinfo_del = {
    init: function () {},
    del: function (custinfo_no) {
      if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
          url:'/account/address/delete',
          method:'post',
          dataType: 'json',
          data: {custinfo_no:custinfo_no},
          success:function (response){
            if (response) {
              alert('삭제되었습니다.');
              location.reload();
            }
          }
        });
      }
    }
  };
  let custinfo_update = {
    init: function () {},
    update: function (custinfo_no) {
      if (confirm('수정하시겠습니까?')) {

        const custinfo_name = $('#name_' + custinfo_no).val();
        const custinfo_addr = $('#addr_' + custinfo_no).val();
        const custinfo_phone = $('#phone_' + custinfo_no).val();

        $.ajax({
          url:'/account/address/update',
          method: 'post',
          dataType: 'json',
          data: {
            custinfo_no: custinfo_no,
            custinfo_name: custinfo_name,
            custinfo_addr: custinfo_addr,
            custinfo_phone: custinfo_phone
          },
          success:function (response){
            if (response) {
              alert('수정되었습니다');
              location.reload();
            }
          }
        });
      }
    }
  };
  $(document).ready(()=>{
    custinfo_del.init();
    custinfo_update.init();
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
        <form class="form">
          <div class="col-12">
            <c:forEach var="ci" items="${ci}">
              <div class="list-group-item" style="margin-bottom: 15px">
                <div class="form-group">
                  <input type="text" name="custinfo_name" id="name_${ci.custinfo_no}" value="${ci.custinfo_name}">
                </div>
                <div class="form-group">
                  <input type="text" name="custinfo_addr" id="addr_${ci.custinfo_no}" value="${ci.custinfo_addr}">
                </div>
                <div class="form-group">
                  <input type="text" name="custinfo_phone" id="phone_${ci.custinfo_no}" value="${ci.custinfo_phone}">
                </div>
                <div class="form-group login-btn d-flex justify-content-between">
                  <button class="btn btn-primary" type="button" onclick="custinfo_update.update(${ci.custinfo_no})">수정</button>
                  <button class="btn btn-danger delete-btn" style="background-color: red;" type="button" onclick="custinfo_del.del(${ci.custinfo_no})">삭제</button>
                </div>
              </div>
            </c:forEach>
            <button class="btn btn-primary btn-block" type="button" id="add_btn" onclick="location.href='/account/address/add-form'">배송지 추가</button>
          </div>
        </form>
        <!--/ End Form -->
      </div>
    </div>
  </section>
</div>
<!--/ End Account -->