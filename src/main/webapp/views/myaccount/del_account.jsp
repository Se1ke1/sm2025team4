<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  $().ready(()=>{
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
        <form class="form" method="post" id="cust_delete" action="delete_account">
          <div class="form-group">
            <label>비밀번호 확인</label> <br>
            <input type="password" id="password" name="password">
          </div>
          <div>
            <c:if test="${not empty error}">
              <p style="color: red">
                  ${error}
              </p>
            </c:if>
          </div>
          <div>
            <button class="btn btn-primary" type="submit" style="background-color: red; min-height: 30px">계정 삭제</button>
          </div>
        </form>
        <!--/ End Form -->
      </div>
    </div>
  </section>
</div>
<!--/ End Del Account -->