<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../../resources/css/member/signUp.css">

    <title>signUp</title>
</head>


<body>
    <main>

        <header>
            header

        </header>

        <div id="contaioner">
            <h3>회원가입</h3>
            <form action="#" method="POST" name="ID-form" id="signUp-form">
                <fieldset id="signUp-area">

                    <section>
                        <h4>아이디</h4>
                        <input type="text" id="id-box" maxlength="20" placeholder="아이디를 입력해주세요.">

                        <button id="idDupCheck">중복검사</button>
                    </section>

                    <section>
                        <h4>비밀번호</h4>
                        <input type="password" id="PW-box" placeholder="비밀번호를 입력해주세요.">
                    </section>

                    <section>
                        <h4>비밀번호 확인</h4>
                        <input type="password" id="PW-box2" placeholder="비밀번호를 다시 입력해주세요.">
                    </section>

                    <section>
                        <h4>닉네임</h4>
                        <input type="text" id="nickname-box" maxlength="20" placeholder="닉네임을 입력해주세요.">
                    </section>

                    <section>
                        <h4>전화번호</h4>
                        <input type="text" id="phone-box" maxlength="20" placeholder="전화번호를 입력해주세요.">
                        <button id="nicknameDupCheck">중복검사</button>
                    </section>

                    
                    <button id="submitBtn" class="submitBtn">회원가입하기</button>
                        
                    

                </fieldset>
            </form>

        </div>


        <footer>
            footer

        </footer>

    </main>

    
</body>
</html>