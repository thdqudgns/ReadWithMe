<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function checkLoginStatus(){
      if(gauth.isSignedIn.get()){
        console.log('logined');
        var profile = gauth.currentUser.get().getBasicProfile();
        
        var name = profile.getName();
        var id = profile.getId();
        var Email = profile.getEmail();
        
        console.log(name);
        console.log(id);
        console.log(Email);
        
        location.href="/login/google?id="+id+"&name="+name+"&email="+Email;


      } else {
        console.log('logouted');
      }
    };
    
    
    function init(){
      console.log('init');
      gapi.load('auth2', function() {
        console.log('auth2');
        window.gauth = gapi.auth2.init({
          client_id:'589171260139-fvnvmdpt9mk2afsdk48bghb9vpcj4e8o.apps.googleusercontent.com'
        })
        gauth.then(function(){
          console.log('googleAuth success');
          checkLoginStatus();
        }, function(){
          console.log('googleAuth fail');
        });
      });
    }


</script>

<link href="/resources/css/login.css" rel="stylesheet">
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<section>
<h1>구글 확인중</h1>
구글 정보를 확인중입니다!<br>
완료되면 자동으로 페이지가 이동합니다.
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
