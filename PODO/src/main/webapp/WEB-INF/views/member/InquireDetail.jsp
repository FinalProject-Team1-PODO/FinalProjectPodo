<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="memberNo" value="${map.memberNo}" />
<c:set var="sellMember" value="${map.sellMember}" />
<c:set var="inquireDetail" value="${map.inquireDetail}" />
<c:set var="boardNo" value="${boardNo}" />
<c:set var="boardImageList" value="${map.boardImageList}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의 상세페이지</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/inquireDetail.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="body">
    <div class="top-menu">
        <nav id="mainMenu">
            <h3>1:1문의</h3>
            <!-- <a id="inquire" href="#">문의하기</a> -->
        </nav>
    </div>
    <div class="list1">

        <div class="list2">
            <section class="list3">
                <p>${inquireDetail[0].classification}</p>
                <h2>${inquireDetail[0].classification}</h2>
                <p>${inquireDetail[0].createDate}</p>
            </section>

            <section class="list4">
                <div class="list5">
                  
                    <div> ${inquireDetail[0].boardContent}</div>
                    <section>

                        <c:forEach var="img" items="${boardImageList}">
                            <a href="#" >
                                <img src="${contextPath}${img.imageReName}" id="photo1">
                            </a>
                            <%-- <a href="#" >
                                <img src="../../images/logo.png" id="photo1">
                            </a>
                            <a href="#" >
                                <img src="../../images/logo.png" id="photo1">
                            </a>
                            <a href="#">
                                <img src="../../images/logo.png" id="photo1">
                            </a>
                            <a href="#">
                                <img src="../../images/logo.png" id="photo1">
                            </a> --%>
                        </c:forEach>
                    </section>
                </div>
                <%-- <img href="../../images/image.png"> --%>
            </section>
        </div>
    
    </div>
        <div id="chat">
            <p>고객센터가 문제를 알아보고 있어요.<br>조금만 기다려주세요.</p>
                
            <div id="reply1">

                <textarea placeholder="답변을 입력해 주세요." ></textarea>
                <button id="reply2">등록</button>

            </div>
        </div>


    </div>
  
    
   
</div>
<div class="inform">
    <h4>유의사항</h4>
    <ul>
        <li>자주묻는 질문을 확인하면 답변을 빨리 받을 수 있어요.</li>
        <li>접수는 24시간 가능하지만, 답변은 9시~18시 사이에 순차적으로 받을 수 있어요.</li>
        <li>문의 취소는 접수상태에서만 가능해요.</li>
    </ul>
</div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    <script src="${contextPath}/js/member/inquireList.js"></script>
</body>
</html>