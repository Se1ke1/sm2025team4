<%--
  Created by IntelliJ IDEA.
  User: thstp
  Date: 2025-07-17
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let register={
    init:function(){
      $('#btn_register').click(async ()=>{
        if (this.validations()){
          if(await this.ajaxValidation()) {
            this.pushIt();
          }
        }
      //   검증을 통과한 경우 그대로 푸시
      });
      $('#name,#email,#password,#password_confirm').on('input',()=>{
        this.validations();
      });
    },
    validations:function () {
      let id = $('#email').val();
      if (!id){
        // TODO: 출력하기("아이디는 필수 입력 항목입니다.")
        return false;
      }
      let name=$('#name').val();
      if (!name){
        //TODO: 출력하기("이름은 필수 입력 항목입니다.")
        return false;
      }
      let password=$('#password').val();
      let password_confirm=$('#password_confirm').val();
      if (!password){
      //   TODO: 출력하기("비밀번호는 필수 입력 항목입니다.")
        return false;
      }
      else {
        if (password!==password_confirm) {
        //   TODO: 출력하기("입력된 비밀번호와 다릅니다.")
          return false;
        }
      }
      return true;
    },
    ajaxValidation: async function(){
      // TODO: 출력하기("이미 사용 중인 아이디입니다.")
      let id = $('#email').val();
      try {
        return await $.ajax({
          url:'/registerValidate',
          data:{id:id},
          dataType: 'json'
        })
      }
      catch (error){
        console.log(error)
        return false;
      }
    },
    pushIt:function(){
      $('#register_form')
              .attr('action','/registerimpl')
              .attr('method','post').submit();
    }
  }
  $().ready(()=>{
    register.init();
  })
</script>
<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active">Register</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Login -->
<section class="shop login section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3 col-12">
        <div id="register_form" class="login-form">
          <h2>회원가입</h2>
          <p>회원가입을 진행해주세요</p>
          <!-- Form -->
          <form id="register_form" class="form">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label>이름<span>*</span></label>
                  <input type="text" id="name" name="cust_name" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>ID<span>*</span></label>
                  <input type="text" id="email" name="cust_id" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>비밀번호<span>*</span></label>
                  <input type="password" id="password" name="cust_pwd" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>비밀번호 확인<span>*</span></label>
                  <input type="password" id="password_confirm" placeholder="" required="required">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group login-btn">
                  <button class="btn" type="button" id="btn_register">회원가입</button>
                  <a class="btn" type="button" href="/login">로그인 화면으로</a>
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
<!--/ End Login -->