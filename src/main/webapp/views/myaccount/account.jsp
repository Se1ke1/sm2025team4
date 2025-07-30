<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let cust_update = {
    init:function(){
      $('#update_btn').click(()=>{
        if(confirm('수정을 하시겠습니까?')){
          $('#cust_update')
                  .attr('method', 'post')
                  .attr('action', '/update')
                  .submit();
        }
      });
    }
  }
  $().ready(()=>{
    cust_update.init();
  });
</script>

  <!-- Shop Account -->
<div class="col-9">
  <section class="shop login section">
    <div class="container">
      <div class="row">
        <%-- mypage --%>
        <div class="col-9">
          <div class="login-form">
            <h2>회원 정보 수정</h2>
            <!-- Form -->
            <form class="form" method="post" id="cust_update">
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label>Id:</label>
                    <li class="list-group-item">${c.cust_id}</li>
                    <input type="hidden" name="cust_id" value="${c.cust_id}">
                  </div>
                  <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="cust_pwd" value="${c.cust_pwd}" placeholder="New password">
                  </div>
                  <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" value="${c.cust_name}" id="name" name="cust_name">
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-group login-btn">
                    <button class="btn btn-primary" type="submit" id="update_btn">수정</button>
                  </div>
                </div>
              </div>
            </form>
            <!--/ End Form -->
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<!--/ End Account -->