
function cambiar_login() {
  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
document.querySelector('.cont_form_login').style.display = "block";
document.querySelector('.cont_form_sign_up').style.opacity = "0";

setTimeout(function(){  document.querySelector('.cont_form_login').style.opacity = "1"; },400);

setTimeout(function(){
document.querySelector('.cont_form_sign_up').style.display = "none";
},200);
    let user = $('.user').val();
    let pwd = $('.pwd').val();
    if (  user != "" && pwd != "")
        $.ajax({
          url: 'http://127.0.0.1:8000/login/',
          type: "POST",
          data: {
            user: user,
            pwd: pwd,
          },
          success: function (resp) {
            console.log(resp)
            if (resp.result === 'success') {
              alert('登录成功')
              window.location = "http://127.0.0.1:8000/bbs/";
              // console.log("success")
            }else
              alert(resp.result)
          }
        })
  console.log(user)
  console.log(pwd)

}

function cambiar_sign_up(at) {
  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
  document.querySelector('.cont_form_sign_up').style.display = "block";
document.querySelector('.cont_form_login').style.opacity = "0";
  
setTimeout(function(){  document.querySelector('.cont_form_sign_up').style.opacity = "1";
},100);  

setTimeout(function(){   document.querySelector('.cont_form_login').style.display = "none";
},400);  

let user = $('.register_user').val();
let pwd = $('.register_pwd').val();
let re_pwd = $('.confirm_pwd').val();
let email = $('.register_email').val();
  // console.log("user:" + user)
  // console.log("pwd:" + pwd)
  // console.log("confirm_pwd:" + re_pwd)
  // console.log("email:" + email)
    if (  user != "" && pwd != "" && re_pwd != "" && email != "")
        $.ajax({
          url: 'http://127.0.0.1:8000/register/',
          type: "POST",
          data: {
            user: user,
            pwd: pwd,
            re_pwd: re_pwd,
            email: email
          },
          success: function (resp) {
            // console.log(resp)
            if (resp.user) {
              alert('注册成功！')
              cambiar_login()
              ocultar_login_sign_up()

            }

            else if (resp.msg.user != null)
              alert(resp.msg.user)
            else if (resp.msg.__all__ != null)
              alert(resp.msg.__all__)
          }
        })

}    



function ocultar_login_sign_up() {

document.querySelector('.cont_forms').className = "cont_forms";  
document.querySelector('.cont_form_sign_up').style.opacity = "0";               
document.querySelector('.cont_form_login').style.opacity = "0"; 

setTimeout(function(){
document.querySelector('.cont_form_sign_up').style.display = "none";
document.querySelector('.cont_form_login').style.display = "none";
},500);  
  
  }