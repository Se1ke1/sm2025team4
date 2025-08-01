<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let cust_del = {
    del:function() {
      let c = confirm('정말 삭제하시겠습니까?');
      if(c == true) {
        $('#cust_delete')
                .attr('method', 'post')
                .attr('action', '/account/delete')
                .submit();
      }
    }
  }
  $(document).ready(()=>{
    setTimeout(function (){
      const errorlimit = document.getElementById('error');
      if (errorlimit) {
        errorlimit.style.display = 'none';
      }
    }, 5000);
  });
</script>

<!-- Del Account -->
<div class="col-9">
  <section class="shop login section">
    <%-- mypage --%>
    <div class="col-11">
      <div class="login-form">
        <h2>계정 삭제</h2>
        <!-- Form -->
        <form class="form" method="post" id="cust_delete" action="/account/delete">
          <div class="form-group">
            <label>비밀번호 확인</label> <br>
            <input type="password" id="password" name="password" required>
          </div>
          <div>
            <c:if test="${not empty error}">
              <p style="color: red">
                  ${error}
              </p>
            </c:if>
          </div>
          <div style="text-align: right">
            <button class="btn btn-primary" type="submit" style="background-color: red; min-height: 30px;" onclick="cust_del.del()">계정 삭제</button>
          </div>
        </form>
        <!--/ End Form -->
      </div>
    </div>
  </section>
</div>
<!--/ End Del Account -->