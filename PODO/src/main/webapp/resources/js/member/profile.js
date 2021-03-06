const itemCategory = document.getElementById("item-list");
const reviewCategory = document.getElementById("review-category");

const reviewList = document.getElementById("reviews-area");
reviewList.style.display = "flex";
reviewList.style.justifyContent = "center";
reviewList.style.flexDirection = "column";
const itemList = document.getElementById("seller-items");

if (loginMemberNo == member2) {
    document.getElementById("user-intro-change").style.display = '';
    document.getElementById("item-report").style.display = 'none';
} else {
    document.getElementById("user-intro-change").style.display = 'none';
    document.getElementById("item-report").style.display = '';
}

selectItemsList();
itemCategory.addEventListener("click", selectItemsList);


function selectItemsList() {

    console.log(member2);

    $.ajax({
        url: contextPath + "/shop/selectItemsList/" + member2,
        type: "GET",
        dataType: "JSON",
        success: function (iList) {
            console.log(iList);

            itemList.innerHTML = "";

            reviewList.style.display = "none";
            itemList.style.display = "block";

            if (iList == "") {
                const itembox = document.createElement("div");
                itembox.classList.add("box");

                itembox.innerText = "등록된 상품이 없습니다.";

                reviewList.style.display = "none";
                itemList.style.display = "block";
                itembox.style.border = "none";

                itemList.style.fontSize = "20px";


                itemList.append(itembox);


            } else {

                let frame;

                for (let k = 0; k < iList.length; k++) {

                    if(k % 5 == 0){
                        frame = document.createElement("div");
                        frame.classList.add("frame");
                        frame.style.marginTop = "20px";
                        itemList.append(frame);
                    }


                    const itembox = document.createElement("div");
                    itembox.classList.add("boxx");
                    
                    itembox.style.width = "225.02px";
                    itembox.style.boxSizing = "border-box";

                    /* const boxNumber = 1;
                    boxNumber++; */
                    


                    const mainTitle = document.createElement("a");
                    mainTitle.classList.add("title");
                    mainTitle.setAttribute('href',contextPath + '/board/detail/'+iList[k].boardNo);
                    mainTitle.style.width = "230px";
                    const imageArea = document.createElement("div");
                    imageArea.classList.add("image");

                    const itemImage = document.createElement("img");
                    if(iList[k].imageList[0] != null){
                        itemImage.setAttribute('src', contextPath+iList[k].imageList[0].imageReName);
                    }else{
                        itemImage.setAttribute('src','resources/images/items/image1.jpg');
                    }
                    

                    const title1 = document.createElement("div");
                    title1.classList.add("title1");
                    
                    title1.style.marginRight = "0";

                    const title2 = document.createElement("div");
                    title2.classList.add("title2");
                    title2.innerText = iList[k].boardTitle;
                    

                    const name2 = document.createElement("div");
                    name2.classList.add("name2");

                    const price = document.createElement("div");
                    price.classList.add("price");
                    price.innerText = iList[k].price;

                    const time = document.createElement("div");
                    time.classList.add("time");
                    time.innerText = iList[k].updateDate;

                    name2.append(price, time);

                    title1.append(title2, name2);

                    imageArea.append(itemImage);

                    mainTitle.append(imageArea, title1);

                    itembox.append(mainTitle);

                    frame.append(itembox);

                }

            }

        },
        error: function (req, status, error) {
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}


reviewCategory.addEventListener("click", reviewsList);



/* 후기 ajax */
function reviewsList() {

    console.log("memberNo" + member2);

    $.ajax({
        url: contextPath + "/shop/selectReviewsList/" + member2,
        data: { "memberNo": member2 },
        type: "GET",
        dataType: "JSON",
        success: function (rList) {


            console.log(rList);

            reviewList.innerHTML = "";
            itemList.innerHTML = "";
            reviewList.style.display = "flex";
            itemList.style.display = "none";


            if (rList == "") {
                reviewList.innerText = "등록된 후기가 없습니다.";


                reviewList.style.fontSize = "20px";
                reviewList.style.height = "320px";
                reviewList.style.padding = "30px 0 40px 0";



            } else {
                for (let review of rList) {

                    console.log(rList);

                    const reviewBox = document.createElement("section");
                    reviewBox.classList.add("user-reviews");
                    /* reviewBox.style.display = "flex";
                    reviewBox.style.display = "center"; */


                    const reviewRow = document.createElement("div");
                    reviewRow.classList.add("reviews-top");

                    const writerImage = document.createElement("img");
                    writerImage.classList.add("reviews-image");
                    if (review.memberProfile == null) writerImage.src = imageSrc;
                    else writerImage.src = review.memberProfile;

                    const imageBox = document.createElement("div");
                    imageBox.classList.add("image-area");
                    imageBox.append(writerImage);

                    const writerName = document.createElement("div");
                    writerName.classList.add("reviews-user-nick");
                    writerName.innerText = review.memberNickname;

                    

                    const createDate = document.createElement("div");
                    createDate.classList.add("reviews-create-date");
                    createDate.innerText = review.createDate;
                    createDate.style.marginLeft = "90px";
                    

                    

                    reviewRow.append(writerName, createDate);

                    const shortReview = document.createElement("div");
                    shortReview.id = "reviews-shorts";
                    shortReview.innerText = review.reviewContent;

                    const goodBad = document.createElement("div");
                    goodBad.classList.add("good-or-bad");
                    goodBad.innerText = review.reviewCondition;

                    // const textReview = document.createElement("div");
                    // textReview.id = "reviews-user-text";

                    const footReview = document.createElement("div");
                    footReview.classList.add("reviews-footer");

                    const itemReview = document.createElement("a");
                    itemReview.classList.add("reviews-user-item");
                    itemReview.innerText = review.boardTitle + "     >";
                    itemReview.setAttribute("href", contextPath + "/board/detail/" + review.boardNo);

                    console.log(review.boardNo);
                    
                    footReview.append(itemReview);

                    const reviewCoount = document.createElement("div");
                    reviewCoount.classList.add("reviewCoount");
                    
                    

                    reviewCoount.append(reviewRow, goodBad,shortReview, footReview)
                    reviewBox.append(imageBox,reviewCoount);


                    reviewList.append(reviewBox);
                }
            }




        },
        error: function (req, status, error) {
            console.log("에러 발생");
            console.log(req.responseText);
        }


    });

}


// 신고하기 ajax



