
 let history = document.querySelector('.history');
 let historyArr = [];
 let historyTemplate = document.querySelector('#worldTem');

function GetLatlong()   //경도,위도받아오기
   {
       var geocoder = new google.maps.Geocoder();
       var address = document.querySelector("#search-box").value;
       geocoder.geocode({ 'address': address }, function (results, status) {
           if (status == google.maps.GeocoderStatus.OK) {
               var latitude = results[0].geometry.location.lat().toFixed(2);
               var longitude = results[0].geometry.location.lng().toFixed(2);
            }
            fetch("https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+
            "&appid=6d3f4e0daab2cbc7d44887f2e5df098e").then(function(resp){    //받은 위치 도시 호출
                return resp.json();
            }).then(function(json){
                print(json);
            })
       });
   }

function forntHtml(){
    fetch("https://api.openweathermap.org/data/2.5/weather?lat=37.57&lon=126.98&appid=6d3f4e0daab2cbc7d44887f2e5df098e").then(function(resp){    //받은 위치 도시 호출
        return resp.json();
    }).then(function(json){
        print(json);
    })
}

function print(json) {
    let date = new Date();
//    let date = new Date(json.dt * 1000);
//    let worldTime = (json.dt+json.timezone)*1000;
//    console.log('UTC', json.dt, worldTime, date.formatUTCDay(worldTime));
//    console.log('convert', date.formatUTCDay(worldTime), date.formatUTCTime(worldTime/1000));
//    console.log('Timezone', json.timezone, new Date(worldTime*1000).formatUTCTime());
    document.querySelector('#date').textContent = date.formatDay();
    document.querySelector('#time').textContent = date.formatTime();
//    document.querySelector('#date').textContent = new Date(worldTime*1000).formatUTCDay();
//    document.querySelector('#time').textContent = new Date(worldTime*1000).formatUTCTime();
    let currentTemp = (json.main.temp - 273.15).toFixed(1);
    let maxTemp = (json.main.temp_max - 273.15).toFixed(1);
    let minTemp = (json.main.temp_min - 273.15).toFixed(1);
    let iconId = json.weather[0].icon;
    if(iconId in iconobj){
        document.querySelector('#icon').src=iconobj[iconId];
        if(iconId in bgobj){
            document.querySelector('body').background=bgobj[iconId];
        } else{
            document.querySelector('body').background="bb.jpg";
        }       
     }else{
        if(iconId in bgobj){
            document.querySelector('body').background=bgobj[iconId];
        } else{
            document.querySelector('body').background="bb.jpg";
        }
         let iconadress = "http://openweathermap.org/img/wn/"+json.weather[0].icon+"@2x.png";
         // http://openweathermap.org/img/wn/10d@2x.png <- 10d 가 아이콘 아이디
         document.querySelector('#icon').src=iconadress;
     }
    console.log(document.querySelector('#icon').src)
    document.querySelector('#weather').textContent = obj[json.weather[0].main];
    if(document.querySelector("#search-box").value===""){document.querySelector('#here').textContent='서울';}
    else{document.querySelector('#here').textContent = document.querySelector("#search-box").value;}
    document.querySelector('#now').textContent = currentTemp + ' ºC';
    document.querySelector('#high-low').textContent = maxTemp + ' ºC / ' + minTemp + " ºC";
   
    history.innerHTML='';
    for(let i=0; i<historyArr.length; i++){
        let template = document.importNode(historyTemplate.content, true);
        template.querySelector('#ch').querySelector('#cityname').textContent=historyArr[i].name+" "+(historyArr[i].main.temp - 273.15).toFixed(1) + ' ºC';
        history.appendChild(template);
     }
     
    if(historyArr.length>4){ //최대 다섯개이므로 5를 초과하면?
        historyArr.shift();
        historyArr.push(json);
        console.log(historyArr);
     }else{
        historyArr.push(json);
        console.log(historyArr);
     }

    
}

forntHtml(); //시작페이지





// 날씨 한글로
let obj = {
    Thunderstorm:"뇌우",
    Drizzle:"이슬비",
    Rain:"비",
    Snow:"눈",
    Mist:"엷은 안개",
    Smoke:"공기질 나쁨",
    Haze:"실안개",
    Dust:"먼지",
    Fog:"안개",
    Sand:"먼지",
    Ash:"먼지",
    Squall:"돌풍",
    Tornado: "토네이도",
    Clear: "맑음",
    Clouds: "구름"
}

let iconobj = {
    "01d": "01d.png",
    "01n": "01n.png",
    "02d": "02d.png",
    "09d": "09d.png",
    "10d": "10d.png",
    "11d": "11d.png",
    "13d": "13d.png",
    "50d": "50d.png"
}

let bgobj = {
    "01d": "coolSky.jpg",
    "02d": "cloud.jpg",
    "50d": "mist.jpg"
}


// Date함수에서 01, 02, 03 표현하기 위해서 만든 함수
Number.prototype.padLeft = function() {
    if(this < 10) {
      return '0' + String(this);
    }
    else {
      return String(this);
    }
  }
   
  // 날짜
  Date.prototype.formatDay = function() {
    // var yyyy = this.getFullYear();
    var month = (this.getMonth() + 1).padLeft();
    var dd = this.getDate().padLeft();
    var day = this.getDay();
    var dayArr = ['월', '화', '수', '목', '금', '토', '일'];
    var format = month + "월 " + dd + "일 " + dayArr[day-1] +"요일";
    return format;
  }

  Date.prototype.formatTime = function() {
    var HH = this.getHours().padLeft();
    var mm = this.getMinutes().padLeft();
    var format = HH + "시 " + mm + "분 ";
    return format;
  }
  
  Date.prototype.formatUTCDay = function() {
    // var yyyy = this.getFullYear();
    var month = (this.getUTCMonth() + 1).padLeft();
    var dd = this.getUTCDate().padLeft();
    var day = this.getUTCDay();
    var dayArr = ['월', '화', '수', '목', '금', '토', '일'];
    var format = month + "월 " + dd + "일 " + dayArr[day-1] +"요일";
    return format;
  }

  Date.prototype.formatUTCTime = function() {
    var HH = this.getUTCHours().padLeft();
    var mm = this.getUTCMinutes().padLeft();
    var format = HH + "시 " + mm + "분 ";
    return format;
  }
  