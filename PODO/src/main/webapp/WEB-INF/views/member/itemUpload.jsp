<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="LCategory" value="${LCategoryList}" />
<c:set var="MCategory" value="${MCategoryList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PODO 상품등록</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/header-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemUpload.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>

        <div class="top-menu">
            <nav id="mainMenu">
                <a href="${contextPath}/member/itemUpload">상품등록</a>
                <a href="${contextPath}/shop/main">상품관리</a>
                <a href="${contextPath}/shop/myMall">구매/판매 내역</a>
            </nav>
        </div>

    
        <div class="basic1">
            <section class="basic">
                <h2>기본정보</h2>
                <span>*필수항목</span>
            </section>
        </div>   

    <form action="${contextPath}/board/itemUpload" enctype="multipart/form-data" method="POST" class="itemUpload" onsubmit="return writeValidate()">

        <%-- imageList에 존재하는 이미지 레벨을 이용하여 변수 생성 --%>
        <c:choose>
        
            <c:when test="${!empty boardImageList}">

                <c:forEach items="${boardImageList}" var="boardImage" varStatus="status">

                    <c:choose>
                        <c:when test="${boardImage.imageLevel == 0}">
                            <c:set var="img0"  value="${contextPath}${boardImage.imageReName}" />
                        </c:when>
                        <c:when test="${boardImage.imageLevel == 1}">
                            <%-- c:set 변수는 page scope가 기본값 (조건문이 끝나도 사용 가능)  --%>
                            <c:set var="img1"  value="${contextPath}${boardImage.imageReName}" />
                        </c:when>
                        <c:when test="${boardImage.imageLevel == 2}">
                            <%-- c:set 변수는 page scope가 기본값 (조건문이 끝나도 사용 가능)  --%>
                            <c:set var="img2"  value="${contextPath}${boardImage.imageReName}" />
                        </c:when>
                        <c:when test="${boardImage.imageLevel == 3}">
                            <%-- c:set 변수는 page scope가 기본값 (조건문이 끝나도 사용 가능)  --%>
                            <c:set var="img3"  value="${contextPath}${boardImage.imageReName}" />
                        </c:when>
                        <c:when test="${boardImage.imageLevel == 4}">
                            <%-- c:set 변수는 page scope가 기본값 (조건문이 끝나도 사용 가능)  --%>
                            <c:set var="img4"  value="${contextPath}${boardImage.imageReName}" />
                        </c:when>
                    </c:choose>

                </c:forEach>

            </c:when>
            
            <c:when test="${empty boardImageList}">
                 <c:set var="img0"  value="${contextPath}/resources/images/image.png" />
                 <c:set var="img1"  value="${contextPath}/resources/images/image.png" />
                 <c:set var="img2"  value="${contextPath}/resources/images/image.png" />
                 <c:set var="img3"  value="${contextPath}/resources/images/image.png" />
                 <c:set var="img4"  value="${contextPath}/resources/images/image.png" />
            </c:when>



        </c:choose>

        <%-- <img class="preview" src="${contextPath}/resources/images/image.png"> --%>
   
        <ul class="basic2">
            <li class="frist">
                <div class="title">
                    상품이미지
                    <span>*</span>
                    
                </div>
                <ul class="second">
                    <div class="img-box">
                        <div class="boardImg">
                            <label for="img0">
                                <img class="preview" src="${img0}">
                            </label>
                            <input type="file" class="inputImage" id="img0" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                        <div class="boardImg">
                            <label for="img1">
                                <img class="preview" src="${img1}">
                            </label>
                            <input type="file" class="inputImage" id="img1" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
        
                        <div class="boardImg">
                            <label for="img2">
                                <img class="preview" src="${img2}">
                            </label>
                            <input type="file" class="inputImage" id="img2" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                        
                        <div class="boardImg">
                            <label for="img3">
                                <img class="preview" src="${img3}">
                            </label>
                            <input type="file" class="inputImage" id="img3" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                        <div class="boardImg">
                            <label for="img4">
                                <img class="preview" src="${img4}">
                            </label>
                            <input type="file" class="inputImage" id="img4" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                   
                    </div>


                <div id="ex">
                    <br>* 상품이미지는 600x600에 최적화 되어있습니다.
                    <br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다. 
                    <%-- <br>- 이미지를 클릭할 경우 원본이미지를 확인 할 수 있습니다. --%>
                    <br>- 최대 지원사이즈인 640x640으로 준수해주세요.
                    <br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.
                </div>
                </ul>
            </li>
        </ul>
        
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        제목
                        <span>*</span>
                    </div>
                </li>
                <ul class="second">



                    <li>
                        <section class="search1">                        
                        <input id="search2" type="text" placeholder="상품명 입력" name="boardTitle" value="${item.boardTitle}">  
                    </li> 
                    </section>
                </ul>
            </li>
        </ul>
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        카테고리
                        <span>*</span>
                    </div>
                </li>
                <ul class="second">
                    <li style="display: flex;">
                        <div id="category">
                            <div id="category1">
                                <ul class="category1-1">

                                    <c:forEach var="LCate" items="${LCategory}">
                                        <li> <button type="button" class="select" name="LCate" id="${LCate.LCategoryNo}">${LCate.LCategoryName}</button></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div id="category">
                             <div id="category2">
                                <ul class="category1-1" name="category2">
                                </ul>
                             </div>
                        </div>
                    </li>
                    <div id="category3"> 선택한 카테고리 : 
                        <div id="category4"></div> 
                        <div id="category5"></div> 
                    </div>
                </ul>
            </li>
        </ul>
        <!-- 거래지역 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        거래지역
                        <span>*</span>
                    </div>
                </li>
                <ul class="second">
                    <li>
                        <section class="place">
                            <button type="button" id="myPlace">내 위치</button>
                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" id="searchBtn">
                        </section>
                        <section class="place2">
                            <input type="text" id="sample5_address" placeholder="주소" class="placeResult" name="placeResult">
                            
                        <%-- readonly : input 박스 value 값을 form 전송이 가능하지만 --%>
                            <%-- <input placeholder="선호 거래 지역을 검색해주세요." class="placeResult" name="placeResult" value="${item.sellArea}"> --%>
                            <section id="map-area" style="display:none;">
                                <div id="map" style="width:500px;height:400px;margin-top:10px;"></div>
                            </section>
                        </section>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- 상태 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        상태
                        <span>*</span>
                    </div>
                </li>
            </li>
            <ul class="second">
                <li>
                    <section class="states">
                        
                        <input type="radio" id="secondHand1" name="itemCondition" value='중고상품' class="itemCondition" checked> 
                        <label for="secondHand1">중고상품</label>
                    
                        <input type="radio" id="secondHand2" name="itemCondition" value='새상품' class="itemCondition">
                        <label for="secondHand2">새상품</label>

                    </section>
                </li>
            </ul>
        </ul>   
        
          
        <!-- 배송 유형 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        배송 유형
                        <span>*</span>
                    </div>
                </li>
            </li>
            <ul class="second">
                <li>
                    <section class="states">
                        <input type="radio" name="delivery" id="delivery1" value='직거래' name="deliveryMethod" checked>
                        <label for="delivery1">직거래</label>

                        <input type="radio" name="delivery" id="delivery2" value='무료배송' name="deliveryMethod">
                        <label for="delivery2">무료배송</label>

                        <input type="radio" name="delivery" id="delivery3" value='배송비 본인부담' name="deliveryMethod">
                        <label for="delivery3">배송비 본인부담</label>
                    </section>
                </li>
            </ul>          
        </ul>

        <!-- 가격 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        가격
                        <span>*</span>
                    </div>
                </li>
            </li>

            <ul class="second">
                <li>
                    <section class="price">
                        <input id="search2" type="number" placeholder="숫자만 입력해주세요." minlength="2" name="price" value="${item.price}">원&nbsp;
                    </section>
                </li>
            </ul> 
        </ul>

        <!-- 설명 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        설명
                        <span>*</span>
                    </div>
                </li>
            </li>

            <ul class="second">
                <li>
                    <div class="info">
                        <textarea id="info2" placeholder="여려장의 상품사진과 구입연도, 브랜드, 사용감, 하자 유무등 구매자에게 필요한 정보를 꼭 포함해 주세요. 문의를 줄이고 더 쉽게 판매할 수 있어요. (10자 이상)" name="boardContent">${item.boardContent}</textarea>
                        <div id="inform">
                        <%-- <small>0/1000</small> --%>
                        </div>
                    </div>
                </li>
            </ul> 
        </ul>

        <div class="submit">
            <button class="submit2" type="submit" id="writebtn">등록하기</button>
        </div>


       <!-- 수정0> 상세조회 -> 목록으로 or 삭제 -->
            
            <!-- 존재하던 이미지가 제거되었음을 기록하여 전달하는 input -->
            <!-- value에 제거된 이미지의 레벨을 기록 (X버튼 클릭 시)-->
            <!-- DELETE FROM BOARD_IMG 
                 WHERE BOARD_NO = 1000 
                 AND IMG_LEVEL IN (0,3,1,2) -->

        <input type="hidden" name="deleteList" id="deleteList" value="">

        <input type="hidden" name="lCateValue" id="lCateValue">
        <input type="hidden" name="mCateValue" id="mCateValue">

        <input type="hidden" name="dLon" id="dLon" value="">
        <input type="hidden" name="dLat" id="dLat" value="">

        <%-- <input type="text" name="dLon" id="dLon" value="">
        <input type="text" name="dLat" id="dLat" value=""> --%>

      </form>
    </main>
    
         <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bb10cd60ad6e59265c29b83ff6ec2d&libraries=services"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/itemUpload.js"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>
    
</body>
</html>