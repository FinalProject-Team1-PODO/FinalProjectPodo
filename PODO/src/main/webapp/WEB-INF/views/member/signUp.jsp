<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/member/signUp.css">

    <title>signUp</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <div id="contaioner">
            <h3>회원가입</h3>
            <form action="signUp" method="POST" name="ID-form" id="signUp-form">
                <fieldset id="signUp-area">

                    <section>
                        <h4>아이디</h4>
                        <input type="text" id="memberId" maxlength="20" name="memberId" placeholder="아이디를 입력해주세요.">

                        <button id="idDupCheck" type="button">중복검사</button>
                    </section>
                    <span class="signUp-message" id="idMessage">* 4~15글자의 숫자,영어를 입력하세요.</span>


                    <section>
                        <h4>비밀번호</h4>
                        <input type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요.">
                    </section>
                    <span class="signUp-message" id="pwMessage">* 4~15글자 (영어,숫자,특수기호 조합)</span>

                    <section>
                        <h4>비밀번호 확인</h4>
                        <input type="password" id="memberPwConfirm" name="memberPwConfirm" placeholder="비밀번호를 다시 입력해주세요.">
                    </section>
                    <span class="signUp-message" id="pwMessage">* 비밀번호는 동일해야 합니다.</span>

                    <section>
                        <h4>닉네임</h4>
                        <input type="text" id="memberNickname" maxlength="20" name="memberNickname" placeholder="닉네임을 입력해주세요.">
                    </section>
                    <span class="signUp-message" id="nickMessage">* 2~8글자를 입력하세요.</span>

                    <section>
                        <h4>전화번호</h4>
                        <input type="text" id="memberTel" maxlength="20" name="memberTel" placeholder="전화번호를 입력해주세요.">
                        <button id="nicknameDupCheck" type="button">중복검사</button>
                    </section>
                    <span class="signUp-message" id="telMessage">* 본인의 전화번호를 입력해주세요.</span>

                    <section>
                        <h4>주소</h4>
                        <input type="text" id="memberAddress" name="memberAddress" placeholder="주소를 입력하세요">

                    </section>
                    <span class="signUp-message" id="addressMessage">* 본인의 전화번호를 입력해주세요.</span>
                    

                    <section id="submitBtn-area">
                        <button id="submitBtn" >회원가입하기</button>
                    </section>  
                    

                </fieldset>
            </form>

        </div>

    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/js/member/signUp.js"></script>

    
</body>
</html>