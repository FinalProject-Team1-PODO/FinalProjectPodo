<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/login.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

    <title>login</title>
</head>


        <jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
    <main>

		<div id="login-contaioner">
			<h3>로그인</h3>
			<form action="login" method="POST" name="login-form" id="login-form" onsubmit="return loginValidate()">
				<fieldset id="login-area">

                    <section>
                        <input type="text" id="ID-box" name="memberId" maxlength="20" placeholder="아이디를 입력해주세요.">
                        <input type="password" id="PW-box" name="memberPw" placeholder="비밀번호를 입력해주세요.">
                    </section>

                    <section>
                        <button id="loginBtn" class="loginBtn">로그인</button>
                    </section>

                </fieldset>



                <div class="under-login">
                    <label>   
                        <input type="checkbox" name="saveId"  id="saveId"> 아이디 저장
                    </label>
                        <a href="${contextPath}/member/findId">아이디 찾기  |</a>  
                        <a href="${contextPath}/member/findPw">비밀번호 찾기</a>
                </div>

            </form>

            <section id="outside-login">

            <a href="javascript:kakaoLogin();"><img src="${contextPath}/resources/images/카카오로그인1.png" style="height:40px; width:85px;"></a> 
            <%-- <a href="javascript:kakaoLogin();"><img src="data:image/png;base64,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" 
            style="height:40px; width:120px;"></a>  --%>
            <!-- 네이버 로그인 버튼 노출 영역 -->
            <div id="naver_id_login"></div>
            <span><button onclick = "location.href = '${contextPath}/member/signUp'" style="height:38px;">회원가입</button></span>
            </section>
        </div>

    </main>


	<script type="text/javascript">
		var naver_id_login = new naver_id_login("7CM27UMDND6X1zZ8Ekqr","http://kh-classa.xyz:10000/podo/member/loginNaver/");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://kh-classa.xyz:10000/podo/member/login");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

    <script>
        window.Kakao.init("da5af6c7ff0ee360eff5f27697b239d3");

        function kakaoLogin(){
            window.Kakao.Auth.login({
                scope : 'profile_nickname, account_email, gender',
                success: function(authObj){
                    console.log(authObj);
                    window.Kakao.API.request({
                        url: '/v2/user/me',
                        success: res =>{

                            // console.log(res.kakao_account);
                            location.href='selectKakao?email='+res.kakao_account.email
        
                        }
                    });
                }
            });
        }


        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                alert('Not logged in.');
                 return;
            }

            // Kakao.Auth.logout(function() {
            //    alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
            // })

            // Kakao.API.request({
            //     url: '/v1/user/unlink',
            //     success: function(response) {
            //         console.log(response);
            //     },
            //     fail: function(error) {
            //         console.log(error);
            //     },
            // });     

            Kakao.API.request({
                url: '/v2/user/revoke/scopes',
                data: {
                    scopes: ["account_email","gender"]
                },
                success: function(response) {
                    console.log(response);
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>

    <script src="${contextPath}/resources/js/member/login.js"></script>
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>


</html>