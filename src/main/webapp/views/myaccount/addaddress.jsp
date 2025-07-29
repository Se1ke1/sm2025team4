<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let custinfo_add = {
    init:function(){
      $('#add_address_btn').click(()=>{
        if(c == true){
          $('#custinfo_add').attr('method', 'post');
          $('#custinfo_add').attr('action', '/add');
          $('#custinfo_add').submit();
        }
      });
    }
  }
  $().ready(()=>{
    custinfo_add.init();
  });
</script>

<!-- Add address -->
<div class="col-9">
  <section class="shop login section">
    <%-- mypage --%>
    <div class="col-12">
      <div class="login-form">
        <h2 style="right: 50px">주소 정보 추가</h2>
        <!-- Form -->
        <form class="form" method="post" id="custinfo_add" action="add">
          <div class="row">
            <div class="col-11">
              <input type="hidden" name="cust_id" value="${c.cust_id}">
              <div class="form-group">
                <label for="name">받는 사람</label>
                <input type="text" name="custinfo_name" placeholder="받는 사람" required="required">
              </div>
              <div class="form-group">
                <label for="addr">배송지</label>
                <input type="text" name="custinfo_addr" placeholder="배송지" required="required">
              </div>
              <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" name="custinfo_phone" placeholder="전화번호" required="required">
              </div>
            </div>
            <div class="col-11">
              <div class="form-group login-btn">
                <button class="btn btn-primary" type="submit" id="add_address_btn">추가</button>
              </div>
            </div>
          </div>
        </form>
        <!--/ End Form -->
      </div>
    </div>
  </section>
</div>
<!--/ Add address -->