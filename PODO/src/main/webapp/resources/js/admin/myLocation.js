resultX = Math.floor(x * 100000) / 100000;


resultY = Math.floor(y * 100000) / 100000;
console.log(resultX);



var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(resultY, resultX), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(resultY, resultX),
map: map
});

let dLat = "";
let dLon = "";
console.log(resultY);
console.log(resultX);

function sample5_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        var addr = data.address; // 최종 주소 변수

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("sample5_address").value = addr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);

                dLon = result.x;
                dLat = result.y;

                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords);
                

            }
        });
    }
}).open();
}

   document.getElementById("currentAddr").addEventListener("click", function(){
    console.log(dLon);
    console.log(dLat);
   

}); 


const address =  document.getElementById("sample5_address");
document.getElementById("reset-address").addEventListener("click", function(){

    $("#dLon").val(dLon); 
    $("#dLat").val(dLat); 

    if(address.value.length != ""){

         $.ajax({
            url : "resetAddr",                     
            data : { "dLon" : dLon, "dLat" : dLat, "sample5_address" : sample5_address.value },                

            type : "GET",    
            success : function(){
                alert("주소가 변경되었습니다.");
            },
            
            error : function(req, status, error){
                console.log(req.responseText);
            }
        }); 
    }else{
        alert("주소 검색해주세요");
    }

});


function show() {
document.querySelector(".background").className = "background show";
}

function close() {
document.querySelector(".background").className = "background";
}

document.querySelector("#choose-address").addEventListener("click", show);
document.querySelector("#close").addEventListener("click", close);


/* const distance = document.getElementById("addrLength"); */

let distance = "";


const showValue = (target) => {
    console.log(target.value);

    distance = target.value;
    
    // option의 text 값
    console.log(distance);
  }


document.getElementById("selectBtn").addEventListener("click", function(){

    console.log(distance);

     if(distance != 0){

         $.ajax({
            url : "insertDistance",                     
            data : {"distance" : distance},               

            type : "GET",    
            success : function(){
                alert("거리가 변경되었습니다");
            },
            
            error : function(req, status, error){
                console.log(req.responseText);
            }
        }); 
    }else{
        alert("거리를 입력하세요.");
    } 

    /* location.reload(); */

});











 
