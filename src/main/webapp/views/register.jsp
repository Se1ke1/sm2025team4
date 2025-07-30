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
    init:async function(){
      $('#btn_register').click(async ()=>{
        // input 무결성 검증 후 재차 계정 중복 검증
        if (await register.validations()&&await register.idValidation()){
          // 검증을 통과한 경우 그대로 푸시
          register.pushIt();
        }

      });
      // 입력 시마다 입력 검증 시도
      $('#name,#email,#password,#password_confirm').on('input',()=>{
        register.validations();
      });
    },
    validations:async function () {
      console.log('validations');
      let result = true;
      let id = $('#email').val();
      let response = await register.ajaxValidation();
      if (!id){
        $('#id_classifier').removeClass('green_text').addClass('red_text').text('아이디는 필수 입력 항목입니다')
        result = false;
      }
      else {
        if (response) {
          $('#id_classifier').removeClass('red_text').addClass('green_text').text('사용 가능한 아이디입니다')
        }
        else {
          $('#id_classifier').removeClass('green_text').addClass('red_text').text('사용할 수 없는 아이디입니다')
        }
      }
      let name=$('#name').val();
      if (!name){
        $('#name_classifier').removeClass('green_text').addClass('red_text').text('이름은 필수 입력 항목입니다')
        result = false;
      }
      else {
        $('#name_classifier').removeClass('red_text').addClass('green_text').text('')
      }
      let password=$('#password').val();
      let password_confirm=$('#password_confirm').val();
      if (!password){
        $('#pwd_classifier').removeClass('green_text').addClass('red_text').text('비밀번호는 필수 입력 항목입니다')
        result = false;
      }
      else {
        $('#pwd_classifier').removeClass('red_text').addClass('green_text').text('')
        if (password!==password_confirm) {
          $('#pwdconfirm_classifier').removeClass('green_text').addClass('red_text').text('입력된 비밀번호와 다릅니다')
          result = false;
        }
        else {
          $('#pwdconfirm_classifier').removeClass('red_text').addClass('green_text').text('')
        }
      }
      return result;
    },
    idValidation: async function(){
      let id = $('#email').val();
      try {
        return await $.ajax({
          url:'/api/registerValidate',
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
  document.addEventListener("DOMContentLoaded", function(){
    register.init();
  });
</script>
<style>
  .green_text {
    color: green;
  }
  .red_text {
    color: red;
  }
</style>
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
                  <input type="text" id="name" name="cust_name" placeholder="이름을 입력하세요" required="required">
                  <span id="name_classifier" class="text-center"></span>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>ID<span>*</span></label>
                  <input type="text" id="email" name="cust_id" placeholder="아이디를 입력하세요" required="required">
                  <span id="id_classifier" class="text-center"></span>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>비밀번호<span>*</span></label>
                  <input type="password" id="password" name="cust_pwd" placeholder="비밀번호를 입력하세요" required="required">
                  <span id="pwd_classifier" class="text-center"></span>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>비밀번호 확인<span>*</span></label>
                  <input type="password" id="password_confirm" placeholder="비밀번호를 다시 입력하세요" required="required">
                  <span id="pwdconfirm_classifier" class="text-center"></span>
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